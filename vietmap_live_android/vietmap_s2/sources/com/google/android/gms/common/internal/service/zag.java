package com.google.android.gms.common.internal.service;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.internal.BaseImplementation;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
abstract class zag<R extends Result> extends BaseImplementation.ApiMethodImpl<R, zai> {
    public zag(GoogleApiClient googleApiClient) {
        super(Common.API, googleApiClient);
    }
}
