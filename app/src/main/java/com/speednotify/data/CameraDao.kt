package com.speednotify.data

import androidx.room.Dao
import androidx.room.Index
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query

@Dao
interface CameraDao {

    @Query("""
        SELECT * FROM cameras
        WHERE speedLimit > 0
        AND lat BETWEEN :minLat AND :maxLat
        AND lng BETWEEN :minLng AND :maxLng
    """)
    suspend fun getCamerasInBoundingBox(
        minLat: Double,
        maxLat: Double,
        minLng: Double,
        maxLng: Double
    ): List<Camera>

    @Query("""
        SELECT * FROM cameras
        WHERE speedLimit > 0
        AND ( 6371000 * acos(
            cos(radians(:lat)) * cos(radians(lat)) * cos(radians(lng) - radians(:lng)) +
            sin(radians(:lat)) * sin(radians(lat))
        ) ) <= :maxDistance
    """)
    suspend fun getCamerasByHaversine(
        lat: Double,
        lng: Double,
        maxDistance: Double
    ): List<Camera>

    @Query("SELECT * FROM cameras")
    suspend fun getAllCameras(): List<Camera>

    @Query("SELECT COUNT(*) FROM cameras")
    suspend fun getTotalCameraCount(): Int

    @Query("SELECT COUNT(*) FROM cameras WHERE osm_id IS NOT NULL")
    suspend fun getOsmCameraCount(): Int

    /**
     * Upsert dữ liệu từ OpenStreetMap:
     * - osm_id đã tồn tại → bỏ qua (IGNORE, unique index idx_osm_id), tránh trùng khi sync lại
     * - Chưa có → chèn mới
     * Dữ liệu seed thủ công (osm_id = NULL) không bị ảnh hưởng
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun upsertOsmCameras(cameras: List<Camera>)

    @Query("DELETE FROM cameras")
    suspend fun clearAllCameras()

    @Query("INSERT INTO cameras (lat, lng, speedLimit, bearing, type, direction, roadName, province, district, ward) VALUES (:lat, :lng, :speedLimit, :bearing, :type, :direction, :roadName, :province, :district, :ward)")
    suspend fun insertCamera(
        lat: Double,
        lng: Double,
        speedLimit: Int,
        bearing: Float,
        type: String,
        direction: String?,
        roadName: String?,
        province: String?,
        district: String?,
        ward: String?
    )
}