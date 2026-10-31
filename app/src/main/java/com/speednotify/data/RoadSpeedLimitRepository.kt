package com.speednotify.data

import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import kotlin.math.atan2
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.sqrt

data class RoadSpeedLimit(
    val speedKmh: Int,
    val roadName: String?
)

object RoadSpeedLimitRepository {

    private const val TAG = "RoadSpeedLimitRepo"
    private const val SEARCH_RADIUS_METERS = 500.0
    private const val CACHE_RADIUS_METERS = 350.0
    private const val CACHE_DURATION_MS = 60_000L
    private const val MAX_MATCH_DISTANCE_METERS = 45.0
    private const val EARTH_RADIUS_METERS = 6_371_000.0
    private const val CONNECT_TIMEOUT_MS = 8_000
    private const val READ_TIMEOUT_MS = 12_000

    private val endpoints = listOf(
        "https://overpass-api.de/api/interpreter",
        "https://overpass.kumi.systems/api/interpreter",
        "https://maps.mail.ru/osm/tools/overpass/api/interpreter"
    )
    private val mutex = Mutex()
    private var cachedCenter: Pair<Double, Double>? = null
    private var cachedAtMs = 0L
    private var cachedSegments: List<RoadSegment> = emptyList()

    suspend fun findNearest(latitude: Double, longitude: Double, bearing: Float? = null): RoadSpeedLimit? =
        withContext(Dispatchers.IO) {
            mutex.withLock {
                val center = cachedCenter
                val cacheIsUsable = center != null &&
                    System.currentTimeMillis() - cachedAtMs < CACHE_DURATION_MS &&
                    distanceMeters(latitude, longitude, center.first, center.second) <= CACHE_RADIUS_METERS
                if (!cacheIsUsable) {
                    cachedSegments = fetchSegments(latitude, longitude)
                    cachedCenter = latitude to longitude
                    cachedAtMs = System.currentTimeMillis()
                }
                nearestFromSegments(latitude, longitude, bearing, cachedSegments)
            }
        }

    private fun fetchSegments(latitude: Double, longitude: Double): List<RoadSegment> {
        val query = """
            [out:json][timeout:20];
            way(around:$SEARCH_RADIUS_METERS,$latitude,$longitude)["highway"]["maxspeed"];
            out tags geom;
        """.trimIndent()
        var lastError: Exception? = null

        for (endpoint in endpoints) {
            var connection: HttpURLConnection? = null
            try {
                connection = URL(endpoint).openConnection() as HttpURLConnection
                connection.requestMethod = "POST"
                connection.doOutput = true
                connection.connectTimeout = CONNECT_TIMEOUT_MS
                connection.readTimeout = READ_TIMEOUT_MS
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
                connection.setRequestProperty("User-Agent", "SpeedNotify/1.0 (Android speed limit alerts)")
                connection.outputStream.use { output ->
                    OutputStreamWriter(output, Charsets.UTF_8).use { writer ->
                        writer.write("data=${URLEncoder.encode(query, "UTF-8")}")
                    }
                }
                if (connection.responseCode != HttpURLConnection.HTTP_OK) continue
                val body = connection.inputStream.bufferedReader().use { it.readText() }
                val elements = JSONObject(body).optJSONArray("elements") ?: return emptyList()
                return (0 until elements.length()).mapNotNull { index ->
                    parseWay(elements.optJSONObject(index) ?: return@mapNotNull null)
                }
            } catch (exception: Exception) {
                lastError = exception
                Log.w(TAG, "Overpass request failed at $endpoint", exception)
            } finally {
                connection?.disconnect()
            }
        }
        lastError?.let { Log.w(TAG, "Could not load nearby road speed limits", it) }
        return emptyList()
    }

    private fun parseWay(way: JSONObject): RoadSegment? {
        val tags = way.optJSONObject("tags") ?: return null
        val speed = parseSpeed(tags.optString("maxspeed"))
        val geometry = way.optJSONArray("geometry") ?: return null
        if (speed <= 0 || geometry.length() < 2) return null
        val points = (0 until geometry.length()).mapNotNull { index ->
            val point = geometry.optJSONObject(index) ?: return@mapNotNull null
            if (!point.has("lat") || !point.has("lon")) return@mapNotNull null
            point.getDouble("lat") to point.getDouble("lon")
        }
        if (points.size < 2) return null
        return RoadSegment(
            speedKmh = speed,
            name = tags.optString("name").takeIf(String::isNotBlank),
            points = points
        )
    }

    private fun nearestFromSegments(
        latitude: Double,
        longitude: Double,
        bearing: Float?,
        segments: List<RoadSegment>
    ): RoadSpeedLimit? {
        var nearest: RoadSpeedLimit? = null
        var nearestDistance = Double.MAX_VALUE
        for (segment in segments) {
            for (index in 0 until segment.points.lastIndex) {
                val start = segment.points[index]
                val end = segment.points[index + 1]
                val distance = distanceToSegmentMeters(latitude, longitude, start, end)
                if (distance > MAX_MATCH_DISTANCE_METERS || distance >= nearestDistance) continue
                if (bearing != null && bearing >= 0f) {
                    val roadBearing = bearingBetween(start.first, start.second, end.first, end.second)
                    val difference = angleDifference(bearing, roadBearing)
                    if (difference > 70f && difference < 110f) continue
                }
                nearestDistance = distance
                nearest = RoadSpeedLimit(segment.speedKmh, segment.name)
            }
        }
        return nearest
    }

    private fun parseSpeed(raw: String): Int {
        val normalized = raw.trim().lowercase()
        val numeric = Regex("\\d+").find(normalized)?.value?.toIntOrNull()
        if (numeric != null) return numeric.takeIf { it in 10..160 } ?: 0
        return when (normalized) {
            "vn:urban" -> 50
            "vn:rural" -> 80
            "vn:motorway" -> 120
            "vn:living_street" -> 20
            else -> 0
        }
    }

    private fun distanceToSegmentMeters(
        latitude: Double,
        longitude: Double,
        start: Pair<Double, Double>,
        end: Pair<Double, Double>
    ): Double {
        val latitudeScale = Math.toRadians(1.0) * EARTH_RADIUS_METERS
        val longitudeScale = latitudeScale * cos(Math.toRadians(latitude))
        val startX = (start.second - longitude) * longitudeScale
        val startY = (start.first - latitude) * latitudeScale
        val endX = (end.second - longitude) * longitudeScale
        val endY = (end.first - latitude) * latitudeScale
        val deltaX = endX - startX
        val deltaY = endY - startY
        val lengthSquared = deltaX * deltaX + deltaY * deltaY
        val fraction = if (lengthSquared == 0.0) 0.0 else {
            (-(startX * deltaX + startY * deltaY) / lengthSquared).coerceIn(0.0, 1.0)
        }
        val nearestX = startX + fraction * deltaX
        val nearestY = startY + fraction * deltaY
        return sqrt(nearestX * nearestX + nearestY * nearestY)
    }

    private fun distanceMeters(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
        val dLat = Math.toRadians(lat2 - lat1)
        val dLon = Math.toRadians(lon2 - lon1)
        val a = sin(dLat / 2) * sin(dLat / 2) +
            cos(Math.toRadians(lat1)) * cos(Math.toRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2)
        return 2 * EARTH_RADIUS_METERS * atan2(sqrt(a), sqrt(1 - a))
    }

    private fun bearingBetween(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Float {
        val deltaLongitude = Math.toRadians(lon2 - lon1)
        val firstLatitude = Math.toRadians(lat1)
        val secondLatitude = Math.toRadians(lat2)
        val y = sin(deltaLongitude) * cos(secondLatitude)
        val x = cos(firstLatitude) * sin(secondLatitude) -
            sin(firstLatitude) * cos(secondLatitude) * cos(deltaLongitude)
        return ((Math.toDegrees(atan2(y, x)) + 360) % 360).toFloat()
    }

    private fun angleDifference(first: Float, second: Float): Float {
        val difference = kotlin.math.abs(first - second) % 360f
        return if (difference > 180f) 360f - difference else difference
    }

    private data class RoadSegment(
        val speedKmh: Int,
        val name: String?,
        val points: List<Pair<Double, Double>>
    )
}