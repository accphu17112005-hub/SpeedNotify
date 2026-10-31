package com.navngo.igo.javaclient.utils.gps;

import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import com.navngo.igo.javaclient.DebugLogger;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationListenerLogWriter implements LocationListener {
    public static final String headerVersion = "LocationListener log v1.0";
    private static final String logname = "LocationListenerLogWriter";
    ObjectOutputStream out;
    long startTime;

    public LocationListenerLogWriter(File file) throws IOException {
        try {
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(new FileOutputStream(file));
            this.out = objectOutputStream;
            objectOutputStream.writeObject(headerVersion);
            this.startTime = System.nanoTime();
        } catch (IOException e) {
            DebugLogger.D1(logname, "error opening file: " + file.getPath(), e);
            throw e;
        }
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        LocationListenerLogger.onLocationChanged(location);
        try {
            writeTimestamp();
            this.out.writeInt(0);
            this.out.writeObject(location.getProvider());
            this.out.writeFloat(location.getAccuracy());
            this.out.writeDouble(location.getAltitude());
            this.out.writeFloat(location.getBearing());
            writeBundle(this.out, location.getExtras());
            this.out.writeDouble(location.getLatitude());
            this.out.writeDouble(location.getLongitude());
            this.out.writeFloat(location.getSpeed());
            this.out.writeLong(location.getTime());
            this.out.writeBoolean(location.hasAccuracy());
            this.out.writeBoolean(location.hasAltitude());
            this.out.writeBoolean(location.hasBearing());
            this.out.writeBoolean(location.hasSpeed());
            this.out.flush();
        } catch (Exception unused) {
            DebugLogger.D3(logname, "Error during location logging");
        }
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String str) {
        LocationListenerLogger.onProviderDisabled(str);
        try {
            writeTimestamp();
            this.out.writeInt(1);
            this.out.writeObject(str);
            this.out.flush();
        } catch (Exception unused) {
            DebugLogger.D3(logname, "Error during location logging");
        }
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String str) {
        LocationListenerLogger.onProviderEnabled(str);
        try {
            writeTimestamp();
            this.out.writeInt(2);
            this.out.writeObject(str);
            this.out.flush();
        } catch (Exception unused) {
            DebugLogger.D3(logname, "Error during location logging");
        }
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String str, int i, Bundle bundle) {
        LocationListenerLogger.onStatusChanged(str, i, bundle);
        try {
            writeTimestamp();
            this.out.writeInt(3);
            this.out.writeObject(str);
            this.out.writeInt(i);
            writeBundle(this.out, bundle);
            this.out.flush();
        } catch (Exception unused) {
            DebugLogger.D3(logname, "Error during location logging");
        }
    }

    protected void writeTimestamp() throws IOException {
        this.out.writeLong(System.nanoTime() - this.startTime);
    }

    protected void writeBundle(ObjectOutputStream objectOutputStream, Bundle bundle) throws IOException {
        objectOutputStream.writeInt(0);
    }
}
