package com.vietmap.dashcam.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.content.pm.ServiceInfo
import android.location.Location
import android.os.Build
import android.os.IBinder
import android.os.Looper
import android.util.Log
import androidx.core.app.NotificationCompat
import com.google.android.gms.location.*
import com.vietmap.dashcam.data.OsmCameraRepository
import com.vietmap.dashcam.database.AppDatabase
import com.vietmap.dashcam.database.DatabaseSeeder
import com.vietmap.dashcam.database.SpeedCameraEntity
import com.vietmap.dashcam.tts.VoiceAlertManager
import kotlinx.coroutines.*
import kotlin.math.roundToInt

class WarningService : Service() {

    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback
    private lateinit var voiceAlert: VoiceAlertManager
    private lateinit var database: AppDatabase
    
    private val serviceJob = SupervisorJob()
    private val scope = CoroutineScope(Dispatchers.IO + serviceJob)

    /** Đảm bảo OSM refresh chỉ trigger 1 lần per service lifecycle */
    @Volatile private var osmRefreshTriggered = false

    private val CHANNEL_ID = "WarningServiceChannel"
    private var defaultSpeedLimit = 60 // Tốc độ giới hạn mặc định
    private var currentSpeedLimit = defaultSpeedLimit

    companion object {
        const val ACTION_LOCATION_UPDATE = "com.vietmap.dashcam.LOCATION_UPDATE"
        /** Broadcast gửi khi danh sách camera được cập nhật (OSM refresh) — MainActivity sẽ reload map markers */
        const val ACTION_CAMERAS_UPDATED = "com.vietmap.dashcam.CAMERAS_UPDATED"
        const val EXTRA_CAMERAS_ADDED = "EXTRA_CAMERAS_ADDED"
        const val EXTRA_LAT = "EXTRA_LAT"
        const val EXTRA_LNG = "EXTRA_LNG"
        /** Timestamp thật của GPS fix (SystemClock.elapsedRealtimeNanos), không lệch bởi độ trễ xử lý DB/broadcast */
        const val EXTRA_FIX_ELAPSED_REALTIME_NANOS = "EXTRA_FIX_ELAPSED_REALTIME_NANOS"
        const val EXTRA_SPEED = "EXTRA_SPEED"
        const val EXTRA_SPEED_LIMIT = "EXTRA_SPEED_LIMIT"
        const val EXTRA_NEAREST_CAM_NAME = "EXTRA_NEAREST_CAM_NAME"
        const val EXTRA_NEAREST_CAM_DIST = "EXTRA_NEAREST_CAM_DIST"
        const val EXTRA_NEAREST_CAM_TYPE = "EXTRA_NEAREST_CAM_TYPE"
        const val PREFS_NAME = "warning_service_prefs"
        const val KEY_VOICE_MUTED = "voice_muted"
    }

    override fun onCreate() {
        super.onCreate()
        createNotificationChannel()
        database = AppDatabase.getDatabase(this)
        voiceAlert = VoiceAlertManager(this)
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)

        // Tự động seed dữ liệu ban đầu nếu CSDL trống
        scope.launch {
            DatabaseSeeder.seedInitialDataIfEmpty(this@WarningService, database)
            // Sau khi seed xong, thử refresh dữ liệu camera từ OpenStreetMap (nếu cache hết hạn)
            // Chạy non-blocking — nếu không có internet thì tự động skip, dùng dữ liệu cũ
            triggerOsmRefresh()
        }

        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                locationResult.lastLocation?.let { location ->
                    processLocation(location)
                }
            }
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val notification: Notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("Vietmap Cảnh Báo Giao Thông")
            .setContentText("Đang theo dõi GPS và cảnh báo tốc độ offline...")
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(1, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION)
        } else {
            startForeground(1, notification)
        }
        requestLocationUpdates()

        return START_STICKY
    }

    private fun requestLocationUpdates() {
        val locationRequest = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 1000)
            .setMinUpdateIntervalMillis(500)
            .build()

        try {
            fusedLocationClient.requestLocationUpdates(
                locationRequest,
                locationCallback,
                Looper.getMainLooper()
            )
        } catch (e: SecurityException) {
            Log.e("WarningService", "Thiếu quyền truy cập GPS", e)
        }
    }

    private fun processLocation(currentLocation: Location) {
        val speedKmh = (currentLocation.speed * 3.6).roundToInt()
        val lat = currentLocation.latitude
        val lng = currentLocation.longitude
        val fixElapsedRealtimeNanos = currentLocation.elapsedRealtimeNanos

        scope.launch {
            val voiceEnabled = !getSharedPreferences(PREFS_NAME, MODE_PRIVATE).getBoolean(KEY_VOICE_MUTED, false)

            // 1. Quét các điểm camera trong bán kính ~3km (tương đương chênh lệch vĩ/kinh độ ~0.03)
            val delta = 0.03
            val nearbyCameras = database.cameraDao().getCamerasInArea(
                minLat = lat - delta,
                maxLat = lat + delta,
                minLng = lng - delta,
                maxLng = lng + delta
            )

            var nearestCam: SpeedCameraEntity? = null
            var minDistance = Float.MAX_VALUE

            for (cam in nearbyCameras) {
                val distanceResults = FloatArray(1)
                Location.distanceBetween(
                    lat, lng,
                    cam.latitude, cam.longitude,
                    distanceResults
                )
                val dist = distanceResults[0]

                if (dist < minDistance) {
                    minDistance = dist
                    nearestCam = cam
                }
            }

            // 2. Cập nhật giới hạn tốc độ và phát âm thanh cảnh báo
            var nearestCamName = ""
            var nearestDistInt = 0
            var nearestCamType = ""

            if (nearestCam != null) {
                nearestDistInt = minDistance.roundToInt()
                nearestCamName = nearestCam.name
                nearestCamType = nearestCam.type

                val alertDist = SpeedCameraEntity.alertDistanceMetres(nearestCam.type)

                if (nearestCam.type == SpeedCameraEntity.TYPE_SPEED_LIMIT_SIGN) {
                    // Biển đổi tốc độ: chỉ cập nhật giới hạn & phát âm khi đủ gần (≤ 500m)
                    // Tránh hiển thị tốc độ mới khi biển còn cách xa 2-3km
                    if (nearestDistInt <= alertDist) {
                        currentSpeedLimit = nearestCam.speedLimit
                        if (voiceEnabled) {
                            voiceAlert.warnSpeedLimitSign(nearestDistInt, nearestCam.speedLimit)
                        }
                    }
                    // Khi chưa đủ gần: giữ nguyên currentSpeedLimit từ camera/zone trước đó
                } else {
                    currentSpeedLimit = nearestCam.speedLimit

                    // Ngưỡng cảnh báo theo loại camera (camera tốc độ cảnh báo xa hơn vượt đèn đỏ, xem SpeedCameraEntity.alertDistanceMetres)
                    if (nearestDistInt <= alertDist && voiceEnabled) {
                        when (nearestCam.type) {
                            SpeedCameraEntity.TYPE_SPEED_CAM, SpeedCameraEntity.TYPE_RED_LIGHT_CAM, SpeedCameraEntity.TYPE_AI_JUNCTION -> {
                                voiceAlert.warnSpeedCamera(nearestDistInt, nearestCam.speedLimit)
                            }
                            SpeedCameraEntity.TYPE_ZONE_RESIDENTIAL -> {
                                voiceAlert.warnApproachingZone("Khu dân cư", nearestCam.speedLimit)
                            }
                            SpeedCameraEntity.TYPE_HIGHWAY -> {
                                voiceAlert.warnApproachingZone("Cao tốc", nearestCam.speedLimit)
                            }
                        }
                    }
                }
            } else {
                currentSpeedLimit = defaultSpeedLimit
            }

            // 3. Kiểm tra quá tốc độ (cho phép dung sai +3 km/h)
            if (speedKmh > (currentSpeedLimit + 3) && voiceEnabled) {
                voiceAlert.warnOverSpeed(speedKmh, currentSpeedLimit)
            }

            // 4. Gửi Broadcast để cập nhật giao diện (UI)
            val broadcastIntent = Intent(ACTION_LOCATION_UPDATE).apply {
                setPackage(packageName)
                putExtra(EXTRA_LAT, lat)
                putExtra(EXTRA_LNG, lng)
                putExtra(EXTRA_FIX_ELAPSED_REALTIME_NANOS, fixElapsedRealtimeNanos)
                putExtra(EXTRA_SPEED, speedKmh)
                putExtra(EXTRA_SPEED_LIMIT, currentSpeedLimit)
                putExtra(EXTRA_NEAREST_CAM_NAME, nearestCamName)
                putExtra(EXTRA_NEAREST_CAM_DIST, nearestDistInt)
                putExtra(EXTRA_NEAREST_CAM_TYPE, nearestCamType)
            }
            sendBroadcast(broadcastIntent)
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        super.onDestroy()
        fusedLocationClient.removeLocationUpdates(locationCallback)
        voiceAlert.shutdown()
        serviceJob.cancel()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val serviceChannel = NotificationChannel(
                CHANNEL_ID,
                "Dịch Vụ Cảnh Báo Giao Thông",
                NotificationManager.IMPORTANCE_LOW
            )
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(serviceChannel)
        }
    }

    /**
     * Trigger refresh dữ liệu camera từ OpenStreetMap (chỉ chạy 1 lần/24h).
     * Chạy hoàn toàn trong background — không block GPS, không ảnh hưởng UI.
     * Nếu không có internet hoặc Overpass timeout → giữ nguyên data trong DB.
     */
    private suspend fun triggerOsmRefresh() {
        if (osmRefreshTriggered) return
        osmRefreshTriggered = true
        try {
            val added = OsmCameraRepository.refreshIfNeeded(
                context = this@WarningService,
                db = database,
            )
            when {
                added > 0 -> {
                    Log.i("WarningService", "OSM refresh: +$added camera mới từ OpenStreetMap")
                    // Thông báo cho MainActivity reload markers trên bản đồ
                    val broadcast = Intent(ACTION_CAMERAS_UPDATED).apply {
                        setPackage(packageName)
                        putExtra(EXTRA_CAMERAS_ADDED, added)
                    }
                    sendBroadcast(broadcast)
                }
                added == 0 -> Log.d("WarningService", "OSM refresh: không có camera mới")
                else       -> Log.d("WarningService", "OSM refresh: bỏ qua (cache còn hiệu lực hoặc lỗi mạng)")
            }
        } catch (e: Exception) {
            Log.w("WarningService", "OSM refresh thất bại (không crash): ${e.message}")
        }
    }
}
