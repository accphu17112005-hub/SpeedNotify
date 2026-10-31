package com.navngo.igo.javaclient.utils.gps;

import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationListenerExtender implements LocationListener {
    private List<LocationListener> delegateList = new LinkedList();

    public LocationListenerExtender() {
    }

    public LocationListenerExtender(LocationListener locationListener) {
        addDelegate(locationListener);
    }

    public LocationListenerExtender(LocationListener locationListener, LocationListener locationListener2) {
        addDelegate(locationListener);
        addDelegate(locationListener2);
    }

    public void addDelegate(LocationListener locationListener) {
        if (locationListener != null) {
            this.delegateList.add(locationListener);
        }
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        Iterator<LocationListener> it = this.delegateList.iterator();
        while (it.hasNext()) {
            it.next().onLocationChanged(location);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String str) {
        Iterator<LocationListener> it = this.delegateList.iterator();
        while (it.hasNext()) {
            it.next().onProviderDisabled(str);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String str) {
        Iterator<LocationListener> it = this.delegateList.iterator();
        while (it.hasNext()) {
            it.next().onProviderEnabled(str);
        }
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String str, int i, Bundle bundle) {
        Iterator<LocationListener> it = this.delegateList.iterator();
        while (it.hasNext()) {
            it.next().onStatusChanged(str, i, bundle);
        }
    }
}
