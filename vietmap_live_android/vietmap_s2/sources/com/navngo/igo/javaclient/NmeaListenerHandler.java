package com.navngo.igo.javaclient;

import android.location.GpsStatus;
import android.location.LocationManager;
import android.location.OnNmeaMessageListener;
import android.os.Build;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class NmeaListenerHandler {
    private static final String logname = "NmeaListenerHandler";

    NmeaListenerHandler() {
    }

    private static Method getNmeaListenerMethod(String str) throws NoSuchMethodException {
        return LocationManager.class.getMethod(str, Build.VERSION.SDK_INT < 29 ? GpsStatus.NmeaListener.class : OnNmeaMessageListener.class);
    }

    public static boolean addNmeaListener(NmeaListenerImpl nmeaListenerImpl) {
        try {
            return ((Boolean) getNmeaListenerMethod("addNmeaListener").invoke(NmeaListenerImpl.getLocationManager(), nmeaListenerImpl)).booleanValue();
        } catch (Exception e) {
            DebugLogger.D3(logname, "Register nmea listener exception : " + e.getMessage());
            return false;
        }
    }

    public static void removeNmeaListener(NmeaListenerImpl nmeaListenerImpl) {
        try {
            getNmeaListenerMethod("removeNmeaListener").invoke(NmeaListenerImpl.getLocationManager(), nmeaListenerImpl);
        } catch (Exception e) {
            DebugLogger.D3(logname, "Remove nmea listener exception: " + e.getMessage());
        }
    }
}
