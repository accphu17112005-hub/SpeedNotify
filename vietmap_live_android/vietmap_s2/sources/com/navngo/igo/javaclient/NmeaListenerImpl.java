package com.navngo.igo.javaclient;

import android.location.GpsStatus;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.location.OnNmeaMessageListener;
import android.os.Build;
import android.os.Bundle;
import com.navngo.igo.javaclient.gps.GpsHacks;
import com.navngo.igo.javaclient.permission.PermissionHandler;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class NmeaListenerImpl implements GpsStatus.NmeaListener, GpsStatus.Listener {
    private static LocationListener locationListener = null;
    private static final String logname = "NmeaListenerImpl";
    private static NmeaListenerImpl nmeaListener = null;
    private static boolean nmeaListener_registered = false;

    private NmeaListenerImpl() {
    }

    public static boolean isListening() {
        return !Config.location_nmea || nmeaListener_registered;
    }

    @Override // android.location.GpsStatus.NmeaListener
    public void onNmeaReceived(long j, String str) {
        DebugLogger.D5(logname, "NMEA: " + str);
        if (Config.accuracy_workaround) {
            GpsHacks.ovrAccuracyNmea(str);
        }
        ServerRunner.onNmeaReceived(j, str);
    }

    @Override // android.location.GpsStatus.Listener
    public void onGpsStatusChanged(int i) {
        if (i == 1) {
            ServerRunner.wantGpsStatus(4);
        } else {
            if (i != 2) {
                return;
            }
            ServerRunner.wantGpsStatus(3);
        }
    }

    public static void setNmeaListener(final boolean z) {
        DebugLogger.D4(logname, "setNmeaListener: " + z);
        if (Config.location_nmea) {
            ServerRunner.runOnHandlerThread(new Runnable() { // from class: com.navngo.igo.javaclient.NmeaListenerImpl.1
                @Override // java.lang.Runnable
                public void run() {
                    NmeaListenerImpl.setNmeaListenerBody(z);
                }
            });
        }
    }

    static boolean p_gps_enabled() {
        if (!Config.location_nmea) {
            return false;
        }
        try {
            return getLocationManager().isProviderEnabled("gps");
        } catch (Exception e) {
            DebugLogger.D1(logname, "p_gps_enabled: ", e);
            return false;
        }
    }

    public static void setNmeaListenerBody(boolean z) {
        LocationManager locationManager = getLocationManager();
        boolean z2 = isGpsDenied() || !z;
        if (z) {
            try {
                if (Config.location_nmea && !nmeaListener_registered) {
                    if (nmeaListener == null) {
                        if (Build.VERSION.SDK_INT >= 29) {
                            nmeaListener = new NmeaMessageListenerImpl();
                        } else {
                            nmeaListener = new NmeaListenerImpl();
                        }
                        locationListener = new LocationListener() { // from class: com.navngo.igo.javaclient.NmeaListenerImpl.2
                            @Override // android.location.LocationListener
                            public void onProviderDisabled(String str) {
                            }

                            @Override // android.location.LocationListener
                            public void onProviderEnabled(String str) {
                            }

                            @Override // android.location.LocationListener
                            public void onStatusChanged(String str, int i, Bundle bundle) {
                            }

                            @Override // android.location.LocationListener
                            public void onLocationChanged(Location location) {
                                ResumeHandler.INSTANCE.onLocationChanged(location);
                            }
                        };
                    }
                    DebugLogger.D5(logname, "NmeaListener: on");
                    if (!PermissionHandler.get().isPermissionGranted("android.permission.ACCESS_FINE_LOCATION")) {
                        DebugLogger.D2(logname, "Missing ACCESS_FINE_LOCATION permission");
                        return;
                    }
                    if (!LocationListenerImpl.isListening()) {
                        try {
                            locationManager.requestLocationUpdates("gps", 0L, 0.0f, locationListener);
                        } catch (Exception e) {
                            DebugLogger.D1(logname, "setNmeaListenerBody: exception", e);
                        }
                    }
                    nmeaListener_registered = locationManager.addGpsStatusListener(nmeaListener) & NmeaListenerHandler.addNmeaListener(nmeaListener);
                }
            } catch (Exception e2) {
                DebugLogger.D4(logname, "setNmeaListener: " + e2.getMessage());
            }
        } else if (nmeaListener_registered) {
            DebugLogger.D5(logname, "NmeaListener: remove");
            nmeaListener_registered = false;
            NmeaListenerHandler.removeNmeaListener(nmeaListener);
            locationManager.removeGpsStatusListener(nmeaListener);
            locationManager.removeUpdates(locationListener);
        }
        if (z2) {
            StringBuilder sb = new StringBuilder();
            sb.append("GPS (NMEA) is not enabled (provider denied: ");
            sb.append(isGpsDenied());
            sb.append(" UI denied: ");
            sb.append(!z);
            sb.append(")");
            DebugLogger.D5(logname, sb.toString());
            return;
        }
        DebugLogger.D5(logname, "GPS (NMEA) is enabled");
    }

    public static LocationManager getLocationManager() {
        return (LocationManager) Application.anApplication.getSystemService("location");
    }

    public static boolean isGpsDenied() {
        DebugLogger.D5(logname, "p_gps_enabled = " + p_gps_enabled());
        boolean z = (Config.location_nmea && p_gps_enabled()) ? false : true;
        StringBuilder sb = new StringBuilder();
        sb.append("isGpsDenied: ");
        sb.append(z ? "true" : "false");
        DebugLogger.D5(logname, sb.toString());
        return z;
    }

    public static final class NmeaMessageListenerImpl extends NmeaListenerImpl implements OnNmeaMessageListener {
        public NmeaMessageListenerImpl() {
            super();
        }

        @Override // android.location.OnNmeaMessageListener
        public void onNmeaMessage(String str, long j) {
            onNmeaReceived(j, str);
        }
    }
}
