package com.speednotify

import android.app.Application
import android.content.Context
import com.speednotify.data.CameraDataImporter
import com.speednotify.data.CameraDatabase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class SpeedNotifyApplication : Application() {

    companion object {
        fun getDatabase(context: Context): CameraDatabase {
            return CameraDatabase.getDatabase(context)
        }
    }

    override fun onCreate() {
        super.onCreate()
        // Initialize database
        CameraDatabase.getDatabase(this)
        // Import camera data on first run
        importCameraDataIfNeeded()
    }

    private fun importCameraDataIfNeeded() {
        val prefs = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)
        val isDataImported = prefs.getBoolean("camera_data_imported", false)

        if (!isDataImported) {
            CoroutineScope(Dispatchers.IO).launch {
                val importer = CameraDataImporter(this@SpeedNotifyApplication)

                // Import dữ liệu camera từ các file JSON trong assets
                val count = importer.importFromJsonAssets(
                    "speed_cameras_vietnam.json",
                    "ai_cameras_hanoi.json"
                )

                // Chỉ đánh dấu đã import khi có dữ liệu (lần chạy sau sẽ thử lại nếu thất bại)
                if (count > 0) {
                    prefs.edit().putBoolean("camera_data_imported", true).apply()
                }
            }
        }
    }
}