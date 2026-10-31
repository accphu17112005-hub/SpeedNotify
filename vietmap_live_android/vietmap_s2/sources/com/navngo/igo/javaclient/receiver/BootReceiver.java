package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ServerRunner;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BootReceiver extends BroadcastReceiver {
    private static final String logname = "BootReceiver";

    /* JADX WARN: Type inference failed for: r3v7, types: [com.navngo.igo.javaclient.receiver.BootReceiver$1] */
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) throws Throwable {
        String str = logname;
        DebugLogger.D5(logname, "onReceive");
        Application.anApplication.setApplicationContext(context.getApplicationContext());
        Application.setBootTime(SystemClock.elapsedRealtime());
        if (Config.getBool("android", "start_on_boot", false)) {
            Application.anApplication.Initialize();
            new Thread(str) { // from class: com.navngo.igo.javaclient.receiver.BootReceiver.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    Config.reload(2);
                    if (!Application.checkForSDCard(false)) {
                        try {
                            Thread.sleep(Config.getInt("android", "wait_for_sdcard_on_boot", Config.def_wait_for_sdcard_on_boot));
                        } catch (InterruptedException unused) {
                        }
                    }
                    Application.reInit();
                    if (Application.checkForSDCard(false)) {
                        Application.serviceRunner.startServices(true);
                        ServerRunner.startServerAfterMediaScan(!Config.getBool("gps", "background_navigation", Config.def_background_navigation));
                    }
                }
            }.start();
        } else {
            DebugLogger.D3(logname, "start_on_boot is disabled in sys.txt");
        }
        DebugLogger.D5(logname, "onReceive completed");
    }
}
