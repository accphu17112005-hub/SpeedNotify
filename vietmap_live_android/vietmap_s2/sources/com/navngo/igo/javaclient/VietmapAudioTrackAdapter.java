package com.navngo.igo.javaclient;

import android.media.AudioTrack;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class VietmapAudioTrackAdapter extends AndroidAudioTrackAdapter implements IFunctorCollection {
    private static final String logname = "VietmapAudioTrackAdapter";
    private static int mStreamType = 3;

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ void flush() {
        super.flush();
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ int getPlayState() {
        return super.getPlayState();
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ int getState() {
        return super.getState();
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ void play() {
        super.play();
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ void release() {
        super.release();
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ void stop() {
        super.stop();
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public /* bridge */ /* synthetic */ int write(byte[] bArr, int i, int i2) {
        return super.write(bArr, i, i2);
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AudioTrackFactory.getInstance().register("vietmap", VietmapAudioTrackAdapter.class);
        AndroidGo.getInstance().registerFunctor("android.vietmap.streamTypeChanged", this, "streamTypeChanged");
    }

    public void streamTypeChanged(int i) {
        mStreamType = i;
    }

    @Override // com.navngo.igo.javaclient.AndroidAudioTrackAdapter, com.navngo.igo.javaclient.IAudioTrackAdapter
    public void initFromFactory(int i, int i2, int i3, int i4, int i5, int i6) {
        DebugLogger.D3(logname, "Initalizing VietmapAudioTrackAdapter");
        this.track = new AudioTrack(mStreamType, i2, i3, i4, i5, i6);
    }
}
