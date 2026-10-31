package com.navngo.igo.javaclient.shinylocation;

import android.os.Build;
import android.os.Bundle;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class ShinyJsonObject {
    public JSONObject obj = new JSONObject();

    public void addArray(String str, Iterable<ShinyJsonObject> iterable) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        Iterator<ShinyJsonObject> it = iterable.iterator();
        while (it.hasNext()) {
            jSONArray.put(it.next().obj);
        }
        this.obj.put(str, jSONArray);
    }

    public void addBool(String str, boolean z) throws JSONException {
        this.obj.put(str, z);
    }

    public void addInt(String str, int i) throws JSONException {
        this.obj.put(str, i);
    }

    public void addLong(String str, long j) throws JSONException {
        this.obj.put(str, Long.toString(j));
    }

    public void addDouble(String str, double d) throws JSONException {
        this.obj.put(str, Double.toHexString(d));
    }

    public void addOptionalDouble(String str, double d, boolean z) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        if (z) {
            jSONArray.put(Double.toHexString(d));
        }
        this.obj.put(str, jSONArray);
    }

    public void addString(String str, String str2) throws JSONException {
        this.obj.put(str, str2);
    }

    public void addObject(String str, ShinyJsonObject shinyJsonObject) throws JSONException {
        this.obj.put(str, shinyJsonObject.obj);
    }

    public void addBundle(String str, Bundle bundle) throws JSONException {
        if (Build.VERSION.SDK_INT >= 19 && bundle != null) {
            JSONObject jSONObject = new JSONObject();
            for (String str2 : bundle.keySet()) {
                jSONObject.put(str2, JSONObject.wrap(bundle.get(str2)));
            }
            this.obj.put(str, jSONObject);
            return;
        }
        this.obj.put(str, JSONObject.NULL);
    }
}
