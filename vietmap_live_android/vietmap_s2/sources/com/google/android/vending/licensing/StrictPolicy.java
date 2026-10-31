package com.google.android.vending.licensing;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class StrictPolicy implements Policy {
    private int mLastResponse = Policy.RETRY;

    @Override // com.google.android.vending.licensing.Policy
    public void processServerResponse(int i, ResponseData responseData) {
        this.mLastResponse = i;
    }

    @Override // com.google.android.vending.licensing.Policy
    public boolean allowAccess() {
        return this.mLastResponse == 256;
    }
}
