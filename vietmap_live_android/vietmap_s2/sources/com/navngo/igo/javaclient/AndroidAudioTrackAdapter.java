package com.navngo.igo.javaclient;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioTrack;
import android.os.Build;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class AndroidAudioTrackAdapter implements IAudioTrackAdapter {
    private static final String logname = "AndroidAudioTrackAdapter";
    protected AudioTrack track;

    AndroidAudioTrackAdapter() {
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public void initFromFactory(int i, int i2, int i3, int i4, int i5, int i6) {
        if (Build.VERSION.SDK_INT >= 23) {
            DebugLogger.D3(logname, "Initalizing AndroidAudioTrackAdapter with builder");
            this.track = new AudioTrack.Builder().setAudioAttributes(new AudioAttributes.Builder().setUsage(Config.navigation_audio_usage).setContentType(Config.navigation_audio_content_type).build()).setAudioFormat(new AudioFormat.Builder().setEncoding(i4).setSampleRate(i2).setChannelMask(i3).build()).setBufferSizeInBytes(i5).setTransferMode(i6).build();
        } else {
            DebugLogger.D3(logname, "Initalizing AndroidAudioTrackAdapter");
            this.track = new AudioTrack(i, i2, i3, i4, i5, i6);
        }
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public void play() {
        if (this.track.getPlayState() != 3) {
            this.track.play();
        }
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public void stop() {
        if (this.track.getPlayState() == 3) {
            this.track.stop();
        }
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public void flush() {
        this.track.flush();
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public int write(byte[] bArr, int i, int i2) {
        return this.track.write(bArr, i, i2);
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public int getPlayState() {
        return this.track.getPlayState();
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public int getState() {
        return this.track.getState();
    }

    @Override // com.navngo.igo.javaclient.IAudioTrackAdapter
    public void release() {
        this.track.release();
    }
}
