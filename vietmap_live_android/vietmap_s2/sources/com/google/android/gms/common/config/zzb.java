package com.google.android.gms.common.config;

import com.google.android.gms.common.config.GservicesValue;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzb extends GservicesValue<Long> {
    zzb(String str, Long l) {
        super(str, l);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.gms.common.config.GservicesValue
    protected final /* synthetic */ Long zzd(String str) {
        GservicesValue.zza zzaVar = null;
        return zzaVar.getLong(this.mKey, (Long) this.zzbp);
    }
}
