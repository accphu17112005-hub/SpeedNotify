package com.google.android.gms.common.api.internal;

import android.os.RemoteException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface RemoteCall<T, U> {
    void accept(T t, U u) throws RemoteException;
}
