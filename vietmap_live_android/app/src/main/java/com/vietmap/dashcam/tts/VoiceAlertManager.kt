package com.vietmap.dashcam.tts

import android.content.Context
import android.speech.tts.TextToSpeech
import android.util.Log
import java.util.Locale

class VoiceAlertManager(private val context: Context) : TextToSpeech.OnInitListener {

    private var tts: TextToSpeech? = null
    private var isInitialized = false
    private var lastSpokenTime = 0L
    private var lastSpokenKey = ""
    private val COOLDOWN_MS = 12000L // 12 giây không nhắc lại cùng 1 nội dung

    init {
        tts = TextToSpeech(context.applicationContext, this)
    }

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            val vietnameseLocale = Locale("vi", "VN")
            val result = tts?.setLanguage(vietnameseLocale)

            if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED) {
                Log.w("VoiceAlert", "Tiếng Việt không được hỗ trợ đầy đủ trên TTS máy, dùng ngôn ngữ mặc định.")
                tts?.language = Locale.getDefault()
            }
            tts?.setSpeechRate(1.05f) // Nói nhanh hơn một chút để báo kịp thời khi lái xe
            isInitialized = true
            Log.d("VoiceAlert", "TTS initialized successfully")
        } else {
            Log.e("VoiceAlert", "Khởi tạo TextToSpeech thất bại: $status")
        }
    }

    /**
     * Phát âm thanh cảnh báo bằng giọng nói tiếng Việt
     * @param message Nội dung thông báo
     * @param alertKey Khóa định danh cảnh báo để tránh nói lặp lại liên tục
     * @param force Bỏ qua thời gian chờ (dành cho cảnh báo khẩn cấp như vượt tốc độ)
     */
    fun speak(message: String, alertKey: String = message, force: Boolean = false) {
        if (!isInitialized || tts == null) return

        val currentTime = System.currentTimeMillis()
        if (!force && alertKey == lastSpokenKey && (currentTime - lastSpokenTime) < COOLDOWN_MS) {
            return // Đang trong thời gian cooldown, không lặp lại
        }

        lastSpokenKey = alertKey
        lastSpokenTime = currentTime

        tts?.speak(message, TextToSpeech.QUEUE_FLUSH, null, "ALERT_${System.currentTimeMillis()}")
    }

    fun warnSpeedCamera(distanceMetres: Int, speedLimit: Int) {
        val message = "Chú ý, phía trước ${distanceMetres} mét có camera phạt nguội, tốc độ giới hạn $speedLimit ki lô mét trên giờ."
        speak(message, "CAMERA_$speedLimit", force = false)
    }

    fun warnOverSpeed(currentSpeed: Int, speedLimit: Int) {
        val message = "Cảnh báo, bạn đang chạy quá tốc độ $currentSpeed trên $speedLimit ki lô mét trên giờ!"
        speak(message, "OVERSPEED", force = true)
    }

    fun warnApproachingZone(zoneName: String, speedLimit: Int) {
        val message = "Sắp vào $zoneName, tốc độ tối đa $speedLimit ki lô mét trên giờ."
        speak(message, "ZONE_$zoneName", force = false)
    }

    /**
     * Thông báo sắp đến biển đổi tốc độ (không phải camera phạt).
     * Ví dụ: "Phía trước 400 mét, tốc độ tối đa 60 ki lô mét trên giờ"
     */
    fun warnSpeedLimitSign(distanceMetres: Int, speedLimit: Int) {
        val message = "Phía trước $distanceMetres mét, tốc độ tối đa $speedLimit ki lô mét trên giờ."
        speak(message, "SIGN_$speedLimit", force = false)
    }

    fun shutdown() {
        tts?.stop()
        tts?.shutdown()
        tts = null
    }
}
