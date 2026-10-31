package com.google.android.gms.auth.api.signin.internal;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class HashAccumulator {
    private static int zaah = 31;
    private int zaai = 1;

    public HashAccumulator addObject(Object obj) {
        this.zaai = (zaah * this.zaai) + (obj == null ? 0 : obj.hashCode());
        return this;
    }

    public final HashAccumulator zaa(boolean z) {
        this.zaai = (zaah * this.zaai) + (z ? 1 : 0);
        return this;
    }

    public int hash() {
        return this.zaai;
    }
}
