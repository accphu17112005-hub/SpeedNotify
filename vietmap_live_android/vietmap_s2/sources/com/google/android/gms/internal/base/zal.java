package com.google.android.gms.internal.base;

import android.os.Handler;
import android.os.Looper;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class zal extends Handler {
    private static volatile zam zaro;

    public zal() {
    }

    public zal(Looper looper) {
        super(looper);
    }

    public zal(Looper looper, Handler.Callback callback) {
        super(looper, callback);
    }
}
