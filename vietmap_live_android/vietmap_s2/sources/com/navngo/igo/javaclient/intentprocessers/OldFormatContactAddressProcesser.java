package com.navngo.igo.javaclient.intentprocessers;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.provider.Contacts;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.address.AddressResolver;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.utils.GPSUtils;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class OldFormatContactAddressProcesser implements IIntentProcesser {
    private Context mContext;

    public OldFormatContactAddressProcesser(Context context) {
        this.mContext = context;
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        return "content".equals(intent.getScheme()) && intent.getData() != null && "contacts".equals(intent.getData().getHost());
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        boolean z = false;
        if (matchesIntent(intent)) {
            String[] strArrSplit = intent.getData().getPath().split("/");
            Cursor cursorQuery = this.mContext.getContentResolver().query(Contacts.ContactMethods.CONTENT_URI, new String[]{"data"}, "contact_methods.person=? AND contact_methods._id=?", new String[]{Config.def_additional_assets + strArrSplit[2], Config.def_additional_assets + strArrSplit[4]}, null);
            if (cursorQuery.moveToFirst()) {
                String string = cursorQuery.getString(0);
                GCoor positionFromAddress = GPSUtils.getPositionFromAddress(string);
                if (positionFromAddress != null) {
                    AddressResolver.getResolver().jumpToPosition(positionFromAddress);
                } else {
                    AddressResolver.getResolver().jumpToAddressSelective(null, string);
                }
                z = true;
            }
            cursorQuery.close();
        }
        return z;
    }
}
