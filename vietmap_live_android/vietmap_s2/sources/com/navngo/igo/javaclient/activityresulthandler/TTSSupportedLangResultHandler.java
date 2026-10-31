package com.navngo.igo.javaclient.activityresulthandler;

import android.content.Intent;
import com.navngo.igo.javaclient.tts.TTSSpeaker;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class TTSSupportedLangResultHandler implements IActivityResultHandler {
    public static final int REQUEST_CODE = 1250;
    private TTSSpeaker mTTSSpeaker;

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public int getHandledRequestCode() {
        return REQUEST_CODE;
    }

    public TTSSupportedLangResultHandler(TTSSpeaker tTSSpeaker) {
        this.mTTSSpeaker = tTSSpeaker;
    }

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public void handleActivityResult(int i, Intent intent) {
        TTSSpeaker tTSSpeaker = this.mTTSSpeaker;
        if (tTSSpeaker != null) {
            tTSSpeaker.onActivityResult(REQUEST_CODE, i, intent);
        }
    }
}
