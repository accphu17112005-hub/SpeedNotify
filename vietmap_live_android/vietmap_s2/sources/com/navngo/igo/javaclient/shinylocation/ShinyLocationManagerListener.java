package com.navngo.igo.javaclient.shinylocation;

import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import androidx.core.app.NotificationCompat;
import androidx.core.os.EnvironmentCompat;
import org.json.JSONException;

/* JADX INFO: compiled from: ShinyLocationListener.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class ShinyLocationManagerListener implements IShinyListener, LocationListener {
    private String provider;
    private ShinyLocationUtils utils;

    ShinyLocationManagerListener(String str, ShinyLocationUtils shinyLocationUtils) {
        this.utils = shinyLocationUtils;
        this.provider = str;
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void startListening() {
        try {
            this.utils.getLocationManager().requestLocationUpdates(this.provider, 1000L, 0.0f, this);
            this.utils.sendRegisterMessage(getProviderName(), true);
        } catch (Throwable th) {
            this.utils.sendRegisterMessage(getProviderName(), th);
        }
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public void stopListening() {
        this.utils.getLocationManager().removeUpdates(this);
        this.utils.sendUnregisterMessage(getProviderName());
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyListener
    public String getProviderName() {
        return this.provider;
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        try {
            ShinyJsonObject shinyJsonObjectLocationToJson = this.utils.locationToJson(location);
            if (location.getProvider().equals("gps")) {
                this.utils.sendJson("gps", shinyJsonObjectLocationToJson);
            }
            if (location.getProvider().equals("network")) {
                this.utils.sendJson("net", shinyJsonObjectLocationToJson);
            }
        } catch (JSONException e) {
            this.utils.handleJsonException("onLocationChanged", e);
        }
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String str, int i, Bundle bundle) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            String str2 = EnvironmentCompat.MEDIA_UNKNOWN;
            if (i == 0) {
                str2 = "OUT_OF_SERVICE";
            } else if (i == 1) {
                str2 = "TEMPORARILY_UNAVAILABLE";
            } else if (i == 2) {
                str2 = "AVAILABLE";
            }
            shinyJsonObject.addString("provider", str);
            shinyJsonObject.addString(NotificationCompat.CATEGORY_STATUS, str2);
            shinyJsonObject.addBundle("extras", bundle);
            this.utils.sendJson("providerStatus", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onStatusChanged", e);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String str) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addString("provider", str);
            this.utils.sendJson("enable", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onProviderEnabled", e);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String str) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addString("provider", str);
            this.utils.sendJson("disable", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("onProviderDisabled", e);
        }
    }
}
