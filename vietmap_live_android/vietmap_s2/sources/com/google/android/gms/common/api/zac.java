package com.google.android.gms.common.api;

import java.util.Map;
import java.util.WeakHashMap;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class zac {
    private static final Map<Object, zac> zacj = new WeakHashMap();
    private static final Object sLock = new Object();

    public abstract void remove(int i);
}
