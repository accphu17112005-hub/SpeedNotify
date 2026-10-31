package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ServerRunner;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class TimeReceiver extends BroadcastReceiver implements IReceiver {
    private static final String logname = "TimeReceiver";
    public static final TimeReceiver instance = new TimeReceiver();
    private static final IntentFilter intentfilter = new IntentFilter("android.intent.action.TIME_SET");
    private static boolean registered = false;

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public synchronized void register() {
        if (!registered) {
            Application.anApplication.registerReceiver(this, intentfilter);
            registered = true;
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public synchronized void unregister() {
        if (registered) {
            Application.anApplication.unregisterReceiver(this);
            registered = false;
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        DebugLogger.D4(logname, intent.toString());
        if (intent.getAction().equals("android.intent.action.TIME_SET")) {
            ServerRunner.requestTimeChange();
        }
    }
}
