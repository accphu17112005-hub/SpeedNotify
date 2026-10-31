package com.navngo.igo.javaclient;

import android.content.Context;
import android.content.Intent;
import com.navngo.igo.javaclient.address.AddressResolver;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.receiver.DynamicIntentReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class PapagoLocationReceiver extends DynamicIntentReceiver {
    final String logname = getClass().getSimpleName();

    @Override // com.navngo.igo.javaclient.receiver.CustomIntentReceiver
    protected boolean bringMainActivityInForeground() {
        return true;
    }

    @Override // com.navngo.igo.javaclient.receiver.CustomIntentReceiver
    protected void dispatchIntent(Context context, Intent intent) {
        intent.getIntExtra("KEY_TYPE", 0);
        intent.getStringExtra("POI_NAME");
        float floatExtra = intent.getFloatExtra("LAT", 0.0f);
        float floatExtra2 = intent.getFloatExtra("LON", 0.0f);
        intent.getIntExtra("DEV", 0);
        intent.getIntExtra("STYLE", 0);
        intent.getStringExtra("SOURCE_APP");
        AddressResolver.getResolver().calculateRouteToPosition(new GCoor(floatExtra, floatExtra2), true);
    }

    @Override // com.navngo.igo.javaclient.receiver.DynamicIntentReceiver
    protected String[] action() {
        return new String[]{"com.vietmap.S2OBU.javaclient.PAPAGO_BROADCAST_RECV"};
    }
}
