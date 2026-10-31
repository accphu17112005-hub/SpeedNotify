package com.speednotify.data

import android.content.Context
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL

/**
 * Repository lấy dữ liệu điểm bắn tốc độ / camera phạt nguội từ OpenStreetMap
 * thông qua Overpass API (https://overpass-api.de).
 *
 * ## Chiến lược cache
 * - Refresh tối đa 1 lần / 24 giờ để tránh spam Overpass server (rate limit)
 * - Dữ liệu được lưu vào Room DB (offline) - hoạt động không cần mạng khi lái xe
 * - Nếu fetch thất bại, tiếp tục dùng dữ liệu cũ trong DB
 *
 * Port từ dự án tham chiếu (vietmap_live_android), đổi entity sang [Camera]
 */
object OsmCameraRepository {

    private const val TAG = "OsmCameraRepo"
    private const val PREFS_NAME = "osm_cache_prefs"
    private const val KEY_LAST_REFRESH_MS = "last_refresh_ms"
    private const val REFRESH_INTERVAL_MS = 24 * 60 * 60 * 1000L // 24 giờ
    private const val CONNECT_TIMEOUT_MS = 15_000
    private const val READ_TIMEOUT_MS = 30_000

    private val OVERPASS_ENDPOINTS = listOf(
        "https://overpass-api.de/api/interpreter",
        "https://overpass.kumi.systems/api/interpreter",
        "https://maps.mail.ru/osm/tools/overpass/api/interpreter"
    )

    private fun buildOverpassQuery(
        minLat: Double = 8.0,
        minLon: Double = 102.0,
        maxLat: Double = 23.5,
        maxLon: Double = 109.5,
    ): String = """
        [out:json][timeout:30];
        (
          node["highway"="speed_camera"]($minLat,$minLon,$maxLat,$maxLon);
          node["highway"="enforcement"]($minLat,$minLon,$maxLat,$maxLon);
        );
        out body;
    """.trimIndent()

    /**
     * Refresh dữ liệu camera từ OSM nếu cache đã hết hạn (> 24h).
     *
     * @param context Android context để access SharedPreferences và Room
     * @param forceRefresh Bỏ qua cache, fetch lại ngay lập tức
     * @return Số camera mới được thêm vào DB:
     *         -1 = cache còn hiệu lực (skip), -2 = fetch lỗi, >= 0 = số điểm thêm
     */
    suspend fun refreshIfNeeded(
        context: Context,
        forceRefresh: Boolean = false
    ): Int = withContext(Dispatchers.IO) {
        val db = CameraDatabase.getDatabase(context)
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val lastRefreshMs = prefs.getLong(KEY_LAST_REFRESH_MS, 0L)
        val elapsedMs = System.currentTimeMillis() - lastRefreshMs

        if (!forceRefresh && elapsedMs < REFRESH_INTERVAL_MS) {
            val hoursAgo = elapsedMs / 3_600_000
            Log.d(TAG, "Cache còn hiệu lực (${hoursAgo}h trước). Bỏ qua fetch.")
            return@withContext -1
        }

        Log.d(TAG, "Bắt đầu fetch camera từ OpenStreetMap Overpass API...")
        return@withContext try {
            val nodes = fetchFromOverpass()
            if (nodes.isNotEmpty()) {
                val cameras = nodes.mapNotNull { parseNode(it) }
                if (cameras.isNotEmpty()) {
                    // Upsert theo osm_id (unique index idx_osm_id): bản ghi đã có sẽ bị bỏ qua,
                    // bản ghi mới được chèn. Dữ liệu seed (osm_id = NULL) không bị ảnh hưởng.
                    db.cameraDao().upsertOsmCameras(cameras)
                    prefs.edit().putLong(KEY_LAST_REFRESH_MS, System.currentTimeMillis()).apply()
                    val osmCount = db.cameraDao().getOsmCameraCount()
                    Log.i(TAG, "Đã fetch ${cameras.size} nodes OSM. Tổng camera OSM trong DB: $osmCount")
                }
                cameras.size
            } else {
                Log.w(TAG, "Overpass không trả về dữ liệu")
                0
            }
        } catch (e: Exception) {
            Log.e(TAG, "Fetch camera từ OSM thất bại: ${e.message}", e)
            -2
        }
    }

    /**
     * Fetch tất cả endpoints cho đến khi 1 cái thành công (failover).
     */
    private fun fetchFromOverpass(): List<JSONObject> {
        val query = buildOverpassQuery()
        var lastException: Exception? = null

        for (endpoint in OVERPASS_ENDPOINTS) {
            try {
                val conn = URL(endpoint).openConnection() as HttpURLConnection
                conn.requestMethod = "POST"
                conn.doOutput = true
                conn.connectTimeout = CONNECT_TIMEOUT_MS
                conn.readTimeout = READ_TIMEOUT_MS
                conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
                conn.setRequestProperty("User-Agent", "SpeedNotify/1.0 (android speed camera app)")

                conn.outputStream.use { os ->
                    val writer = OutputStreamWriter(os, "UTF-8")
                    writer.write("data=" + java.net.URLEncoder.encode(query, "UTF-8"))
                    writer.flush()
                }

                if (conn.responseCode == HttpURLConnection.HTTP_OK) {
                    val responseBody = BufferedReader(InputStreamReader(conn.inputStream)).use { it.readText() }
                    conn.disconnect()
                    val root = JSONObject(responseBody)
                    val elements = root.getJSONArray("elements")
                    return (0 until elements.length()).map { elements.getJSONObject(it) }
                } else {
                    conn.disconnect()
                }
            } catch (e: Exception) {
                lastException = e
                Log.w(TAG, "Endpoint $endpoint error: ${e.message}, trying next...")
            }
        }
        lastException?.let { throw it }
        return emptyList()
    }

    /**
     * Parse một Overpass node thành [Camera].
     *
     * Tag mapping:
     * - maxspeed    -> speedLimit
     * - name        -> roadName
     * - camera:type -> "red_light" → loại "redlight", còn lại → "speed"
     * - direction   -> direction (mô tả hướng)
     */
    private fun parseNode(node: JSONObject): Camera? {
        return try {
            val osmId = node.getLong("id")
            val lat = node.getDouble("lat")
            val lon = node.getDouble("lon")
            val tags = node.optJSONObject("tags") ?: JSONObject()

            val speedLimit = parseMaxSpeed(tags.optString("maxspeed", ""))
            val name = tags.optString("name").ifBlank { "Camera phạt nguội OSM" }
            val type = if (tags.optString("camera:type") == "red_light") "redlight" else "speed"
            val direction = tags.optString("direction").ifBlank { null }

            Camera(
                lat = lat,
                lng = lon,
                speedLimit = speedLimit,
                bearing = -1f, // OSM không có bearing, service sẽ cảnh báo mọi hướng
                type = type,
                direction = direction,
                roadName = name,
                province = null,
                district = null,
                ward = null,
                osmId = osmId
            )
        } catch (e: Exception) {
            Log.w(TAG, "Bỏ qua node lỗi: ${e.message}")
            null
        }
    }

    /**
     * Parse giá trị maxspeed từ OSM tag.
     * VN: "60", "60 km/h", "VN:urban" (50), "VN:rural" (80), "VN:motorway" (120)
     */
    private fun parseMaxSpeed(raw: String): Int {
        if (raw.isBlank()) return 60

        val firstNumber = raw.replace("km/h", "").trim().split(Regex("[^0-9]")).firstOrNull()?.toIntOrNull()
        if (firstNumber != null) return firstNumber.coerceIn(20, 140)

        return when (raw.lowercase()) {
            "vn:urban"         -> 50
            "vn:rural"         -> 80
            "vn:motorway"      -> 120
            "vn:living_street" -> 20
            "walk"             -> 10
            else               -> 60
        }
    }
}
