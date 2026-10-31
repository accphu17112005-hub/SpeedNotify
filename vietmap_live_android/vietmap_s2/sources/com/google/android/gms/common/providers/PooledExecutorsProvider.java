package com.google.android.gms.common.providers;

import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PooledExecutorsProvider {
    private static PooledExecutorFactory zzey;

    public interface PooledExecutorFactory {
        ScheduledExecutorService newSingleThreadScheduledExecutor();
    }

    public static synchronized PooledExecutorFactory getInstance() {
        if (zzey == null) {
            zzey = new zza();
        }
        return zzey;
    }

    private PooledExecutorsProvider() {
    }
}
