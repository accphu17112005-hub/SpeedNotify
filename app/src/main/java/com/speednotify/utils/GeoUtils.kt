package com.speednotify.utils

object GeoUtils {

    private const val EARTH_RADIUS_METERS = 6371000.0

    /**
     * Tính khoảng cách Haversine giữa 2 tọa độ (met)
     */
    fun haversineDistance(lat1: Double, lng1: Double, lat2: Double, lng2: Double): Double {
        val dLat = Math.toRadians(lat2 - lat1)
        val dLng = Math.toRadians(lng2 - lng1)
        val a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                Math.sin(dLng / 2) * Math.sin(dLng / 2)
        val c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
        return EARTH_RADIUS_METERS * c
    }

    /**
     * Tính góc bearing từ điểm 1 đến điểm 2 (độ, 0-360)
     */
    fun calculateBearing(lat1: Double, lng1: Double, lat2: Double, lng2: Double): Float {
        val dLng = Math.toRadians(lng2 - lng1)
        val lat1Rad = Math.toRadians(lat1)
        val lat2Rad = Math.toRadians(lat2)

        val y = Math.sin(dLng) * Math.cos(lat2Rad)
        val x = Math.cos(lat1Rad) * Math.sin(lat2Rad) -
                Math.sin(lat1Rad) * Math.cos(lat2Rad) * Math.cos(dLng)
        val bearing = Math.toDegrees(Math.atan2(y, x))
        return (bearing + 360).toFloat() % 360
    }

    /**
     * Kiểm tra xem 2 hướng có ngược nhau không (chênh lệch > 90 độ)
     */
    fun isOppositeDirection(bearing1: Float, bearing2: Float, threshold: Float = 90f): Boolean {
        val diff = Math.abs(bearing1 - bearing2) % 360
        val normalizedDiff = if (diff > 180) 360 - diff else diff
        return normalizedDiff > threshold
    }

    /**
     * Tạo bounding box quanh tọa độ trung tâm (±degrees)
     */
    fun createBoundingBox(centerLat: Double, centerLng: Double, degreeOffset: Double): BoundingBox {
        return BoundingBox(
            minLat = centerLat - degreeOffset,
            maxLat = centerLat + degreeOffset,
            minLng = centerLng - degreeOffset,
            maxLng = centerLng + degreeOffset
        )
    }

    fun createBoundingBoxMeters(centerLat: Double, centerLng: Double, radiusMeters: Double): BoundingBox {
        val latitudeOffset = radiusMeters / 111_320.0
        val longitudeScale = (111_320.0 * kotlin.math.cos(Math.toRadians(centerLat)))
            .coerceAtLeast(1.0)
        val longitudeOffset = radiusMeters / longitudeScale
        return createBoundingBox(centerLat, centerLng, maxOf(latitudeOffset, longitudeOffset))
    }

    fun nearestCameraWithinDistance(
        cameras: List<com.speednotify.data.Camera>,
        latitude: Double,
        longitude: Double,
        maxDistanceMeters: Double
    ): Pair<com.speednotify.data.Camera, Double>? = cameras
        .asSequence()
        .map { camera ->
            camera to haversineDistance(latitude, longitude, camera.lat, camera.lng)
        }
        .filter { (_, distance) -> distance <= maxDistanceMeters }
        .minByOrNull { (_, distance) -> distance }

    data class BoundingBox(
        val minLat: Double,
        val maxLat: Double,
        val minLng: Double,
        val maxLng: Double
    )
}