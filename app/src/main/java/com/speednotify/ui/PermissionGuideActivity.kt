package com.speednotify.ui

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.speednotify.R
import com.speednotify.utils.PermissionUtils

class PermissionGuideActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_permission_guide)

        val tvGuide = findViewById<TextView>(R.id.tvGuide)
        val btnAutostart = findViewById<Button>(R.id.btnAutostart)
        val btnBattery = findViewById<Button>(R.id.btnBattery)
        val btnLocation = findViewById<Button>(R.id.btnLocation)
        val btnNotifications = findViewById<Button>(R.id.btnNotifications)
        val btnLockApp = findViewById<Button>(R.id.btnLockApp)

        val manufacturer = Build.MANUFACTURER
        val guideText = StringBuilder()
        guideText.append("Hướng dẫn cấp quyền cho $manufacturer\n\n")

        when {
            PermissionUtils.isXiaomiDevice() -> {
                guideText.append("""
                    XIAOMI / REDMI / POCO:
                    1. Cài đặt -> Ứng dụng -> Quản lý ứng dụng -> SpeedNotify
                    2. Quyền -> Vị trí -> Luôn cho phép
                    3. Tự khởi động -> BẬT
                    4. Tiết kiệm pin -> Không giới hạn
                    5. Khóa ứng dụng trong Recent Apps (biểu tượng ổ khóa)
                """.trimIndent())
            }
            PermissionUtils.isOppoDevice() -> {
                guideText.append("""
                    OPPO / REALME / ONEPLUS:
                    1. Cài đặt -> Ứng dụng -> Quản lý ứng dụng -> SpeedNotify
                    2. Quyền -> Vị trí -> Luôn cho phép
                    3. Tự khởi động -> BẬT
                    4. Tiết kiệm pin -> Không giới hạn
                    6. Khóa ứng dụng trong Recent Apps
                """.trimIndent())
            }
            PermissionUtils.isVivoDevice() -> {
                guideText.append("""
                    VIVO / IQOO:
                    1. Cài đặt -> Ứng dụng -> Quản lý ứng dụng -> SpeedNotify
                    2. Quyền -> Vị trí -> Luôn cho phép
                    3. Tự khởi động -> BẬT
                    4. Quản lý nền -> Cho phép chạy nền
                    5. Khóa ứng dụng trong Recent Apps
                """.trimIndent())
            }
            PermissionUtils.isAsusDevice() -> {
                guideText.append("""
                    ASUS:
                    1. Cài đặt -> Ứng dụng -> Quản lý ứng dụng -> SpeedNotify
                    2. Quyền -> Vị trí -> Luôn cho phép
                    3. Mobile Manager -> Tự khởi động -> BẬT SpeedNotify
                    4. Tiết kiệm pin -> Không giới hạn
                    5. Khóa ứng dụng trong Recent Apps
                """.trimIndent())
            }
            PermissionUtils.isSamsungDevice() -> {
                guideText.append("""
                    SAMSUNG:
                    1. Cài đặt -> Ứng dụng -> SpeedNotify
                    2. Quyền -> Vị trí -> Luôn cho phép
                    3. Pin -> Không giới hạn / Bỏ tối ưu
                    4. Khóa ứng dụng trong Recent Apps
                    5. (OneUI 6+) Cài đặt -> Bảo mật và quyền riêng tư -> Quyền đặc biệt -> Truy cập vị trí liên tục
                """.trimIndent())
            }
            else -> {
                guideText.append("""
                    THIẾT BỊ KHÁC (Android thuần/Android One):
                    1. Cài đặt -> Ứng dụng -> SpeedNotify
                    2. Quyền -> Vị trí -> Luôn cho phép
                    3. Pin -> Không giới hạn / Bỏ tối ưu
                    4. Khóa ứng dụng trong Recent Apps
                    5. Android 13+: Thông báo -> Cho phép
                """.trimIndent())
            }
        }

        tvGuide.text = guideText.toString()

        btnAutostart.setOnClickListener { PermissionUtils.openAutostartSettings(this) }
        btnBattery.setOnClickListener { PermissionUtils.openBatteryOptimizationSettings(this) }
        btnLocation.setOnClickListener {
            val intent = Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
            intent.data = android.net.Uri.fromParts("package", packageName, null)
            startActivity(intent)
        }
        btnNotifications.setOnClickListener {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                val intent = Intent(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                intent.putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, packageName)
                startActivity(intent)
            }
        }
        btnLockApp.setOnClickListener {
            android.app.AlertDialog.Builder(this)
                .setTitle("Khóa ứng dụng")
                .setMessage("Mở Recent Apps -> Giữ icon SpeedNotify -> Chọn biểu tượng ổ khóa")
                .setPositiveButton("Đã hiểu", null)
                .show()
        }
    }
}