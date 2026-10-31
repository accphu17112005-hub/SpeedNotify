package com.navngo.igo.javaclient;

import android.content.Context;
import android.content.Intent;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.receiver.DynamicIntentReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class HudInitialiser extends DynamicIntentReceiver {
    @Override // com.navngo.igo.javaclient.receiver.CustomIntentReceiver
    protected boolean bringMainActivityInForeground() {
        return false;
    }

    @Override // com.navngo.igo.javaclient.receiver.DynamicIntentReceiver
    protected String[] action() {
        return new String[]{"com.vietmap.hud.HUD_INITIALIZED"};
    }

    @Override // com.navngo.igo.javaclient.receiver.CustomIntentReceiver
    protected void dispatchIntent(Context context, Intent intent) {
        AndroidGo.getInstance().callIgo("android.on_message_received", null, "{\"type\":\"guidance_provider\", \"command\":\"get_update\"}");
    }
}
