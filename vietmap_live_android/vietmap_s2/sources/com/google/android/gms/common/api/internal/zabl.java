package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.internal.GoogleApiManager;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zabl implements Runnable {
    private final /* synthetic */ GoogleApiManager.zaa zaix;
    private final /* synthetic */ ConnectionResult zaiy;

    zabl(GoogleApiManager.zaa zaaVar, ConnectionResult connectionResult) {
        this.zaix = zaaVar;
        this.zaiy = connectionResult;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zaix.onConnectionFailed(this.zaiy);
    }
}
