package com.navngo.igo.javaclient.shinylocation;

import org.json.JSONException;

/* JADX INFO: compiled from: ShinySatellite.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
abstract class ShinySatelliteCommon {
    public double azimuth;
    public double elevation;
    public boolean hasAlmanac;
    public boolean hasEpheremis;
    public boolean usedInFix;

    ShinySatelliteCommon() {
    }

    public ShinyJsonObject addDifference(ShinyJsonObject shinyJsonObject, ShinySatelliteCommon shinySatelliteCommon) throws JSONException {
        if (shinySatelliteCommon == null || shinySatelliteCommon.azimuth != this.azimuth) {
            shinyJsonObject.addDouble("azimuth", this.azimuth);
        }
        if (shinySatelliteCommon == null || shinySatelliteCommon.elevation != this.elevation) {
            shinyJsonObject.addDouble("elevation", this.elevation);
        }
        if (shinySatelliteCommon == null || shinySatelliteCommon.hasAlmanac != this.hasAlmanac) {
            shinyJsonObject.addBool("hasAlmanac", this.hasAlmanac);
        }
        if (shinySatelliteCommon == null || shinySatelliteCommon.hasEpheremis != this.hasEpheremis) {
            shinyJsonObject.addBool("hasEphemeris", this.hasEpheremis);
        }
        if (shinySatelliteCommon == null || shinySatelliteCommon.usedInFix != this.usedInFix) {
            shinyJsonObject.addBool("usedInFix", this.usedInFix);
        }
        return shinyJsonObject;
    }
}
