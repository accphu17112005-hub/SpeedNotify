package com.navngo.igo.javaclient;

import android.content.SharedPreferences;
import android.os.Build;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class HttpLogFunctors implements IFunctorCollection {
    private final String SHARED_PREFERENCES_NAME = "PrimoServiceSharedPreferences";
    private final String PHONE_NUMBER = "phoneNumber";
    private final String TOKEN = "token";
    private SharedPreferences preferences = Application.anApplication.getSharedPreferences("PrimoServiceSharedPreferences", 0);

    public String getPhoneNumber() {
        return Encryptor.decrypt(this.preferences.getString("phoneNumber", Config.def_additional_assets));
    }

    public String getToken() {
        return Encryptor.decrypt(this.preferences.getString("token", Config.def_additional_assets));
    }

    public String getHardwareInfo(int i) {
        String str = ",\\\"model\\\":\\\"" + Build.MODEL + "\\\",\\\"product\\\":\\\"" + Build.PRODUCT + "\\\",\\\"brand\\\":\\\"" + Build.BRAND + "\\\",\\\"hardware\\\":\\\"" + Build.HARDWARE + "\\\",\\\"os_ver\\\":\\\"" + Build.VERSION.RELEASE + "\\\"";
        if (i == 0 || i == 3) {
            str = str + ",\\\"fw_ver\\\":\\\"" + Build.DISPLAY + "\\\"";
        }
        DebugLogger.D3("HttpLogFunctors", "Getting hw info json string: " + str);
        return str;
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("vietmap.getPhoneNumber", this, "getPhoneNumber");
        AndroidGo.getInstance().registerFunctor("vietmap.getToken", this, "getToken");
        AndroidGo.getInstance().registerFunctor("vietmap.getHardwareInfo", this, "getHardwareInfo");
    }
}
