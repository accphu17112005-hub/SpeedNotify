package com.navngo.igo.javaclient.utils;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum ActivityState {
    INSTANCE;

    private Boolean resumed = false;

    ActivityState() {
    }

    public void setResumed(Boolean bool) {
        this.resumed = bool;
    }

    public Boolean isResumed() {
        return this.resumed;
    }
}
