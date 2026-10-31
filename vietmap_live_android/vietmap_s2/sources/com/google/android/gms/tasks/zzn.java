package com.google.android.gms.tasks;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzn implements Runnable {
    private final /* synthetic */ Task zzg;
    private final /* synthetic */ zzm zzq;

    zzn(zzm zzmVar, Task task) {
        this.zzq = zzmVar;
        this.zzg = task;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zzq.mLock) {
            if (this.zzq.zzp != null) {
                this.zzq.zzp.onSuccess(this.zzg.getResult());
            }
        }
    }
}
