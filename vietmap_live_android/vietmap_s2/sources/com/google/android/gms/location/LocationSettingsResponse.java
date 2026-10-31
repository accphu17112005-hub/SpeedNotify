package com.google.android.gms.location;

import com.google.android.gms.common.api.Response;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationSettingsResponse extends Response<LocationSettingsResult> {
    public LocationSettingsStates getLocationSettingsStates() {
        return getResult().getLocationSettingsStates();
    }
}
