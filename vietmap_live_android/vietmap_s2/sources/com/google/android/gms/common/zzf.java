package com.google.android.gms.common;

import java.util.Arrays;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class zzf extends zze {
    private final byte[] zzu;

    zzf(byte[] bArr) {
        super(Arrays.copyOfRange(bArr, 0, 25));
        this.zzu = bArr;
    }

    @Override // com.google.android.gms.common.zze
    final byte[] getBytes() {
        return this.zzu;
    }
}
