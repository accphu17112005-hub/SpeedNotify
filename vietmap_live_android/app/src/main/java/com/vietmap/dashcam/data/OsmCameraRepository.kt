package com.vietmap.dashcam.data

import android.content.Context
import android.util.Log
import com.vietmap.dashcam.database.AppDatabase
import com.vietmap.dashcam.database.SpeedCameraEntity
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL

/**
 * Repository lay du lieu diem ban toc do / camera phat nguoi tu OpenStreetMap
 * thong qua Overpass API (https://overpass-api.de).
 *
 * ## Chien luoc cache
 * - Refresh toi da 1 lan / 24 gio de tranh spam Overpass server (rate limit)
 * - Du lieu duoc luu vao Room DB (offline) - hoat dong khong can mang khi lai xe
 * - Neu fetch that bai, tiep tuc dung du lieu cu trong DB
 */
object OsmCameraRepository {

    private const val TAG = "OsmCameraRepo"
    private const val PREFS_NAME = "osm_cache_prefs"
    private const val KEY_LAST_REFRESH_MS = "last_refresh_ms"
    private const val REFRESH_INTERVAL_MS = 24 * 60 * 60 * 1000L // 24 gio
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
     * Refresh du lieu camera tu OSM neu cache da het han (> 24h).
     *
     * @param context Android context de access SharedPreferences va Room
     * @param db AppDatabase instance da khoi tao
     * @param forceRefresh Bo qua cache, fetch lai ngay lap tuc
     * @return So luong camera moi duoc them vao DB (-1 neu skip/loi)
     */
    suspend fun refreshIfNeeded(
        context: Context,
        db: AppDatabase,
        forceRefresh: Boolean = false
    ): Int = withContext(Dispatchers.IO) {
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val lastRefreshMs = prefs.getLong(KEY_LAST_REFRESH_MS, 0L)
        val elapsedMs = System.currentTimeMillis() - lastRefreshMs

        if (!forceRefresh && elapsedMs < REFRESH_INTERVAL_MS) {
            val hoursAgo = elapsedMs / 3_600_000
            Log.d(TAG, "Cache con hieu luc (${hoursAgo}h truoc). Bo qua fetch.")
            return@withContext -1
        }

        Log.d(TAG, "Bat dau fetch camera tu OpenStreetMap Overpass API...")
        return@withContext try {
            val nodes = fetchFromOverpass()
            if (nodes.isNotEmpty()) {
                val cameras = nodes.mapNotNull { parseNode(it) }
                db.cameraDao().upsertOsmCameras(cameras)
                prefs.edit().putLong(KEY_LAST_REFRESH_MS, System.currentTimeMillis()).apply()
                val osmCount = db.cameraDao().getOsmCameraCount()
                Log.i(TAG, "Da fetch ${cameras.size} nodes OSM. Tong camera OSM trong DB: $osmCount")
                cameras.size
            } else {
                Log.w(TAG, "Overpass tra ve 0 nodes. Giu nguyen du lieu cu.")
                0
            }
        } catch (e: Exception) {
            Log.e(TAG, "Loi khi fetch Overpass API: ${e.message}", e)
            -1
        }
    }

    private fun fetchFromOverpass(): List<JSONObject> {
        val query = buildOverpassQuery()
        var lastException: Exception? = null

        for (endpoint in OVERPASS_ENDPOINTS) {
            try {
                val url = URL(endpoint)
                val conn = url.openConnection() as HttpURLConnection
                conn.apply {
                    requestMethod = "POST"
                    doOutput = true
                    connectTimeout = CONNECT_TIMEOUT_MS
                    readTimeout = READ_TIMEOUT_MS
                    setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                    setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
                    setRequestProperty("Accept", "*/*")
                }

                OutputStreamWriter(conn.outputStream).use { writer ->
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
        if (lastException != null) throw lastException
        return emptyList()
    }

    /**
     * Parse mot Overpass node thanh SpeedCameraEntity.
     *
     * Tag mapping:
     * - maxspeed   -> speedLimit
     * - name       -> name camera
     * - highway    -> type
     * - camera:type -> description
     */
    private fun parseNode(node: JSONObject): SpeedCameraEntity? {
        return try {
            val osmId = node.getLong("id")
            val lat = node.getDouble("lat")
            val lon = node.getDouble("lon")
            val tags = node.optJSONObject("tags") ?: JSONObject()

            val speedLimit = parseMaxSpeed(tags.optString("maxspeed", ""))

            val name = tags.optString("name")
                .ifBlank { tags.optString("description") }
                .ifBlank { "Camera phat nguoi OSM" }

            val type = when {
                tags.optString("highway") == "enforcement" -> SpeedCameraEntity.TYPE_SPEED_CAM
                tags.optString("camera:type") == "red_light" -> SpeedCameraEntity.TYPE_RED_LIGHT_CAM
                else -> SpeedCameraEntity.TYPE_SPEED_CAM
            }

            val cameraType = tags.optString("camera:type")
            val direction = tags.optString("direction")
            val desc = buildString {
                if (cameraType.isNotBlank()) append("Loai: $cameraType. ")
                if (direction.isNotBlank()) append("Huong: $direction. ")
                append("OSM node #$osmId")
            }

            SpeedCameraEntity(
                name = name,
                latitude = lat,
                longitude = lon,
                speedLimit = speedLimit,
                type = type,
                description = desc,
                osmId = osmId,
            )
        } catch (e: Exception) {
            Log.w(TAG, "Bo qua node loi: ${e.message}")
            null
        }
    }

    /**
     * Parse gia tri maxspeed tu OSM tag.
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
