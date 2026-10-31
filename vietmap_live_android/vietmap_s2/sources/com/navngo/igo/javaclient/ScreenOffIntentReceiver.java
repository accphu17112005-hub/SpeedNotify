package com.navngo.igo.javaclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.receiver.IReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ScreenOffIntentReceiver extends BroadcastReceiver implements IReceiver {
    private static final String logname = "ScreenOffIntentReceiver";
    public static final ScreenOffIntentReceiver instance = new ScreenOffIntentReceiver();
    private static boolean isRegistered = false;
    private static final IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_OFF");

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (isRegistered) {
            return;
        }
        DebugLogger.D3(logname, "Registering ScreenOffIntentReceiver");
        Application.anApplication.registerReceiver(this, intentFilter);
        isRegistered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (isRegistered) {
            Application.anApplication.unregisterReceiver(this);
            isRegistered = false;
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        DebugLogger.D5(logname, intent.toString());
        if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
            DebugLogger.D3(logname, "Exiting...");
            Application.exit(true);
        }
    }
}
