package com.navngo.igo.javaclient.gps;

import android.location.GpsSatellite;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import java.util.Iterator;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class GpsHacks {
    public static final double DOP_AVERAGE_VALUE = 3.0d;
    public static final double DOP_BAD_VALUE = 6.0d;
    private static final int NMEA_GPGGA_ACC = 8;
    private static final int NMEA_GPGGA_FIX = 6;
    private static final int NMEA_GPGGA_MINLEN = 10;
    private static boolean hasNmea = false;
    private static float ovrFlAccuracy = 0.0f;
    private static boolean ovrHasAccuracy = false;

    public static boolean getOvrHasAccuracy() {
        return ovrHasAccuracy;
    }

    public static float getOvrFlAccuracy() {
        return ovrFlAccuracy;
    }

    public static void overrideAccuracy(boolean z, float f, boolean z2) {
        if (z2) {
            if (!hasNmea) {
                DebugLogger.D3("accuracy_workaround", "NMEA works and sends GPGGA messages.");
            }
            hasNmea = true;
        }
        if (z2 || !hasNmea) {
            ovrHasAccuracy = z;
            ovrFlAccuracy = f;
        }
    }

    public static void guessAccuracy(Iterable<GpsSatellite> iterable) {
        float f;
        Iterator<GpsSatellite> it = iterable.iterator();
        int i = 0;
        while (it.hasNext()) {
            if (it.next().usedInFix()) {
                i++;
            }
        }
        boolean z = true;
        if (i >= 5) {
            f = 25.0f;
            if (i >= 6) {
                f = 5.0f;
            }
        } else {
            f = 0.0f;
            z = false;
        }
        overrideAccuracy(z, f, false);
    }

    public static boolean ovrAccuracyNmea(String str) {
        if (!str.startsWith("$GPGGA,")) {
            return false;
        }
        String[] strArrSplit = str.split(",");
        if (strArrSplit.length < 10) {
            DebugLogger.D3("accuracy_workaround", "Malformed NMEA message, $GPGAA has " + strArrSplit.length + " fields: " + str);
            return false;
        }
        boolean z = Integer.parseInt(strArrSplit[6]) != 0;
        overrideAccuracy(z, convertHdopToMeters(z ? Float.parseFloat(strArrSplit[8]) : 0.0f), true);
        return true;
    }

    public static float convertHdopToMeters(float f) {
        return (float) (((double) (f * Config.horizontal_accuracy_treshold)) / 6.0d);
    }
}
