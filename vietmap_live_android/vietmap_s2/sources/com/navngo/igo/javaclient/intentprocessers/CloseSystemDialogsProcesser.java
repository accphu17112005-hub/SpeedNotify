package com.navngo.igo.javaclient.intentprocessers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.IgoActivity;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.receiver.IReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CloseSystemDialogsProcesser extends BroadcastReceiver implements IReceiver {
    private static final String TAG = "CloseSystemDialogsProcesser";
    public static final CloseSystemDialogsProcesser instance = new CloseSystemDialogsProcesser();
    private boolean mRegistered = false;

    private CloseSystemDialogsProcesser() {
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (this.mRegistered) {
            return;
        }
        DebugLogger.D3(TAG, "registering broadcast receiver");
        Application.anApplication.registerReceiver(this, new IntentFilter("android.intent.action.CLOSE_SYSTEM_DIALOGS"));
        this.mRegistered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (this.mRegistered) {
            DebugLogger.D3(TAG, "unregistering broadcast receiver");
            Application.anApplication.unregisterReceiver(this);
            this.mRegistered = false;
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals("android.intent.action.CLOSE_SYSTEM_DIALOGS")) {
            if (!intent.getBooleanExtra(IgoActivity.EXTRA_IS_INTERNAL_EVENT, false)) {
                DebugLogger.D3(TAG, "Handling android.intent.action.CLOSE_SYSTEM_DIALOGS");
                AndroidGo.getInstance().callUI("sc_longBack", null, new Object[0]);
                return;
            } else {
                DebugLogger.D3(TAG, "Ignoring internal android.intent.action.CLOSE_SYSTEM_DIALOGS");
                return;
            }
        }
        DebugLogger.D2(TAG, "Unhandled intent: " + intent);
    }
}
