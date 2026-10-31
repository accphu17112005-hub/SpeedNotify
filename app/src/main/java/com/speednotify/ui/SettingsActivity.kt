package com.speednotify.ui

import android.content.SharedPreferences
import android.os.Bundle
import android.util.Log
import android.widget.SeekBar
import android.widget.Switch
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.speednotify.R
import com.speednotify.utils.AudioManagerHelper
import com.speednotify.utils.PermissionUtils

class SettingsActivity : AppCompatActivity() {

    private lateinit var prefs: SharedPreferences
    private lateinit var switchSpeedWarning: Switch
    private lateinit var switchCameraWarning: Switch
    private lateinit var seekBarSpeedThreshold: SeekBar
    private lateinit var tvSpeedThreshold: TextView
    private lateinit var btnTestSound: android.widget.Button
    private lateinit var btnAutostartGuide: android.widget.Button
    private lateinit var btnBatteryOptimization: android.widget.Button
    private lateinit var btnLockAppGuide: android.widget.Button
    private lateinit var audioHelper: AudioManagerHelper

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_settings)

        prefs = getSharedPreferences("speednotify_prefs", MODE_PRIVATE)

        switchSpeedWarning = findViewById(R.id.switchSpeedWarning)
        switchCameraWarning = findViewById(R.id.switchCameraWarning)
        seekBarSpeedThreshold = findViewById(R.id.seekBarSpeedThreshold)
        tvSpeedThreshold = findViewById(R.id.tvSpeedThreshold)
        btnTestSound = findViewById(R.id.btnTestSound)
        btnAutostartGuide = findViewById(R.id.btnAutostartGuide)
        btnBatteryOptimization = findViewById(R.id.btnBatteryOptimization)
        btnLockAppGuide = findViewById(R.id.btnLockAppGuide)

        audioHelper = AudioManagerHelper(this)

        loadSettings()

        switchSpeedWarning.setOnCheckedChangeListener { _, isChecked ->
            prefs.edit().putBoolean("speed_warning_enabled", isChecked).apply()
        }

        switchCameraWarning.setOnCheckedChangeListener { _, isChecked ->
            prefs.edit().putBoolean("camera_warning_enabled", isChecked).apply()
        }

        seekBarSpeedThreshold.setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar, progress: Int, fromUser: Boolean) {
                val threshold = progress + 5 // 5-25 km/h
                tvSpeedThreshold.text = "Ngưỡng cảnh báo: $threshold km/h"
                prefs.edit().putInt("speed_threshold", threshold).apply()
            }
            override fun onStartTrackingTouch(seekBar: SeekBar) {}
            override fun onStopTrackingTouch(seekBar: SeekBar) {}
        })

        btnTestSound.setOnClickListener {
            // Test sound via service or direct
            testWarningSound()
        }

        btnAutostartGuide.setOnClickListener {
            PermissionUtils.openAutostartSettings(this)
        }

        btnBatteryOptimization.setOnClickListener {
            PermissionUtils.openBatteryOptimizationSettings(this)
        }

        btnLockAppGuide.setOnClickListener {
            showLockAppGuide()
        }
    }

    private fun loadSettings() {
        switchSpeedWarning.isChecked = prefs.getBoolean("speed_warning_enabled", true)
        switchCameraWarning.isChecked = prefs.getBoolean("camera_warning_enabled", true)
        val threshold = prefs.getInt("speed_threshold", 5)
        seekBarSpeedThreshold.progress = threshold - 5
        tvSpeedThreshold.text = "Ngưỡng cảnh báo: $threshold km/h"
    }

    private fun testWarningSound() {
        // Test speed warning sound at current threshold
        val threshold = prefs.getInt("speed_threshold", 5)
        val testText = "${AudioManagerHelper.SPEED_WARNING_PREFIX}${threshold} km/h"
        audioHelper.speak(testText, object : AudioManagerHelper.AudioCallback {
            override fun onAudioFocusGained() {
                Log.d("Settings", "Test sound completed")
            }

            override fun onAudioFocusLost() {
                Log.d("Settings", "Test sound focus lost")
            }
        })
    }

    private fun showLockAppGuide() {
        android.app.AlertDialog.Builder(this)
            .setTitle("Khóa ứng dụng trong Recent Apps")
            .setMessage("""
                Để dịch vụ không bị kill khi xoá recent apps:
                
                1. Mở Recent Apps (vuốt lên/giữ nút Home)
                2. Tìm SpeedNotify
                3. Giữ icon app -> Chọn "Khóa" (biểu tượng ổ khóa)
                
                Hoặc vào Cài đặt -> Pin/Unpin apps
            """.trimIndent())
            .setPositiveButton("Đã hiểu", null)
            .show()
    }
}