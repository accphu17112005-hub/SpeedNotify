package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.SystemClock;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.IgoActivity;
import com.navngo.igo.javaclient.ServerRunner;
import java.io.File;
import java.io.IOException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class MediaReceiver extends BroadcastReceiver implements IReceiver {
    public static final MediaReceiver instance = new MediaReceiver();
    private static final String logname = "MediaReceiver";

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        IntentFilter intentFilter = new IntentFilter("android.intent.action.MEDIA_BAD_REMOVAL");
        intentFilter.addAction("android.intent.action.MEDIA_EJECT");
        intentFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        Application.anApplication.registerReceiver(this, intentFilter);
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        Application.anApplication.unregisterReceiver(this);
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) throws Throwable {
        DebugLogger.D5(logname, intent.toString());
        String action = intent.getAction();
        String encodedPath = intent.getData().getEncodedPath();
        Application.anApplication.setApplicationContext(context.getApplicationContext());
        if (encodedPath != null && Config.sdcardDir != null) {
            try {
                if (!new File(Config.sdcardDir).getCanonicalPath().startsWith(new File(encodedPath).getCanonicalPath())) {
                    DebugLogger.D3(logname, "Irrelevant media, intent discarded. Received path='" + encodedPath + "' own path='" + Config.sdcardDir + "'.");
                    return;
                }
            } catch (IOException unused) {
                DebugLogger.D3(logname, "IOException caught while checking intent.");
            }
        }
        if (action.equals("android.intent.action.MEDIA_EJECT") || action.equals("android.intent.action.MEDIA_BAD_REMOVAL")) {
            DebugLogger.D3(logname, "SD card was removed. Exiting.");
            Application.exit(true);
            return;
        }
        if (action.equals("android.intent.action.MEDIA_MOUNTED")) {
            Application.anApplication.Initialize();
            Config.reload(4);
            if (Application.checkForSDCard(false)) {
                long bootTime = Application.getBootTime();
                if (bootTime != -1 && bootTime + ((long) Config.getInt("android", "wait_for_sdcard_on_boot", Config.def_wait_for_sdcard_on_boot)) > SystemClock.elapsedRealtime()) {
                    if (Config.getBool("android", "start_on_boot", false)) {
                        DebugLogger.D3(logname, "starting in background");
                        ServerRunner.startServerAfterMediaScan(true);
                        return;
                    } else {
                        DebugLogger.D3(logname, "start_on_boot is disabled");
                        return;
                    }
                }
                if (Config.getBool("android", "start_on_insert_sdcard", true)) {
                    DebugLogger.D3(logname, "starting in foreground");
                    IgoActivity.startInForeground(0);
                    return;
                } else {
                    DebugLogger.D3(logname, "start_on_insert_sdcard is disabled");
                    return;
                }
            }
            return;
        }
        if (action.equals("android.intent.action.MEDIA_SCANNER_STARTED")) {
            Application.setMediaScanning(true);
        } else if (action.equals("android.intent.action.MEDIA_SCANNER_FINISHED")) {
            Application.setMediaScanning(false);
        }
    }
}
