package com.google.android.gms.common.api.internal;

import android.app.Activity;
import android.content.Intent;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface LifecycleFragment {
    void addCallback(String str, LifecycleCallback lifecycleCallback);

    <T extends LifecycleCallback> T getCallbackOrNull(String str, Class<T> cls);

    Activity getLifecycleActivity();

    boolean isCreated();

    boolean isStarted();

    void startActivityForResult(Intent intent, int i);
}
