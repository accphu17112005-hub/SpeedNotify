package com.google.android.gms.common.wrappers;

import android.content.Context;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Wrappers {
    private static Wrappers zzhx = new Wrappers();
    private PackageManagerWrapper zzhw = null;

    private final synchronized PackageManagerWrapper zzi(Context context) {
        if (this.zzhw == null) {
            if (context.getApplicationContext() != null) {
                context = context.getApplicationContext();
            }
            this.zzhw = new PackageManagerWrapper(context);
        }
        return this.zzhw;
    }

    public static PackageManagerWrapper packageManager(Context context) {
        return zzhx.zzi(context);
    }
}
