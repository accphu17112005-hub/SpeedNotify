package com.navngo.igo.javaclient.observer;

import android.net.Uri;
import android.text.format.DateFormat;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.androidgo.IgoModel;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class OSTimeFormatChangeObserver extends ObserverBase {
    public static final Integer TIME_FORMAT_ID_24H = 2;
    public static final Integer TIME_FORMAT_ID_12H = 6;
    public static final Uri CONTENT_URI = Uri.parse("content://settings/system/time_12_24");

    @Override // com.navngo.igo.javaclient.observer.ObserverBase, android.database.ContentObserver
    public void onChange(boolean z, Uri uri) {
        IgoModel.ROOT_MODEL.getIntModel("regional.timeformat").set(DateFormat.is24HourFormat(Application.anApplication.getApplicationContext()) ? TIME_FORMAT_ID_24H : TIME_FORMAT_ID_12H);
    }

    @Override // com.navngo.igo.javaclient.observer.ObserverBase
    public Uri getContentUri() {
        return CONTENT_URI;
    }
}
