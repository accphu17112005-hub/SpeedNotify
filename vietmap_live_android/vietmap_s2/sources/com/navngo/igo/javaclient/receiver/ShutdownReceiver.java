package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ShutdownReceiver extends BroadcastReceiver implements IReceiver {
    public static final String SelfInitiatedShutdown = "com.navngo.igo.javaclient.receiver.ShutdownReceiver.SELF_INITIATED_SHUTDOWN";
    private static final String mAction = "android.intent.action.ACTION_SHUTDOWN";
    private static boolean mRegistered = false;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals(mAction) || intent.getAction().equals(SelfInitiatedShutdown)) {
            Application.blockWhileExit(true);
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (mRegistered) {
            return;
        }
        IntentFilter intentFilter = new IntentFilter(mAction);
        intentFilter.addAction(SelfInitiatedShutdown);
        Application.anApplication.registerReceiver(this, intentFilter);
        mRegistered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (mRegistered) {
            Application.anApplication.unregisterReceiver(this);
            mRegistered = false;
        }
    }
}
