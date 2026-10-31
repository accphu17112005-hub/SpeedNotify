package com.google.android.gms.internal.location;

import android.os.DeadObjectException;
import android.os.IInterface;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface zzbj<T extends IInterface> {
    void checkConnected();

    T getService() throws DeadObjectException;
}
