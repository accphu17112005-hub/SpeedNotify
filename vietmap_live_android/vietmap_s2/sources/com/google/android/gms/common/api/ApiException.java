package com.google.android.gms.common.api;

import com.navngo.igo.javaclient.Config;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ApiException extends Exception {
    protected final Status mStatus;

    public ApiException(Status status) {
        int statusCode = status.getStatusCode();
        String statusMessage = status.getStatusMessage() != null ? status.getStatusMessage() : Config.def_additional_assets;
        StringBuilder sb = new StringBuilder(String.valueOf(statusMessage).length() + 13);
        sb.append(statusCode);
        sb.append(": ");
        sb.append(statusMessage);
        super(sb.toString());
        this.mStatus = status;
    }

    public int getStatusCode() {
        return this.mStatus.getStatusCode();
    }

    @Deprecated
    public String getStatusMessage() {
        return this.mStatus.getStatusMessage();
    }
}
