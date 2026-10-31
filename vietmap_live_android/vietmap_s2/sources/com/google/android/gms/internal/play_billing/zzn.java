package com.google.android.gms.internal.play_billing;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzn<E> extends zzl<E> {
    private final zzp<E> zza;

    zzn(zzp<E> zzpVar, int i) {
        super(zzpVar.size(), i);
        this.zza = zzpVar;
    }

    @Override // com.google.android.gms.internal.play_billing.zzl
    protected final E zza(int i) {
        return this.zza.get(i);
    }
}
