package com.navngo.igo.javaclient.shinylocation;

import android.location.OnNmeaMessageListener;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinyLocationListener.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class ShinyNmeaListener24 implements IShinyListener, OnNmeaMessageListener {
    private ShinyLocationUtils utils;

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public String getProviderName() {
        return "NNG!Nmea24";
    }

    ShinyNmeaListener24(ShinyLocationUtils shinyLocationUtils) {
        this.utils = shinyLocationUtils;
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void startListening() {
        try {
            this.utils.sendRegisterMessage(getProviderName(), this.utils.getLocationManager().addNmeaListener(this));
        } catch (Throwable th) {
            this.utils.sendRegisterMessage(getProviderName(), th);
        }
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void stopListening() {
        this.utils.getLocationManager().removeNmeaListener(this);
        this.utils.sendUnregisterMessage(getProviderName());
    }

    @Override // android.location.OnNmeaMessageListener
    public void onNmeaMessage(String str, long j) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addString("nmea", str);
            shinyJsonObject.addLong("timestamp", j);
            this.utils.sendJson("nmea24", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onNmeaMessage", e);
        }
    }
}
