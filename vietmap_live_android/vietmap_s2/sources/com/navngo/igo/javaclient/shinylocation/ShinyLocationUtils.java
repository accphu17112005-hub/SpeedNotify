package com.navngo.igo.javaclient.shinylocation;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.os.SystemClock;
import android.provider.Settings;
import com.google.android.gms.common.GoogleApiAvailability;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ShinyLocationUtils {
    public static final int LOCATION_UPDATE_INTERVAL = 1000;
    private IShinyLocationConsumer consumer;
    private Context context;

    public ShinyLocationUtils(IShinyLocationConsumer iShinyLocationConsumer, Context context) {
        this.consumer = iShinyLocationConsumer;
        this.context = context;
    }

    public ShinyJsonObject locationToJson(Location location) throws JSONException {
        ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
        shinyJsonObject.addOptionalDouble("accuracy", location.getAccuracy(), location.hasAccuracy());
        shinyJsonObject.addOptionalDouble("altitude", location.getAltitude(), location.hasAltitude());
        shinyJsonObject.addOptionalDouble("bearing", location.getBearing(), location.hasBearing());
        shinyJsonObject.addDouble("latitude", location.getLatitude());
        shinyJsonObject.addDouble("longitude", location.getLongitude());
        shinyJsonObject.addString("provider", location.getProvider());
        shinyJsonObject.addOptionalDouble("speed", location.getSpeed(), location.hasSpeed());
        shinyJsonObject.addLong("time", location.getTime());
        shinyJsonObject.addBundle("extras", location.getExtras());
        if (Build.VERSION.SDK_INT >= 17) {
            shinyJsonObject.addLong("elapsedRealtimeNanos17", location.getElapsedRealtimeNanos());
        }
        if (Build.VERSION.SDK_INT >= 18) {
            shinyJsonObject.addBool("isFromMockProvider18", location.isFromMockProvider());
        }
        if (Build.VERSION.SDK_INT >= 26) {
            shinyJsonObject.addOptionalDouble("bearingAccuracyDegrees26", location.getBearingAccuracyDegrees(), location.hasBearingAccuracy());
            shinyJsonObject.addOptionalDouble("speedAccuracyMetersPerSecond26", location.getSpeedAccuracyMetersPerSecond(), location.hasSpeedAccuracy());
            shinyJsonObject.addOptionalDouble("verticalAccuracyMeters26", location.getVerticalAccuracyMeters(), location.hasVerticalAccuracy());
        }
        return shinyJsonObject;
    }

    public Context getContext() {
        return this.context;
    }

    public LocationManager getLocationManager() {
        return (LocationManager) this.context.getSystemService("location");
    }

    public boolean hasPermission(String str) {
        return Build.VERSION.SDK_INT >= 23 && this.context.checkSelfPermission(str) == 0;
    }

    public String getSecureSetting(String str) {
        return Settings.Secure.getString(this.context.getContentResolver(), str);
    }

    public boolean isGooglePlayServicesAvailable() {
        return GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(this.context) == 0;
    }

    public void sendJson(String str, ShinyJsonObject shinyJsonObject) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(str, shinyJsonObject.obj);
            jSONObject.put("javaTick", Long.toString(SystemClock.elapsedRealtime()));
            String string = jSONObject.toString();
            IShinyLocationConsumer iShinyLocationConsumer = this.consumer;
            if (iShinyLocationConsumer != null) {
                iShinyLocationConsumer.JsonDataArrived(string);
            }
        } catch (JSONException e) {
            handleJsonException("sendJson", e);
        }
    }

    public void handleJsonException(String str, JSONException jSONException) {
        logDebugMessage("JSONException in " + str + ": " + jSONException.getMessage());
    }

    public void sendRegisterMessage(String str, boolean z) {
        sendRegisterMessage(str, z ? "success" : "fail", null);
    }

    public void sendRegisterMessage(String str, Throwable th) {
        sendRegisterMessage(str, "exception", th.toString());
    }

    public void sendRegisterMessage(String str, String str2, String str3) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addString("result", str2);
            if (str3 != null) {
                shinyJsonObject.addString("message", str3);
            }
            shinyJsonObject.addString("provider", str);
            sendJson("register", shinyJsonObject);
        } catch (JSONException e) {
            handleJsonException("sendRegisterMessage", e);
        }
    }

    public void sendUnregisterMessage(String str) {
        sendUnregisterMessage(str, true);
    }

    public void sendUnregisterMessage(String str, boolean z) {
        sendUnregisterMessage(str, z ? "success" : "fail", null);
    }

    public void sendUnregisterMessage(String str, Throwable th) {
        sendUnregisterMessage(str, "exception", th.toString());
    }

    public void sendUnregisterMessage(String str, String str2, String str3) {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addString("result", str2);
            if (str3 != null) {
                shinyJsonObject.addString("message", str3);
            }
            shinyJsonObject.addString("provider", str);
            sendJson("unregister", shinyJsonObject);
        } catch (JSONException e) {
            handleJsonException("sendUnregisterMessage", e);
        }
    }

    public void logDebugMessage(String str) {
        IShinyLocationConsumer iShinyLocationConsumer = this.consumer;
        if (iShinyLocationConsumer != null) {
            iShinyLocationConsumer.LogDebugMessage(str);
        }
    }
}
