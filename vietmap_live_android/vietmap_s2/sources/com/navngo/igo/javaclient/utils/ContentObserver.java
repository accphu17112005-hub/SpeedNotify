package com.navngo.igo.javaclient.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class ContentObserver extends android.database.ContentObserver {
    private ContentResolver content_resolver;
    private Uri content_uri;
    private boolean registered;

    @Override // android.database.ContentObserver
    public boolean deliverSelfNotifications() {
        return false;
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z, Uri uri) {
    }

    public ContentObserver(Context context, Handler handler, Uri uri) {
        super(handler);
        this.content_resolver = context.getContentResolver();
        this.content_uri = uri;
        this.registered = false;
    }

    public synchronized void register() {
        if (this.registered) {
            return;
        }
        this.content_resolver.registerContentObserver(this.content_uri, false, this);
        this.registered = true;
    }

    public synchronized void unregister() {
        if (this.registered) {
            this.content_resolver.unregisterContentObserver(this);
            this.registered = false;
        }
    }

    @Override // android.database.ContentObserver
    public void onChange(boolean z) {
        onChange(z, null);
    }
}
