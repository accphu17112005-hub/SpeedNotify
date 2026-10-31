package com.navngo.igo.javaclient;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface IAudioTrackAdapter {
    void flush();

    int getPlayState();

    int getState();

    void initFromFactory(int i, int i2, int i3, int i4, int i5, int i6);

    void play();

    void release();

    void stop();

    int write(byte[] bArr, int i, int i2);
}
