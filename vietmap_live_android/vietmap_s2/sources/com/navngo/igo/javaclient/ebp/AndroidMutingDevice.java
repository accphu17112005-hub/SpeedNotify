package com.navngo.igo.javaclient.ebp;

import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AndroidMutingDevice extends MutingDeviceBase implements IMutingDevice {
    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Mute(int i, int i2, int i3) {
        DebugLogger.D3("AndroidMutingDevice", "Mute(" + Config.navigation_audio_stream + ")");
        Application.getAudioManager().setStreamMute(3, true);
        AudiofocusChanged(0, i);
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Unmute() {
        DebugLogger.D3("AndroidMutingDevice", "Unmute(" + Config.navigation_audio_stream + ")");
        Application.getAudioManager().setStreamMute(3, false);
        AudiofocusChanged(1, 0);
    }
}
