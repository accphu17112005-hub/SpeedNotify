package com.navngo.igo.javaclient.shinylocation;

import android.content.Context;
import android.os.Build;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class ShinyLocationListener {
    private static final int CURRENT_LOG_VERSION = 8;
    private ArrayList<IShinyListener> listeners = new ArrayList<>();
    private ShinyLocationUtils utils;

    public ShinyLocationListener(IShinyLocationConsumer iShinyLocationConsumer, Context context) {
        ShinyLocationUtils shinyLocationUtils = new ShinyLocationUtils(iShinyLocationConsumer, context);
        this.utils = shinyLocationUtils;
        shinyLocationUtils.logDebugMessage("ShinyLocationListener created");
        sendInitMessage();
        boolean z = Build.VERSION.SDK_INT < 24;
        this.listeners.add(new ShinyLocationManagerListener("gps", this.utils));
        this.listeners.add(new ShinyLocationManagerListener("network", this.utils));
        if (z) {
            this.listeners.add(new ShinyNmeaListenerLegacy(this.utils));
        }
        this.listeners.add(new ShinyGpsStatusListenerLegacy(this.utils));
        if (Build.VERSION.SDK_INT >= 24) {
            this.listeners.add(new ShinyNmeaListener24(this.utils));
            this.listeners.add(new ShinyGnssStatusListener24(this.utils));
        }
        if (this.utils.isGooglePlayServicesAvailable()) {
            this.listeners.add(new ShinyFusedListener(this.utils));
        }
    }

    public ShinyLocationUtils getShinyLocationUtils() {
        return this.utils;
    }

    public ArrayList<IShinyListener> getListeners() {
        return this.listeners;
    }

    public void done() {
        this.utils.sendJson("done", new ShinyJsonObject());
    }

    private void sendInitMessage() {
        try {
            ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
            shinyJsonObject.addInt("log_version", 8);
            shinyJsonObject.addObject("phone", createPhoneObject());
            this.utils.sendJson("init", shinyJsonObject);
        } catch (JSONException e) {
            this.utils.handleJsonException("sendInitMessage", e);
        }
    }

    private ShinyJsonObject createPhoneObject() throws JSONException {
        ShinyJsonObject shinyJsonObject = new ShinyJsonObject();
        shinyJsonObject.addInt("api_version", Build.VERSION.SDK_INT);
        shinyJsonObject.addString("brand", Build.BRAND);
        shinyJsonObject.addString("model", Build.MODEL);
        shinyJsonObject.addString("serial", Build.SERIAL);
        if (Build.VERSION.SDK_INT >= 26 && Build.VERSION.SDK_INT < 29 && this.utils.hasPermission("android.permission.READ_PHONE_STATE")) {
            shinyJsonObject.addString("serial26", Build.getSerial());
        }
        shinyJsonObject.addString("android_id", this.utils.getSecureSetting("android_id"));
        return shinyJsonObject;
    }

    public void startListening() {
        this.utils.sendJson("startListening", new ShinyJsonObject());
        Iterator<IShinyListener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().startListening();
        }
    }

    public void stopListening() {
        this.utils.sendJson("stopListening", new ShinyJsonObject());
        Iterator<IShinyListener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().stopListening();
        }
    }
}
