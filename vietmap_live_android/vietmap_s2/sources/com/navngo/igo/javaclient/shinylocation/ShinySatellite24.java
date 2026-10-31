package com.navngo.igo.javaclient.shinylocation;

import android.location.GnssStatus;
import android.os.Build;
import androidx.core.os.EnvironmentCompat;
import java.util.OptionalDouble;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinySatellite.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class ShinySatellite24 extends ShinySatelliteCommon {
    public OptionalDouble carrierFrequency26;
    public double cnzero;
    public int constellation;
    public int svid;

    private String constellationToString(int i) {
        switch (i) {
            case 0:
                return EnvironmentCompat.MEDIA_UNKNOWN;
            case 1:
                return "gps";
            case 2:
                return "sbas";
            case 3:
                return "glonass";
            case 4:
                return "qzss";
            case 5:
                return "beidou";
            case 6:
                return "galileo";
            default:
                return "unmapped";
        }
    }

    public ShinySatellite24(GnssStatus gnssStatus, int i) {
        this.azimuth = gnssStatus.getAzimuthDegrees(i);
        this.elevation = gnssStatus.getElevationDegrees(i);
        this.hasAlmanac = gnssStatus.hasAlmanacData(i);
        this.hasEpheremis = gnssStatus.hasEphemerisData(i);
        this.usedInFix = gnssStatus.usedInFix(i);
        this.constellation = gnssStatus.getConstellationType(i);
        this.svid = gnssStatus.getSvid(i);
        this.cnzero = gnssStatus.getCn0DbHz(i);
        if (Build.VERSION.SDK_INT >= 26 && gnssStatus.hasCarrierFrequencyHz(i)) {
            this.carrierFrequency26 = OptionalDouble.of(gnssStatus.getCarrierFrequencyHz(i));
        } else {
            this.carrierFrequency26 = OptionalDouble.empty();
        }
    }

    public ShinyJsonObject getDifference(ShinySatellite24 shinySatellite24) throws JSONException {
        ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
        shinyJsonObject.addString("constellation", constellationToString(this.constellation));
        shinyJsonObject.addInt("svid", this.svid);
        addDifference(shinyJsonObject, shinySatellite24);
        if (shinySatellite24 == null || shinySatellite24.cnzero != this.cnzero) {
            shinyJsonObject.addDouble("cnzero", this.cnzero);
        }
        if (Build.VERSION.SDK_INT >= 26 && (shinySatellite24 == null || !shinySatellite24.carrierFrequency26.equals(this.carrierFrequency26))) {
            shinyJsonObject.addOptionalDouble("carrierFrequency26", this.carrierFrequency26.orElse(0.0d), this.carrierFrequency26.isPresent());
        }
        return shinyJsonObject;
    }
}
