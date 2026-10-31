package com.navngo.igo.javaclient.matek;

import android.location.Location;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GeoArea {
    private static double metric_R = 6366197.7236758135d;
    private float maxDistance;
    private float[] metric_origo;
    private Location origo;

    public GeoArea(Location location) {
        this.origo = location;
        if (location != null) {
            this.metric_origo = getMetricLocation(location);
        }
        this.maxDistance = 0.0f;
    }

    public void extend(Location location) {
        if (this.origo == null) {
            this.origo = location;
            if (location != null) {
                this.metric_origo = getMetricLocation(location);
                return;
            }
            return;
        }
        if (location != null) {
            this.maxDistance = Math.max(this.maxDistance, metricLocationDiff(getMetricLocation(location), this.metric_origo));
        }
    }

    public static float metricLocationDiff(float[] fArr, float[] fArr2) {
        float f = fArr[0] - fArr2[0];
        float f2 = fArr[1] - fArr2[1];
        float f3 = fArr[2] - fArr2[2];
        return (float) Math.sqrt((f * f) + (f2 * f2) + (f3 * f3));
    }

    public double metricRadius() {
        return this.maxDistance;
    }

    public static float[] getMetricLocation(Location location) {
        double altitude = metric_R + location.getAltitude();
        double latitude = (location.getLatitude() * 3.141592653589793d) / 180.0d;
        double dCos = Math.cos(latitude) * altitude;
        double dSin = Math.sin(latitude) * altitude;
        double longitude = (location.getLongitude() * 3.141592653589793d) / 180.0d;
        return new float[]{(float) (Math.cos(longitude) * dCos), (float) (Math.sin(longitude) * dCos), (float) dSin};
    }
}
