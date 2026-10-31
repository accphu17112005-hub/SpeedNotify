package com.android.billingclient.api;

import com.android.billingclient.api.Purchase;
import java.util.concurrent.Callable;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzz implements Callable<Purchase.PurchasesResult> {
    final /* synthetic */ String zza;
    final /* synthetic */ BillingClientImpl zzb;

    zzz(BillingClientImpl billingClientImpl, String str) {
        this.zzb = billingClientImpl;
        this.zza = str;
    }

    @Override // java.util.concurrent.Callable
    public final /* bridge */ /* synthetic */ Purchase.PurchasesResult call() throws Exception {
        return BillingClientImpl.zzk(this.zzb, this.zza);
    }
}
