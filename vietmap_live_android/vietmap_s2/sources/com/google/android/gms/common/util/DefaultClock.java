package com.google.android.gms.common.util;

import android.os.SystemClock;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class DefaultClock implements Clock {
    private static final DefaultClock zzgk = new DefaultClock();

    public static Clock getInstance() {
        return zzgk;
    }

    @Override // com.google.android.gms.common.util.Clock
    public long currentTimeMillis() {
        return System.currentTimeMillis();
    }

    @Override // com.google.android.gms.common.util.Clock
    public long elapsedRealtime() {
        return SystemClock.elapsedRealtime();
    }

    @Override // com.google.android.gms.common.util.Clock
    public long nanoTime() {
        return System.nanoTime();
    }

    @Override // com.google.android.gms.common.util.Clock
    public long currentThreadTimeMillis() {
        return SystemClock.currentThreadTimeMillis();
    }

    private DefaultClock() {
    }
}
