package com.google.android.gms.common.api.internal;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zabn implements Runnable {
    private final /* synthetic */ zabm zaiz;

    zabn(zabm zabmVar) {
        this.zaiz = zabmVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.zaiz.zaix.zain.disconnect();
    }
}
