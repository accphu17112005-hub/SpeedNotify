package com.navngo.igo.javaclient.utils.gps;

import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import com.navngo.igo.javaclient.DebugLogger;
import java.io.IOException;
import java.io.ObjectInputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationListenerLogReader {
    private static final String logname = "LocationListenerLogReader";
    ObjectInputStream in;
    boolean isValid;
    LocationListener listener;

    public LocationListenerLogReader(LocationListener locationListener, ObjectInputStream objectInputStream) {
        this.isValid = true;
        this.listener = locationListener;
        this.in = objectInputStream;
        try {
            if (LocationListenerLogWriter.headerVersion.equals(objectInputStream.readObject())) {
                return;
            }
        } catch (Exception unused) {
        }
        this.isValid = false;
        DebugLogger.D2(logname, "Bad log file version!");
    }

    public boolean isEOF() {
        try {
            if (this.isValid) {
                return this.in.available() == 0;
            }
            return true;
        } catch (Exception unused) {
            return true;
        }
    }

    public long readNextTimestamp() {
        if (!this.isValid) {
            return -1L;
        }
        try {
            return this.in.readLong();
        } catch (Exception e) {
            throw new Error(e);
        }
    }

    public void readNextRecord(boolean z) {
        if (this.isValid) {
            try {
                int i = this.in.readInt();
                if (i == 0) {
                    Location location = new Location((String) this.in.readObject());
                    location.setAccuracy(this.in.readFloat());
                    location.setAltitude(this.in.readDouble());
                    location.setBearing(this.in.readFloat());
                    location.setExtras(readBundle());
                    location.setLatitude(this.in.readDouble());
                    location.setLongitude(this.in.readDouble());
                    location.setSpeed(this.in.readFloat());
                    location.setTime(this.in.readLong());
                    if (!this.in.readBoolean()) {
                        location.removeAccuracy();
                    }
                    if (!this.in.readBoolean()) {
                        location.removeAltitude();
                    }
                    if (!this.in.readBoolean()) {
                        location.removeBearing();
                    }
                    if (!this.in.readBoolean()) {
                        location.removeSpeed();
                    }
                    if (z) {
                        return;
                    }
                    LocationListenerLogger.onLocationChanged(location);
                    this.listener.onLocationChanged(location);
                    return;
                }
                if (i == 1) {
                    String str = (String) this.in.readObject();
                    if (z) {
                        return;
                    }
                    LocationListenerLogger.onProviderEnabled(str);
                    this.listener.onProviderEnabled(str);
                    return;
                }
                if (i == 2) {
                    String str2 = (String) this.in.readObject();
                    if (z) {
                        return;
                    }
                    LocationListenerLogger.onProviderDisabled(str2);
                    this.listener.onProviderDisabled(str2);
                    return;
                }
                if (i != 3) {
                    return;
                }
                String str3 = (String) this.in.readObject();
                int i2 = this.in.readInt();
                Bundle bundle = readBundle();
                if (z) {
                    return;
                }
                LocationListenerLogger.onStatusChanged(str3, i2, bundle);
                this.listener.onStatusChanged(str3, i2, bundle);
            } catch (Exception e) {
                throw new Error(e);
            }
        }
    }

    public Bundle readBundle() throws IOException, ClassNotFoundException {
        Bundle bundle = new Bundle();
        int i = this.in.readInt();
        while (true) {
            int i2 = i - 1;
            if (i <= 0) {
                return bundle;
            }
            this.in.readObject();
            i = i2;
        }
    }
}
