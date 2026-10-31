package com.google.android.gms.tasks;

import java.util.concurrent.Executor;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzg<TResult> implements zzq<TResult> {
    private final Object mLock = new Object();
    private final Executor zzd;
    private OnCanceledListener zzj;

    public zzg(Executor executor, OnCanceledListener onCanceledListener) {
        this.zzd = executor;
        this.zzj = onCanceledListener;
    }

    @Override // com.google.android.gms.tasks.zzq
    public final void onComplete(Task task) {
        if (task.isCanceled()) {
            synchronized (this.mLock) {
                if (this.zzj == null) {
                    return;
                }
                this.zzd.execute(new zzh(this));
            }
        }
    }

    @Override // com.google.android.gms.tasks.zzq
    public final void cancel() {
        synchronized (this.mLock) {
            this.zzj = null;
        }
    }
}
