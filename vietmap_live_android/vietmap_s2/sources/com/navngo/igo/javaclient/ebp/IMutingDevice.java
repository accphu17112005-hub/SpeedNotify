package com.navngo.igo.javaclient.ebp;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface IMutingDevice {
    public static final int MUTED = 0;
    public static final int MUTE_FAILED = 2;
    public static final int UNMUTED = 1;

    void Close();

    void Mute(int i, int i2, int i3);

    void OnAudioFocusLoss();

    void Unmute();
}
