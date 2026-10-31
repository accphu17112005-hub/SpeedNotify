package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.navngo.igo.javaclient.Application;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class CustomIntentReceiver extends BroadcastReceiver {
    protected abstract boolean bringMainActivityInForeground();

    protected abstract void dispatchIntent(Context context, Intent intent);

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (bringMainActivityInForeground()) {
            Application.anApplication.startMainActivityInForeground();
        }
        dispatchIntent(context, intent);
    }
}
