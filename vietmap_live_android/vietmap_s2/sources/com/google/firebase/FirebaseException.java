package com.google.firebase;

import com.google.android.gms.common.internal.Preconditions;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class FirebaseException extends Exception {
    @Deprecated
    protected FirebaseException() {
    }

    public FirebaseException(String str) {
        super(Preconditions.checkNotEmpty(str, "Detail message must not be empty"));
    }

    public FirebaseException(String str, Throwable th) {
        super(Preconditions.checkNotEmpty(str, "Detail message must not be empty"), th);
    }
}
