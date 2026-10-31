package com.navngo.igo.javaclient.shinylocation;

import android.location.GpsSatellite;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinySatellite.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class ShinySatelliteLegacy extends ShinySatelliteCommon {
    public int prn;
    public double snr;

    public ShinySatelliteLegacy(GpsSatellite gpsSatellite) {
        this.azimuth = gpsSatellite.getAzimuth();
        this.elevation = gpsSatellite.getElevation();
        this.hasAlmanac = gpsSatellite.hasAlmanac();
        this.hasEpheremis = gpsSatellite.hasEphemeris();
        this.usedInFix = gpsSatellite.usedInFix();
        this.prn = gpsSatellite.getPrn();
        this.snr = gpsSatellite.getSnr();
    }

    public ShinyJsonObject getDifference(ShinySatelliteLegacy shinySatelliteLegacy) throws JSONException {
        ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
        shinyJsonObject.addInt("prn", this.prn);
        addDifference(shinyJsonObject, shinySatelliteLegacy);
        if (shinySatelliteLegacy == null || shinySatelliteLegacy.snr != this.snr) {
            shinyJsonObject.addDouble("snr", this.snr);
        }
        return shinyJsonObject;
    }
}
