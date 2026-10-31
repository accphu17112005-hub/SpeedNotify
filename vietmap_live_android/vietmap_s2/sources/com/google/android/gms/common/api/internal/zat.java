package com.google.android.gms.common.api.internal;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zat implements Runnable {
    private final /* synthetic */ zas zaep;

    zat(zas zasVar) {
        this.zaep = zasVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zaep.zaen.lock();
        try {
            this.zaep.zax();
        } finally {
            this.zaep.zaen.unlock();
        }
    }
}
