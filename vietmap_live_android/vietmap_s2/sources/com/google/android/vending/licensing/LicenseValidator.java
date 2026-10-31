package com.google.android.vending.licensing;

import android.text.TextUtils;
import android.util.Log;
import com.google.android.vending.licensing.util.Base64;
import com.google.android.vending.licensing.util.Base64DecoderException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
class LicenseValidator {
    private static final int ERROR_CONTACTING_SERVER = 257;
    private static final int ERROR_INVALID_PACKAGE_NAME = 258;
    private static final int ERROR_NON_MATCHING_UID = 259;
    private static final int ERROR_NOT_MARKET_MANAGED = 3;
    private static final int ERROR_OVER_QUOTA = 5;
    private static final int ERROR_SERVER_FAILURE = 4;
    private static final int LICENSED = 0;
    private static final int LICENSED_OLD_KEY = 2;
    private static final int NOT_LICENSED = 1;
    private static final String SIGNATURE_ALGORITHM = "SHA1withRSA";
    private static final String TAG = "LicenseValidator";
    private final LicenseCheckerCallback mCallback;
    private final DeviceLimiter mDeviceLimiter;
    private final int mNonce;
    private final String mPackageName;
    private final Policy mPolicy;
    private final String mVersionCode;

    LicenseValidator(Policy policy, DeviceLimiter deviceLimiter, LicenseCheckerCallback licenseCheckerCallback, int i, String str, String str2) {
        this.mPolicy = policy;
        this.mDeviceLimiter = deviceLimiter;
        this.mCallback = licenseCheckerCallback;
        this.mNonce = i;
        this.mPackageName = str;
        this.mVersionCode = str2;
    }

    public LicenseCheckerCallback getCallback() {
        return this.mCallback;
    }

    public int getNonce() {
        return this.mNonce;
    }

    public String getPackageName() {
        return this.mPackageName;
    }

    public void verify(PublicKey publicKey, int i, String str, String str2) {
        ResponseData responseData;
        String str3 = null;
        if (i == 0 || i == 1 || i == 2) {
            try {
                if (TextUtils.isEmpty(str)) {
                    Log.e(TAG, "Signature verification failed: signedData is empty. (Device not signed-in to any Google accounts?)");
                    handleInvalidResponse();
                    return;
                }
                Signature signature = Signature.getInstance(SIGNATURE_ALGORITHM);
                signature.initVerify(publicKey);
                signature.update(str.getBytes());
                if (!signature.verify(Base64.decode(str2))) {
                    Log.e(TAG, "Signature verification failed.");
                    handleInvalidResponse();
                    return;
                }
                try {
                    ResponseData responseData2 = ResponseData.parse(str);
                    if (responseData2.responseCode != i) {
                        Log.e(TAG, "Response codes don't match.");
                        handleInvalidResponse();
                        return;
                    }
                    if (responseData2.nonce != this.mNonce) {
                        Log.e(TAG, "Nonce doesn't match.");
                        handleInvalidResponse();
                        return;
                    }
                    if (!responseData2.packageName.equals(this.mPackageName)) {
                        Log.e(TAG, "Package name doesn't match.");
                        handleInvalidResponse();
                        return;
                    } else {
                        if (!responseData2.versionCode.equals(this.mVersionCode)) {
                            Log.e(TAG, "Version codes don't match.");
                            handleInvalidResponse();
                            return;
                        }
                        String str4 = responseData2.userId;
                        if (TextUtils.isEmpty(str4)) {
                            Log.e(TAG, "User identifier is empty.");
                            handleInvalidResponse();
                            return;
                        } else {
                            str3 = str4;
                            responseData = responseData2;
                        }
                    }
                } catch (IllegalArgumentException unused) {
                    Log.e(TAG, "Could not parse response.");
                    handleInvalidResponse();
                    return;
                }
            } catch (Base64DecoderException unused2) {
                Log.e(TAG, "Could not Base64-decode signature.");
                handleInvalidResponse();
                return;
            } catch (InvalidKeyException unused3) {
                handleApplicationError(5);
                return;
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            } catch (SignatureException e2) {
                throw new RuntimeException(e2);
            }
        } else {
            responseData = null;
        }
        if (i != 0) {
            if (i == 1) {
                handleResponse(Policy.NOT_LICENSED, responseData);
                return;
            }
            if (i != 2) {
                if (i == 3) {
                    handleApplicationError(3);
                    return;
                }
                if (i == 4) {
                    Log.w(TAG, "An error has occurred on the licensing server.");
                    handleResponse(Policy.RETRY, responseData);
                    return;
                }
                if (i != 5) {
                    switch (i) {
                        case 257:
                            Log.w(TAG, "Error contacting licensing server.");
                            handleResponse(Policy.RETRY, responseData);
                            return;
                        case ERROR_INVALID_PACKAGE_NAME /* 258 */:
                            handleApplicationError(1);
                            return;
                        case ERROR_NON_MATCHING_UID /* 259 */:
                            handleApplicationError(2);
                            return;
                        default:
                            Log.e(TAG, "Unknown response code for license check.");
                            handleInvalidResponse();
                            return;
                    }
                }
                Log.w(TAG, "Licensing server is refusing to talk to this device, over quota.");
                handleResponse(Policy.RETRY, responseData);
                return;
            }
        }
        handleResponse(this.mDeviceLimiter.isDeviceAllowed(str3), responseData);
    }

    private void handleResponse(int i, ResponseData responseData) {
        this.mPolicy.processServerResponse(i, responseData);
        if (this.mPolicy.allowAccess()) {
            this.mCallback.allow(i);
        } else {
            this.mCallback.dontAllow(i);
        }
    }

    private void handleApplicationError(int i) {
        this.mCallback.applicationError(i);
    }

    private void handleInvalidResponse() {
        this.mCallback.dontAllow(Policy.NOT_LICENSED);
    }
}
