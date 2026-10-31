package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.IInterface;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class zzn extends com.google.android.gms.internal.common.zzb implements zzm {
    public static zzm zzc(IBinder iBinder) {
        if (iBinder == null) {
            return null;
        }
        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IGoogleCertificatesApi");
        if (iInterfaceQueryLocalInterface instanceof zzm) {
            return (zzm) iInterfaceQueryLocalInterface;
        }
        return new zzo(iBinder);
    }
}
