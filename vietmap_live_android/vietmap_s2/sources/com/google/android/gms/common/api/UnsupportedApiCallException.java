package com.google.android.gms.common.api;

import com.google.android.gms.common.Feature;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class UnsupportedApiCallException extends UnsupportedOperationException {
    private final Feature zzar;

    public UnsupportedApiCallException(Feature feature) {
        this.zzar = feature;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        String strValueOf = String.valueOf(this.zzar);
        StringBuilder sb = new StringBuilder(String.valueOf(strValueOf).length() + 8);
        sb.append("Missing ");
        sb.append(strValueOf);
        return sb.toString();
    }
}
