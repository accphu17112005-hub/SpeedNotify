package com.vietmap.dashcam.database

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.Index
import androidx.room.PrimaryKey

/**
 * Entity camera phạt nguội / điểm cảnh báo tốc độ.
 *
 * osmId != null → dữ liệu lấy từ OpenStreetMap qua Overpass API
 * osmId == null → dữ liệu nhập tay / seed ban đầu
 *
 * SQLite UNIQUE coi mỗi NULL là riêng biệt → nhiều bản ghi thủ công
 * (osmId=null) KHÔNG bị conflict với nhau.
 */
@Entity(
    tableName = "speed_cameras",
    indices = [Index(value = ["osm_id"], unique = true, name = "idx_osm_id")]
)
data class SpeedCameraEntity(
    @PrimaryKey(autoGenerate = true) val id: Int = 0,
    val name: String = "Điểm phạt nguội",
    val latitude: Double,
    val longitude: Double,
    val speedLimit: Int = 60,
    val type: String = TYPE_SPEED_CAM,
    val description: String = "",
    /** null = dữ liệu thủ công; non-null = OSM node ID */
    @ColumnInfo(name = "osm_id") val osmId: Long? = null,
) {
    companion object {
        const val TYPE_SPEED_CAM = "SPEED_CAMERA"
        const val TYPE_RED_LIGHT_CAM = "RED_LIGHT_CAMERA"
        const val TYPE_ZONE_RESIDENTIAL = "ZONE_RESIDENTIAL"
        const val TYPE_HIGHWAY = "HIGHWAY"
        const val TYPE_AI_JUNCTION = "AI_JUNCTION_CAMERA"
        /** Biển giới hạn tốc độ thay đổi (không phải camera phạt) — ví dụ biển 60/70/80 trên đường */
        const val TYPE_SPEED_LIMIT_SIGN = "SPEED_LIMIT_SIGN"

        /**
         * Khoảng cách bắt đầu cảnh báo (mét) theo từng loại camera/biển báo —
         * theo bảng category chuẩn của Vietmap (Category 0/4/10/17...): camera bắn
         * tốc độ cần cảnh báo xa hơn nhiều so với camera vượt đèn đỏ hay biển báo khu
         * dân cư, trước đây app dùng chung 1 ngưỡng 500m cho mọi loại là không đúng.
         */
        fun alertDistanceMetres(type: String): Int = when (type) {
            TYPE_SPEED_CAM -> 750
            TYPE_RED_LIGHT_CAM -> 350
            TYPE_ZONE_RESIDENTIAL -> 400
            TYPE_AI_JUNCTION -> 350
            TYPE_HIGHWAY -> 400
            TYPE_SPEED_LIMIT_SIGN -> 500 // Thông báo trước 500m để kịp giảm tốc
            else -> 500
        }
    }
}

