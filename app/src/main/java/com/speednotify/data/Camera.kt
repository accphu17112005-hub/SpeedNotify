package com.speednotify.data

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "cameras", indices = [
    androidx.room.Index(value = ["lat", "lng"]),
    androidx.room.Index(value = ["type"]),
    // UNIQUE cho osm_id: dữ liệu OSM upsert không trùng (SQLite coi mỗi NULL là riêng biệt
    // nên các bản ghi thủ công osm_id=null không bị conflict với nhau)
    androidx.room.Index(value = ["osm_id"], unique = true, name = "idx_osm_id"),
])
data class Camera(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val lat: Double,
    val lng: Double,
    val speedLimit: Int,
    val bearing: Float,
    val type: String,
    val direction: String? = null,
    val roadName: String? = null,
    val province: String? = null,
    val district: String? = null,
    val ward: String? = null,
    /** null = dữ liệu thủ công/seed; non-null = OSM node ID (từ Overpass API) */
    @androidx.room.ColumnInfo(name = "osm_id") val osmId: Long? = null
)