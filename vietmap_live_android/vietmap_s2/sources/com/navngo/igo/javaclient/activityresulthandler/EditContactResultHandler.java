package com.navngo.igo.javaclient.activityresulthandler;

import android.content.Intent;
import com.navngo.igo.javaclient.functors.MailSmsContacts;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class EditContactResultHandler implements IActivityResultHandler {
    public static final int REQUEST_CODE = 1249;
    private MailSmsContacts mMailSmsContacts;

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public int getHandledRequestCode() {
        return REQUEST_CODE;
    }

    public EditContactResultHandler(MailSmsContacts mailSmsContacts) {
        this.mMailSmsContacts = mailSmsContacts;
    }

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public void handleActivityResult(int i, Intent intent) {
        if (i != -1) {
            this.mMailSmsContacts.deleteRecentlyInserted();
        } else {
            this.mMailSmsContacts.resetRecentlyInserted();
        }
    }
}
