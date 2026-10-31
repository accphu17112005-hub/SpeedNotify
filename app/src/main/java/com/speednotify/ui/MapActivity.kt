package com.speednotify.ui

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.location.Location
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import android.app.DatePickerDialog
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.core.graphics.toColorInt
import androidx.lifecycle.lifecycleScope
import com.google.android.gms.location.LocationCallback
import com.google.android.gms.location.LocationRequest
import com.google.android.gms.location.LocationResult
import com.google.android.gms.location.LocationServices
import com.google.android.gms.location.Priority
import com.speednotify.R
import com.speednotify.data.Camera
import com.speednotify.data.CameraDatabase
import com.speednotify.data.OsmCameraRepository
import com.speednotify.data.RoadSpeedLimitRepository
import com.speednotify.data.TripLocation
import com.speednotify.map.CameraMarkerHelper
import com.speednotify.service.LocationForegroundService
import com.speednotify.utils.PermissionUtils
import com.speednotify.utils.GeoUtils
import com.speednotify.utils.GpsUtils
import com.speednotify.utils.RouteDistance
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.json.JSONArray
import org.json.JSONObject
import org.maplibre.android.MapLibre
import org.maplibre.android.RenderingEngine
import org.maplibre.android.WellKnownTileServer
import org.maplibre.android.camera.CameraPosition
import org.maplibre.android.camera.CameraUpdateFactory
import org.maplibre.android.geometry.LatLng
import org.maplibre.android.maps.MapLibreMap
import org.maplibre.android.maps.MapView
import org.maplibre.android.maps.Style
import org.maplibre.android.style.expressions.Expression
import org.maplibre.android.style.layers.Property
import org.maplibre.android.style.layers.PropertyFactory
import org.maplibre.android.style.layers.LineLayer
import org.maplibre.android.style.layers.SymbolLayer
import org.maplibre.android.style.sources.GeoJsonSource
import java.io.File
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale

/**
 * Màn hình bản đồ camera phạt nguội (MapLibre).
 *
 * - Tự động tải bản đồ OFFLINE vector (vietnam.mbtiles) nếu có trên máy,
 *   hoặc bản đồ ONLINE OpenFreeMap miễn phí (dark / liberty) nếu chưa có file offline.
 * - Hỗ trợ nạp file vietnam.mbtiles qua File Picker (nút 📂) hoặc tự quét các thư mục phổ biến.
 * - Marker camera từ Room DB (103 điểm seed + dữ liệu sync từ OSM Overpass).
 * - Chấm xe "vị trí của bạn" + HUD tốc độ nhận từ LocationForegroundService hoặc FusedLocation.
 * - Nút sync OSM: cập nhật camera phạt nguội mới nhất từ OpenStreetMap (cache 24h).
 */
class MapActivity : AppCompatActivity() {
    private var mapView: MapView? = null
    private var maplibreMap: MapLibreMap? = null

    private lateinit var tvServiceStatus: TextView
    private lateinit var tvMapSourceStatus: TextView
    private lateinit var btnSyncOsm: Button
    private lateinit var tvCurrentSpeed: TextView
    private lateinit var tvSpeedLimit: TextView
    private lateinit var cardCameraAlert: View
    private lateinit var tvAlertTitle: TextView
    private lateinit var tvAlertDetail: TextView
    private lateinit var btnLocateMe: TextView
    private lateinit var btnMapTheme: TextView
    private lateinit var btnImportMbtiles: TextView
    private lateinit var tvRouteDay: TextView
    private lateinit var tvRouteSummary: TextView
    private lateinit var btnRouteDate: TextView

    private var lastLat = 0.0
    private var lastLng = 0.0
    private var lastBearing = 0f
    private var lastLocationTimeMs = 0L
    private var lastFixElapsedRealtimeNanos = 0L
    private var isVisibleLocationUpdatesActive = false
    private var isLocationUpdateReceiverRegistered = false
    private var lastCameraLookupTimeMs = 0L
    private var lastNearbyCameraLookupTimeMs = 0L
    private var lastNearbyCameraLookupLat = 0.0
    private var lastNearbyCameraLookupLng = 0.0
    private var isSyncingOsm = false
    private var isOfflineStyleActive: Boolean? = null
    private var networkCallback: ConnectivityManager.NetworkCallback? = null
    private val cameraRefreshHandler = Handler(Looper.getMainLooper())
    private val cameraRefreshRunnable = object : Runnable {
        override fun run() {
            if (lastLat != 0.0 || lastLng != 0.0) {
                refreshNearbyCameraLimit(lastLat, lastLng)
            }
            cameraRefreshHandler.postDelayed(this, CAMERA_REFRESH_INTERVAL_MS)
        }
    }
    private var selectedRouteDateMillis = startOfDay(Calendar.getInstance()).timeInMillis
    private var lastRouteRefreshTimeMs = 0L
    private var routeObserverJob: Job? = null

    private val fusedLocationClient by lazy { LocationServices.getFusedLocationProviderClient(this) }
    private val visibleLocationCallback = object : LocationCallback() {
        override fun onLocationResult(locationResult: LocationResult) {
            if (PermissionUtils.isServiceRunning(this@MapActivity, LocationForegroundService::class.java)) {
                stopVisibleLocationUpdates()
                return
            }
            locationResult.lastLocation?.let(::updateHudFromVisibleLocation)
        }
    }

    companion object {
        private const val TAG = "MapActivity"
        private const val CAMERA_SOURCE_ID = "cameras-source"
        private const val CAMERA_ICONS_LAYER_ID = "cameras-icons-layer"
        private const val CAMERA_LABELS_LAYER_ID = "cameras-labels-layer"
        private const val CAR_SOURCE_ID = "car-source"
        private const val CAR_LAYER_ID = "car-layer"
        private const val ROUTE_SOURCE_ID = "daily-route-source"
        private const val ROUTE_LAYER_ID = "daily-route-layer"
        private const val CAMERA_SEARCH_RADIUS_METERS = 10_000.0
        private const val KEY_MAP_THEME_LIGHT = "map_theme_light"
        private const val KEY_LAST_SPEED_LIMIT = "last_speed_limit"
        private const val KEY_LAST_SPEED_LIMIT_LAT = "last_speed_limit_lat"
        private const val KEY_LAST_SPEED_LIMIT_LNG = "last_speed_limit_lng"
        private const val KEY_LAST_SPEED_LIMIT_SOURCE = "last_speed_limit_source"
        private const val SPEED_LIMIT_CACHE_RADIUS_METERS = 100.0
        private const val CAMERA_REFRESH_INTERVAL_MS = 60_000L
        private const val EMPTY_FEATURE_COLLECTION = """{"type":"FeatureCollection","features":[]}"""

        // OpenFreeMap: dịch vụ bản đồ vector miễn phí chất lượng cao, không cần API key
        private const val ONLINE_STYLE_DARK = "https://tiles.openfreemap.org/styles/dark"
        private const val ONLINE_STYLE_LIGHT = "https://tiles.openfreemap.org/styles/liberty"
    }

    /** Trình chọn file MBTiles từ bộ nhớ máy */
    private val importMbtilesLauncher = registerForActivityResult(
        ActivityResultContracts.OpenDocument()
    ) { uri: Uri? ->
        if (uri != null) {
            importMbtilesFromUri(uri)
        }
    }

    /** Receiver cập nhật HUD + di chuyển bản đồ theo vị trí từ foreground service */
    private val locationUpdateReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action == LocationForegroundService.ACTION_LOCATION_UPDATE) {
                val speed = intent.getIntExtra(LocationForegroundService.EXTRA_SPEED, 0).coerceAtLeast(0)
                val speedLimit = intent.getIntExtra(LocationForegroundService.EXTRA_SPEED_LIMIT, 0)
                val nearestCamName = intent.getStringExtra(LocationForegroundService.EXTRA_NEAREST_CAM_NAME) ?: ""
                val nearestCamDist = intent.getIntExtra(LocationForegroundService.EXTRA_NEAREST_CAM_DIST, -1)
                val nearestCamType = intent.getStringExtra(LocationForegroundService.EXTRA_NEAREST_CAM_TYPE) ?: ""
                val lat = intent.getDoubleExtra(LocationForegroundService.EXTRA_LAT, 0.0)
                val lng = intent.getDoubleExtra(LocationForegroundService.EXTRA_LNG, 0.0)
                val bearing = intent.getFloatExtra(LocationForegroundService.EXTRA_BEARING, -1f)
                val fixNanos = intent.getLongExtra(LocationForegroundService.EXTRA_FIX_ELAPSED_REALTIME_NANOS, 0L)

                stopVisibleLocationUpdates()
                updateServiceStatus(running = true)
                updateHUD(speed, speedLimit, nearestCamName, nearestCamDist, nearestCamType, lat, lng, bearing, fixNanos)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MapLibre.getInstance(this, null, WellKnownTileServer.MapLibre, RenderingEngine.Type.OPENGL)
        setContentView(R.layout.activity_map)

        initViews()
        initMap(savedInstanceState)
        updateServiceStatus()
    }

    private fun initViews() {
        mapView = findViewById(R.id.mapView)
        tvServiceStatus = findViewById(R.id.tvServiceStatus)
        tvMapSourceStatus = findViewById(R.id.tvMapSourceStatus)
        btnSyncOsm = findViewById(R.id.btnSyncOsm)
        tvCurrentSpeed = findViewById(R.id.tvCurrentSpeed)
        tvSpeedLimit = findViewById(R.id.tvSpeedLimit)
        cardCameraAlert = findViewById(R.id.cardCameraAlert)
        tvAlertTitle = findViewById(R.id.tvAlertTitle)
        tvAlertDetail = findViewById(R.id.tvAlertDetail)
        btnLocateMe = findViewById(R.id.btnLocateMe)
        btnMapTheme = findViewById(R.id.btnMapTheme)
        btnImportMbtiles = findViewById(R.id.btnImportMbtiles)
        tvRouteDay = findViewById(R.id.tvRouteDay)
        tvRouteSummary = findViewById(R.id.tvRouteSummary)
        btnRouteDate = findViewById(R.id.btnRouteDate)
        val btnZoomIn: TextView = findViewById(R.id.btnZoomIn)
        val btnZoomOut: TextView = findViewById(R.id.btnZoomOut)

        cardCameraAlert.visibility = View.GONE

        btnZoomIn.setOnClickListener { maplibreMap?.animateCamera(CameraUpdateFactory.zoomIn()) }
        btnZoomOut.setOnClickListener { maplibreMap?.animateCamera(CameraUpdateFactory.zoomOut()) }

        btnLocateMe.setOnClickListener {
            if (lastLat != 0.0 || lastLng != 0.0) {
                val position = CameraPosition.Builder()
                    .target(LatLng(lastLat, lastLng))
                    .zoom(17.5)
                    .tilt(30.0)
                    .build()
                maplibreMap?.animateCamera(CameraUpdateFactory.newCameraPosition(position))
            } else {
                Toast.makeText(this, getString(R.string.location_not_available), Toast.LENGTH_SHORT).show()
                fetchInitialLocation()
            }
        }

        updateMapThemeButton()
        btnMapTheme.setOnClickListener {
            val prefs = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)
            val isLight = prefs.getBoolean(KEY_MAP_THEME_LIGHT, false)
            prefs.edit().putBoolean(KEY_MAP_THEME_LIGHT, !isLight).apply()
            updateMapThemeButton()
            applyMapStyle(isFirstLoad = false)
        }

        btnImportMbtiles.setOnClickListener {
            try {
                importMbtilesLauncher.launch(arrayOf("*/*"))
            } catch (e: Exception) {
                Log.e(TAG, "Failed to open document picker", e)
                Toast.makeText(this, "Không thể mở trình chọn tệp: ${e.message}", Toast.LENGTH_SHORT).show()
            }
        }

        btnSyncOsm.setOnClickListener { syncOsm() }
        btnRouteDate.setOnClickListener { showRouteDatePicker() }
        tvRouteDay.text = formatRouteDate(selectedRouteDateMillis)
        tvRouteSummary.text = "Đang tải hành trình..."
    }

    private fun updateServiceStatus(running: Boolean? = null) {
        val isRunning = running ?: PermissionUtils.isServiceRunning(this, LocationForegroundService::class.java)
        tvServiceStatus.text = if (isRunning) getString(R.string.map_service_running) else getString(R.string.map_service_stopped)
        tvServiceStatus.setTextColor(if (isRunning) "#38BDF8".toColorInt() else "#FBBF24".toColorInt())
    }

    private fun updateMapThemeButton() {
        val isLight = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)
            .getBoolean(KEY_MAP_THEME_LIGHT, true)
        btnMapTheme.text = if (isLight) "☀️" else "🌙"
    }

    /** Sync camera phạt nguội mới nhất từ OpenStreetMap (Overpass API, cache 24h) */
    private fun syncOsm() {
        if (isSyncingOsm) return
        isSyncingOsm = true
        btnSyncOsm.isEnabled = false
        btnSyncOsm.text = getString(R.string.map_syncing)

        lifecycleScope.launch {
            val result = OsmCameraRepository.refreshIfNeeded(this@MapActivity, forceRefresh = true)
            isSyncingOsm = false
            btnSyncOsm.isEnabled = true
            btnSyncOsm.text = getString(R.string.map_sync_osm)

            when (result) {
                -1 -> Toast.makeText(this@MapActivity, getString(R.string.map_osm_cached), Toast.LENGTH_SHORT).show()
                -2 -> Toast.makeText(this@MapActivity, getString(R.string.map_osm_failed), Toast.LENGTH_LONG).show()
                else -> Toast.makeText(this@MapActivity, getString(R.string.map_osm_synced, result), Toast.LENGTH_SHORT).show()
            }
            // Vẽ lại marker camera trên bản đồ sau khi DB cập nhật
            maplibreMap?.style?.let { loadCameraMarkers(it) }
        }
    }

    private fun initMap(savedInstanceState: Bundle?) {
        mapView?.onCreate(savedInstanceState)
        mapView?.addOnDidFailLoadingMapListener { errorMessage ->
            Log.e(TAG, "Map loading error: $errorMessage")
            if (isOfflineStyleActive != true && findMbtilesFile() != null) {
                runOnUiThread { applyMapStyle(isFirstLoad = false, forceOffline = true) }
            }
        }
        mapView?.getMapAsync { map ->
            this.maplibreMap = map
            applyMapStyle(isFirstLoad = true)
            fetchInitialLocation()
        }
    }

    /**
     * Tìm file vietnam.mbtiles từ nhiều vị trí khả dĩ trong máy:
     * 1. Thư mục riêng của ứng dụng (getExternalFilesDir)
     * 2. Thư mục Download công cộng
     * 3. Bộ nhớ gốc máy (/sdcard/)
     * 4. Thư mục của app tham chiếu cũ
     */
    private fun findMbtilesFile(): File? {
        val appSpecific = File(getExternalFilesDir(null), "vietnam.mbtiles")
        if (appSpecific.exists() && isValidMbtiles(appSpecific)) {
            return appSpecific
        }
        val candidates = listOf(
            File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), "vietnam.mbtiles"),
            File("/sdcard/Download/vietnam.mbtiles"),
            File("/sdcard/vietnam.mbtiles"),
            File("/storage/emulated/0/Download/vietnam.mbtiles"),
            File("/sdcard/Android/data/com.vietmap.dashcam/files/vietnam.mbtiles")
        )
        for (candidate in candidates) {
            try {
                if (candidate.exists() && candidate.canRead() && isValidMbtiles(candidate)) {
                    // Sao chép sang thư mục riêng của app để đảm bảo quyền truy cập trên Android 11+
                    try {
                        candidate.copyTo(appSpecific, overwrite = true)
                        return appSpecific
                    } catch (_: Exception) {
                        return candidate
                    }
                }
            } catch (_: Exception) {}
        }
        return null
    }

    /** Nạp file MBTiles do người dùng chọn từ File Picker */
    private fun importMbtilesFromUri(uri: Uri) {
        Toast.makeText(this, getString(R.string.map_import_copying), Toast.LENGTH_SHORT).show()
        lifecycleScope.launch(Dispatchers.IO) {
            val destFile = File(getExternalFilesDir(null), "vietnam.mbtiles")
            val tempFile = File(getExternalFilesDir(null), "vietnam.mbtiles.tmp")
            try {
                contentResolver.openInputStream(uri)?.use { input ->
                    tempFile.outputStream().use { output ->
                        input.copyTo(output)
                    }
                }
                if (isValidMbtiles(tempFile)) {
                    if (destFile.exists()) destFile.delete()
                    val renamed = tempFile.renameTo(destFile)
                    if (!renamed) {
                        tempFile.copyTo(destFile, overwrite = true)
                        tempFile.delete()
                    }
                    withContext(Dispatchers.Main) {
                        Toast.makeText(this@MapActivity, getString(R.string.map_import_success), Toast.LENGTH_SHORT).show()
                        applyMapStyle(isFirstLoad = false)
                    }
                } else {
                    tempFile.delete()
                    withContext(Dispatchers.Main) {
                        Toast.makeText(this@MapActivity, getString(R.string.map_import_failed), Toast.LENGTH_LONG).show()
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error importing MBTiles", e)
                if (tempFile.exists()) tempFile.delete()
                withContext(Dispatchers.Main) {
                    Toast.makeText(this@MapActivity, "${getString(R.string.map_import_failed)}: ${e.localizedMessage}", Toast.LENGTH_LONG).show()
                }
            }
        }
    }

    /** Lấy tọa độ GPS ban đầu nhanh bằng FusedLocation */
    private fun fetchInitialLocation() {
        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED) {
            try {
                val fusedClient = LocationServices.getFusedLocationProviderClient(this)
                fusedClient.lastLocation.addOnSuccessListener { location ->
                    if (location != null && (lastLat == 0.0 && lastLng == 0.0)) {
                        lastLat = location.latitude
                        lastLng = location.longitude
                        restoreCachedSpeedLimit(lastLat, lastLng)?.let { tvSpeedLimit.text = it.toString() }
                        refreshSpeedLimitIfDue(lastLat, lastLng)
                        refreshNearbyCameraLimit(lastLat, lastLng)
                        maplibreMap?.let { map ->
                            val position = CameraPosition.Builder()
                                .target(LatLng(location.latitude, location.longitude))
                                .zoom(15.0)
                                .tilt(0.0)
                                .build()
                            map.animateCamera(CameraUpdateFactory.newCameraPosition(position))
                            map.style?.let { style ->
                                val existingSource = style.getSourceAs<GeoJsonSource>(CAR_SOURCE_ID)
                                existingSource?.setGeoJson(buildCarGeoJson(lastLat, lastLng))
                            }
                        }
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error fetching initial location", e)
            }
        }
    }

    /**
     * Áp style theo theme đang chọn.
     * - Dùng MBTiles offline nếu có file vietnam.mbtiles hợp lệ.
     * - Fallback bản đồ OpenFreeMap Online nếu chưa có file offline.
     */
    private fun applyMapStyle(isFirstLoad: Boolean = false, forceOffline: Boolean = false) {
        val map = maplibreMap ?: return
        val isLight = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)
            .getBoolean(KEY_MAP_THEME_LIGHT, true)
        val mbtilesFile = findMbtilesFile()

        val hasInternet = hasInternetConnection()
        val isOffline = mbtilesFile != null && (forceOffline || !hasInternet)
        isOfflineStyleActive = isOffline
        tvMapSourceStatus.text = if (isOffline) {
            getString(R.string.map_source_offline)
        } else if (hasInternet) {
            getString(R.string.map_source_online)
        } else {
            "Mất mạng · chưa có bản đồ offline"
        }
        tvMapSourceStatus.setTextColor(
            when {
                isOffline -> "#10B981".toColorInt()
                hasInternet -> "#38BDF8".toColorInt()
                else -> "#FBBF24".toColorInt()
            }
        )

        try {
            val styleBuilder = if (isOffline) {
                val styleAsset = if (isLight) "offline_style_light.json" else "offline_style.json"
                Style.Builder().fromJson(buildOfflineStyleJson(styleAsset, mbtilesFile!!))
            } else {
                val onlineUrl = if (isLight) ONLINE_STYLE_LIGHT else ONLINE_STYLE_DARK
                Style.Builder().fromUri(onlineUrl)
            }

            map.setStyle(styleBuilder) { style ->
                try {
                    if (isFirstLoad) {
                        val targetLatLng = if (lastLat != 0.0 && lastLng != 0.0) {
                            LatLng(lastLat, lastLng)
                        } else {
                            LatLng(21.0285, 105.8542) // Hà Nội
                        }
                        val defaultPosition = CameraPosition.Builder()
                            .target(targetLatLng)
                            .zoom(if (lastLat != 0.0) 15.0 else 10.0)
                            .tilt(0.0)
                            .build()
                        map.cameraPosition = defaultPosition
                    }
                    addDailyRouteLayer(style)
                    loadCameraMarkers(style)
                    addCarMarkerLayer(style)
                    loadDailyRoute()
                } catch (exception: Exception) {
                    Log.e(TAG, "Failed to initialize map style layers", exception)
                    Toast.makeText(this, "Không thể khởi tạo lớp bản đồ", Toast.LENGTH_LONG).show()
                }
            }
        } catch (exception: Exception) {
            Log.e(TAG, "Failed to load map style", exception)
            tvMapSourceStatus.text = "Không tải được bản đồ"
            Toast.makeText(this, "Không thể tải bản đồ trên thiết bị này", Toast.LENGTH_LONG).show()
        }
    }

    /**
     * MapLibre không đọc mbtiles:// trực tiếp từ assets, phải trỏ tới đường dẫn tuyệt đối
     * nên style.json cần được vá đường dẫn thật tại runtime. MBTilesFileSource chỉ nhận
     * tile qua query string mbtiles://<path>?file={x}/{y}/{z}.pbf (đặt trong "tiles").
     */
    private fun buildOfflineStyleJson(styleAsset: String, mbtilesFile: File): String {
        val template = assets.open(styleAsset).bufferedReader().use { it.readText() }
        return template.replace("mbtiles://vietnam.mbtiles", "mbtiles://${mbtilesFile.absolutePath}")
    }

    /** .mbtiles là SQLite nên chỉ cần đọc 16 byte header đầu (kiểm tra file push dở) */
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

    private fun addCarMarkerLayer(style: Style) {
        style.addImage("car_puck", CameraMarkerHelper.makeCarPuck(this))
        val geoJson = if (lastLat != 0.0 || lastLng != 0.0) buildCarGeoJson(lastLat, lastLng, lastBearing) else EMPTY_FEATURE_COLLECTION
        style.addSource(GeoJsonSource(CAR_SOURCE_ID, geoJson))
        val carLayer = SymbolLayer(CAR_LAYER_ID, CAR_SOURCE_ID).withProperties(
            PropertyFactory.iconImage("car_puck"),
            PropertyFactory.iconRotate(Expression.get("bearing")),
            PropertyFactory.iconRotationAlignment(Property.ICON_ROTATION_ALIGNMENT_MAP),
            PropertyFactory.iconAllowOverlap(true),
            PropertyFactory.iconIgnorePlacement(true),
        )
        // Luôn đặt layer xe ở trên cùng (phía trên vệt đường đi)
        if (style.getLayer(ROUTE_LAYER_ID) != null) {
            style.addLayerAbove(carLayer, ROUTE_LAYER_ID)
        } else {
            style.addLayer(carLayer)
        }
    }

    private fun addDailyRouteLayer(style: Style) {
        style.addSource(GeoJsonSource(ROUTE_SOURCE_ID, EMPTY_FEATURE_COLLECTION))
        val routeLayer = LineLayer(ROUTE_LAYER_ID, ROUTE_SOURCE_ID).withProperties(
            PropertyFactory.lineColor("#38BDF8"), // Xanh nhạt (Light Sky Blue)
            PropertyFactory.lineWidth(5f),
            PropertyFactory.lineOpacity(0.9f)
        )
        // Vệt đường đi luôn nằm phía dưới layer xe (CAR_LAYER_ID) để không che mất mũi tên
        if (style.getLayer(CAR_LAYER_ID) != null) {
            style.addLayerBelow(routeLayer, CAR_LAYER_ID)
        } else {
            style.addLayer(routeLayer)
        }
    }

    private fun showRouteDatePicker() {
        val selectedDate = Calendar.getInstance().apply { timeInMillis = selectedRouteDateMillis }
        DatePickerDialog(
            this,
            { _, year, month, day ->
                selectedRouteDateMillis = Calendar.getInstance().apply {
                    set(year, month, day, 0, 0, 0)
                    set(Calendar.MILLISECOND, 0)
                }.timeInMillis
                tvRouteDay.text = formatRouteDate(selectedRouteDateMillis)
                loadDailyRoute()
            },
            selectedDate.get(Calendar.YEAR),
            selectedDate.get(Calendar.MONTH),
            selectedDate.get(Calendar.DAY_OF_MONTH)
        ).show()
    }

    private fun loadDailyRoute() {
        observeDailyRoute()
    }

    private fun observeDailyRoute() {
        routeObserverJob?.cancel()
        val start = Calendar.getInstance().apply { timeInMillis = selectedRouteDateMillis }
        val end = (start.clone() as Calendar).apply { add(Calendar.DAY_OF_MONTH, 1) }
        routeObserverJob = lifecycleScope.launch {
            try {
                CameraDatabase.getDatabase(this@MapActivity)
                    .tripLocationDao()
                    .observeLocationsBetween(start.timeInMillis, end.timeInMillis)
                    .collect { locations ->
                        val distanceMeters = RouteDistance.totalMeters(locations)
                        tvRouteSummary.text = if (locations.isEmpty()) {
                            "Chưa có dữ liệu · 0 m"
                        } else if (distanceMeters >= 1000) {
                            String.format(Locale.getDefault(), "%d điểm · %.2f km", locations.size, distanceMeters / 1000)
                        } else {
                            String.format(Locale.getDefault(), "%d điểm · %.0f m", locations.size, distanceMeters)
                        }
                        maplibreMap?.style?.getSourceAs<GeoJsonSource>(ROUTE_SOURCE_ID)
                            ?.setGeoJson(buildRouteGeoJson(locations))
                    }
            } catch (exception: Exception) {
                Log.e(TAG, "Failed to observe route history", exception)
                tvRouteSummary.text = "Không tải được hành trình"
            }
        }
    }

    private fun buildRouteGeoJson(locations: List<TripLocation>): String {
        if (locations.size < 2) return EMPTY_FEATURE_COLLECTION
        val coordinates = JSONArray()
        locations.forEach { location ->
            coordinates.put(JSONArray().put(location.longitude).put(location.latitude))
        }
        return JSONObject().apply {
            put("type", "Feature")
            put(
                "geometry",
                JSONObject().apply {
                    put("type", "LineString")
                    put("coordinates", coordinates)
                }
            )
            put("properties", JSONObject())
        }.toString()
    }

    private fun formatRouteDate(timestamp: Long): String =
        SimpleDateFormat("EEE, dd/MM/yyyy", Locale("vi", "VN")).format(timestamp)

    private fun isSelectedRouteToday(): Boolean =
        startOfDay(Calendar.getInstance()).timeInMillis == selectedRouteDateMillis

    private fun refreshTodayRouteIfDue() {
        val now = System.currentTimeMillis()
        if (isSelectedRouteToday() && now - lastRouteRefreshTimeMs >= 3_000L) {
            lastRouteRefreshTimeMs = now
            if (routeObserverJob == null || routeObserverJob?.isActive != true) {
                observeDailyRoute()
            }
        }
    }

    private fun recordVisibleLocation(location: Location) {
        // Bỏ qua nếu độ chính xác quá kém (> 100m) để tránh điểm nhiễu
        // Nếu thiết bị không báo accuracy, vẫn ghi để đảm bảo không mất dữ liệu
        val accuracy = if (location.hasAccuracy()) location.accuracy else 99f
        if (accuracy > 100f) return
        lifecycleScope.launch(Dispatchers.IO) {
            CameraDatabase.getDatabase(this@MapActivity)
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

    private fun startOfDay(calendar: Calendar): Calendar = (calendar.clone() as Calendar).apply {
        set(Calendar.HOUR_OF_DAY, 0)
        set(Calendar.MINUTE, 0)
        set(Calendar.SECOND, 0)
        set(Calendar.MILLISECOND, 0)
    }

    private fun buildCarGeoJson(lat: Double, lng: Double, bearing: Float = 0f): String {
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
                        put(
                            "properties",
                            JSONObject().apply {
                                put("bearing", bearing)
                            }
                        )
                    }
                )
            )
        }.toString()
    }

    /**
     * Vẽ marker camera phạt nguội từ Room DB (1 GeoJSON source + layer icon theo loại
     * + layer nhãn tốc độ). Dữ liệu nhỏ nên load hết 1 lần; refresh sau mỗi lần sync OSM.
     */
    private fun loadCameraMarkers(style: Style) {
        lifecycleScope.launch {
            try {
                val db = CameraDatabase.getDatabase(this@MapActivity)
                val cameras = withContext(Dispatchers.IO) {
                    db.cameraDao().getAllCameras()
                }
                val geoJson = buildCameraGeoJson(cameras)
                val existingSource = style.getSourceAs<GeoJsonSource>(CAMERA_SOURCE_ID)
                if (existingSource != null) {
                    existingSource.setGeoJson(geoJson)
                    return@launch
                }

                style.addImage("cam_pin_default", CameraMarkerHelper.makeCameraPin(this@MapActivity, "#38BDF8".toColorInt()))
                style.addImage("cam_pin_speed", CameraMarkerHelper.makeCameraPin(this@MapActivity, "#EF4444".toColorInt()))
                style.addImage("cam_pin_red_light", CameraMarkerHelper.makeCameraPin(this@MapActivity, "#F97316".toColorInt()))
                style.addImage("cam_pin_ai", CameraMarkerHelper.makeCameraPin(this@MapActivity, "#A855F7".toColorInt()))

                style.addSource(GeoJsonSource(CAMERA_SOURCE_ID, geoJson))
                val iconsLayer = SymbolLayer(CAMERA_ICONS_LAYER_ID, CAMERA_SOURCE_ID).withProperties(
                    PropertyFactory.iconImage(
                        Expression.match(
                            Expression.get("type"),
                            Expression.literal("cam_pin_default"),
                            Expression.stop("speed", Expression.literal("cam_pin_speed")),
                            Expression.stop("redlight", Expression.literal("cam_pin_red_light")),
                            Expression.stop("ai", Expression.literal("cam_pin_ai")),
                        )
                    ),
                    PropertyFactory.iconAllowOverlap(true),
                    PropertyFactory.iconIgnorePlacement(true),
                    PropertyFactory.iconSize(0.9f),
                )
                val labelsLayer = SymbolLayer(CAMERA_LABELS_LAYER_ID, CAMERA_SOURCE_ID).withProperties(
                    PropertyFactory.textField(Expression.get("speedLimitLabel")),
                    PropertyFactory.textFont(arrayOf("Noto Sans Regular")),
                    PropertyFactory.textSize(11f),
                    PropertyFactory.textColor("#17312D".toColorInt()),
                    PropertyFactory.textHaloColor("#FFFFFF".toColorInt()),
                    PropertyFactory.textHaloWidth(2.0f),
                    PropertyFactory.textOffset(arrayOf(0f, 1.35f)),
                    PropertyFactory.textAllowOverlap(true),
                    PropertyFactory.textIgnorePlacement(true),
                )
                if (style.getLayer(CAR_LAYER_ID) != null) {
                    style.addLayerBelow(iconsLayer, CAR_LAYER_ID)
                    style.addLayerBelow(labelsLayer, CAR_LAYER_ID)
                } else {
                    style.addLayer(iconsLayer)
                    style.addLayer(labelsLayer)
                }
            } catch (exception: Exception) {
                Log.e(TAG, "Failed to load camera markers", exception)
            }
        }
    }

    private fun buildCameraGeoJson(cameras: List<Camera>): String {
        val features = JSONArray()
        cameras.forEach { cam ->
            features.put(
                JSONObject().apply {
                    put("type", "Feature")
                    put(
                        "geometry",
                        JSONObject().apply {
                            put("type", "Point")
                            put("coordinates", JSONArray().put(cam.lng).put(cam.lat))
                        }
                    )
                    put(
                        "properties",
                        JSONObject().apply {
                            put("name", cam.roadName ?: "Camera")
                            put("type", cam.type)
                            put("speedLimitLabel", if (cam.speedLimit > 0) cam.speedLimit.toString() else "")
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

    /** Cập nhật HUD (tốc độ, thẻ cảnh báo camera) + di chuyển bản đồ theo xe */
    private fun updateHUD(
        speed: Int,
        speedLimit: Int,
        nearestCamName: String,
        nearestCamDist: Int,
        nearestCamType: String,
        lat: Double,
        lng: Double,
        bearing: Float,
        fixElapsedRealtimeNanos: Long
    ) {
        tvCurrentSpeed.text = speed.coerceAtLeast(0).toString()
        updateSpeedColor()

        // Hiển thị tốc độ giới hạn từ service; nếu = 0 thì dùng mặc định 50
        if (speedLimit > 0) {
            tvSpeedLimit.text = speedLimit.toString()
        } else if (tvSpeedLimit.text == "--" || tvSpeedLimit.text.isNullOrEmpty()) {
            tvSpeedLimit.text = "50"
        }
        updateSpeedColor()

        // Thẻ cảnh báo camera gần nhất — ngưỡng theo loại (750m speed, 350m đèn đỏ)
        val alertDistance = if (nearestCamType == "redlight") 350 else 750
        if (nearestCamDist in 1..alertDistance) {
            cardCameraAlert.visibility = View.VISIBLE
            tvAlertTitle.text = "🚨 $nearestCamName"
            val displayLimit = if (speedLimit > 0) speedLimit else tvSpeedLimit.text.toString().toIntOrNull() ?: 50
            tvAlertDetail.text = getString(R.string.camera_alert_distance, nearestCamDist, displayLimit)
        } else {
            cardCameraAlert.visibility = View.GONE
        }

        // Di chuyển bản đồ theo xe — duration khớp thời gian giữa 2 fix GPS thật
        if (lat != 0.0 && lng != 0.0 && maplibreMap != null) {
            val isFirstFix = lastLat == 0.0 && lastLng == 0.0

            if (bearing >= 0f) {
                lastBearing = bearing
            } else if (lastLat != 0.0 && lastLng != 0.0) {
                val prevLoc = Location("").apply {
                    latitude = lastLat
                    longitude = lastLng
                }
                val curLoc = Location("").apply {
                    latitude = lat
                    longitude = lng
                }
                if (prevLoc.distanceTo(curLoc) >= 1.5f) {
                    lastBearing = prevLoc.bearingTo(curLoc)
                }
            }

            lastLat = lat
            lastLng = lng

            // Cập nhật marker xe (mũi tên tam giác chỉ hướng) trên bản đồ
            maplibreMap?.style?.getSourceAs<GeoJsonSource>(CAR_SOURCE_ID)
                ?.setGeoJson(buildCarGeoJson(lat, lng, lastBearing))

            val duration = if (lastFixElapsedRealtimeNanos == 0L || fixElapsedRealtimeNanos == 0L) {
                1000
            } else {
                ((fixElapsedRealtimeNanos - lastFixElapsedRealtimeNanos) / 1_000_000L).toInt().coerceIn(100, 1500)
            }
            lastFixElapsedRealtimeNanos = fixElapsedRealtimeNanos

            // Tự động zoom to khi di chuyển để người lái xe quan sát rõ làn đường
            val currentZoom = maplibreMap?.cameraPosition?.zoom ?: 16.0
            val desiredZoom = when {
                speed >= 70 -> 16.0
                speed >= 30 -> 16.8
                else -> 17.5
            }
            val targetZoom = if (currentZoom < desiredZoom || isFirstFix) desiredZoom else currentZoom

            val cameraPosition = CameraPosition.Builder()
                .target(LatLng(lat, lng))
                .zoom(targetZoom)
                .tilt(30.0)
                .build()

            if (isFirstFix) {
                maplibreMap?.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition), 800)
            } else {
                maplibreMap?.easeCamera(CameraUpdateFactory.newCameraPosition(cameraPosition), duration)
            }

            refreshTodayRouteIfDue()
            refreshSpeedLimitIfDue(lat, lng, lastBearing.takeIf { it >= 0f })
            refreshNearbyCameraLimit(lat, lng)
        }
    }

    override fun onStart() {
        super.onStart()
        mapView?.onStart()
        registerConnectivityCallback()
    }

    override fun onResume() {
        super.onResume()
        mapView?.onResume()
        // API 34: phải khai báo rõ receiver không export (broadcast chỉ nội bộ app)
        if (!isLocationUpdateReceiverRegistered) {
            ContextCompat.registerReceiver(
                this,
                locationUpdateReceiver,
                IntentFilter(LocationForegroundService.ACTION_LOCATION_UPDATE),
                ContextCompat.RECEIVER_NOT_EXPORTED
            )
            isLocationUpdateReceiverRegistered = true
        }
        val serviceRunning = PermissionUtils.isServiceRunning(this, LocationForegroundService::class.java)
        updateServiceStatus(running = serviceRunning)
        if (serviceRunning) stopVisibleLocationUpdates() else startVisibleLocationUpdates()
        cameraRefreshHandler.removeCallbacks(cameraRefreshRunnable)
        cameraRefreshHandler.post(cameraRefreshRunnable)
    }

    override fun onPause() {
        super.onPause()
        cameraRefreshHandler.removeCallbacks(cameraRefreshRunnable)
        mapView?.onPause()
        stopVisibleLocationUpdates()
        if (isLocationUpdateReceiverRegistered) {
            unregisterReceiver(locationUpdateReceiver)
            isLocationUpdateReceiverRegistered = false
        }
    }

    override fun onStop() {
        unregisterConnectivityCallback()
        super.onStop()
        mapView?.onStop()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        mapView?.onSaveInstanceState(outState)
    }

    override fun onLowMemory() {
        super.onLowMemory()
        mapView?.onLowMemory()
    }

    override fun onDestroy() {
        routeObserverJob?.cancel()
        stopVisibleLocationUpdates()
        super.onDestroy()
        mapView?.onDestroy()
    }

    private fun startVisibleLocationUpdates() {
        if (isVisibleLocationUpdatesActive ||
            ContextCompat.checkSelfPermission(this, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED
        ) return

        val request = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 1000L)
            .setMinUpdateIntervalMillis(500L)
            .setMinUpdateDistanceMeters(0f)
            .setWaitForAccurateLocation(false)
            .build()
        try {
            fusedLocationClient.requestLocationUpdates(request, visibleLocationCallback, mainLooper)
            isVisibleLocationUpdatesActive = true
        } catch (e: SecurityException) {
            Log.w(TAG, "Location permission was revoked before map updates started", e)
        }
    }

    private fun stopVisibleLocationUpdates() {
        if (!isVisibleLocationUpdatesActive) return
        fusedLocationClient.removeLocationUpdates(visibleLocationCallback)
        isVisibleLocationUpdatesActive = false
    }

    private fun updateHudFromVisibleLocation(location: Location) {
        recordVisibleLocation(location)
        val isFirstFix = lastLat == 0.0 && lastLng == 0.0

        // Tính tốc độ GPS thực tế: ưu tiên location.speed, fallback delta distance / delta time
        var calculatedSpeedKmh = 0f
        if (location.hasSpeed() && location.speed > 0f) {
            calculatedSpeedKmh = location.speed * 3.6f
        } else if (lastLat != 0.0 && lastLng != 0.0 && lastLocationTimeMs > 0L) {
            val timeDeltaSec = (location.time - lastLocationTimeMs) / 1000.0
            if (timeDeltaSec in 0.4..5.0) {
                val dist = GeoUtils.haversineDistance(lastLat, lastLng, location.latitude, location.longitude)
                if (dist >= 1.5) {
                    calculatedSpeedKmh = ((dist / timeDeltaSec) * 3.6).toFloat()
                }
            }
        }
        val speedKmh = calculatedSpeedKmh.toInt().coerceAtLeast(0)
        tvCurrentSpeed.text = speedKmh.toString()
        updateSpeedColor()

        // Tính góc hướng (bearing)
        val bearing = if (location.hasBearing() && location.bearing > 0f) {
            location.bearing
        } else if (lastLat != 0.0 && lastLng != 0.0) {
            val prevLoc = Location("").apply {
                latitude = lastLat
                longitude = lastLng
            }
            if (prevLoc.distanceTo(location) >= 1.5f) {
                prevLoc.bearingTo(location)
            } else {
                lastBearing
            }
        } else {
            lastBearing
        }
        if (bearing >= 0f) {
            lastBearing = bearing
        }

        lastLat = location.latitude
        lastLng = location.longitude
        lastLocationTimeMs = location.time

        // Cập nhật marker xe (mũi tên tam giác có hướng) trên bản đồ
        maplibreMap?.style?.getSourceAs<GeoJsonSource>(CAR_SOURCE_ID)
            ?.setGeoJson(buildCarGeoJson(location.latitude, location.longitude, lastBearing))

        val currentZoom = maplibreMap?.cameraPosition?.zoom ?: 16.0
        val desiredZoom = when {
            speedKmh >= 70 -> 16.0
            speedKmh >= 30 -> 16.8
            else -> 17.5
        }
        val targetZoom = if (currentZoom < desiredZoom || isFirstFix) desiredZoom else currentZoom

        val cameraPosition = CameraPosition.Builder()
            .target(LatLng(location.latitude, location.longitude))
            .zoom(targetZoom)
            .tilt(30.0)
            .build()

        if (isFirstFix) {
            maplibreMap?.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition), 800)
        } else {
            maplibreMap?.easeCamera(CameraUpdateFactory.newCameraPosition(cameraPosition), 1000)
        }

        refreshTodayRouteIfDue()

        refreshSpeedLimitIfDue(
            location.latitude,
            location.longitude,
            lastBearing.takeIf { it >= 0f }
        )
        refreshNearbyCameraLimit(location.latitude, location.longitude)
    }

    private fun registerConnectivityCallback() {
        if (networkCallback != null) return
        val manager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                updateMapConnectivity(hasInternetConnection())
            }

            override fun onCapabilitiesChanged(network: Network, capabilities: NetworkCapabilities) {
                val validated = capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) &&
                    capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED)
                updateMapConnectivity(validated)
            }

            override fun onLost(network: Network) {
                updateMapConnectivity(hasInternetConnection())
            }
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                manager.registerDefaultNetworkCallback(callback)
            } else {
                val request = NetworkRequest.Builder()
                    .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    .build()
                manager.registerNetworkCallback(request, callback)
            }
            networkCallback = callback
            updateMapConnectivity(hasInternetConnection())
        } catch (exception: RuntimeException) {
            Log.w(TAG, "Could not monitor network changes", exception)
        }
    }

    private fun unregisterConnectivityCallback() {
        val callback = networkCallback ?: return
        val manager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        runCatching { manager.unregisterNetworkCallback(callback) }
        networkCallback = null
    }

    private fun updateMapConnectivity(hasInternet: Boolean) {
        runOnUiThread {
            val mbtilesAvailable = findMbtilesFile() != null
            val shouldUseOffline = !hasInternet && mbtilesAvailable
            if (maplibreMap != null && isOfflineStyleActive != shouldUseOffline) {
                applyMapStyle(isFirstLoad = false, forceOffline = shouldUseOffline)
            }
            if (!hasInternet && (lastLat != 0.0 || lastLng != 0.0)) {
                restoreCachedSpeedLimit(lastLat, lastLng)?.let { tvSpeedLimit.text = it.toString() }
                lastCameraLookupTimeMs = 0L
                refreshSpeedLimitIfDue(lastLat, lastLng)
            }
        }
    }

    private fun hasInternetConnection(): Boolean {
        val manager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val activeNetwork = manager.activeNetwork ?: return false
        val capabilities = manager.getNetworkCapabilities(activeNetwork) ?: return false
        return capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) &&
            capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED)
    }

    private fun persistSpeedLimit(speedLimit: Int, latitude: Double, longitude: Double) {
        persistSpeedLimit(speedLimit, latitude, longitude, "road")
    }

    private fun persistSpeedLimit(speedLimit: Int, latitude: Double, longitude: Double, source: String) {
        if (speedLimit <= 0) return
        getSharedPreferences("speednotify_prefs", MODE_PRIVATE).edit()
            .putInt(KEY_LAST_SPEED_LIMIT, speedLimit)
            .putString(KEY_LAST_SPEED_LIMIT_LAT, latitude.toString())
            .putString(KEY_LAST_SPEED_LIMIT_LNG, longitude.toString())
            .putString(KEY_LAST_SPEED_LIMIT_SOURCE, source)
            .apply()
    }

    private fun restoreCachedSpeedLimit(latitude: Double, longitude: Double): Int? {
        val prefs = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)
        if (prefs.getString(KEY_LAST_SPEED_LIMIT_SOURCE, null) != "road") return null
        val speedLimit = prefs.getInt(KEY_LAST_SPEED_LIMIT, 0)
        val savedLatitude = prefs.getString(KEY_LAST_SPEED_LIMIT_LAT, null)?.toDoubleOrNull() ?: return null
        val savedLongitude = prefs.getString(KEY_LAST_SPEED_LIMIT_LNG, null)?.toDoubleOrNull() ?: return null
        val distance = GeoUtils.haversineDistance(latitude, longitude, savedLatitude, savedLongitude)
        return speedLimit.takeIf { it > 0 && distance <= SPEED_LIMIT_CACHE_RADIUS_METERS }
    }

    private fun refreshSpeedLimitIfDue(latitude: Double, longitude: Double, bearing: Float? = null) {
        val cachedLimit = restoreCachedSpeedLimit(latitude, longitude)
        // Mặc định 50 km/h khi chưa tra được (quy định mặc định trong đô thị VN)
        tvSpeedLimit.text = cachedLimit?.toString() ?: "50"
        updateSpeedColor()
        val now = System.currentTimeMillis()
        if (now - lastCameraLookupTimeMs < 5000L) return
        lastCameraLookupTimeMs = now
        lifecycleScope.launch {
            val roadLimit = if (hasInternetConnection()) {
                RoadSpeedLimitRepository.findNearest(latitude, longitude, bearing)
            } else {
                null
            }
            if (roadLimit != null) {
                tvSpeedLimit.text = roadLimit.speedKmh.toString()
                persistSpeedLimit(roadLimit.speedKmh, latitude, longitude)
                updateSpeedColor()
            } else {
                val stillValidCache = restoreCachedSpeedLimit(latitude, longitude)
                // Fallback: mặc định 50 km/h khi không có cache hoặc không có internet
                tvSpeedLimit.text = stillValidCache?.toString() ?: "50"
                updateSpeedColor()
            }
        }
    }

    private fun refreshNearbyCameraLimit(latitude: Double, longitude: Double) {
        if (latitude == 0.0 && longitude == 0.0) return
        val now = System.currentTimeMillis()
        val movedMeters = if (lastNearbyCameraLookupTimeMs == 0L) {
            Double.MAX_VALUE
        } else {
            GeoUtils.haversineDistance(
                lastNearbyCameraLookupLat,
                lastNearbyCameraLookupLng,
                latitude,
                longitude
            )
        }
        if (now - lastNearbyCameraLookupTimeMs < CAMERA_REFRESH_INTERVAL_MS && movedMeters < 500.0) return
        lastNearbyCameraLookupTimeMs = now
        lastNearbyCameraLookupLat = latitude
        lastNearbyCameraLookupLng = longitude
        lifecycleScope.launch {
            val localCamera = withContext(Dispatchers.IO) {
                val box = GeoUtils.createBoundingBoxMeters(latitude, longitude, CAMERA_SEARCH_RADIUS_METERS)
                val cameras = CameraDatabase.getDatabase(this@MapActivity).cameraDao()
                    .getCamerasInBoundingBox(box.minLat, box.maxLat, box.minLng, box.maxLng)
                GeoUtils.nearestCameraWithinDistance(
                    cameras,
                    latitude,
                    longitude,
                    CAMERA_SEARCH_RADIUS_METERS
                )?.let { (camera, distance) ->
                    camera to distance
                }
            }
            if (localCamera != null) {
                Log.d(TAG, "Nearby camera lookup completed")
            }
        }
    }

    private fun updateSpeedColor() {
        val speed = tvCurrentSpeed.text.toString().toIntOrNull() ?: 0
        val limit = tvSpeedLimit.text.toString().toIntOrNull() ?: 0
        tvCurrentSpeed.setTextColor(
            if (limit > 0 && speed > limit) "#EF4444".toColorInt()
            else "#38BDF8".toColorInt()
        )
    }
}
