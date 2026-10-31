package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class SynctoolCommandReceiver extends BroadcastReceiver implements IReceiver {
    public static final String BROADCAST_INTENT_ACTION = "com.navngo.igo.synctoolcommand";
    public static final String BROADCAST_INTENT_CATEGORY = "android.intent.category.DEFAULT";
    public static final String BROADCAST_INTENT_COMMAND = "command";
    public static final int BROADCAST_INTENT_COMMAND_EXIT_IGO = 0;
    public static final int BROADCAST_INTENT_COMMAND_INVALID = -1;
    public static final int RESULT_HANDLED = 2;
    public static final SynctoolCommandReceiver instance = new SynctoolCommandReceiver();
    private static final IntentFilter intentfilter;
    private static final String logname = "SynctoolCommandReceiver";
    private static boolean registered;

    static {
        IntentFilter intentFilter = new IntentFilter();
        intentfilter = intentFilter;
        intentFilter.addAction(BROADCAST_INTENT_ACTION);
        intentFilter.addCategory("android.intent.category.DEFAULT");
        registered = false;
    }

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
        DebugLogger.D5(logname, intent.toString());
        if (intent.getIntExtra(BROADCAST_INTENT_COMMAND, -1) == 0) {
            setResultCode(2);
            setResultData(Config.packageName);
            exitfromIgo();
            return;
        }
        DebugLogger.D3(logname, "Unknown command from synctool. Command discarded.");
    }

    private void exitfromIgo() {
        DebugLogger.D3(logname, "Shutdown command from synctool. Exiting...");
        AndroidGo.getInstance().callUI("sc_DoExit", null, new Object[0]);
    }
}
