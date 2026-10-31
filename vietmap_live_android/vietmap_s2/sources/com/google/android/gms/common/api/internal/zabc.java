package com.google.android.gms.common.api.internal;

import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zabc extends zabr {
    private WeakReference<zaaw> zahl;

    zabc(zaaw zaawVar) {
        this.zahl = new WeakReference<>(zaawVar);
    }

    @Override // com.google.android.gms.common.api.internal.zabr
    public final void zas() {
        zaaw zaawVar = this.zahl.get();
        if (zaawVar == null) {
            return;
        }
        zaawVar.resume();
    }
}
