package com.speednotify.receiver

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import com.speednotify.utils.AutoStartHelper

/**
 * Khởi động lại dịch vụ sau khi máy boot xong.
 *
 * An toàn trên Android 12+/14+ (xem AutoStartHelper): BOOT_COMPLETED là
 * trường hợp được miễn khỏi hạn chế start-FGS-từ-nền của Android 12,
 * nhưng vẫn phải đủ quyền runtime location (Android 14+) và tôn trọng
 * lựa chọn của user — chỉ start khi user đã chủ động bật dịch vụ.
 * Mọi exception đều được bắt để không bao giờ crash ngay sau boot.
 */
class BootCompletedReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.action
        if (action == Intent.ACTION_BOOT_COMPLETED
            || action == "android.intent.action.QUICKBOOT_POWERON"
            || action == "com.htc.intent.action.QUICKBOOT_POWERON"
        ) {
            Log.d("BootReceiver", "Boot completed, checking whether to start foreground service")
            AutoStartHelper.startServiceIfSafe(context, "BOOT_COMPLETED")
        }
    }
}