package com.navngo.igo.javaclient.googleplay;

import android.content.Context;
import android.util.Log;
import com.google.android.vending.licensing.Obfuscator;
import com.google.android.vending.licensing.Policy;
import com.google.android.vending.licensing.PreferenceObfuscator;
import com.google.android.vending.licensing.ResponseData;
import com.google.android.vending.licensing.util.URIQueryDecoder;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CustomLicencingPolicy implements Policy {
    private static final String DEFAULT_MAX_RETRIES = "0";
    private static final String DEFAULT_RETRY_COUNT = "0";
    private static final String DEFAULT_RETRY_UNTIL = "0";
    private static final String DEFAULT_VALIDITY_TIMESTAMP = "0";
    private static final long MILLIS_PER_MINUTE = 60000;
    private static final String PREFS_FILE = "com.google.android.vending.licensing.CustomLicencingPolicy";
    private static final String PREF_LAST_RESPONSE = "lastResponse";
    private static final String PREF_MAX_RETRIES = "maxRetries";
    private static final String PREF_RETRY_COUNT = "retryCount";
    private static final String PREF_RETRY_UNTIL = "retryUntil";
    private static final String PREF_VALIDITY_TIMESTAMP = "validityTimestamp";
    private static final String TAG = "CustomLicencingPolicy";
    private int mLastResponse;
    private long mLastResponseTime = 0;
    private long mMaxRetries;
    private PreferenceObfuscator mPreferences;
    private long mRetryCount;
    private long mRetryUntil;
    private long mValidityTimestamp;

    public CustomLicencingPolicy(Context context, Obfuscator obfuscator) {
        PreferenceObfuscator preferenceObfuscator = new PreferenceObfuscator(context.getSharedPreferences(PREFS_FILE, 0), obfuscator);
        this.mPreferences = preferenceObfuscator;
        this.mLastResponse = Integer.parseInt(preferenceObfuscator.getString(PREF_LAST_RESPONSE, Integer.toString(Policy.RETRY)));
        this.mValidityTimestamp = Long.parseLong(this.mPreferences.getString(PREF_VALIDITY_TIMESTAMP, "0"));
        this.mRetryUntil = Long.parseLong(this.mPreferences.getString(PREF_RETRY_UNTIL, "0"));
        this.mMaxRetries = Long.parseLong(this.mPreferences.getString(PREF_MAX_RETRIES, "0"));
        this.mRetryCount = Long.parseLong(this.mPreferences.getString(PREF_RETRY_COUNT, "0"));
    }

    @Override // com.google.android.vending.licensing.Policy
    public void processServerResponse(int i, ResponseData responseData) {
        if (i != 291) {
            setRetryCount(0L);
        } else {
            setRetryCount(this.mRetryCount + 1);
        }
        if (i == 256) {
            Map<String, String> mapDecodeExtras = decodeExtras(responseData.extra);
            this.mLastResponse = i;
            setValidityTimestamp(mapDecodeExtras.get("VT"));
            setRetryUntil(mapDecodeExtras.get("GT"));
            setMaxRetries(mapDecodeExtras.get("GR"));
        } else if (i == 561) {
            setValidityTimestamp("0");
            setRetryUntil("0");
            setMaxRetries("0");
        }
        setLastResponse(i);
        this.mPreferences.commit();
    }

    private void setLastResponse(int i) {
        this.mLastResponseTime = System.currentTimeMillis();
        this.mLastResponse = i;
        this.mPreferences.putString(PREF_LAST_RESPONSE, Integer.toString(i));
    }

    private void setRetryCount(long j) {
        this.mRetryCount = j;
        this.mPreferences.putString(PREF_RETRY_COUNT, Long.toString(j));
    }

    public long getRetryCount() {
        return this.mRetryCount;
    }

    private void setValidityTimestamp(String str) {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(Long.parseLong(str));
        } catch (NumberFormatException unused) {
            Log.w(TAG, "License validity timestamp (VT) missing, caching for a minute");
            lValueOf = Long.valueOf(System.currentTimeMillis() + MILLIS_PER_MINUTE);
            str = Long.toString(lValueOf.longValue());
        }
        this.mValidityTimestamp = lValueOf.longValue();
        this.mPreferences.putString(PREF_VALIDITY_TIMESTAMP, str);
    }

    public long getValidityTimestamp() {
        return this.mValidityTimestamp;
    }

    private void setRetryUntil(String str) {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(Long.parseLong(str));
        } catch (NumberFormatException unused) {
            Log.w(TAG, "License retry timestamp (GT) missing, grace period disabled");
            lValueOf = 0L;
            str = "0";
        }
        this.mRetryUntil = lValueOf.longValue();
        this.mPreferences.putString(PREF_RETRY_UNTIL, str);
    }

    public long getRetryUntil() {
        return this.mRetryUntil;
    }

    private void setMaxRetries(String str) {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(Long.parseLong(str));
        } catch (NumberFormatException unused) {
            Log.w(TAG, "Licence retry count (GR) missing, grace period disabled");
            lValueOf = 0L;
            str = "0";
        }
        this.mMaxRetries = lValueOf.longValue();
        this.mPreferences.putString(PREF_MAX_RETRIES, str);
    }

    public long getMaxRetries() {
        return this.mMaxRetries;
    }

    @Override // com.google.android.vending.licensing.Policy
    public boolean allowAccess() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        int i = this.mLastResponse;
        if (i == 256) {
            if (jCurrentTimeMillis <= this.mValidityTimestamp) {
                return true;
            }
        } else if (i == 291 && jCurrentTimeMillis < this.mLastResponseTime + MILLIS_PER_MINUTE) {
            return jCurrentTimeMillis <= this.mRetryUntil || this.mRetryCount <= this.mMaxRetries;
        }
        return false;
    }

    private Map<String, String> decodeExtras(String str) {
        HashMap map = new HashMap();
        try {
            URIQueryDecoder.DecodeQuery(new URI("?" + str), map);
        } catch (URISyntaxException unused) {
            Log.w(TAG, "Invalid syntax error while decoding extras data from server.");
        }
        return map;
    }
}
