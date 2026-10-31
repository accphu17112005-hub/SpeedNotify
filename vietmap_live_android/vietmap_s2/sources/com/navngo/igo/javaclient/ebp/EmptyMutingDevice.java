package com.navngo.igo.javaclient.ebp;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class EmptyMutingDevice extends MutingDeviceBase implements IMutingDevice {
    @Override // com.navngo.igo.javaclient.ebp.MutingDeviceBase, com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Close() {
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Mute(int i, int i2, int i3) {
        AudiofocusChanged(0, i);
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Unmute() {
        AudiofocusChanged(1, 0);
    }
}
