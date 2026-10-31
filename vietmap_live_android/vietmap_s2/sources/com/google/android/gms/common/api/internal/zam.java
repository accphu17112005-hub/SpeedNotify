package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zam {
    private final int zadg;
    private final ConnectionResult zadh;

    zam(ConnectionResult connectionResult, int i) {
        Preconditions.checkNotNull(connectionResult);
        this.zadh = connectionResult;
        this.zadg = i;
    }

    final int zar() {
        return this.zadg;
    }

    final ConnectionResult getConnectionResult() {
        return this.zadh;
    }
}
