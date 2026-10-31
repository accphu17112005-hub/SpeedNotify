package com.google.android.gms.common.util.concurrent;

import android.os.Process;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zza implements Runnable {
    private final int priority;
    private final Runnable zzhs;

    public zza(Runnable runnable, int i) {
        this.zzhs = runnable;
        this.priority = i;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Process.setThreadPriority(this.priority);
        this.zzhs.run();
    }
}
