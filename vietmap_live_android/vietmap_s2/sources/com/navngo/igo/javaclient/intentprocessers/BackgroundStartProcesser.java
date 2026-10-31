package com.navngo.igo.javaclient.intentprocessers;

import android.content.Intent;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.IgoActivity;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BackgroundStartProcesser implements IIntentProcesser {
    private static final String logname = "BackgroundStartProcesser";
    private boolean mHandled = false;

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        return intent.getBooleanExtra("isBootOnBackground", false);
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        IgoActivity igoActivity;
        if (!matchesIntent(intent) || this.mHandled || (igoActivity = Application.getIgoActivity()) == null) {
            return false;
        }
        igoActivity.moveTaskToBack(true);
        this.mHandled = true;
        return true;
    }
}
