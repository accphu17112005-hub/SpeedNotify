package com.google.android.gms.common.api;

import com.google.android.gms.common.api.Result;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Response<T extends Result> {
    private T zzao;

    public Response() {
    }

    protected Response(T t) {
        this.zzao = t;
    }

    protected T getResult() {
        return this.zzao;
    }

    public void setResult(T t) {
        this.zzao = t;
    }
}
