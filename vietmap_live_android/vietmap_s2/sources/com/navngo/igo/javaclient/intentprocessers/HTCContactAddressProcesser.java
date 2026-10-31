package com.navngo.igo.javaclient.intentprocessers;

import android.content.Intent;
import android.os.Bundle;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.address.AddressResolver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class HTCContactAddressProcesser implements IIntentProcesser {
    private String getAddressFromIntent(Intent intent) {
        Bundle bundle;
        Bundle extras = intent.getExtras();
        if (extras == null || (bundle = extras.getBundle("REVERSE_ADDR_ON_MAP_BUNDLE")) == null) {
            return null;
        }
        return bundle.getString("Address");
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean matchesIntent(Intent intent) {
        String addressFromIntent = getAddressFromIntent(intent);
        return (addressFromIntent == null || addressFromIntent == Config.def_additional_assets) ? false : true;
    }

    @Override // com.navngo.igo.javaclient.intentprocessers.IIntentProcesser
    public boolean processIntent(Intent intent) {
        String addressFromIntent = getAddressFromIntent(intent);
        if (addressFromIntent == null || addressFromIntent == Config.def_additional_assets) {
            return false;
        }
        AddressResolver.getResolver().jumpToAddressSelective(null, addressFromIntent);
        return true;
    }
}
