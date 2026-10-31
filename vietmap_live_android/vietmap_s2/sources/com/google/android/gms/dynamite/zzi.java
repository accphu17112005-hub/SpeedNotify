package com.google.android.gms.dynamite;

import android.os.IInterface;
import android.os.RemoteException;
import com.google.android.gms.dynamic.IObjectWrapper;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface zzi extends IInterface {
    int zza(IObjectWrapper iObjectWrapper, String str, boolean z) throws RemoteException;

    IObjectWrapper zza(IObjectWrapper iObjectWrapper, String str, int i) throws RemoteException;

    int zzaj() throws RemoteException;

    int zzb(IObjectWrapper iObjectWrapper, String str, boolean z) throws RemoteException;

    IObjectWrapper zzb(IObjectWrapper iObjectWrapper, String str, int i) throws RemoteException;
}
