package com.speednotify.utils

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.core.content.ContextCompat
import com.speednotify.service.LocationForegroundService

/**
 * Helper cho việc tự khởi động lại dịch vụ sau boot / update app.
 *
 * Android 12+ (API 31) cấm app ở nền gọi startForegroundService()
 * (ném ForegroundServiceStartNotAllowedException) — chỉ được phép trong
 * các trường hợp được miễn, bao gồm ACTION_BOOT_COMPLETED và
 * ACTION_MY_PACKAGE_REPLACED (2 receiver của app đều thuộc trường hợp miễn).
 *
 * Android 14+ (API 34) ngoài ra yêu cầu:
 *  - Khai báo foregroundServiceType="location" + quyền FOREGROUND_SERVICE_LOCATION
 *    (đã có trong AndroidManifest).
 *  - Phải giữ quyền runtime ACCESS_FINE_LOCATION khi start FGS type location,
 *    nếu thiếu sẽ ném SecurityException. Nếu chỉ có while-in-use (thiếu
 *    ACCESS_BACKGROUND_LOCATION) thì FGS chỉ nhận được vị trí while-in-use.
 *
 * Vì vậy trước khi auto-start phải kiểm tra:
 *  1. Người dùng đã từng chủ động bật dịch vụ (flag "service_enabled_by_user",
 *     set trong MainActivity) — không tự khởi động khi user chưa muốn.
 *  2. Đủ quyền vị trí (FINE + BACKGROUND trên Android 10+).
 * Và luôn bọc startForegroundService trong try-catch để không bao giờ crash.
 */
object AutoStartHelper {

    private const val TAG = "AutoStartHelper"

    // Dùng chung file prefs "speednotify_prefs" với phần còn lại của app
    private const val PREFS_NAME = "speednotify_prefs"
    private const val KEY_SERVICE_ENABLED = "service_enabled_by_user"

    /** Flag: user đã chủ động bật dịch vụ (set khi bấm nút trong MainActivity) */
    fun isServiceEnabledByUser(context: Context): Boolean {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .getBoolean(KEY_SERVICE_ENABLED, false)
    }

    fun setServiceEnabledByUser(context: Context, enabled: Boolean) {
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .edit().putBoolean(KEY_SERVICE_ENABLED, enabled).apply()
    }

    /** Đủ quyền vị trí để chạy FGS type "location" một cách hợp lệ? */
    fun hasLocationPermissions(context: Context): Boolean {
        val fineGranted = ContextCompat.checkSelfPermission(
            context, android.Manifest.permission.ACCESS_FINE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED
        if (!fineGranted) return false

        // Android 10+ cần thêm BACKGROUND_LOCATION để FGS location nhận được
        // cập nhật khi app ở nền (Android 14+ nếu thiếu sẽ chỉ while-in-use)
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContextCompat.checkSelfPermission(
                context, android.Manifest.permission.ACCESS_BACKGROUND_LOCATION
            ) == PackageManager.PERMISSION_GRANTED
        } else {
            true
        }
    }

    /**
     * Start FGS một cách an toàn: chỉ start khi user đã bật + đủ quyền,
     * mọi exception đều được bắt để không bao giờ crash app sau boot/update.
     *
     * @param reason mô tả nguồn kích hoạt (BOOT_COMPLETED / MY_PACKAGE_REPLACED)
     * @return true nếu đã gọi start thành công
     */
    fun startServiceIfSafe(context: Context, reason: String): Boolean {
        if (!isServiceEnabledByUser(context)) {
            Log.d(TAG, "$reason: bỏ qua — user chưa bật dịch vụ")
            return false
        }
        if (!hasLocationPermissions(context)) {
            Log.d(TAG, "$reason: bỏ qua — chưa đủ quyền vị trí (FINE/BACKGROUND)")
            return false
        }

        val serviceIntent = Intent(context, LocationForegroundService::class.java)
        return try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(serviceIntent)
            } else {
                context.startService(serviceIntent)
            }
            Log.d(TAG, "$reason: đã khởi động lại dịch vụ")
            true
        } catch (e: SecurityException) {
            // Android 14+: thiếu quyền runtime khi start FGS type location
            Log.e(TAG, "$reason: SecurityException khi start FGS", e)
            false
        } catch (e: Exception) {
            // Android 12+: ForegroundServiceStartNotAllowedException và các lỗi khác
            Log.e(TAG, "$reason: không thể start FGS (${e.javaClass.simpleName}): ${e.message}")
            false
        }
    }
}