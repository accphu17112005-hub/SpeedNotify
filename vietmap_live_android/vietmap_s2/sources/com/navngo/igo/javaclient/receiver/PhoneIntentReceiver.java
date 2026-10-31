package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ResumeHandler;
import com.navngo.igo.javaclient.permission.PermissionHandler;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PhoneIntentReceiver extends BroadcastReceiver implements IReceiver {
    private static final String logname = "PhoneIntentReceiver";
    private static final IntentFilter intentfilter = new IntentFilter("android.intent.action.PHONE_STATE");
    public static final PhoneIntentReceiver instance = new PhoneIntentReceiver();
    private static boolean registered = false;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        DebugLogger.D5(logname, "onReceive: " + intent);
        String state = getState(intent);
        if (state == null) {
            state = getState();
        }
        processState(state);
    }

    public static void processState(String str) {
        ResumeHandler.INSTANCE.setPhoneState(str);
    }

    private String getState(Intent intent) {
        Bundle extras = intent.getExtras();
        if (extras == null) {
            return null;
        }
        String string = extras.getString("state");
        return string == null ? "null" : string;
    }

    public static String getState() {
        if (Build.VERSION.SDK_INT >= 31 && !PermissionHandler.get().isPermissionGranted("android.permission.READ_PHONE_STATE")) {
            return "IDLE";
        }
        TelephonyManager telephonyManager = (TelephonyManager) Application.anApplication.getSystemService("phone");
        if (telephonyManager == null) {
            DebugLogger.D2(logname, "There is no TelephonyManager", null);
            return "IDLE";
        }
        int callState = telephonyManager.getCallState();
        return callState != 1 ? callState != 2 ? "IDLE" : "OFFHOOK" : "RINGING";
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
}
