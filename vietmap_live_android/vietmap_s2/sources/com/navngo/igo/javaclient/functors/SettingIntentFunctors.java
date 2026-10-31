package com.navngo.igo.javaclient.functors;

import android.content.Intent;
import android.net.wifi.WifiManager;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class SettingIntentFunctors implements IFunctorCollection {
    private static final String logname = "SettingIntentFunctors";

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.showAndroidSettings", this, "showAndroidSettings");
        androidGo.registerFunctor("android.showAndroidTetherSettings", this, "showAndroidTetherSettings");
        androidGo.registerFunctor("android.getWifiApState", this, "getWifiApState");
    }

    public void showAndroidSettings() {
        DebugLogger.D3(logname, "Opening settings intent");
        Application.getIgoActivity().startActivity(new Intent("android.settings.SETTINGS"));
    }

    public void showAndroidTetherSettings() {
        DebugLogger.D3(logname, "Opening tether settings intent");
        Intent intent = new Intent();
        intent.setClassName("com.android.settings", "com.android.settings.TetherSettings");
        Application.getIgoActivity().startActivity(intent);
    }

    public int getWifiApState() {
        try {
            WifiManager wifiManager = (WifiManager) Application.anApplication.getApplicationContext().getSystemService("wifi");
            Method declaredMethod = wifiManager.getClass().getDeclaredMethod("getWifiApState", new Class[0]);
            declaredMethod.setAccessible(true);
            int iIntValue = ((Integer) declaredMethod.invoke(wifiManager, null)).intValue();
            DebugLogger.D3(logname, "Wifi access point state is: " + iIntValue);
            return iIntValue;
        } catch (IllegalAccessException e) {
            DebugLogger.D2(logname, "Unable to get wifi accesspoint state: " + e.getMessage());
            return 11;
        } catch (NoSuchMethodException e2) {
            DebugLogger.D2(logname, "Unable to get wifi accesspoint state: " + e2.getMessage());
            return 11;
        } catch (InvocationTargetException e3) {
            DebugLogger.D2(logname, "Unable to get wifi accesspoint state: " + e3.getMessage());
            return 11;
        }
    }
}
