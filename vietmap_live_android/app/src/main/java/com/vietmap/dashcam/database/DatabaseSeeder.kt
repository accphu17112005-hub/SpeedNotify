package com.vietmap.dashcam.database

import android.content.Context
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONArray

object DatabaseSeeder {

    private const val AI_CAMERAS_ASSET = "ai_cameras_hanoi.json"
    private const val VIETNAM_CAMERAS_ASSET = "speed_cameras_vietnam.json"

    suspend fun seedInitialDataIfEmpty(context: Context, database: AppDatabase) {
        withContext(Dispatchers.IO) {
            val dao = database.cameraDao()
            // Xóa dữ liệu cũ và nạp dữ liệu 100% thực tế đã xác minh
            dao.clearManualCameras()
            Log.d("DatabaseSeeder", "Nạp 100% dữ liệu camera phạt nguội & bắn tốc độ thực tế đã xác minh...")
            
            val vnCameras = loadCamerasFromAsset(context, VIETNAM_CAMERAS_ASSET)
            if (vnCameras.isNotEmpty()) {
                dao.insertCameras(vnCameras)
                Log.d("DatabaseSeeder", "Đã nạp ${vnCameras.size} camera thực tế từ $VIETNAM_CAMERAS_ASSET.")
            }

            val aiCameras = loadCamerasFromAsset(context, AI_CAMERAS_ASSET)
            if (aiCameras.isNotEmpty()) {
                dao.insertCameras(aiCameras)
                Log.d("DatabaseSeeder", "Đã nạp ${aiCameras.size} camera AI từ $AI_CAMERAS_ASSET.")
            }
            
            val total = dao.getCameraCount()
            Log.i("DatabaseSeeder", "Tổng số camera phạt nguội & bắn tốc độ THỰC TẾ trong CSDL: $total điểm.")
        }
    }

    private fun loadCamerasFromAsset(context: Context, assetName: String): List<SpeedCameraEntity> {
        val json = try {
            context.assets.open(assetName).bufferedReader().use { it.readText() }
        } catch (e: java.io.IOException) {
            Log.w("DatabaseSeeder", "Không tìm thấy $assetName, bỏ qua.", e)
            return emptyList()
        }

        val array = JSONArray(json)
        return (0 until array.length()).map { i ->
            val obj = array.getJSONObject(i)
            SpeedCameraEntity(
                name = obj.getString("name"),
                latitude = obj.getDouble("latitude"),
                longitude = obj.getDouble("longitude"),
                speedLimit = obj.optInt("speedLimit", 60),
                type = obj.optString("type", SpeedCameraEntity.TYPE_SPEED_CAM),
                description = obj.optString("description", ""),
            )
        }
    }
}
