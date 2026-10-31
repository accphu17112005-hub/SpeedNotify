package com.speednotify.receiver

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import com.speednotify.utils.AutoStartHelper

/**
 * Khởi động lại dịch vụ sau khi app được update (MY_PACKAGE_REPLACED).
 *
 * An toàn trên Android 12+/14+ (xem AutoStartHelper): MY_PACKAGE_REPLACED
 * là trường hợp được miễn khỏi hạn chế start-FGS-từ-nền của Android 12,
 * nhưng vẫn chỉ start khi user đã chủ động bật dịch vụ + đủ quyền vị trí.
 */
class PackageReplacedReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        if (Intent.ACTION_MY_PACKAGE_REPLACED == intent.action) {
            Log.d("PackageReplacedReceiver", "App updated, checking whether to restart foreground service")
            AutoStartHelper.startServiceIfSafe(context, "MY_PACKAGE_REPLACED")
        }
    }
}