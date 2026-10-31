package com.speednotify.utils

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFocusRequest
import android.media.AudioManager
import android.media.MediaPlayer
import android.os.Build
import android.speech.tts.TextToSpeech
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.media.AudioAttributesCompat
import androidx.media.AudioFocusRequestCompat
import androidx.media.AudioManagerCompat
import com.speednotify.R
import java.util.Locale
import java.util.concurrent.atomic.AtomicBoolean

class AudioManagerHelper(private val context: Context) {

    private var tts: TextToSpeech? = null
    private var mediaPlayer: MediaPlayer? = null
    private var audioFocusRequest: Any? = null // AudioFocusRequest or AudioFocusRequestCompat
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    private val ttsInitialized = AtomicBoolean(false)
    private val ttsSupported = AtomicBoolean(false)
    private var onTtsReady: (() -> Unit)? = null

    interface AudioCallback {
        fun onAudioFocusGained()
        fun onAudioFocusLost()
    }

    init {
        initializeTts()
    }

    private fun initializeTts() {
        tts = TextToSpeech(context) { status ->
            if (status == TextToSpeech.SUCCESS) {
                val result = tts?.setLanguage(Locale("vi", "VN"))
                val supported = result != TextToSpeech.LANG_MISSING_DATA && result != TextToSpeech.LANG_NOT_SUPPORTED
                ttsSupported.set(supported)
                if (supported) {
                    tts?.setSpeechRate(1.0f)
                    tts?.setPitch(1.0f)
                    ttsInitialized.set(true)
                    onTtsReady?.invoke()
                    Log.d("AudioManager", "TTS Vietnamese initialized successfully")
                } else {
                    Log.w("AudioManager", "Vietnamese TTS not supported, will use fallback audio files")
                }
            } else {
                Log.e("AudioManager", "TTS initialization failed: $status")
            }
        }
    }

    fun setOnTtsReady(callback: () -> Unit) {
        if (ttsInitialized.get()) {
            callback()
        } else {
            onTtsReady = callback
        }
    }

    fun speak(text: String, callback: AudioCallback) {
        requestAudioFocus { granted ->
            if (granted) {
                if (ttsSupported.get() && ttsInitialized.get()) {
                    speakWithTts(text, callback)
                } else {
                    playFallbackAudio(text, callback)
                }
            } else {
                callback.onAudioFocusLost()
            }
        }
    }

    private fun speakWithTts(text: String, callback: AudioCallback) {
        val utteranceId = "speednotify_${System.currentTimeMillis()}"
        val params = android.os.Bundle().apply {
            putString(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, utteranceId)
        }

        tts?.speak(text, TextToSpeech.QUEUE_FLUSH, params, utteranceId)

        // For TTS, we release focus after a delay since we can't easily detect completion
        // In production, use UtteranceProgressListener for precise control
        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
            releaseAudioFocus()
            callback.onAudioFocusLost()
        }, estimateSpeechDuration(text))
    }

    private fun playFallbackAudio(text: String, callback: AudioCallback) {
        val resId = getFallbackAudioResource(text)
        if (resId != 0) {
            mediaPlayer = MediaPlayer.create(context, resId)
            mediaPlayer?.setOnCompletionListener {
                releaseAudioFocus()
                mediaPlayer?.release()
                mediaPlayer = null
                callback.onAudioFocusLost()
            }
            mediaPlayer?.start()
        } else {
            Log.w(TAG, "Fallback audio resource not found for: $text, using TTS fallback")
            if (ttsSupported.get() && ttsInitialized.get()) {
                speakWithTts(text, callback)
            } else {
                releaseAudioFocus()
                callback.onAudioFocusLost()
            }
        }
    }

    private fun getFallbackAudioResource(text: String): Int {
        // Map text to raw resource IDs
        return when {
            text.contains("vượt tốc độ") || text.contains("quá tốc độ") -> R.raw.warning_speed
            text.contains("camera") -> R.raw.warning_camera
            text.contains("đèn đỏ") -> R.raw.warning_redlight
            else -> R.raw.warning_generic
        }
    }

    private fun estimateSpeechDuration(text: String): Long {
        // Rough estimate: ~150 words per minute, Vietnamese ~200 chars per minute
        return (text.length * 300L).coerceAtLeast(2000).coerceAtMost(10000)
    }

    private fun requestAudioFocus(callback: (Boolean) -> Unit) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            requestAudioFocusV26(callback)
        } else {
            requestAudioFocusLegacy(callback)
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun requestAudioFocusV26(callback: (Boolean) -> Unit) {
        val focusRequest = AudioFocusRequestCompat.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK)
            .setAudioAttributes(
                AudioAttributesCompat.Builder()
                    .setUsage(AudioAttributesCompat.USAGE_ASSISTANCE_NAVIGATION_GUIDANCE)
                    .setContentType(AudioAttributesCompat.CONTENT_TYPE_SPEECH)
                    .build()
            )
            .setOnAudioFocusChangeListener { focusChange ->
                when (focusChange) {
                    AudioManager.AUDIOFOCUS_GAIN -> callback(true)
                    AudioManager.AUDIOFOCUS_LOSS,
                    AudioManager.AUDIOFOCUS_LOSS_TRANSIENT,
                    AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK -> {
                        callback(false)
                    }
                }
            }
            .build()
        audioFocusRequest = focusRequest
        val result = AudioManagerCompat.requestAudioFocus(audioManager, focusRequest)
        callback(result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED)
    }

    @Suppress("DEPRECATION")
    private fun requestAudioFocusLegacy(callback: (Boolean) -> Unit) {
        val result = audioManager.requestAudioFocus(
            { focusChange ->
                when (focusChange) {
                    AudioManager.AUDIOFOCUS_GAIN -> callback(true)
                    else -> callback(false)
                }
            },
            AudioManager.STREAM_MUSIC,
            AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK
        )
        callback(result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED)
    }

    private fun releaseAudioFocus() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            audioFocusRequest?.let { request ->
                AudioManagerCompat.abandonAudioFocusRequest(audioManager, request as AudioFocusRequestCompat)
            }
        } else {
            audioManager.abandonAudioFocus(null)
        }
        audioFocusRequest = null
    }

    fun shutdown() {
        releaseAudioFocus()
        tts?.shutdown()
        mediaPlayer?.release()
        mediaPlayer = null
    }

    companion object {
        private const val TAG = "AudioManagerHelper"
        const val SPEED_WARNING_PREFIX = "Cảnh báo, bạn đang vượt tốc độ. Giới hạn "
        const val CAMERA_WARNING_PREFIX = "Cảnh báo, sắp đến camera phạt nguội. Giới hạn "
    }
}