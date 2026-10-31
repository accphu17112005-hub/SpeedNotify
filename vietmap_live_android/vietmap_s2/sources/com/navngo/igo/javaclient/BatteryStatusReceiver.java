package com.navngo.igo.javaclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import androidx.core.app.NotificationCompat;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.receiver.IReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BatteryStatusReceiver extends BroadcastReceiver implements IReceiver {
    private static final String logname = "PowerConnectionReceiver";
    public static final BatteryStatusReceiver INSTANCE = new BatteryStatusReceiver();
    private static boolean registered = false;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        DebugLogger.D4(logname, intent.getAction());
        boolean z = true;
        int intExtra = intent.getIntExtra(NotificationCompat.CATEGORY_STATUS, 1);
        boolean z2 = intExtra == 2 || intExtra == 5;
        int intExtra2 = intent.getIntExtra("plugged", -1);
        boolean z3 = intExtra2 == 2;
        boolean z4 = intExtra2 == 1;
        int intExtra3 = (intent.getIntExtra("level", -1) * 100) / intent.getIntExtra("scale", -1);
        AndroidGo androidGo = AndroidGo.getInstance();
        Object[] objArr = new Object[3];
        objArr[0] = Integer.valueOf(intExtra3);
        objArr[1] = Boolean.valueOf(z2);
        if (!z3 && !z4) {
            z = false;
        }
        objArr[2] = Boolean.valueOf(z);
        androidGo.callIgo("android.battery_status_changed", null, objArr);
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (registered) {
            return;
        }
        Application.anApplication.registerReceiver(this, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        registered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (registered) {
            Application.anApplication.unregisterReceiver(this);
            registered = false;
        }
    }
}
