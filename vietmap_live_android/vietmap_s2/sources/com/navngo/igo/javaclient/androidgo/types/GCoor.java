package com.navngo.igo.javaclient.androidgo.types;

import com.navngo.igo.javaclient.DebugLogger;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GCoor {
    private static final int FIX_POINT_PRECISION = 23;
    public static final double INVALID = 250.0d;
    public double latitude;
    public double longitude;

    public GCoor() {
        this.latitude = 250.0d;
        this.longitude = 250.0d;
    }

    public GCoor(double d, double d2) {
        this.latitude = d;
        this.longitude = d2;
    }

    public GCoor(DataInputStream dataInputStream) {
        try {
            this.latitude = dataInputStream.readInt();
            double d = dataInputStream.readInt();
            this.latitude /= 8388608.0d;
            this.longitude = d / 8388608.0d;
        } catch (Exception e) {
            DebugLogger.D1("Gcoor", "load from inputstream failure", e);
            this.latitude = 250.0d;
            this.longitude = 250.0d;
        }
    }

    public GCoor(long j) {
        this.longitude = (j >> 32) / 8388608.0d;
        this.latitude = ((double) ((int) (j & (-1)))) / 8388608.0d;
    }

    public static GCoor createFromString(String str, String str2) {
        GCoor gCoor = new GCoor();
        try {
            gCoor.latitude = Double.parseDouble(str);
            gCoor.longitude = Double.parseDouble(str2);
        } catch (NumberFormatException unused) {
            gCoor.latitude = 250.0d;
            gCoor.longitude = 250.0d;
        }
        return gCoor;
    }

    public void writeOut(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeInt((int) (this.latitude * 8388608.0d));
        dataOutputStream.writeInt((int) (this.longitude * 8388608.0d));
    }

    public boolean isValid() {
        return (this.latitude == 250.0d || this.longitude == 250.0d) ? false : true;
    }

    public boolean isZero() {
        return this.latitude == 0.0d && this.longitude == 0.0d;
    }

    public String toString() {
        return String.format(null, "lat: %f, lon: %f", Double.valueOf(this.latitude), Double.valueOf(this.longitude));
    }
}
