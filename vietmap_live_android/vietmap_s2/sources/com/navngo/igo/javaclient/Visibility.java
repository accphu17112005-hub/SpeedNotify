package com.navngo.igo.javaclient;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum Visibility {
    INSTANCE;

    private static boolean activityVisible;

    public static boolean visible() {
        return activityVisible;
    }

    public static void setVisibility(boolean z) {
        activityVisible = z;
    }
}
