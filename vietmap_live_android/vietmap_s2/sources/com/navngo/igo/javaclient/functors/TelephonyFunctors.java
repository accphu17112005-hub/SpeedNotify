package com.navngo.igo.javaclient.functors;

import android.telephony.TelephonyManager;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class TelephonyFunctors implements IFunctorCollection {
    public String getSimOperator() {
        TelephonyManager telephonyManager = (TelephonyManager) Application.anApplication.getSystemService("phone");
        return (telephonyManager == null || telephonyManager.getSimState() != 5) ? "SIM_NA" : telephonyManager.getSimOperator();
    }

    public String getGsmNetworkOperator() {
        TelephonyManager telephonyManager = (TelephonyManager) Application.anApplication.getSystemService("phone");
        return (telephonyManager == null || telephonyManager.getPhoneType() != 1) ? "NOT_GSM" : telephonyManager.getNetworkOperator();
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.telephony.getSimOperator", this, "getSimOperator");
        androidGo.registerFunctor("android.telephony.getGsmNetworkOperator", this, "getGsmNetworkOperator");
    }
}
