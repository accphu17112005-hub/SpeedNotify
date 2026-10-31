package com.navngo.igo.javaclient.ebp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import androidx.core.os.EnvironmentCompat;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AudioFocusMutingDevice extends MutingDeviceBase implements IMutingDevice, AudioManager.OnAudioFocusChangeListener {
    private static final String logname = "AudioFocusMutingDevice";
    private final AudioFocusHandler mAudioFocusHandler;
    private int mLastAudioMode;
    private boolean mLastSpeakerPhoneOn;
    final ScoAudioStateChangedReceiver mScoAudioStateChangedReceiver;
    private boolean mIsForceSpeakerOutSet = false;
    private boolean mIsForceCallModeSet = false;

    @Override // com.navngo.igo.javaclient.ebp.MutingDeviceBase, com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Close() {
    }

    @Override // android.media.AudioManager.OnAudioFocusChangeListener
    public void onAudioFocusChange(int i) {
        if (i == -3) {
            DebugLogger.D3(logname, "transient audio focus loss, can duck");
        } else if (i == -2) {
            DebugLogger.D3(logname, "transient audio focus loss");
        } else if (i == -1) {
            DebugLogger.D3(logname, "audio focus loss");
        } else if (i == 1) {
            DebugLogger.D3(logname, "audio focus gained");
        } else if (i == 2) {
            DebugLogger.D3(logname, "transient audio focus gained");
        } else if (i == 3) {
            DebugLogger.D3(logname, "transient audio focus gained, may duck");
        } else if (i == 4) {
            DebugLogger.D3(logname, "transient exclusive audio focus gained");
        } else {
            DebugLogger.D3(logname, "unknown audio focus notify; type='" + i + "'");
        }
        if (i < 0) {
            OnAudioFocusLoss();
        }
    }

    private final class ScoAudioStateChangedReceiver extends BroadcastReceiver {
        boolean ScoPlaybackWaiting;
        int currState;
        int prevState;

        public String scoAudioStateToString(int i) {
            return i != -1 ? i != 0 ? i != 1 ? i != 2 ? EnvironmentCompat.MEDIA_UNKNOWN : "connecting" : "connected" : "disconnected" : "error";
        }

        private ScoAudioStateChangedReceiver() {
            this.prevState = -1;
            this.currState = -1;
            this.ScoPlaybackWaiting = false;
        }

        public int getState() {
            return this.currState;
        }

        public void resetScoplaybackWait() {
            this.ScoPlaybackWaiting = true;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.media.ACTION_SCO_AUDIO_STATE_UPDATED")) {
                this.prevState = intent.getIntExtra("android.media.extra.SCO_AUDIO_PREVIOUS_STATE", -1);
                this.currState = intent.getIntExtra("android.media.extra.SCO_AUDIO_STATE", -1);
                DebugLogger.D3(AudioFocusMutingDevice.logname, "Sco State Updated. Previous: " + scoAudioStateToString(this.prevState) + " Current: " + scoAudioStateToString(this.currState));
            }
        }
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Mute(int i, int i2, int i3) {
        int i4 = Config.navigation_audio_stream;
        DebugLogger.D3(logname, "Mute(" + i + "," + i2 + "," + i3 + ") audio stream " + i4 + ", IsForceCallModeSet: " + this.mIsForceCallModeSet + ", IsForceSpeakerOutSet: " + this.mIsForceSpeakerOutSet);
        AudioManager audioManager = Application.getAudioManager();
        boolean z = this.mAudioFocusHandler.requestFocus(i, i4) == 1;
        StringBuilder sb = new StringBuilder();
        sb.append("Requested focus; stream='");
        sb.append(i4);
        sb.append("', success='");
        sb.append(z ? "yes" : "no");
        sb.append("'");
        DebugLogger.D3(logname, sb.toString());
        if (z && !audioManager.isWiredHeadsetOn()) {
            boolean z2 = i2 != 0;
            boolean z3 = i3 != 0;
            if (z2) {
                if (audioManager.isBluetoothA2dpOn()) {
                    setForceSpeakerOut(true);
                }
            } else if (z3 && audioManager.isBluetoothScoAvailableOffCall()) {
                setForceCallMode(true);
            }
        }
        AudiofocusChanged(z ? 0 : 2, i);
    }

    private void setForceSpeakerOut(boolean z) {
        AudioManager audioManager = Application.getAudioManager();
        if (z) {
            if (this.mIsForceSpeakerOutSet) {
                return;
            }
            this.mLastAudioMode = audioManager.getMode();
            this.mLastSpeakerPhoneOn = audioManager.isSpeakerphoneOn();
            audioManager.setSpeakerphoneOn(true);
            audioManager.setMode(3);
            this.mIsForceSpeakerOutSet = true;
            return;
        }
        if (this.mIsForceSpeakerOutSet) {
            audioManager.setMode(this.mLastAudioMode);
            audioManager.setSpeakerphoneOn(this.mLastSpeakerPhoneOn);
            this.mIsForceSpeakerOutSet = false;
        }
    }

    private void setForceCallMode(boolean z) {
        AudioManager audioManager = Application.getAudioManager();
        if (z) {
            if (this.mIsForceCallModeSet) {
                return;
            }
            audioManager.setMode(2);
            audioManager.startBluetoothSco();
            audioManager.setBluetoothScoOn(true);
            this.mIsForceCallModeSet = true;
            return;
        }
        if (this.mIsForceCallModeSet) {
            audioManager.stopBluetoothSco();
            audioManager.setBluetoothScoOn(false);
            audioManager.setMode(0);
            this.mIsForceCallModeSet = false;
        }
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Unmute() {
        DebugLogger.D3(logname, "Unmute() streamID: " + Config.navigation_audio_stream + ", IsForceCallModeSet: " + this.mIsForceCallModeSet + ", IsForceSpeakerOutSet: " + this.mIsForceSpeakerOutSet);
        setForceCallMode(false);
        setForceSpeakerOut(false);
        this.mAudioFocusHandler.abandonFocus();
        AudiofocusChanged(1, 0);
    }

    public AudioFocusMutingDevice() {
        ScoAudioStateChangedReceiver scoAudioStateChangedReceiver = new ScoAudioStateChangedReceiver();
        this.mScoAudioStateChangedReceiver = scoAudioStateChangedReceiver;
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("audio_focus.isBluetoothA2dpOn", this, "isBluetoothA2dpOn");
        androidGo.registerFunctor("audio_focus.isBluetoothScoOn", this, "isBluetoothScoOn");
        Application.anApplication.registerReceiver(scoAudioStateChangedReceiver, new IntentFilter("android.media.ACTION_SCO_AUDIO_STATE_UPDATED"));
        this.mAudioFocusHandler = new AudioFocusHandler(this);
    }

    public boolean isBluetoothA2dpOn() {
        boolean zIsBluetoothA2dpOn = Application.getAudioManager().isBluetoothA2dpOn();
        DebugLogger.D3(logname, "isBluetoothA2dpOn: " + zIsBluetoothA2dpOn);
        return zIsBluetoothA2dpOn;
    }

    public boolean isBluetoothScoOn() {
        boolean zIsBluetoothScoOn = Application.getAudioManager().isBluetoothScoOn();
        DebugLogger.D3(logname, "isBluetoothScoOn: " + zIsBluetoothScoOn);
        return zIsBluetoothScoOn;
    }
}
