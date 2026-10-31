package com.google.android.gms.tasks;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzl implements Runnable {
    private final /* synthetic */ Task zzg;
    private final /* synthetic */ zzk zzo;

    zzl(zzk zzkVar, Task task) {
        this.zzo = zzkVar;
        this.zzg = task;
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this.zzo.mLock) {
            if (this.zzo.zzn != null) {
                this.zzo.zzn.onFailure(this.zzg.getException());
            }
        }
    }
}
