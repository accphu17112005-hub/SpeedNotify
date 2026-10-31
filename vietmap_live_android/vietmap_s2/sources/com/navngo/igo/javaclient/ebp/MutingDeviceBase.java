package com.navngo.igo.javaclient.ebp;

import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class MutingDeviceBase implements IMutingDevice, IFunctorCollection {
    private AndroidGo mAndroidGo = AndroidGo.getInstance();

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Close() {
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public final void registerFunctors() {
        this.mAndroidGo.registerFunctor("sound.audiofocus_get", this, "AudioFocusGet");
        this.mAndroidGo.registerFunctor("sound.audiofocus_release", this, "AudioFocusRelease");
    }

    public final void AudioFocusGet(int i, int i2, int i3) {
        Mute(i, i2, i3);
    }

    public final void AudioFocusRelease() {
        Unmute();
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public final void OnAudioFocusLoss() {
        this.mAndroidGo.callIgoSync("sound.on_audiofocus_loss", new Object[0]);
    }

    public final void AudiofocusChanged(int i, int i2) {
        this.mAndroidGo.callIgoSync("sound.on_audiofocus_change", Integer.valueOf(i), Integer.valueOf(i2));
    }
}
