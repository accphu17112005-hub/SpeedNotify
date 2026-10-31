package com.google.android.gms.common.api.internal;

import android.app.Dialog;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zao extends zabr {
    private final /* synthetic */ Dialog zadk;
    private final /* synthetic */ zan zadl;

    zao(zan zanVar, Dialog dialog) {
        this.zadl = zanVar;
        this.zadk = dialog;
    }

    @Override // com.google.android.gms.common.api.internal.zabr
    public final void zas() {
        this.zadl.zadj.zaq();
        if (this.zadk.isShowing()) {
            this.zadk.dismiss();
        }
    }
}
