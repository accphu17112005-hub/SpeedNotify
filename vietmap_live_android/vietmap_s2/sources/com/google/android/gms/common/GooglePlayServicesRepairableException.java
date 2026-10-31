package com.google.android.gms.common;

import android.content.Intent;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GooglePlayServicesRepairableException extends UserRecoverableException {
    private final int zzaf;

    public GooglePlayServicesRepairableException(int i, String str, Intent intent) {
        super(str, intent);
        this.zzaf = i;
    }

    public int getConnectionStatusCode() {
        return this.zzaf;
    }
}
