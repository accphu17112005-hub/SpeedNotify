package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zacf implements Runnable {
    private final /* synthetic */ zace zakj;

    zacf(zace zaceVar) {
        this.zakj = zaceVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zakj.zaki.zag(new ConnectionResult(4));
    }
}
