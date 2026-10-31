package com.navngo.igo.javaclient.login.api;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LoginRequest extends JsonObjectRequest {
    private static final String apiKey = "8zldlgom55ech8edg32fwdz7ld8di0tv";
    private static final String entry = "https://api-s2.vietmap.vn";
    private static final DefaultRetryPolicy policy = new DefaultRetryPolicy(10000, 1, 1.0f);

    public LoginRequest(String str, JSONObject jSONObject, final LoginResponse loginResponse, Response.Listener<JSONObject> listener) {
        super(1, entry + str, jSONObject, listener, new Response.ErrorListener() { // from class: com.navngo.igo.javaclient.login.api.LoginRequest$$ExternalSyntheticLambda0
            @Override // com.android.volley.Response.ErrorListener
            public final void onErrorResponse(VolleyError volleyError) {
                loginResponse.onError(LoginError.NO_INTERNET);
            }
        });
        setRetryPolicy(policy);
    }

    @Override // com.android.volley.Request
    public Map<String, String> getHeaders() throws AuthFailureError {
        HashMap map = new HashMap();
        map.put("Apikey", apiKey);
        return map;
    }
}
