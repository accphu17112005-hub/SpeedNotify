package com.speednotify.utils

import android.app.Activity
import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.PowerManager
import android.provider.Settings
import androidx.core.app.ActivityCompat

object PermissionUtils {

    fun isIgnoringBatteryOptimizations(context: Context): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val pm = context.getSystemService(Context.POWER_SERVICE) as PowerManager
            return pm.isIgnoringBatteryOptimizations(context.packageName)
        }
        return true
    }

    fun isServiceRunning(context: Context, serviceClass: Class<*>): Boolean {
        val manager = context.getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
        for (service in manager.getRunningServices(Int.MAX_VALUE)) {
            if (serviceClass.name == service.service.className) {
                return true
            }
        }
        return false
    }

    fun showPermissionSettingsDialog(activity: Activity) {
        AlertDialog.Builder(activity)
            .setTitle("Cần cấp quyền")
            .setMessage("Ứng dụng cần quyền vị trí và thông báo để hoạt động. Bạn có muốn mở cài đặt không?")
            .setPositiveButton("Mở cài đặt") { _, _ ->
                val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                intent.data = Uri.fromParts("package", activity.packageName, null)
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                activity.startActivity(intent)
            }
            .setNegativeButton("Hủy", null)
            .show()
    }

    fun requestPermissions(activity: Activity, permissions: Array<String>, requestCode: Int) {
        ActivityCompat.requestPermissions(activity, permissions, requestCode)
    }

    fun shouldShowRequestPermissionRationale(activity: Activity, permission: String): Boolean {
        return ActivityCompat.shouldShowRequestPermissionRationale(activity, permission)
    }

    fun openAutostartSettings(context: Context) {
        val packageName = context.packageName
        try {
            when {
                // Xiaomi
                isXiaomiDevice() -> {
                    val intent = Intent()
                    intent.setComponent(android.content.ComponentName(
                        "com.miui.securitycenter",
                        "com.miui.permcenter.autostart.AutoStartManagementActivity"
                    ))
                    context.startActivity(intent)
                }
                // Oppo/Realme
                isOppoDevice() -> {
                    val intent = Intent()
                    intent.setComponent(android.content.ComponentName(
                        "com.coloros.safecenter",
                        "com.coloros.safecenter.permission.startup.StartupAppListActivity"
                    ))
                    context.startActivity(intent)
                }
                // Vivo
                isVivoDevice() -> {
                    val intent = Intent()
                    intent.setComponent(android.content.ComponentName(
                        "com.vivo.permissionmanager",
                        "com.vivo.permissionmanager.activity.BgStartUpManagerActivity"
                    ))
                    context.startActivity(intent)
                }
                // Asus
                isAsusDevice() -> {
                    val intent = Intent()
                    intent.setComponent(android.content.ComponentName(
                        "com.asus.mobilemanager",
                        "com.asus.mobilemanager.entry.FunctionActivity"
                    ))
                    intent.putExtra("function_name", "AutoStartManager")
                    context.startActivity(intent)
                }
                // Samsung
                isSamsungDevice() -> {
                    val intent = Intent()
                    intent.setComponent(android.content.ComponentName(
                        "com.samsung.android.sm_cn",
                        "com.samsung.android.sm_cn.AppSmartCareActivity"
                    ))
                    context.startActivity(intent)
                }
                // Generic
                else -> {
                    val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
                    intent.data = Uri.fromParts("package", packageName, null)
                    context.startActivity(intent)
                }
            }
        } catch (e: Exception) {
            // Fallback to app info
            val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
            intent.data = Uri.fromParts("package", packageName, null)
            context.startActivity(intent)
        }
    }

    fun openBatteryOptimizationSettings(context: Context) {
        try {
            val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
            context.startActivity(intent)
        } catch (e: Exception) {
            val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
            intent.data = Uri.fromParts("package", context.packageName, null)
            context.startActivity(intent)
        }
    }

    fun isXiaomiDevice(): Boolean = Build.MANUFACTURER.equals("Xiaomi", ignoreCase = true) ||
        Build.MANUFACTURER.equals("Redmi", ignoreCase = true) ||
        Build.MANUFACTURER.equals("POCO", ignoreCase = true)

    fun isOppoDevice(): Boolean = Build.MANUFACTURER.equals("OPPO", ignoreCase = true) ||
        Build.MANUFACTURER.equals("Realme", ignoreCase = true) ||
        Build.MANUFACTURER.equals("OnePlus", ignoreCase = true)

    fun isVivoDevice(): Boolean = Build.MANUFACTURER.equals("Vivo", ignoreCase = true) ||
        Build.MANUFACTURER.equals("iQOO", ignoreCase = true)

    fun isAsusDevice(): Boolean = Build.MANUFACTURER.equals("ASUS", ignoreCase = true)

    fun isSamsungDevice(): Boolean = Build.MANUFACTURER.equals("Samsung", ignoreCase = true)
}