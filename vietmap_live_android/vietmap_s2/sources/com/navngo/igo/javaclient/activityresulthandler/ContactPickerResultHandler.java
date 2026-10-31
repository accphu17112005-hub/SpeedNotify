package com.navngo.igo.javaclient.activityresulthandler;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ContactPickerResultHandler implements IActivityResultHandler {
    public static final int REQUEST_CODE = 1248;
    protected static final String logname = "ContactPickerResultHandler";
    private Activity mActivity;
    private String mContactCallbackScript = "sc_contact_callback";

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public int getHandledRequestCode() {
        return REQUEST_CODE;
    }

    public ContactPickerResultHandler(Activity activity) {
        this.mActivity = activity;
        AndroidGo.getInstance().registerFunctor("android.contacts.set_callback", this, "setContactCallbackScript");
    }

    public void setContactCallbackScript(String str) {
        this.mContactCallbackScript = str;
    }

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public void handleActivityResult(int i, Intent intent) {
        Cursor cursorManagedQuery;
        AndroidGo androidGo = AndroidGo.getInstance();
        if (i == -1 && (cursorManagedQuery = this.mActivity.managedQuery(intent.getData(), null, null, null, null)) != null && cursorManagedQuery.moveToFirst()) {
            Integer numValueOf = Integer.valueOf(cursorManagedQuery.getInt(cursorManagedQuery.getColumnIndex("_id")));
            DebugLogger.D3(logname, "handleActivityResult contactID: " + numValueOf);
            androidGo.callUI(this.mContactCallbackScript, null, true, numValueOf);
            return;
        }
        androidGo.callUI(this.mContactCallbackScript, null, false, 0);
    }
}
