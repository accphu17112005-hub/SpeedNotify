package com.vietmap.dashcam

import android.Manifest
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.graphics.Color
import androidx.core.graphics.toColorInt
import android.os.Build
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.lifecycleScope
import com.vietmap.dashcam.dashcam.DashcamManager
import com.vietmap.dashcam.database.AppDatabase
import com.vietmap.dashcam.database.DatabaseSeeder
import com.vietmap.dashcam.database.SpeedCameraEntity
import com.vietmap.dashcam.service.WarningService
import kotlinx.coroutines.launch
import org.json.JSONArray
import org.json.JSONObject
import org.maplibre.android.MapLibre
import org.maplibre.android.camera.CameraPosition
import org.maplibre.android.camera.CameraUpdateFactory
import org.maplibre.android.geometry.LatLng
import org.maplibre.android.maps.MapLibreMap
import org.maplibre.android.maps.MapView
import org.maplibre.android.maps.Style
import org.maplibre.android.style.expressions.Expression
import org.maplibre.android.style.layers.CircleLayer
import org.maplibre.android.style.layers.PropertyFactory
import org.maplibre.android.style.layers.SymbolLayer
import org.maplibre.android.style.sources.GeoJsonSource
import java.io.File

class MainActivity : AppCompatActivity() {

    private var mapView: MapView? = null
    private var maplibreMap: MapLibreMap? = null

    private lateinit var tvCurrentSpeed: TextView
    private lateinit var cardCameraAlert: View
    private lateinit var tvAlertTitle: TextView
    private lateinit var tvAlertDetail: TextView
    private lateinit var tvDashcamStatus: TextView
    private lateinit var btnSnapPhoto: Button
    private lateinit var btnVoiceMute: TextView
    private lateinit var btnLocateMe: TextView
    private lateinit var btnMapTheme: TextView

    private val dashcamManager = DashcamManager()
    private val locationPermissionRequestCode = 1001
    private var lastLat = 0.0
    private var lastLng = 0.0
    private var lastFixElapsedRealtimeNanos = 0L

    private val locationUpdateReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action == WarningService.ACTION_LOCATION_UPDATE) {
                val speed = intent.getIntExtra(WarningService.EXTRA_SPEED, 0)
                val speedLimit = intent.getIntExtra(WarningService.EXTRA_SPEED_LIMIT, 60)
                val nearestCamName = intent.getStringExtra(WarningService.EXTRA_NEAREST_CAM_NAME) ?: ""
                val nearestCamDist = intent.getIntExtra(WarningService.EXTRA_NEAREST_CAM_DIST, 0)
                val nearestCamType = intent.getStringExtra(WarningService.EXTRA_NEAREST_CAM_TYPE) ?: ""
                val lat = intent.getDoubleExtra(WarningService.EXTRA_LAT, 0.0)
                val lng = intent.getDoubleExtra(WarningService.EXTRA_LNG, 0.0)
                val fixElapsedRealtimeNanos = intent.getLongExtra(WarningService.EXTRA_FIX_ELAPSED_REALTIME_NANOS, 0L)

                updateHUD(speed, speedLimit, nearestCamName, nearestCamDist, nearestCamType, lat, lng, fixElapsedRealtimeNanos)
            }
        }
    }

    /**
     * Receiver cho ACTION_CAMERAS_UPDATED: khi WarningService fetch xong dữ liệu OSM
     * thì reload lại marker camera trên bản đồ hiện tại.
     */
    private val camerasUpdatedReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action == WarningService.ACTION_CAMERAS_UPDATED) {
                val added = intent.getIntExtra(WarningService.EXTRA_CAMERAS_ADDED, 0)
                android.util.Log.d("MainActivity", "Camera OSM cập nhật: +$added điểm mới. Reload map markers...")
                // Lấy style hiện tại và vẽ lại các layer camera
                maplibreMap?.style?.let { style -> loadCameraMarkers(style) }
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MapLibre.getInstance(this)
        setContentView(R.layout.activity_main)

        initViews()
        initMap(savedInstanceState)
        checkPermissionsAndStartService()
    }

    private fun initViews() {
        mapView = findViewById(R.id.mapView)
        tvCurrentSpeed = findViewById(R.id.tvCurrentSpeed)
        cardCameraAlert = findViewById(R.id.cardCameraAlert)
        tvAlertTitle = findViewById(R.id.tvAlertTitle)
        tvAlertDetail = findViewById(R.id.tvAlertDetail)
        tvDashcamStatus = findViewById(R.id.tvDashcamStatus)
        btnSnapPhoto = findViewById(R.id.btnSnapPhoto)
        btnVoiceMute = findViewById(R.id.btnVoiceMute)
        btnLocateMe = findViewById(R.id.btnLocateMe)
        btnMapTheme = findViewById(R.id.btnMapTheme)
        val btnZoomIn: View = findViewById(R.id.btnZoomIn)
        val btnZoomOut: View = findViewById(R.id.btnZoomOut)
        val btnSearch: View = findViewById(R.id.btnSearch)
        val btnMenu: View = findViewById(R.id.btnMenu)

        cardCameraAlert.visibility = View.GONE

        btnSnapPhoto.setOnClickListener {
            lifecycleScope.launch {
                Toast.makeText(this@MainActivity, getString(R.string.dashcam_requesting_photo), Toast.LENGTH_SHORT).show()
                val success = dashcamManager.snapPhoto()
                if (success) {
                    Toast.makeText(this@MainActivity, getString(R.string.photo_success), Toast.LENGTH_SHORT).show()
                } else {
                    Toast.makeText(this@MainActivity, getString(R.string.camera_connect_error), Toast.LENGTH_SHORT).show()
                }
            }
        }

        updateVoiceMuteButton()
        btnVoiceMute.setOnClickListener {
            val prefs = getSharedPreferences(WarningService.PREFS_NAME, MODE_PRIVATE)
            val muted = prefs.getBoolean(WarningService.KEY_VOICE_MUTED, false)
            prefs.edit().putBoolean(WarningService.KEY_VOICE_MUTED, !muted).apply()
            updateVoiceMuteButton()
        }

        btnZoomIn.setOnClickListener { maplibreMap?.animateCamera(CameraUpdateFactory.zoomIn()) }
        btnZoomOut.setOnClickListener { maplibreMap?.animateCamera(CameraUpdateFactory.zoomOut()) }

        btnLocateMe.setOnClickListener {
            if (lastLat != 0.0 || lastLng != 0.0) {
                val position = CameraPosition.Builder()
                    .target(LatLng(lastLat, lastLng))
                    .zoom(16.0)
                    .tilt(30.0)
                    .build()
                maplibreMap?.animateCamera(CameraUpdateFactory.newCameraPosition(position))
            } else {
                Toast.makeText(this, getString(R.string.location_not_available), Toast.LENGTH_SHORT).show()
            }
        }

        btnSearch.setOnClickListener {
            Toast.makeText(this, getString(R.string.feature_in_development), Toast.LENGTH_SHORT).show()
        }
        btnMenu.setOnClickListener {
            Toast.makeText(this, getString(R.string.feature_in_development), Toast.LENGTH_SHORT).show()
        }

        updateMapThemeButton()
        btnMapTheme.setOnClickListener {
            val prefs = getSharedPreferences(WarningService.PREFS_NAME, MODE_PRIVATE)
            val isLight = prefs.getBoolean(KEY_MAP_THEME_LIGHT, false)
            prefs.edit().putBoolean(KEY_MAP_THEME_LIGHT, !isLight).apply()
            updateMapThemeButton()
            applyMapStyle()
        }
    }

    private fun updateVoiceMuteButton() {
        val muted = getSharedPreferences(WarningService.PREFS_NAME, MODE_PRIVATE)
            .getBoolean(WarningService.KEY_VOICE_MUTED, false)
        btnVoiceMute.text = if (muted) "🔇" else "🔊"
    }

    private fun updateMapThemeButton() {
        val isLight = getSharedPreferences(WarningService.PREFS_NAME, MODE_PRIVATE)
            .getBoolean(KEY_MAP_THEME_LIGHT, false)
        btnMapTheme.text = if (isLight) "☀️" else "🌙"
    }

    private fun initMap(savedInstanceState: Bundle?) {
        mapView?.onCreate(savedInstanceState)
        mapView?.getMapAsync { map ->
            this.maplibreMap = map
            applyMapStyle(isFirstLoad = true)
        }
    }

    /**
     * Áp style theo theme đang chọn (sáng/tối) trong SharedPreferences. Dùng chung cho
     * lần load đầu tiên và khi người dùng bấm nút đổi theme — setStyle() luôn thay toàn
     * bộ layer nên các layer camera phải được thêm lại (loadCameraMarkers) mỗi lần.
     */
    private fun applyMapStyle(isFirstLoad: Boolean = false) {
        val map = maplibreMap ?: return
        val isLight = getSharedPreferences(WarningService.PREFS_NAME, MODE_PRIVATE)
            .getBoolean(KEY_MAP_THEME_LIGHT, false)
        val styleAsset = if (isLight) "offline_style_light.json" else "offline_style.json"
        android.util.Log.d("DashcamMap", "applyMapStyle: loading $styleAsset")

        map.setStyle(Style.Builder().fromJson(buildOfflineStyleJson(styleAsset))) { style ->
            android.util.Log.d("DashcamMap", "setStyle callback fired! isFirstLoad=$isFirstLoad")
            if (isFirstLoad) {
                // Thiết lập góc nhìn camera mặc định vào Việt Nam (Hà Nội / TP.HCM)
                val defaultPosition = CameraPosition.Builder()
                    .target(LatLng(21.0285, 105.8542)) // Hà Nội
                    .zoom(10.0) // Zoom 10 (~60km) để thấy toàn bộ camera markers
                    .tilt(0.0)
                    .build()
                map.cameraPosition = defaultPosition
            }

            loadCameraMarkers(style)
            addCarMarkerLayer(style)
        }
    }

    /**
     * Thêm marker "vị trí của bạn" (chấm xanh dương) lên bản đồ — trước đây map chỉ
     * tự pan theo xe mà không có gì đánh dấu vị trí thật, khó biết mình đang ở đâu.
     * setStyle() thay toàn bộ layer nên phải tạo lại mỗi lần đổi theme, giống
     * loadCameraMarkers(). Nếu đã có tọa độ từ trước (đổi theme giữa chừng) thì vẽ
     * ngay tại đó thay vì đợi tới GPS fix tiếp theo.
     */
    private fun addCarMarkerLayer(style: Style) {
        style.addImage("car_puck", com.vietmap.dashcam.map.CameraMarkerHelper.makeCarPuck(this))
        val geoJson = if (lastLat != 0.0 || lastLng != 0.0) buildCarGeoJson(lastLat, lastLng) else EMPTY_FEATURE_COLLECTION
        style.addSource(GeoJsonSource(CAR_SOURCE_ID, geoJson))
        style.addLayer(
            SymbolLayer(CAR_LAYER_ID, CAR_SOURCE_ID).withProperties(
                PropertyFactory.iconImage("car_puck"),
                PropertyFactory.iconAllowOverlap(true),
                PropertyFactory.iconIgnorePlacement(true),
            )
        )
    }

    private fun buildCarGeoJson(lat: Double, lng: Double): String {
        return JSONObject().apply {
            put("type", "FeatureCollection")
            put(
                "features",
                JSONArray().put(
                    JSONObject().apply {
                        put("type", "Feature")
                        put(
                            "geometry",
                            JSONObject().apply {
                                put("type", "Point")
                                put("coordinates", JSONArray().put(lng).put(lat))
                            }
                        )
                    }
                )
            )
        }.toString()
    }

    /**
     * Vẽ điểm bắn tốc độ / camera phạt nguội lên bản đồ: 1 GeoJSON source lấy từ
     * Room (offline), 1 layer chấm tròn tô màu theo loại camera, 1 layer nhãn
     * hiện tốc độ giới hạn. Dữ liệu hiện chỉ vài chục điểm nên load hết 1 lần
     * bằng getAllCameras() là đủ; nếu sau này dữ liệu phủ toàn quốc thì đổi sang
     * CameraDao.getCamerasInArea() theo bounding box quanh vị trí xe.
     */
    private fun loadCameraMarkers(style: Style) {
        lifecycleScope.launch {
            val db = AppDatabase.getDatabase(this@MainActivity)
            // Seed và đọc DB trên IO thread
            val cameras = kotlinx.coroutines.withContext(kotlinx.coroutines.Dispatchers.IO) {
                DatabaseSeeder.seedInitialDataIfEmpty(this@MainActivity, db)
                db.cameraDao().getAllCameras()
            }
            android.util.Log.d("DashcamMap", "loadCameraMarkers: loaded ${cameras.size} cameras from DB")
            // Build GeoJSON và update MapLibre trên Main thread
            val geoJson = buildCameraGeoJson(cameras)
            val existingSource = style.getSourceAs<GeoJsonSource>(CAMERA_SOURCE_ID)
            if (existingSource != null) {
                android.util.Log.d("DashcamMap", "Source exists, updating GeoJSON")
                // Source đã tồn tại → chỉ cập nhật dữ liệu (refresh sau OSM load)
                existingSource.setGeoJson(geoJson)
                return@launch
            }
            // Nạp các bitmap icon camera theo loại vào style
            style.addImage("cam_pin_default", com.vietmap.dashcam.map.CameraMarkerHelper.makeCameraPin(this@MainActivity, Color.parseColor("#38BDF8")))
            style.addImage("cam_pin_speed", com.vietmap.dashcam.map.CameraMarkerHelper.makeCameraPin(this@MainActivity, Color.parseColor("#EF4444")))
            style.addImage("cam_pin_red_light", com.vietmap.dashcam.map.CameraMarkerHelper.makeCameraPin(this@MainActivity, Color.parseColor("#F97316")))
            style.addImage("cam_pin_ai", com.vietmap.dashcam.map.CameraMarkerHelper.makeCameraPin(this@MainActivity, Color.parseColor("#A855F7")))

            // Lần đầu tiên → thêm source + 2 layers (Icon Layer + Speed Label Layer)
            style.addSource(GeoJsonSource(CAMERA_SOURCE_ID, geoJson))
            
            // Layer 1: Icon camera dạng badge tròn viền màu có camera CCTV bên trong
            style.addLayer(
                SymbolLayer(CAMERA_CIRCLE_LAYER_ID, CAMERA_SOURCE_ID).withProperties(
                    PropertyFactory.iconImage(
                        Expression.match(
                            Expression.get("type"),
                            Expression.literal("cam_pin_default"),
                            Expression.stop(SpeedCameraEntity.TYPE_SPEED_CAM, Expression.literal("cam_pin_speed")),
                            Expression.stop(SpeedCameraEntity.TYPE_RED_LIGHT_CAM, Expression.literal("cam_pin_red_light")),
                            Expression.stop(SpeedCameraEntity.TYPE_AI_JUNCTION, Expression.literal("cam_pin_ai")),
                        )
                    ),
                    PropertyFactory.iconAllowOverlap(true),
                    PropertyFactory.iconIgnorePlacement(true),
                    PropertyFactory.iconSize(0.9f),
                )
            )
            // Layer 2: Nhãn tốc độ giới hạn nằm ngay bên dưới icon
            style.addLayer(
                SymbolLayer(CAMERA_LABEL_LAYER_ID, CAMERA_SOURCE_ID).withProperties(
                    PropertyFactory.textField(Expression.get("speedLimitLabel")),
                    PropertyFactory.textFont(arrayOf("Noto Sans Regular")),
                    PropertyFactory.textSize(10f),
                    PropertyFactory.textColor(Color.WHITE),
                    PropertyFactory.textHaloColor("#0f172a".toColorInt()),
                    PropertyFactory.textHaloWidth(1.2f),
                    PropertyFactory.textOffset(arrayOf(0f, 1.4f)),
                    PropertyFactory.textAllowOverlap(true),
                    PropertyFactory.textIgnorePlacement(true),
                )
            )
        }
    }

    private fun buildCameraGeoJson(cameras: List<SpeedCameraEntity>): String {
        val features = JSONArray()
        cameras.forEach { cam ->
            features.put(
                JSONObject().apply {
                    put("type", "Feature")
                    put(
                        "geometry",
                        JSONObject().apply {
                            put("type", "Point")
                            put("coordinates", JSONArray().put(cam.longitude).put(cam.latitude))
                        }
                    )
                    put(
                        "properties",
                        JSONObject().apply {
                            put("name", cam.name)
                            put("type", cam.type)
                            put("speedLimitLabel", cam.speedLimit.toString())
                        }
                    )
                }
            )
        }
        return JSONObject().apply {
            put("type", "FeatureCollection")
            put("features", features)
        }.toString()
    }

    /**
     * MapLibre không đọc mbtiles:// trực tiếp từ assets, phải trỏ tới đường dẫn tuyệt đối
     * nên style.json cần được vá đường dẫn thật tại runtime. MBTilesFileSource của MapLibre
     * chỉ nhận request tile qua query string dạng mbtiles://<path>?file={x}/{y}/{z}.pbf
     * (đặt trong "tiles", không phải "url" — "url" không được xử lý trên Android).
     */
    private fun buildOfflineStyleJson(styleAsset: String): String {
        val mbtilesFile = File(getExternalFilesDir(null), "vietnam.mbtiles")
        when {
            !mbtilesFile.exists() -> Toast.makeText(
                this,
                getString(R.string.offline_map_missing, mbtilesFile.absolutePath),
                Toast.LENGTH_LONG,
            ).show()
            !isValidMbtiles(mbtilesFile) -> Toast.makeText(
                this,
                getString(R.string.offline_map_corrupt, mbtilesFile.absolutePath),
                Toast.LENGTH_LONG,
            ).show()
        }
        val template = assets.open(styleAsset).bufferedReader().use { it.readText() }
        return template.replace(
            "mbtiles://vietnam.mbtiles",
            "mbtiles://${mbtilesFile.absolutePath}"
        )
    }

    /**
     * Kiểm tra file .mbtiles còn nguyên vẹn trước khi dùng (tránh trường hợp
     * adb push/tải bị ngắt giữa chừng để lại file rỗng hoặc thiếu byte cuối) —
     * áp dụng mẫu kiểm tra dữ liệu offline trước khi nạp giống app Vietmap S2.
     * .mbtiles là SQLite nên chỉ cần đọc 16 byte đầu là đủ, không cần quét cả file.
     */
    private fun isValidMbtiles(file: File): Boolean {
        if (file.length() < 1_000_000L) return false
        val header = ByteArray(16)
        return try {
            file.inputStream().use { it.read(header) }
            String(header, Charsets.US_ASCII) == "SQLite format 3\u0000"
        } catch (e: Exception) {
            false
        }
    }

    private fun updateHUD(
        speed: Int,
        speedLimit: Int,
        nearestCamName: String,
        nearestCamDist: Int,
        nearestCamType: String,
        lat: Double,
        lng: Double,
        fixElapsedRealtimeNanos: Long
    ) {
        // Cập nhật vận tốc hiện tại
        tvCurrentSpeed.text = speed.toString()
        if (speed > speedLimit) {
            tvCurrentSpeed.setTextColor("#EF4444".toColorInt()) // Đỏ khi vượt tốc độ
        } else {
            tvCurrentSpeed.setTextColor("#38BDF8".toColorInt()) // Xanh dương an toàn
        }

        // Cập nhật thẻ cảnh báo camera phạt nguội — ngưỡng theo loại camera, xem SpeedCameraEntity.alertDistanceMetres
        if (nearestCamDist in 1..SpeedCameraEntity.alertDistanceMetres(nearestCamType)) {
            cardCameraAlert.visibility = View.VISIBLE
            tvAlertTitle.text = "🚨 $nearestCamName"
            tvAlertDetail.text = getString(R.string.camera_alert_distance, nearestCamDist, speedLimit)
        } else {
            cardCameraAlert.visibility = View.GONE
        }

        // Di chuyển bản đồ theo xe nếu có tọa độ hợp lệ.
        // Duration animation khớp theo đúng khoảng cách thời gian giữa 2 lần GPS fix
        // thật (Location.elapsedRealtimeNanos) — không dùng giờ nhận broadcast vì
        // bước query DB camera gần đó (IO, thời gian không cố định) ở WarningService
        // có thể trễ khác nhau mỗi lần, cộng dồn thêm jitter không liên quan tới GPS.
        // easeCamera dùng interpolator tuyến tính (linear) thay vì animateCamera
        // (ease-in-out) để tốc độ di chuyển đều, không tăng/giảm tốc mỗi bước.
        if (lat != 0.0 && lng != 0.0 && maplibreMap != null) {
            lastLat = lat
            lastLng = lng
            val duration = if (lastFixElapsedRealtimeNanos == 0L || fixElapsedRealtimeNanos == 0L) {
                1000
            } else {
                ((fixElapsedRealtimeNanos - lastFixElapsedRealtimeNanos) / 1_000_000L)
                    .toInt()
                    .coerceIn(100, 1500)
            }
            lastFixElapsedRealtimeNanos = fixElapsedRealtimeNanos
            val carLocation = LatLng(lat, lng)
            maplibreMap?.easeCamera(CameraUpdateFactory.newLatLng(carLocation), duration, false)
            maplibreMap?.style?.getSourceAs<GeoJsonSource>(CAR_SOURCE_ID)?.setGeoJson(buildCarGeoJson(lat, lng))
        }
    }

    private fun checkPermissionsAndStartService() {
        val permissions = arrayOf(
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.ACCESS_COARSE_LOCATION
        )

        val notGranted = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }

        if (notGranted.isNotEmpty()) {
            ActivityCompat.requestPermissions(this, notGranted.toTypedArray(), locationPermissionRequestCode)
        } else {
            startWarningService()
        }
    }

    private fun startWarningService() {
        val serviceIntent = Intent(this, WarningService::class.java)
        ContextCompat.startForegroundService(this, serviceIntent)
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == locationPermissionRequestCode && grantResults.all { it == PackageManager.PERMISSION_GRANTED }) {
            startWarningService()
        }
    }

    override fun onStart() {
        super.onStart()
        mapView?.onStart()
        // Đăng ký receiver GPS
        val locationFilter = IntentFilter(WarningService.ACTION_LOCATION_UPDATE)
        ContextCompat.registerReceiver(this, locationUpdateReceiver, locationFilter, ContextCompat.RECEIVER_NOT_EXPORTED)
        // Đăng ký receiver cập nhật camera OSM
        val cameraFilter = IntentFilter(WarningService.ACTION_CAMERAS_UPDATED)
        ContextCompat.registerReceiver(this, camerasUpdatedReceiver, cameraFilter, ContextCompat.RECEIVER_NOT_EXPORTED)
    }

    override fun onResume() {
        super.onResume()
        mapView?.onResume()
    }

    override fun onPause() {
        super.onPause()
        mapView?.onPause()
    }

    override fun onStop() {
        super.onStop()
        mapView?.onStop()
        try { unregisterReceiver(locationUpdateReceiver) } catch (e: Exception) { /* not registered */ }
        try { unregisterReceiver(camerasUpdatedReceiver) } catch (e: Exception) { /* not registered */ }
    }

    override fun onLowMemory() {
        super.onLowMemory()
        mapView?.onLowMemory()
    }

    override fun onDestroy() {
        super.onDestroy()
        mapView?.onDestroy()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        mapView?.onSaveInstanceState(outState)
    }

    companion object {
        private const val CAMERA_SOURCE_ID = "speed_cameras_source"
        private const val CAMERA_CIRCLE_LAYER_ID = "speed_cameras_circle"
        private const val CAMERA_LABEL_LAYER_ID = "speed_cameras_label"
        private const val CAR_SOURCE_ID = "car_position_source"
        private const val CAR_LAYER_ID = "car_position_layer"
        private const val EMPTY_FEATURE_COLLECTION = """{"type":"FeatureCollection","features":[]}"""
        private const val KEY_MAP_THEME_LIGHT = "map_theme_light"
    }
}
