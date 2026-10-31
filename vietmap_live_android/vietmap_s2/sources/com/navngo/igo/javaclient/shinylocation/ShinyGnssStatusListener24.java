package com.navngo.igo.javaclient.shinylocation;

import android.location.GnssStatus;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinyLocationListener.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class ShinyGnssStatusListener24 extends GnssStatus.Callback implements IShinyListener {
    private SatelliteMap prevSatellites = new SatelliteMap();
    private ShinyLocationUtils utils;

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public String getProviderName() {
        return "NNG!GnssStatus24";
    }

    /* JADX INFO: compiled from: ShinyLocationListener.java */
    private class SatelliteMap {
        private HashMap<Integer, HashMap<Integer, ShinySatellite24>> satellites;

        private SatelliteMap() {
            this.satellites = new HashMap<>();
        }

        public void put(int i, int i2, ShinySatellite24 shinySatellite24) {
            if (!this.satellites.containsKey(Integer.valueOf(i))) {
                this.satellites.put(Integer.valueOf(i), new HashMap<>());
            }
            this.satellites.get(Integer.valueOf(i)).put(Integer.valueOf(i2), shinySatellite24);
        }

        public ShinySatellite24 get(int i, int i2) {
            HashMap<Integer, ShinySatellite24> map = this.satellites.get(Integer.valueOf(i));
            if (map == null) {
                return null;
            }
            return map.get(Integer.valueOf(i2));
        }

        public boolean isEmpty() {
            return this.satellites.isEmpty();
        }
    }

    ShinyGnssStatusListener24(ShinyLocationUtils shinyLocationUtils) {
        this.utils = shinyLocationUtils;
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void startListening() {
        try {
            this.utils.sendRegisterMessage(getProviderName(), this.utils.getLocationManager().registerGnssStatusCallback(this));
        } catch (Throwable th) {
            this.utils.sendRegisterMessage(getProviderName(), th);
        }
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void stopListening() {
        this.utils.getLocationManager().unregisterGnssStatusCallback(this);
        this.utils.sendUnregisterMessage(getProviderName());
    }

    @Override // android.location.GnssStatus.Callback
    public void onFirstFix(int i) {
        super.onFirstFix(i);
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addInt("timeToFirstFix", i);
            this.utils.sendJson("gnssFirstFix24", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onFirstFix", e);
        }
    }

    @Override // android.location.GnssStatus.Callback
    public void onSatelliteStatusChanged(GnssStatus gnssStatus) {
        super.onSatelliteStatusChanged(gnssStatus);
        try {
            SatelliteMap satelliteMap = new SatelliteMap();
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < gnssStatus.getSatelliteCount(); i++) {
                int constellationType = gnssStatus.getConstellationType(i);
                int svid = gnssStatus.getSvid(i);
                ShinySatellite24 shinySatellite24 = new ShinySatellite24(gnssStatus, i);
                satelliteMap.put(constellationType, svid, shinySatellite24);
                arrayList.add(shinySatellite24.getDifference(this.prevSatellites.get(constellationType, svid)));
            }
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            if (this.prevSatellites.isEmpty()) {
                shinyJsonObject.addArray("data", arrayList);
            } else {
                shinyJsonObject.addArray("diff", arrayList);
            }
            this.prevSatellites = satelliteMap;
            this.utils.sendJson("gnssSatellites24", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onSatelliteStatusChanged", e);
        }
    }

    @Override // android.location.GnssStatus.Callback
    public void onStarted() {
        super.onStarted();
        this.utils.sendJson("gnssStart24", new ShinyJsonObject());
    }

    @Override // android.location.GnssStatus.Callback
    public void onStopped() {
        super.onStopped();
        this.utils.sendJson("gnssStop24", new ShinyJsonObject());
    }
}
