package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BringToFrontReceiver extends BroadcastReceiver implements IReceiver {
    public static final String BROADCAST_INTENT_ACTION = "com.nng.BRING_TO_FRONT";
    public static final String BROADCAST_INTENT_CATEGORY = "android.intent.category.DEFAULT";
    public static final int RESULT_HANDLED = 1;
    public static final int RESULT_NOT_HANDLED = 0;
    private static final IntentFilter mIntentfilter;
    private boolean mRegistered = false;

    private boolean isRunning() {
        return true;
    }

    static {
        IntentFilter intentFilter = new IntentFilter();
        mIntentfilter = intentFilter;
        intentFilter.addAction(BROADCAST_INTENT_ACTION);
        intentFilter.addCategory("android.intent.category.DEFAULT");
    }

    private IntentFilter getIntentFilter() {
        return mIntentfilter;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (getIntentFilter().matchAction(intent.getAction()) && isRunning()) {
            if (isOrderedBroadcast()) {
                setResultCode(1);
            }
            Application.anApplication.startMainActivityInForeground();
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (this.mRegistered) {
            return;
        }
        Application.anApplication.registerReceiver(this, getIntentFilter());
        this.mRegistered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (this.mRegistered) {
            Application.anApplication.unregisterReceiver(this);
            this.mRegistered = false;
        }
    }
}
