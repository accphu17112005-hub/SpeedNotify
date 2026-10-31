package com.google.android.gms.common.api.internal;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zaal implements Runnable {
    private final /* synthetic */ zaak zagi;

    zaal(zaak zaakVar) {
        this.zagi = zaakVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zagi.zaex.cancelAvailabilityErrorNotifications(this.zagi.mContext);
    }
}
