package com.google.android.gms.common.api.internal;

import android.app.Activity;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class ActivityLifecycleObserver {
    public abstract ActivityLifecycleObserver onStopCallOnce(Runnable runnable);

    public static final ActivityLifecycleObserver of(Activity activity) {
        return new zaa(activity);
    }
}
