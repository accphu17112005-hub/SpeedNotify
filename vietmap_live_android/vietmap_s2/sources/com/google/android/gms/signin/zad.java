package com.google.android.gms.signin;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.internal.IAccountAccessor;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface zad extends Api.Client {
    void connect();

    void zaa(IAccountAccessor iAccountAccessor, boolean z);

    void zaa(com.google.android.gms.signin.internal.zad zadVar);

    void zacv();
}
