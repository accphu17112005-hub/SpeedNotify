package com.speednotify.data

import android.content.Context
import android.util.Log
import com.speednotify.utils.GeoUtils
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONArray
import org.json.JSONObject
import java.io.BufferedReader
import java.io.InputStreamReader

/**
 * Utility để import dữ liệu camera từ file CSV (đã tải từ Google Drive)
 * Format CSV kỳ vọng: lat,lng,speedLimit,bearing,type,direction,roadName,province,district,ward
 */
class CameraDataImporter(private val context: Context) {

    companion object {
        private const val TAG = "CameraDataImporter"
        private const val BATCH_SIZE = 500
    }

    /**
     * Import từ file CSV trong assets
     * @param fileName tên file trong assets (ví dụ: "cameras_vietnam.csv")
     */
    suspend fun importFromCsv(fileName: String): Int {
        return withContext(Dispatchers.IO) {
            val database = CameraDatabase.getDatabase(context)
            val dao = database.cameraDao()

            // Xóa dữ liệu cũ
            dao.clearAllCameras()

            var count = 0
            var batch = mutableListOf<Camera>()

            context.assets.open(fileName).use { inputStream ->
                BufferedReader(InputStreamReader(inputStream)).use { reader ->
                    reader.readLine() // Bỏ qua header

                    for (line in reader.readLines()) {
                        val parts = line.split(",")
                        if (parts.size >= 5) {
                            try {
                                val lat = parts[0].toDouble()
                                val lng = parts[1].toDouble()
                                val speedLimit = parts[2].toInt()
                                val bearing = parts[3].toFloat()
                                val type = parts[4]
                                val direction = if (parts.size > 5) parts[5] else null
                                val roadName = if (parts.size > 6) parts[6] else null
                                val province = if (parts.size > 7) parts[7] else null
                                val district = if (parts.size > 8) parts[8] else null
                                val ward = if (parts.size > 9) parts[9] else null

                                batch.add(Camera(
                                    lat = lat,
                                    lng = lng,
                                    speedLimit = speedLimit,
                                    bearing = bearing,
                                    type = type,
                                    direction = direction,
                                    roadName = roadName,
                                    province = province,
                                    district = district,
                                    ward = ward
                                ))

                                if (batch.size >= BATCH_SIZE) {
                                    insertBatch(dao, batch)
                                    count += batch.size
                                    batch.clear()
                                    Log.d(TAG, "Imported $count cameras...")
                                }
                            } catch (e: Exception) {
                                Log.w(TAG, "Skip invalid line: $line", e)
                            }
                        }
                    }

                    // Insert remaining
                    if (batch.isNotEmpty()) {
                        insertBatch(dao, batch)
                        count += batch.size
                    }
                }
            }

            Log.i(TAG, "Import completed: $count cameras")
            count
        }
    }

    private suspend fun insertBatch(dao: CameraDao, cameras: List<Camera>) {
        for (camera in cameras) {
            dao.insertCamera(
                camera.lat, camera.lng, camera.speedLimit, camera.bearing,
                camera.type, camera.direction, camera.roadName,
                camera.province, camera.district, camera.ward
            )
        }
    }

    /**
     * Import dữ liệu camera từ các file JSON trong assets
     * (ví dụ: speed_cameras_vietnam.json, ai_cameras_hanoi.json)
     * Format JSON: name, latitude, longitude, speedLimit, type, description
     */
    suspend fun importFromJsonAssets(vararg fileNames: String): Int {
        return withContext(Dispatchers.IO) {
            val database = CameraDatabase.getDatabase(context)
            val dao = database.cameraDao()

            // Xóa dữ liệu cũ
            dao.clearAllCameras()

            var total = 0
            var batch = mutableListOf<Camera>()

            for (fileName in fileNames) {
                try {
                    val json = context.assets.open(fileName).use { input ->
                        input.readBytes().toString(Charsets.UTF_8)
                    }
                    val array = JSONArray(json)

                    for (i in 0 until array.length()) {
                        try {
                            val obj = array.getJSONObject(i)
                            batch.add(jsonToCamera(obj))

                            if (batch.size >= BATCH_SIZE) {
                                insertBatch(dao, batch)
                                total += batch.size
                                batch.clear()
                            }
                        } catch (e: Exception) {
                            Log.w(TAG, "Skip invalid item in $fileName", e)
                        }
                    }
                    Log.i(TAG, "Processed ${array.length()} items from $fileName (running total: $total)")
                } catch (e: Exception) {
                    Log.e(TAG, "Failed to import $fileName", e)
                }
            }

            // Insert remaining
            if (batch.isNotEmpty()) {
                insertBatch(dao, batch)
                total += batch.size
            }

            Log.i(TAG, "JSON import completed: $total cameras")
            total
        }
    }

    /**
     * Chuyển 1 object JSON thành Camera.
     * Dữ liệu nguồn không có bearing nên dùng -1 (không xác định,
     * service sẽ cảnh báo mọi hướng di chuyển).
     */
    private fun jsonToCamera(obj: JSONObject): Camera {
        val rawType = obj.optString("type", "")
        val type = when (rawType.uppercase()) {
            "SPEED_CAMERA", "HIGHWAY" -> "speed"
            "RED_LIGHT_CAMERA" -> "redlight"
            "AI_JUNCTION_CAMERA" -> "ai"
            else -> "speed"
        }
        return Camera(
            lat = obj.optDouble("latitude", 0.0),
            lng = obj.optDouble("longitude", 0.0),
            speedLimit = obj.optInt("speedLimit", 0),
            bearing = -1f,
            type = type,
            direction = null,
            roadName = obj.optString("name", null),
            province = null,
            district = null,
            ward = null
        )
    }

    /**
     * Import từ file SQLite có sẵn (pre-populated database)
     * Copy file .db từ assets vào databases/
     */
    suspend fun importFromPrepopulatedDb(sourceFileName: String, targetDbName: String = "camera_database"): Boolean {
        return withContext(Dispatchers.IO) {
            try {
                val targetPath = context.getDatabasePath(targetDbName).absolutePath
                val targetFile = java.io.File(targetPath)

                // Nếu DB đã tồn tại và có dữ liệu, bỏ qua
                if (targetFile.exists()) {
                    val existingCount = CameraDatabase.getDatabase(context).cameraDao().getTotalCameraCount()
                    if (existingCount > 0) {
                        Log.i(TAG, "Database already has $existingCount cameras, skipping import")
                        return@withContext true
                    }
                }

                // Copy từ assets
                context.assets.open(sourceFileName).use { input ->
                    java.io.FileOutputStream(targetPath).use { output ->
                        input.copyTo(output)
                    }
                }

                val count = CameraDatabase.getDatabase(context).cameraDao().getTotalCameraCount()
                Log.i(TAG, "Prepopulated DB imported: $count cameras")
                true
            } catch (e: Exception) {
                Log.e(TAG, "Failed to import prepopulated DB", e)
                false
            }
        }
    }

    /**
     * Kiểm tra xem đã có dữ liệu camera chưa
     */
    suspend fun hasCameraData(): Boolean {
        return withContext(Dispatchers.IO) {
            CameraDatabase.getDatabase(context).cameraDao().getTotalCameraCount() > 0
        }
    }
}