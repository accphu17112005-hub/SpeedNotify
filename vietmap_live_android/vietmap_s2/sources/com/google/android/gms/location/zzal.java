package com.google.android.gms.location;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.Preconditions;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelWriter;
import com.navngo.igo.javaclient.Config;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class zzal extends AbstractSafeParcelable {
    public static final Parcelable.Creator<zzal> CREATOR = new zzam();
    private final String tag;
    private final List<String> zzbu;
    private final PendingIntent zzbv;

    zzal(List<String> list, PendingIntent pendingIntent, String str) {
        this.zzbu = list == null ? Collections.emptyList() : Collections.unmodifiableList(list);
        this.zzbv = pendingIntent;
        this.tag = str;
    }

    public static zzal zza(PendingIntent pendingIntent) {
        Preconditions.checkNotNull(pendingIntent, "PendingIntent can not be null.");
        return new zzal(null, pendingIntent, Config.def_additional_assets);
    }

    public static zzal zza(List<String> list) {
        Preconditions.checkNotNull(list, "geofence can't be null.");
        Preconditions.checkArgument(!list.isEmpty(), "Geofences must contains at least one id.");
        return new zzal(list, null, Config.def_additional_assets);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iBeginObjectHeader = SafeParcelWriter.beginObjectHeader(parcel);
        SafeParcelWriter.writeStringList(parcel, 1, this.zzbu, false);
        SafeParcelWriter.writeParcelable(parcel, 2, this.zzbv, i, false);
        SafeParcelWriter.writeString(parcel, 3, this.tag, false);
        SafeParcelWriter.finishObjectHeader(parcel, iBeginObjectHeader);
    }
}
