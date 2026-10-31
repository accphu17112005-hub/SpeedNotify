package com.navngo.igo.javaclient.utils.gps;

import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationListenerTestBridge implements LocationListener {
    LocationManager manager;

    public LocationListenerTestBridge(LocationManager locationManager) {
        this.manager = locationManager;
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        this.manager.setTestProviderLocation(location.getProvider(), location);
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String str) {
        this.manager.setTestProviderEnabled(str, false);
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String str) {
        this.manager.setTestProviderEnabled(str, true);
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String str, int i, Bundle bundle) {
        this.manager.setTestProviderStatus(str, i, bundle, 1000L);
    }
}
