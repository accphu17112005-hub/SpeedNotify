package com.navngo.igo.javaclient.activityresulthandler;

import android.content.Intent;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface IActivityResultHandler {
    int getHandledRequestCode();

    void handleActivityResult(int i, Intent intent);
}
