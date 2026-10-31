package com.navngo.igo.javaclient;

import android.location.GpsStatus;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import com.navngo.igo.javaclient.utils.gps.LocationListenerLogPlayer;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class LocationListenerImpl implements LocationListener {
    private static int getGpsMinTime = Config.getInt("gps", "gps_min_time", Config.getGpsMinTime);
    private static LocationListener gpsListener = null;
    private static boolean gpsListener_registered = false;
    private static LocationListenerLogPlayer gpsLogPlayer = null;
    private static final String logname = "LocationListenerImpl";
    private static LocationListener netListener = null;
    private static boolean netListener_registered = false;
    private static GpsStatus.Listener statusListener;
    private final String name;

    public LocationListenerImpl(String str) {
        this.name = str;
    }

    public static boolean isListening() {
        return (!Config.location_net || netListener_registered) && (!Config.location_gps || gpsListener_registered);
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        if (Config.location_log) {
            DebugLogger.D5(logname, this.name + ":onLocationChanged " + new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.US).format(new Date(location.getTime())) + " : " + location);
        }
        ServerRunner.onLocationChanged(location);
        ResumeHandler.INSTANCE.onLocationChanged(location);
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String str) {
        DebugLogger.D4(logname, this.name + ":" + str + " provider disabled");
        if (str.equals("gps")) {
            ServerRunner.wantGpsStatus(3);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String str) {
        DebugLogger.D4(logname, this.name + ":" + str + " provider enabled");
        if (str.equals("gps")) {
            ServerRunner.wantGpsStatus(4);
        }
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String str, int i, Bundle bundle) {
        if (Config.location_log) {
            DebugLogger.D5(logname, this.name + ":" + str + " status changed:" + i + " extras: " + bundle);
        }
        if (str.equals("gps")) {
            if (i == 0) {
                Application.clearSatellites();
                ServerRunner.wantGpsStatus(0);
            } else if (i == 2) {
                ServerRunner.wantGpsStatus(1);
            } else {
                Application.clearSatellites();
                ServerRunner.wantGpsStatus(2);
            }
        }
    }

    public static void setLocationListener(final boolean z) {
        DebugLogger.D4(logname, "setLocationListener: " + z);
        if (Config.location_gps || Config.location_net) {
            ServerRunner.runOnHandlerThread(new Runnable() { // from class: com.navngo.igo.javaclient.LocationListenerImpl.1
                @Override // java.lang.Runnable
                public void run() {
                    LocationListenerImpl.setLocationListenerBody(z);
                }
            });
        }
    }

    static boolean p_gps_enabled() {
        if (!Config.location_gps) {
            return false;
        }
        try {
            return getLocationManager().isProviderEnabled("gps");
        } catch (Exception e) {
            DebugLogger.D1(logname, "p_gps_enabled: ", e);
            return false;
        }
    }

    static boolean p_net_enabled() {
        if (!Config.location_net) {
            return false;
        }
        try {
            return getLocationManager().isProviderEnabled("network");
        } catch (Exception e) {
            DebugLogger.D1(logname, "p_net_enabled: ", e);
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x0113 A[Catch: Exception -> 0x01c5, TryCatch #3 {Exception -> 0x01c5, blocks: (B:27:0x0061, B:29:0x006a, B:30:0x0080, B:33:0x008f, B:35:0x0093, B:41:0x009f, B:42:0x00e3, B:47:0x0107, B:49:0x0113, B:51:0x0119, B:54:0x0121, B:56:0x0125, B:58:0x0129, B:60:0x013b, B:61:0x0144, B:71:0x015f, B:73:0x016d, B:75:0x0173, B:77:0x017a, B:79:0x017e, B:81:0x0182, B:83:0x0186, B:85:0x0191, B:86:0x0198, B:91:0x01ae, B:93:0x01b7, B:95:0x01bf, B:90:0x01ab, B:70:0x015c, B:45:0x00ee, B:37:0x0097, B:39:0x009b, B:87:0x019d), top: B:119:0x005f, inners: #0, #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0119 A[Catch: Exception -> 0x01c5, TRY_LEAVE, TryCatch #3 {Exception -> 0x01c5, blocks: (B:27:0x0061, B:29:0x006a, B:30:0x0080, B:33:0x008f, B:35:0x0093, B:41:0x009f, B:42:0x00e3, B:47:0x0107, B:49:0x0113, B:51:0x0119, B:54:0x0121, B:56:0x0125, B:58:0x0129, B:60:0x013b, B:61:0x0144, B:71:0x015f, B:73:0x016d, B:75:0x0173, B:77:0x017a, B:79:0x017e, B:81:0x0182, B:83:0x0186, B:85:0x0191, B:86:0x0198, B:91:0x01ae, B:93:0x01b7, B:95:0x01bf, B:90:0x01ab, B:70:0x015c, B:45:0x00ee, B:37:0x0097, B:39:0x009b, B:87:0x019d), top: B:119:0x005f, inners: #0, #4 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static void setLocationListenerBody(boolean r16) {
        /*
            Method dump skipped, instruction units count: 581
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.LocationListenerImpl.setLocationListenerBody(boolean):void");
    }

    public static void stopGpsLogPlayer() {
        LocationListenerLogPlayer locationListenerLogPlayer = gpsLogPlayer;
        if (locationListenerLogPlayer != null) {
            locationListenerLogPlayer.StopPlayer();
            gpsLogPlayer = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static LocationManager getLocationManager() {
        return (LocationManager) Application.anApplication.getSystemService("location");
    }

    public static boolean isGpsDenied() {
        DebugLogger.D5(logname, "p_gps_enabled = " + p_gps_enabled() + ";  p_net_enabled = " + p_net_enabled());
        if (!Config.location_gps || !p_gps_enabled()) {
            File file = new File(Config.sdcardDir + Config.getString("gps", "location_log_filename", Config.def_location_log_filename) + ".log");
            if (Config.location_log && file.exists()) {
                DebugLogger.D5(logname, "isGpsDenied: playing back " + file.getPath());
                return false;
            }
            DebugLogger.D5(logname, "isGpsDenied: true");
            return true;
        }
        DebugLogger.D5(logname, "isGpsDenied: false");
        return false;
    }
}
