package com.google.android.gms.tasks;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CancellationTokenSource {
    private final zza zzc = new zza();

    public CancellationToken getToken() {
        return this.zzc;
    }

    public void cancel() {
        this.zzc.cancel();
    }
}
