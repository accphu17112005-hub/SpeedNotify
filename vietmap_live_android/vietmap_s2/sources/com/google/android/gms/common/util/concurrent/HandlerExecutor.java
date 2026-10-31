package com.google.android.gms.common.util.concurrent;

import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.internal.common.zze;
import java.util.concurrent.Executor;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class HandlerExecutor implements Executor {
    private final Handler handler;

    public HandlerExecutor(Looper looper) {
        this.handler = new zze(looper);
    }

    @Override // java.util.concurrent.Executor
    public void execute(Runnable runnable) {
        this.handler.post(runnable);
    }
}
