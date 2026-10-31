package com.google.android.gms.common.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class BinderWrapper implements Parcelable {
    public static final Parcelable.Creator<BinderWrapper> CREATOR = new zza();
    private IBinder zzcy;

    public BinderWrapper() {
        this.zzcy = null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public BinderWrapper(IBinder iBinder) {
        this.zzcy = iBinder;
    }

    private BinderWrapper(Parcel parcel) {
        this.zzcy = null;
        this.zzcy = parcel.readStrongBinder();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeStrongBinder(this.zzcy);
    }

    /* synthetic */ BinderWrapper(Parcel parcel, zza zzaVar) {
        this(parcel);
    }
}
