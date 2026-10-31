package com.navngo.igo.javaclient.intentprocessers;

import android.content.Intent;
import com.navngo.igo.javaclient.address.AddressResolver;
import com.navngo.igo.javaclient.address.StructuredAddress;
import com.navngo.igo.javaclient.androidgo.types.GCoor;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class NavigateToProcesser implements IIntentProcesser {
    public static String ACTION_NAVIGATE_TO = "com.navngo.igo.javaclient.NAVIGATE_TO";
    public static String EXTRA_CITY = "com.navngo.igo.address.CITY";
    public static String EXTRA_COUNTRY = "com.navngo.igo.address.COUNTRY";
    public static String EXTRA_LATITUDE = "com.navngo.igo.address.LATITUDE";
    public static String EXTRA_LONGITUDE = "com.navngo.igo.address.LONGITUDE";
    public static String EXTRA_NUMBER = "com.navngo.igo.address.NUMBER";
    public static String EXTRA_PREFER_COORDINATE_OVER_ADDRESS = "com.navngo.igo.address.PREFER_COORDINATE_OVER_ADDRESS";
    public static String EXTRA_STATE = "com.navngo.igo.address.STATE";
    public static String EXTRA_STREET = "com.navngo.igo.address.STREET";
    public static String EXTRA_ZIP = "com.navngo.igo.address.ZIP";
    public static String MIMETYPE = "vnd.navngo.igo.item/address";

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        return ACTION_NAVIGATE_TO.equals(intent.getAction()) && MIMETYPE.equals(intent.getType());
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        if (!matchesIntent(intent)) {
            return false;
        }
        boolean booleanExtra = intent.getBooleanExtra(EXTRA_PREFER_COORDINATE_OVER_ADDRESS, true);
        GCoor gCoor = new GCoor(intent.getDoubleExtra(EXTRA_LATITUDE, 250.0d), intent.getDoubleExtra(EXTRA_LONGITUDE, 250.0d));
        if (gCoor.isValid() && booleanExtra) {
            AddressResolver.getResolver().jumpToPosition(gCoor);
            return true;
        }
        StructuredAddress structuredAddress = new StructuredAddress(intent.getStringExtra(EXTRA_COUNTRY), intent.getStringExtra(EXTRA_STATE), intent.getStringExtra(EXTRA_CITY), intent.getStringExtra(EXTRA_STREET), intent.getStringExtra(EXTRA_ZIP));
        if (booleanExtra) {
            return AddressResolver.getResolver().jumpToAddress(structuredAddress);
        }
        return AddressResolver.getResolver().jumpToAddressOrPosition(structuredAddress, gCoor);
    }
}
