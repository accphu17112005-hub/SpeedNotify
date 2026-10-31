package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PetzaCommandReceiver extends BroadcastReceiver implements IReceiver {
    public static final String ACTION_PETZA_COMMAND = "com.navngo.igo.javaclient.PETZA_COMMANDER";
    public static final String EXTRA_COMMAND = "com.navngo.igo.javaclient.COMMAND";
    public static final String PETZA_SAVE = "save";
    public static final String PETZA_START = "start";
    public static final String PETZA_STOP = "stop";
    public static final String PETZA_STOP_SAVE = "stop-save";
    private static final String logname = "PetzaCommandReceiver";
    private static final PetzaCommandReceiver mInstance = new PetzaCommandReceiver();
    private static boolean mIsRegistered = false;

    public static PetzaCommandReceiver getInstance() {
        return mInstance;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (mIsRegistered) {
            return;
        }
        Application.anApplication.registerReceiver(this, new IntentFilter(ACTION_PETZA_COMMAND));
        mIsRegistered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (mIsRegistered) {
            Application.anApplication.unregisterReceiver(this);
            mIsRegistered = false;
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        DebugLogger.D5(logname, "PetzaCommandReceiver.onReceive()");
        if (intent.hasExtra(EXTRA_COMMAND)) {
            String stringExtra = intent.getStringExtra(EXTRA_COMMAND);
            if (stringExtra.equals(PETZA_START)) {
                DebugLogger.D3(logname, "PetzaCommandReceiver.onReceive() : calling start_petzalog()");
                AndroidGo.getInstance().callIgo("other.igo_primo.start_petzalog", null, new Object[0]);
                return;
            }
            if (stringExtra.equals(PETZA_STOP)) {
                DebugLogger.D3(logname, "PetzaCommandReceiver.onReceive() : calling stop_petzalog()");
                AndroidGo.getInstance().callIgo("other.igo_primo.stop_petzalog", null, new Object[0]);
            } else if (stringExtra.equals(PETZA_SAVE)) {
                DebugLogger.D3(logname, "PetzaCommandReceiver.onReceive() : calling save_petzalog()");
                AndroidGo.getInstance().callIgo("other.igo_primo.save_petzalog", null, new Object[0]);
            } else {
                if (stringExtra.equals(PETZA_STOP_SAVE)) {
                    DebugLogger.D3(logname, "PetzaCommandReceiver.onReceive() : calling stop_petzalog() and save_petzalog()");
                    AndroidGo.getInstance().callIgo("other.igo_primo.stop_petzalog", null, new Object[0]);
                    AndroidGo.getInstance().callIgo("other.igo_primo.save_petzalog", null, new Object[0]);
                    return;
                }
                DebugLogger.D3(logname, "PetzaCommandReceiver.onReceive() : Undefined action!");
            }
        }
    }
}
