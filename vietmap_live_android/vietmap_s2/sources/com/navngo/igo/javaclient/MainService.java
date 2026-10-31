package com.navngo.igo.javaclient;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import com.navngo.igo.javaclient.utils.NotificationCreator;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class MainService extends Service {
    private static final String logname = "MainService";
    public static final String showNotificationKey = "startForeground";
    private boolean mIsRunningForeground = false;

    public void registerInterfaces() {
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        DebugLogger.D5(logname, "onBind");
        return null;
    }

    @Override // android.app.Service
    public void onCreate() throws Throwable {
        DebugLogger.D5(logname, "onCreate");
        super.onCreate();
        Application.anApplication.setApplicationContext(this);
        Application.setMainService(this);
    }

    @Override // android.app.Service
    public void onDestroy() {
        Application.setMainService(null);
        DebugLogger.D5(logname, "onDestroy");
        super.onDestroy();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent == null) {
            DebugLogger.D5(logname, "onStartCommand(null, " + i2 + ")");
            return 1;
        }
        DebugLogger.D5(logname, "onStartCommand");
        showNotification(intent.getBooleanExtra(showNotificationKey, false));
        return 1;
    }

    private void showNotification(boolean z) {
        if (this.mIsRunningForeground != z) {
            this.mIsRunningForeground = z;
            if (z) {
                startForeground(2, NotificationCreator.createForegroundNotification(Application.anApplication.getApplicationContext()));
            } else {
                DebugLogger.D5(logname, "stopForeground");
                stopForeground(true);
            }
        }
    }

    @Override // android.app.Service
    public void onTaskRemoved(Intent intent) {
        DebugLogger.D3(logname, "Killed from recent apps");
        Application.blockWhileExit(true);
        super.onTaskRemoved(intent);
    }
}
