package com.google.android.gms.common.api.internal;

import com.google.android.gms.common.api.Api;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class zabw {
    public final RegisterListenerMethod<Api.AnyClient, ?> zajw;
    public final UnregisterListenerMethod<Api.AnyClient, ?> zajx;

    public zabw(RegisterListenerMethod<Api.AnyClient, ?> registerListenerMethod, UnregisterListenerMethod<Api.AnyClient, ?> unregisterListenerMethod) {
        this.zajw = registerListenerMethod;
        this.zajx = unregisterListenerMethod;
    }
}
