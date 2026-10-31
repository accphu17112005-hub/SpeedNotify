package com.navngo.igo.javaclient.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class NetworkStatusReceiver extends BroadcastReceiver implements IReceiver {
    private static final String logname = "NetworkStatusReceiver";
    public static final NetworkStatusReceiver instance = new NetworkStatusReceiver();
    private static boolean registered = false;

    enum CONNECTION_TYPE {
        CONNECTION_TYPE_NONE,
        CONNECTION_TYPE_BLUETOOTH,
        CONNECTION_TYPE_CARRIER,
        CONNECTION_TYPE_WIFI
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public synchronized void register() {
        if (!registered) {
            Application.anApplication.registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
            registered = true;
            requestCurrentStatus();
            AndroidGo androidGo = AndroidGo.getInstance();
            androidGo.registerFunctor("android.network.requestCurrentStatus", this, "requestCurrentStatus");
            androidGo.registerFunctor("android.network.getCurrentStatus", this, "getCurrentStatus");
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public synchronized void unregister() {
        if (registered) {
            Application.anApplication.unregisterReceiver(this);
            registered = false;
        }
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        int currentStatusImpl = getCurrentStatusImpl(context);
        DebugLogger.D3(logname, "network staus changed: " + currentStatusImpl);
        AndroidGo.getInstance().callIgo("android.network.set_status", null, Integer.valueOf(currentStatusImpl));
    }

    public int getCurrentStatus() {
        return getCurrentStatusImpl(Application.anApplication.getApplicationContext());
    }

    public void requestCurrentStatus() {
        DebugLogger.D4(logname, "requestCurrentStatus");
        AndroidGo.getInstance().callIgo("android.network.set_status", null, Integer.valueOf(getCurrentStatus()));
    }

    private int getCurrentStatusImpl(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            DebugLogger.D3(logname, "getCurrentStatus: No active network");
            return CONNECTION_TYPE.CONNECTION_TYPE_NONE.ordinal();
        }
        DebugLogger.D5(logname, "getCurrentStatus, status=" + activeNetworkInfo.getState() + " type=" + activeNetworkInfo.getTypeName());
        if (activeNetworkInfo.getState() != NetworkInfo.State.CONNECTED) {
            return CONNECTION_TYPE.CONNECTION_TYPE_NONE.ordinal();
        }
        int type = activeNetworkInfo.getType();
        if (type == 0) {
            return CONNECTION_TYPE.CONNECTION_TYPE_CARRIER.ordinal();
        }
        if (type != 1 && type != 6) {
            if (type == 7) {
                return CONNECTION_TYPE.CONNECTION_TYPE_BLUETOOTH.ordinal();
            }
            if (type != 9) {
                return CONNECTION_TYPE.CONNECTION_TYPE_NONE.ordinal();
            }
        }
        return CONNECTION_TYPE.CONNECTION_TYPE_WIFI.ordinal();
    }
}
