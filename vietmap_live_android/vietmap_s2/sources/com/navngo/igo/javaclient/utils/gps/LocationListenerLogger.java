package com.navngo.igo.javaclient.utils.gps;

import android.location.Location;
import android.os.Bundle;
import com.navngo.igo.javaclient.DebugLogger;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationListenerLogger {
    private static final String logname = "LocationListenerLogger";

    public static void onLocationChanged(Location location) {
    }

    public static void onProviderDisabled(String str) {
        DebugLogger.D4(logname, "LocationListener::onProviderDisabled(Provider = '" + str + "'");
    }

    public static void onProviderEnabled(String str) {
        DebugLogger.D4(logname, "LocationListener::onProviderEnabled(Provider = '" + str + "'");
    }

    public static void onStatusChanged(String str, int i, Bundle bundle) {
        DebugLogger.D4(logname, "LocationListener::onStatusChanged: Provider = " + str + " Status = " + i + logBundle(bundle));
    }

    protected static String logBundle(Bundle bundle) {
        if (bundle == null) {
            return " Bundle is null";
        }
        StringBuilder sb = new StringBuilder(1000);
        sb.append(" Bundle = [");
        boolean z = false;
        for (String str : bundle.keySet()) {
            sb.append("'" + str + "' => " + bundle.getSerializable(str));
            if (z) {
                sb.append(",");
            } else {
                z = true;
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
