package com.android.billingclient.api;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PriceChangeFlowParams {
    private SkuDetails zza;

    /* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
    public static class Builder {
        private SkuDetails zza;

        public PriceChangeFlowParams build() {
            if (this.zza == null) {
                throw new IllegalArgumentException("SkuDetails must be set");
            }
            PriceChangeFlowParams priceChangeFlowParams = new PriceChangeFlowParams();
            priceChangeFlowParams.zza = this.zza;
            return priceChangeFlowParams;
        }

        public Builder setSkuDetails(SkuDetails skuDetails) {
            this.zza = skuDetails;
            return this;
        }
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public SkuDetails getSkuDetails() {
        return this.zza;
    }
}
