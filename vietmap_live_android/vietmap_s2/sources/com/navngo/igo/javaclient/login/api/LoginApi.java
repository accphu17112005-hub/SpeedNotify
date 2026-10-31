package com.navngo.igo.javaclient.login.api;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.refprod.BuildConfig;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LoginApi {
    private static LoginApi instance;
    public final Observable<String> phone = new Observable<>(Config.def_additional_assets);
    public final Observable<String> code = new Observable<>(Config.def_additional_assets);
    public final Observable<String> token = new Observable<>(Config.def_additional_assets);
    public final Counter counter = new Counter(120, 0, 1000);

    public static LoginApi getInstance() {
        if (instance == null) {
            instance = new LoginApi();
        }
        return instance;
    }

    private LoginApi() {
    }

    public void registerPhoneRequest(Context context, final LoginResponse loginResponse) {
        RequestQueue requestQueueNewRequestQueue = Volley.newRequestQueue(context);
        JSONObject jSONObject = new JSONObject();
        String string = Settings.Secure.getString(Application.anApplication.getContentResolver(), "android_id");
        try {
            jSONObject.put("phone", this.phone.getValue());
            jSONObject.put("appVer", BuildConfig.VERSION_NAME.substring(7));
            jSONObject.put("model", Build.MODEL);
            jSONObject.put("unique_id", string + "+" + this.phone.getValue());
            jSONObject.put("product", Build.PRODUCT);
            jSONObject.put("brand", Build.BRAND);
            jSONObject.put("hardware", Build.HARDWARE);
            jSONObject.put("os_ver", Build.VERSION.RELEASE);
            jSONObject.put("fw_ver", Build.DISPLAY);
            requestQueueNewRequestQueue.add(new LoginRequest("/v3/user/RequestOtp", jSONObject, loginResponse, new Response.Listener<JSONObject>() { // from class: com.navngo.igo.javaclient.login.api.LoginApi.1
                @Override // com.android.volley.Response.Listener
                public void onResponse(JSONObject jSONObject2) {
                    try {
                        try {
                            JSONObject jSONObject3 = jSONObject2.getJSONObject("data");
                            String string2 = jSONObject3.getString("description");
                            String string3 = jSONObject3.getString("responseCode");
                            if (string2.equals("Success")) {
                                LoginApi.this.counter.start();
                                loginResponse.onSuccess();
                            } else {
                                loginResponse.onError(LoginError.fromTag(string3));
                            }
                        } catch (JSONException unused) {
                            loginResponse.onError(LoginError.fromTag(jSONObject2.getJSONObject("error").getString("responseCode")));
                        }
                    } catch (JSONException unused2) {
                        loginResponse.onError(LoginError.OTHER);
                    }
                }
            }));
        } catch (JSONException e) {
            e.printStackTrace();
            loginResponse.onError(LoginError.OTHER);
        }
    }

    public void verifyPhoneRequest(Context context, final LoginResponse loginResponse) {
        RequestQueue requestQueueNewRequestQueue = Volley.newRequestQueue(context);
        JSONObject jSONObject = new JSONObject();
        String string = Settings.Secure.getString(Application.anApplication.getContentResolver(), "android_id");
        try {
            jSONObject.put("phone", this.phone.getValue());
            jSONObject.put("otp", this.code.getValue());
            jSONObject.put("unique_id", string + "+" + this.phone.getValue());
            requestQueueNewRequestQueue.add(new LoginRequest("/v3/user/LoginByPhone", jSONObject, loginResponse, new Response.Listener<JSONObject>() { // from class: com.navngo.igo.javaclient.login.api.LoginApi.2
                @Override // com.android.volley.Response.Listener
                public void onResponse(JSONObject jSONObject2) {
                    try {
                        try {
                            JSONObject jSONObject3 = jSONObject2.getJSONObject("data");
                            String string2 = jSONObject3.getString("description");
                            String string3 = jSONObject3.getString("responseCode");
                            if (string2.equals("Success")) {
                                LoginApi.this.counter.stop();
                                LoginApi.this.token.setValue(jSONObject3.getString("token"));
                                loginResponse.onSuccess();
                            } else {
                                loginResponse.onError(LoginError.fromTag(string3));
                            }
                        } catch (JSONException unused) {
                            loginResponse.onError(LoginError.OTHER);
                        }
                    } catch (JSONException unused2) {
                        loginResponse.onError(LoginError.fromTag(jSONObject2.getJSONObject("error").getString("responseCode")));
                    }
                }
            }));
        } catch (JSONException e) {
            e.printStackTrace();
            loginResponse.onError(LoginError.OTHER);
        }
    }
}
