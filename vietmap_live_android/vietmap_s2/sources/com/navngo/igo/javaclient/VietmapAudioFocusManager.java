package com.navngo.igo.javaclient;

import android.media.AudioManager;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class VietmapAudioFocusManager implements IFunctorCollection {
    private final String logname = getClass().getSimpleName();
    private final AudioManager.OnAudioFocusChangeListener mFocusChangeListener = new AudioManager.OnAudioFocusChangeListener() { // from class: com.navngo.igo.javaclient.VietmapAudioFocusManager$$ExternalSyntheticLambda0
        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public final void onAudioFocusChange(int i) {
            this.f$0.m5lambda$new$0$comnavngoigojavaclientVietmapAudioFocusManager(i);
        }
    };

    /* JADX INFO: renamed from: lambda$new$0$com-navngo-igo-javaclient-VietmapAudioFocusManager, reason: not valid java name */
    /* synthetic */ void m5lambda$new$0$comnavngoigojavaclientVietmapAudioFocusManager(int i) {
        DebugLogger.D3(this.logname, "focus changed, value: " + i + (-1));
        AndroidGo androidGo = AndroidGo.getInstance();
        if (i > 0) {
            androidGo.callIgo("vietmap.audio_focus_gained", null, new Object[0]);
        } else {
            androidGo.callIgo("vietmap.audio_focus_loss", null, new Object[0]);
        }
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.vietmap.requestAudioFocus", this, "requestAudioFocus");
        androidGo.registerFunctor("android.vietmap.abandonAudioFocus", this, "abandonAudioFocus");
    }

    public void requestAudioFocus(int i) {
        DebugLogger.D3(this.logname, "requesting audio focus with method: " + i);
        if (Application.getAudioManager().requestAudioFocus(this.mFocusChangeListener, Config.navigation_audio_stream, i) == 1) {
            AndroidGo.getInstance().callIgo("vietmap.audio_focus_gained", null, new Object[0]);
        }
    }

    public void abandonAudioFocus() {
        DebugLogger.D3(this.logname, "abandoning audio focus");
        Application.getAudioManager().abandonAudioFocus(this.mFocusChangeListener);
        AndroidGo.getInstance().callIgo("vietmap.audio_focus_loss", null, new Object[0]);
    }
}
