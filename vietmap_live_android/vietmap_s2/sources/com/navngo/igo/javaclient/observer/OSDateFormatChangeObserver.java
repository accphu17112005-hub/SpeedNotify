package com.navngo.igo.javaclient.observer;

import android.content.Context;
import android.net.Uri;
import android.provider.Settings;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.androidgo.IgoModel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class OSDateFormatChangeObserver extends ObserverBase {
    public static final Uri CONTENT_URI = Uri.parse("content://settings/system/date_format");

    @Override // com.navngo.igo.javaclient.observer.ObserverBase
    public Uri getContentUri() {
        return CONTENT_URI;
    }

    @Override // com.navngo.igo.javaclient.observer.ObserverBase, android.database.ContentObserver
    public void onChange(boolean z, Uri uri) {
        IgoModel.ROOT_MODEL.getIntModel("regional.dateformat").set(Integer.valueOf(getCurrentDateFormatAsIGOCode()));
    }

    public int getCurrentDateFormatAsIGOCode() {
        int i = 0;
        try {
            Context applicationContext = Application.anApplication.getApplicationContext();
            String pattern = ((SimpleDateFormat) DateFormat.getDateInstance(3, applicationContext.getResources().getConfiguration().locale)).toPattern();
            String lowerCase = Settings.System.getString(applicationContext.getContentResolver(), "date_format").toLowerCase(Locale.ROOT);
            if (pattern.indexOf("-") >= 0) {
                if (!lowerCase.startsWith("y") || lowerCase.indexOf("m") >= lowerCase.indexOf("d")) {
                    if (lowerCase.startsWith("y") && lowerCase.indexOf("m") > lowerCase.indexOf("d")) {
                        i = 3;
                    } else if (lowerCase.startsWith("d")) {
                        i = 6;
                    } else if (lowerCase.startsWith("m")) {
                        i = 9;
                    }
                }
            } else if (pattern.indexOf("/") >= 0) {
                if (lowerCase.startsWith("y") && lowerCase.indexOf("m") < lowerCase.indexOf("d")) {
                    i = 2;
                } else if (lowerCase.startsWith("y") && lowerCase.indexOf("m") > lowerCase.indexOf("d")) {
                    i = 5;
                } else if (lowerCase.startsWith("d")) {
                    i = 8;
                } else if (lowerCase.startsWith("m")) {
                    i = 11;
                }
            } else if (pattern.indexOf(".") >= 0) {
                if (lowerCase.startsWith("y") && lowerCase.indexOf("m") < lowerCase.indexOf("d")) {
                    i = 1;
                } else if (lowerCase.startsWith("y") && lowerCase.indexOf("m") > lowerCase.indexOf("d")) {
                    i = 4;
                } else if (lowerCase.startsWith("d")) {
                    i = 7;
                } else if (lowerCase.startsWith("m")) {
                    i = 10;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
