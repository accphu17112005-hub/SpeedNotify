package com.speednotify.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.location.Location
import android.os.Build
import android.os.Looper
import android.os.PowerManager
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.lifecycle.LifecycleService
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority
import com.speednotify.R
import com.speednotify.data.Camera
import com.speednotify.data.CameraDatabase
import com.speednotify.data.RoadSpeedLimitRepository
import com.speednotify.data.TripLocation
import com.speednotify.ui.MainActivity
import com.speednotify.utils.AudioManagerHelper
import com.speednotify.utils.GeoUtils
import com.speednotify.utils.GpsUtils
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class LocationForegroundService : LifecycleService() {

    companion object {
        // Broadcast cho MapActivity: vị trí + tốc độ + camera gần nhất (mỗi lần GPS fix)
        const val ACTION_LOCATION_UPDATE = "com.speednotify.ACTION_LOCATION_UPDATE"
        const val EXTRA_SPEED = "extra_speed"
        const val EXTRA_SPEED_LIMIT = "extra_speed_limit"
        const val EXTRA_NEAREST_CAM_NAME = "extra_nearest_cam_name"
        const val EXTRA_NEAREST_CAM_DIST = "extra_nearest_cam_dist"
        const val EXTRA_NEAREST_CAM_TYPE = "extra_nearest_cam_type"
        const val EXTRA_LAT = "extra_lat"
        const val EXTRA_LNG = "extra_lng"
        const val EXTRA_BEARING = "extra_bearing"
        const val EXTRA_FIX_ELAPSED_REALTIME_NANOS = "extra_fix_elapsed_realtime_nanos"
    }

    private val TAG = "LocationForegroundService"

    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback
    private lateinit var locationRequest: LocationRequest
    private lateinit var notificationManager: NotificationManager
    private lateinit var audioHelper: AudioManagerHelper

    private val scope = CoroutineScope(Dispatchers.IO + Job())
    private var lastLocation: Location? = null
    // Cooldown riêng cho từng loại cảnh báo (12 giây, theo mẫu dự án 5555)
    private var lastSpeedWarningTime = 0L
    private var lastCameraWarningTime = 0L
    private var lastRoadSpeedLookupTime = 0L
    private val WARNING_COOLDOWN_MS = 12000L

    private val BOUNDING_BOX_DEGREES = 0.02 // ~2km
    private val SPEED_LIMIT_SEARCH_RADIUS_METERS = 10_000.0
    // Khoảng cách cảnh báo theo loại camera (mẫu 5555): 750m speed/AI, 350m đèn đỏ
    private val SPEED_CAMERA_ALERT_DISTANCE_METERS = 750.0
    private val RED_LIGHT_CAMERA_ALERT_DISTANCE_METERS = 350.0

    // Cấu hình người dùng (SharedPreferences "speednotify_prefs", ghi bởi SettingsActivity)
    private var speedWarningEnabled = true
    private var cameraWarningEnabled = true
    private var speedThresholdKmh = 5

    override fun onCreate() {
        super.onCreate()
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        audioHelper = AudioManagerHelper(this)
        loadSettings()
        createNotificationChannel()
        setupLocationRequest()
        setupLocationCallback()
    }

    /**
     * Đọc cấu hình từ SharedPreferences "speednotify_prefs" (ghi bởi SettingsActivity).
     * Được gọi lại mỗi lần có location update để thay đổi cài đặt có hiệu lực ngay
     * (SharedPreferences đã cache trong RAM nên chi phí rất thấp).
     */
    private fun loadSettings() {
        val prefs = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)
        speedWarningEnabled = prefs.getBoolean("speed_warning_enabled", true)
        cameraWarningEnabled = prefs.getBoolean("camera_warning_enabled", true)
        speedThresholdKmh = prefs.getInt("speed_threshold", 5)
        Log.d(TAG, "Settings: speedWarning=$speedWarningEnabled, cameraWarning=$cameraWarningEnabled, threshold=$speedThresholdKmh km/h")
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val notification = buildNotification()
        // Overload 3 tham số (kèm FGS type) chỉ có từ API 29;
        // Android 14+ (targetSdk 34) bắt buộc phải khai báo type "location"
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(1, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION)
        } else {
            startForeground(1, notification)
        }
        startLocationUpdates()
        checkAndPromptBatteryOptimization()
        return START_STICKY
    }

    private fun checkAndPromptBatteryOptimization() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val pm = getSystemService(Context.POWER_SERVICE) as PowerManager
            if (pm.isIgnoringBatteryOptimizations(packageName)) {
                Log.d(TAG, "Battery optimization is enabled - app may be killed by OS")
            }
        }
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                "speednotify_location",
                "SpeedNotify Location Service",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Dịch vụ chạy ngầm theo dõi tốc độ và camera"
                setShowBadge(false)
                lockscreenVisibility = Notification.VISIBILITY_PRIVATE
            }
            notificationManager.createNotificationChannel(channel)
        }
    }

    private fun buildNotification(): Notification {
        val intent = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val pendingIntent = PendingIntent.getActivity(
            this, 0, intent,
            PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
        )

        return NotificationCompat.Builder(this, "speednotify_location")
            .setContentTitle("SpeedNotify đang chạy")
            .setContentText("Đang theo dõi tốc độ và camera")
            .setSmallIcon(R.drawable.ic_notification)
            .setContentIntent(pendingIntent)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .setVisibility(NotificationCompat.VISIBILITY_PRIVATE)
            .build()
    }

    private fun setupLocationRequest() {
        locationRequest = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 1000L)
            .setMinUpdateIntervalMillis(500L)
            .setMinUpdateDistanceMeters(0f)
            .setWaitForAccurateLocation(false)
            .build()
    }

    private fun setupLocationCallback() {
        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                locationResult.lastLocation?.let { location ->
                    handleLocationUpdate(location)
                }
            }
        }
    }

    private fun startLocationUpdates() {
        if (!checkLocationPermission()) {
            Log.w(TAG, "Cannot start location updates: FINE_LOCATION not granted")
            return
        }
        try {
            fusedLocationClient.requestLocationUpdates(
                locationRequest,
                locationCallback,
                Looper.getMainLooper()
            )
            Log.d(TAG, "Location updates requested successfully in foreground service")
        } catch (e: SecurityException) {
            Log.e(TAG, "SecurityException requesting location updates in service", e)
        }
    }

    private fun checkLocationPermission(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return checkSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION) ==
                android.content.pm.PackageManager.PERMISSION_GRANTED
        }
        return true
    }

    private fun handleLocationUpdate(location: Location) {
        val prev = lastLocation

        // Tính tốc độ thực tế từ GPS:
        // 1. Ưu tiên location.speed nếu có và > 0
        // 2. Fallback: tự tính bằng delta distance / delta time nếu thiết bị không trả hasSpeed()
        var calculatedSpeedKmh = 0f
        if (location.hasSpeed() && location.speed > 0f) {
            calculatedSpeedKmh = location.speed * 3.6f
        } else if (prev != null) {
            val timeDeltaSec = (location.time - prev.time) / 1000.0
            if (timeDeltaSec in 0.4..5.0) {
                val dist = GeoUtils.haversineDistance(prev.latitude, prev.longitude, location.latitude, location.longitude)
                // Chỉ tính nếu di chuyển >= 1.5m để lọc rung lắc GPS khi đứng yên
                if (dist >= 1.5) {
                    calculatedSpeedKmh = ((dist / timeDeltaSec) * 3.6).toFloat()
                }
            }
        }
        val rawSpeedKmh = calculatedSpeedKmh

        // Tính góc hướng di chuyển (bearing):
        val bearing = if (location.hasBearing() && location.bearing > 0f) {
            location.bearing
        } else if (prev != null && GeoUtils.haversineDistance(prev.latitude, prev.longitude, location.latitude, location.longitude) >= 1.5) {
            prev.bearingTo(location)
        } else {
            -1f
        }

        lastLocation = location
        recordTripLocation(location)

        // Áp dụng cấu hình mới nhất
        loadSettings()

        // 1. Kiểm tra vượt tốc độ (bật/tắt theo cấu hình người dùng)
        val filteredSpeedKmh = if (rawSpeedKmh >= 1.0f) rawSpeedKmh else 0f
        if (speedWarningEnabled && filteredSpeedKmh > 0) {
            checkSpeedLimit(filteredSpeedKmh, location)
            checkRoadSpeedLimit(filteredSpeedKmh, location)
        }

        // 2. Kiểm tra camera gần đó (bật/tắt theo cấu hình người dùng)
        if (cameraWarningEnabled) {
            checkNearbyCameras(location)
        }

        // 3. Broadcast cho màn hình bản đồ (HUD tốc độ + theo dõi vị trí + camera gần nhất)
        broadcastLocationUpdate(location, rawSpeedKmh, bearing)
    }

    private fun recordTripLocation(location: Location) {
        // Bỏ qua nếu độ chính xác quá kém (> 100m) để tránh điểm nhiễu
        // Nếu thiết bị không báo accuracy, vẫn ghi để đảm bảo không mất dữ liệu
        val accuracy = if (location.hasAccuracy()) location.accuracy else 99f
        if (accuracy > 100f) return
        scope.launch {
            CameraDatabase.getDatabase(this@LocationForegroundService)
                .tripLocationDao()
                .insert(
                    TripLocation(
                        latitude = location.latitude,
                        longitude = location.longitude,
                        timestamp = location.time,
                        accuracy = accuracy
                    )
                )
        }
    }

    /**
     * Broadcast vị trí + tốc độ + camera gần nhất cho MapActivity.
     * Chạy async (không block luồng GPS); sendBroadcast nội bộ app —
     * MapActivity đăng ký receiver với RECEIVER_NOT_EXPORTED (yêu cầu API 34).
     */
    private fun broadcastLocationUpdate(location: Location, rawSpeedKmh: Float, bearing: Float) {
        scope.launch {
            val bbox = GeoUtils.createBoundingBoxMeters(
                location.latitude,
                location.longitude,
                SPEED_LIMIT_SEARCH_RADIUS_METERS
            )
            val cameras = CameraDatabase.getDatabase(this@LocationForegroundService)
                .cameraDao()
                .getCamerasInBoundingBox(bbox.minLat, bbox.maxLat, bbox.minLng, bbox.maxLng)
            val nearest = GeoUtils.nearestCameraWithinDistance(
                cameras,
                location.latitude,
                location.longitude,
                SPEED_LIMIT_SEARCH_RADIUS_METERS
            )

            // rawSpeedKmh >= 0 luôn (tốc độ GPS thực, không lọc)
            val intent = Intent(ACTION_LOCATION_UPDATE).apply {
                setPackage(packageName)
                putExtra(EXTRA_SPEED, rawSpeedKmh.toInt().coerceAtLeast(0))
                putExtra(EXTRA_SPEED_LIMIT, nearest?.first?.speedLimit ?: 0)
                putExtra(EXTRA_NEAREST_CAM_NAME, nearest?.first?.roadName ?: "")
                putExtra(EXTRA_NEAREST_CAM_DIST, nearest?.second?.toInt() ?: -1)
                putExtra(EXTRA_NEAREST_CAM_TYPE, nearest?.first?.type ?: "")
                putExtra(EXTRA_LAT, location.latitude)
                putExtra(EXTRA_LNG, location.longitude)
                putExtra(EXTRA_BEARING, bearing)
                putExtra(EXTRA_FIX_ELAPSED_REALTIME_NANOS, location.elapsedRealtimeNanos)
            }
            sendBroadcast(intent)
        }
    }

    private fun checkSpeedLimit(currentSpeedKmh: Float, location: Location) {
        scope.launch {
            val bbox = GeoUtils.createBoundingBox(location.latitude, location.longitude, BOUNDING_BOX_DEGREES)
            val cameras = CameraDatabase.getDatabase(this@LocationForegroundService)
                .cameraDao()
                .getCamerasInBoundingBox(bbox.minLat, bbox.maxLat, bbox.minLng, bbox.maxLng)

            for (camera in cameras) {
                val distance = GeoUtils.haversineDistance(
                    location.latitude, location.longitude,
                    camera.lat, camera.lng
                )
                // Chỉ cảnh báo camera loại speed camera hoặc redlight camera có speedLimit
                if (distance <= alertDistanceFor(camera.type) &&
                    (camera.type == "speed" || camera.type == "redlight") &&
                    camera.speedLimit > 0) {

                    // speedThresholdKmh = dung sai theo cấu hình người dùng (chống cảnh báo do nhiễu GPS)
                    if (GpsUtils.isOverSpeedLimit(currentSpeedKmh, camera.speedLimit, speedThresholdKmh.toFloat()) &&
                        System.currentTimeMillis() - lastSpeedWarningTime > WARNING_COOLDOWN_MS) {

                        lastSpeedWarningTime = System.currentTimeMillis()
                        val warningText = "${AudioManagerHelper.SPEED_WARNING_PREFIX}${camera.speedLimit} km/h"
                        playWarning(warningText)
                        break // Chỉ cảnh báo 1 camera mỗi lần
                    }
                }
            }
        }
    }

    private fun checkRoadSpeedLimit(currentSpeedKmh: Float, location: Location) {
        val now = System.currentTimeMillis()
        if (now - lastRoadSpeedLookupTime < 10_000L) return
        lastRoadSpeedLookupTime = now

        scope.launch {
            val roadLimit = RoadSpeedLimitRepository.findNearest(
                location.latitude,
                location.longitude,
                if (location.hasBearing()) location.bearing else null
            ) ?: return@launch

            if (GpsUtils.isOverSpeedLimit(
                    currentSpeedKmh,
                    roadLimit.speedKmh,
                    speedThresholdKmh.toFloat()
                ) && System.currentTimeMillis() - lastSpeedWarningTime > WARNING_COOLDOWN_MS
            ) {
                lastSpeedWarningTime = System.currentTimeMillis()
                playWarning("${AudioManagerHelper.SPEED_WARNING_PREFIX}${roadLimit.speedKmh} km/h")
            }
        }
    }

    private fun checkNearbyCameras(location: Location) {
        scope.launch {
            val bbox = GeoUtils.createBoundingBox(location.latitude, location.longitude, BOUNDING_BOX_DEGREES)
            val cameras = CameraDatabase.getDatabase(this@LocationForegroundService)
                .cameraDao()
                .getCamerasInBoundingBox(bbox.minLat, bbox.maxLat, bbox.minLng, bbox.maxLng)

            val currentBearing = if (location.hasBearing()) location.bearing else -1f

            for (camera in cameras) {
                val distance = GeoUtils.haversineDistance(
                    location.latitude, location.longitude,
                    camera.lat, camera.lng
                )

                // Cảnh báo camera trong bán kính theo loại (750m speed/AI, 350m đèn đỏ)
                if (distance <= alertDistanceFor(camera.type)) {
                    // Kiểm tra bearing: nếu có bearing của xe và camera, bỏ qua nếu ngược chiều > 90 độ
                    val shouldAlert = if (currentBearing >= 0 && camera.bearing >= 0) {
                        !GeoUtils.isOppositeDirection(currentBearing, camera.bearing)
                    } else {
                        true // Không có bearing thì cảnh báo bình thường
                    }

                    val now = System.currentTimeMillis()
                    // Cooldown riêng cho cảnh báo camera; thêm 3s guard để không đè
                    // lên cảnh báo tốc độ vừa phát (TTS QUEUE_FLUSH sẽ mất 1 câu)
                    if (shouldAlert &&
                        now - lastCameraWarningTime > WARNING_COOLDOWN_MS &&
                        now - lastSpeedWarningTime > 3000L
                    ) {
                        lastCameraWarningTime = now
                        val warningText = if (camera.speedLimit > 0) {
                            "${AudioManagerHelper.CAMERA_WARNING_PREFIX}${camera.speedLimit} km/h"
                        } else {
                            "Cảnh báo, sắp đến camera phạt nguội"
                        }
                        playWarning(warningText)
                        break
                    }
                }
            }
        }
    }

    /**
     * Khoảng cách cảnh báo theo loại camera (mẫu 5555): speed/AI 750m, đèn đỏ 350m
     */
    private fun alertDistanceFor(cameraType: String): Double {
        return if (cameraType == "redlight") {
            RED_LIGHT_CAMERA_ALERT_DISTANCE_METERS
        } else {
            SPEED_CAMERA_ALERT_DISTANCE_METERS
        }
    }

    private fun playWarning(text: String) {
        audioHelper.speak(text, object : AudioManagerHelper.AudioCallback {
            override fun onAudioFocusGained() {
                Log.d(TAG, "Audio focus gained, playing: $text")
            }

            override fun onAudioFocusLost() {
                Log.d(TAG, "Audio focus released")
            }
        })
    }

    override fun onDestroy() {
        scope.cancel()
        fusedLocationClient.removeLocationUpdates(locationCallback)
        audioHelper.shutdown()
        super.onDestroy()
    }
}