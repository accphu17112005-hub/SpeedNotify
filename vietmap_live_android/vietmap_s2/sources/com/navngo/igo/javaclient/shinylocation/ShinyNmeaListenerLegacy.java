package com.navngo.igo.javaclient.shinylocation;

import android.location.GpsStatus;
import android.location.LocationManager;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinyLocationListener.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class ShinyNmeaListenerLegacy implements IShinyListener, GpsStatus.NmeaListener {
    private ShinyLocationUtils utils;

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public String getProviderName() {
        return "NNG!Nmea";
    }

    ShinyNmeaListenerLegacy(ShinyLocationUtils shinyLocationUtils) {
        this.utils = shinyLocationUtils;
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void startListening() {
        try {
            this.utils.sendRegisterMessage(getProviderName(), ((Boolean) LocationManager.class.getMethod("addNmeaListener", GpsStatus.NmeaListener.class).invoke(this.utils.getLocationManager(), this)).booleanValue());
        } catch (Throwable th) {
            this.utils.sendRegisterMessage(getProviderName(), th);
        }
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void stopListening() {
        try {
            LocationManager.class.getMethod("removeNmeaListener", GpsStatus.NmeaListener.class).invoke(this.utils.getLocationManager(), this);
            this.utils.sendUnregisterMessage(getProviderName());
        } catch (Throwable th) {
            this.utils.sendUnregisterMessage(getProviderName(), th);
        }
    }

    @Override // android.location.GpsStatus.NmeaListener
    public void onNmeaReceived(long j, String str) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addString("nmea", str);
            shinyJsonObject.addLong("timestamp", j);
            this.utils.sendJson("nmea", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onNmeaReceived", e);
        }
    }
}
