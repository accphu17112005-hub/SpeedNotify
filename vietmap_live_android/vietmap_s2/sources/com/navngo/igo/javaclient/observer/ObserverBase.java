package com.navngo.igo.javaclient.observer;

import android.content.ContentResolver;
import android.database.ContentObserver;
import android.net.Uri;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class ObserverBase extends ContentObserver implements IObserver {
    public abstract Uri getContentUri();

    @Override // android.database.ContentObserver
    public abstract void onChange(boolean z, Uri uri);

    public ObserverBase() {
        super(null);
        onChange(true);
    }

    @Override // com.navngo.igo.javaclient.observer.IObserver
    public void registerContentObserver(ContentResolver contentResolver) {
        contentResolver.registerContentObserver(getContentUri(), false, this);
    }

    @Override // com.navngo.igo.javaclient.observer.IObserver
    public void unregisterContentObserver(ContentResolver contentResolver) {
        contentResolver.unregisterContentObserver(this);
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z) {
        onChange(z, null);
    }
}
