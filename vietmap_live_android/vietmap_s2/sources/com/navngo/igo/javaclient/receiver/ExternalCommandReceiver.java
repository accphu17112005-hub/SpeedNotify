package com.navngo.igo.javaclient.receiver;

import android.content.Context;
import android.content.Intent;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ExternalCommandReceiver extends DynamicIntentReceiver {
    private static final String logname = "ExternalCommandReceiver";

    @Override // com.navngo.igo.javaclient.receiver.CustomIntentReceiver
    protected boolean bringMainActivityInForeground() {
        return false;
    }

    @Override // com.navngo.igo.javaclient.receiver.DynamicIntentReceiver
    protected String[] action() {
        return new String[]{"com.nng.igo.EXTERNAL_COMMAND"};
    }

    @Override // com.navngo.igo.javaclient.receiver.CustomIntentReceiver
    protected void dispatchIntent(Context context, Intent intent) {
        String stringExtra = intent.getStringExtra(SynctoolCommandReceiver.BROADCAST_INTENT_COMMAND);
        if (stringExtra == null || stringExtra.length() == 0) {
            DebugLogger.D2(logname, "Command ignored due to insufficient extra");
        } else {
            AndroidGo.getInstance().callIgo("android.on_message_received", null, stringExtra);
        }
    }
}
