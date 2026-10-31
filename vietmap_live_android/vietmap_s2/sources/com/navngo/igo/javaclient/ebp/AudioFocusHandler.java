package com.navngo.igo.javaclient.ebp;

import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.os.Build;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AudioFocusHandler {
    private static final String logname = "AudioFocusHandler";
    private final AudioManager.OnAudioFocusChangeListener mFocusChangeListener;
    private AudioFocusRequest mFocusRequest;
    private AudioAttributes mPlaybackAttributes;
    private int mCurrentFocusGainMethod = Config.android_audiofocus_gain_method;
    private int mCurrentUsage = Config.navigation_audio_usage;
    private int mCurrentContentType = Config.navigation_audio_content_type;

    public AudioFocusHandler(AudioManager.OnAudioFocusChangeListener onAudioFocusChangeListener) {
        DebugLogger.D3(logname, "new AudioFocusHandler");
        this.mFocusChangeListener = onAudioFocusChangeListener;
        if (Build.VERSION.SDK_INT >= 26) {
            this.mPlaybackAttributes = new AudioAttributes.Builder().setUsage(Config.navigation_audio_usage).setContentType(Config.navigation_audio_content_type).build();
            this.mFocusRequest = new AudioFocusRequest.Builder(this.mCurrentFocusGainMethod).setAudioAttributes(this.mPlaybackAttributes).setAcceptsDelayedFocusGain(true).setOnAudioFocusChangeListener(onAudioFocusChangeListener).build();
        }
    }

    public int requestFocus(int i, int i2) {
        if (Build.VERSION.SDK_INT >= 26) {
            if (this.mCurrentFocusGainMethod != i || this.mCurrentUsage != Config.navigation_audio_usage || this.mCurrentContentType != Config.navigation_audio_content_type) {
                DebugLogger.D3(logname, "new FocusRequest");
                this.mPlaybackAttributes = new AudioAttributes.Builder().setUsage(Config.navigation_audio_usage).setContentType(Config.navigation_audio_content_type).build();
                this.mFocusRequest = new AudioFocusRequest.Builder(i).setAudioAttributes(this.mPlaybackAttributes).setAcceptsDelayedFocusGain(true).setOnAudioFocusChangeListener(this.mFocusChangeListener).build();
                this.mCurrentFocusGainMethod = i;
                this.mCurrentUsage = Config.navigation_audio_usage;
                this.mCurrentContentType = Config.navigation_audio_content_type;
            }
            return Application.getAudioManager().requestAudioFocus(this.mFocusRequest);
        }
        return Application.getAudioManager().requestAudioFocus(this.mFocusChangeListener, i2, i);
    }

    public void abandonFocus() {
        if (Build.VERSION.SDK_INT >= 26) {
            Application.getAudioManager().abandonAudioFocusRequest(this.mFocusRequest);
        } else {
            Application.getAudioManager().abandonAudioFocus(this.mFocusChangeListener);
        }
    }
}
