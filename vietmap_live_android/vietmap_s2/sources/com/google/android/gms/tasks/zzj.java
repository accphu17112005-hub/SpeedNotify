package com.google.android.gms.tasks;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzj implements Runnable {
    private final /* synthetic */ Task zzg;
    private final /* synthetic */ zzi zzm;

    zzj(zzi zziVar, Task task) {
        this.zzm = zziVar;
        this.zzg = task;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zzm.mLock) {
            if (this.zzm.zzl != null) {
                this.zzm.zzl.onComplete(this.zzg);
            }
        }
    }
}
