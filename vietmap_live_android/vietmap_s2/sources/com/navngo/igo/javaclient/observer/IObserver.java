package com.navngo.igo.javaclient.observer;

import android.content.ContentResolver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface IObserver {
    void registerContentObserver(ContentResolver contentResolver);

    void unregisterContentObserver(ContentResolver contentResolver);
}
