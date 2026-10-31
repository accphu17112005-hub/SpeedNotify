package com.vietmap.dashcam.database

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query

@Dao
interface CameraDao {
    @Query("SELECT * FROM speed_cameras")
    suspend fun getAllCameras(): List<SpeedCameraEntity>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCameras(cameras: List<SpeedCameraEntity>)

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCamera(camera: SpeedCameraEntity)

    @Query("SELECT COUNT(*) FROM speed_cameras")
    suspend fun getCameraCount(): Int

    /**
     * Lấy các điểm cảnh báo xung quanh tọa độ hiện tại trong khung Bounding Box (khoảng ~2-3km)
     */
    @Query(
        """
        SELECT * FROM speed_cameras 
        WHERE latitude BETWEEN :minLat AND :maxLat 
        AND longitude BETWEEN :minLng AND :maxLng
        """,
    )
    suspend fun getCamerasInArea(
        minLat: Double,
        maxLat: Double,
        minLng: Double,
        maxLng: Double
    ): List<SpeedCameraEntity>

    /**
     * Upsert dữ liệu từ OpenStreetMap:
     * - Nếu osm_id đã tồn tại → bỏ qua (IGNORE), tránh trùng lặp
     * - Nếu chưa có → chèn mới
     * Dữ liệu thủ công (osm_id=0) không bị ảnh hưởng.
     */
    @Insert(onConflict = OnConflictStrategy.IGNORE)
    suspend fun upsertOsmCameras(cameras: List<SpeedCameraEntity>)

    /** Xóa toàn bộ camera OSM (để refresh sạch khi cần) */
    @Query("DELETE FROM speed_cameras WHERE osm_id IS NOT NULL")
    suspend fun clearOsmCameras()

    /** Xóa toàn bộ camera thủ công / seed */
    @Query("DELETE FROM speed_cameras WHERE osm_id IS NULL")
    suspend fun clearManualCameras()

    /** Đếm số camera lấy từ OSM */
    @Query("SELECT COUNT(*) FROM speed_cameras WHERE osm_id IS NOT NULL")
    suspend fun getOsmCameraCount(): Int
}

