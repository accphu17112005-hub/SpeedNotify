package com.speednotify.ui

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.Settings
import android.util.Log
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.lifecycleScope
import com.speednotify.R
import com.speednotify.service.LocationForegroundService
import com.speednotify.utils.AutoStartHelper
import com.speednotify.utils.PermissionUtils
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {

    private val TAG = "MainActivity"
    private val REQUEST_CODE_PERMISSIONS = 100
    private val REQUEST_CODE_BATTERY_OPTIMIZATION = 101
    private val REQUEST_CODE_BACKGROUND_LOCATION = 102
    private val REQUEST_CODE_NOTIFICATIONS = 103

    private lateinit var tvStatus: TextView
    private lateinit var btnStartService: Button
    private lateinit var btnSettings: Button
    private lateinit var btnPermissionGuide: Button
    private lateinit var btnMap: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        tvStatus = findViewById(R.id.tvStatus)
        btnStartService = findViewById(R.id.btnStartService)
        btnSettings = findViewById(R.id.btnSettings)
        btnPermissionGuide = findViewById(R.id.btnPermissionGuide)
        btnMap = findViewById(R.id.btnMap)

        btnStartService.setOnClickListener { checkAndRequestPermissions() }
        btnSettings.setOnClickListener {
            startActivity(Intent(this, SettingsActivity::class.java))
        }
        btnPermissionGuide.setOnClickListener {
            startActivity(Intent(this, PermissionGuideActivity::class.java))
        }
        btnMap.setOnClickListener {
            startActivity(Intent(this, MapActivity::class.java))
        }

        updateUI()
    }

    override fun onResume() {
        super.onResume()
        updateUI()
    }

    private fun updateUI() {
        val isServiceRunning = PermissionUtils.isServiceRunning(this, LocationForegroundService::class.java)
        val hasFineLocation = ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED
        val hasBackgroundLocation = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_BACKGROUND_LOCATION) == PackageManager.PERMISSION_GRANTED
        } else true
        val hasNotifications = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS) == PackageManager.PERMISSION_GRANTED
        } else true
        val isBatteryOptimized = !PermissionUtils.isIgnoringBatteryOptimizations(this)

        val statusText = StringBuilder()
        statusText.append("Trạng thái dịch vụ: ").append(if (isServiceRunning) "Đang chạy" else "Đã dừng").append("\n")
        statusText.append("Quyền vị trí chính xác: ").append(if (hasFineLocation) "✓" else "✗").append("\n")
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            statusText.append("Quyền vị trí nền: ").append(if (hasBackgroundLocation) "✓" else "✗").append("\n")
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            statusText.append("Quyền thông báo: ").append(if (hasNotifications) "✓" else "✗").append("\n")
        }
        statusText.append("Tối ưu pin: ").append(if (isBatteryOptimized) "Đang tối ưu (cần tắt)" else "Đã bỏ qua").append("\n")

        tvStatus.text = statusText.toString()

        btnStartService.text = if (isServiceRunning) "Dừng dịch vụ" else "Khởi động dịch vụ"
        // Luôn để nút enabled: nếu thiếu quyền, click sẽ kích hoạt luồng xin quyền
    }

    private fun checkAndRequestPermissions() {
        val isServiceRunning = PermissionUtils.isServiceRunning(this, LocationForegroundService::class.java)
        if (isServiceRunning) {
            // User chủ động tắt dịch vụ → gỡ flag để boot/update không tự khởi động lại
            AutoStartHelper.setServiceEnabledByUser(this, false)
            stopService(Intent(this, LocationForegroundService::class.java))
            updateUI()
            return
        }

        // BƯỚC 1: Xin FINE_LOCATION trước (tách riêng, không gộp chung với BACKGROUND)
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.ACCESS_FINE_LOCATION), REQUEST_CODE_PERMISSIONS)
            return
        }

        // BƯỚC 2: Xin quyền thông báo (API 33+) — riêng lẻ
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU &&
            ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.POST_NOTIFICATIONS), REQUEST_CODE_PERMISSIONS)
            return
        }

        // BƯỚC 3: Background location (API 29+) — PHẢI xin SAU khi đã có FINE,
        // Android 11+ tự động từ chối nếu xin chung với quyền vị trí khác
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q &&
            ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_BACKGROUND_LOCATION) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.ACCESS_BACKGROUND_LOCATION), REQUEST_CODE_BACKGROUND_LOCATION)
            return
        }

        // Đã đủ quyền → xin bỏ tối ưu pin rồi chạy dịch vụ
        requestBatteryOptimization()
    }

    private fun requestBatteryOptimization() {
        if (!PermissionUtils.isIgnoringBatteryOptimizations(this)) {
            val intent = Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
            intent.data = Uri.parse("package:$packageName")
            startActivityForResult(intent, REQUEST_CODE_BATTERY_OPTIMIZATION)
        } else {
            startForegroundService()
        }
    }

    private fun startForegroundService() {
        // User chủ động bật dịch vụ → đánh dấu flag để boot/update tự khởi động lại
        AutoStartHelper.setServiceEnabledByUser(this, true)
        val intent = Intent(this, LocationForegroundService::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(intent)
        } else {
            startService(intent)
        }
        Toast.makeText(this, "Đã khởi động dịch vụ theo dõi tốc độ", Toast.LENGTH_SHORT).show()
        updateUI()
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        val allGranted = grantResults.isNotEmpty() && grantResults.all { it == PackageManager.PERMISSION_GRANTED }

        when (requestCode) {
            REQUEST_CODE_PERMISSIONS, REQUEST_CODE_BACKGROUND_LOCATION -> {
                if (allGranted) {
                    // Tiếp tục chuỗi xin quyền tiếp theo hoặc khởi động dịch vụ
                    checkAndRequestPermissions()
                } else {
                    // Kiểm tra có bị "don't ask again" không
                    val permanentlyDenied = permissions.any {
                        !ActivityCompat.shouldShowRequestPermissionRationale(this, it)
                    }
                    if (permanentlyDenied) {
                        Toast.makeText(this, "Quyền đã bị từ chối vĩnh viễn. Vui lòng cấp thủ công trong Cài đặt", Toast.LENGTH_LONG).show()
                        PermissionUtils.showPermissionSettingsDialog(this)
                    } else {
                        Toast.makeText(this, "Cần cấp đầy đủ quyền để chạy dịch vụ", Toast.LENGTH_LONG).show()
                    }
                }
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_CODE_BATTERY_OPTIMIZATION) {
            startForegroundService()
        }
    }
}