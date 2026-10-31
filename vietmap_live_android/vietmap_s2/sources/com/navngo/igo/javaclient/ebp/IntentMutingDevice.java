package com.navngo.igo.javaclient.ebp;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IntentMutingDevice extends MutingDeviceBase implements IMutingDevice {
    private static void SendIntent(String str) {
        Context applicationContext = Application.getIgoActivity().getApplicationContext();
        Intent intent = new Intent(str);
        if (Config.IMD_category.length() > 0) {
            intent.addCategory(Config.IMD_category);
        }
        if (Config.IMD_component.length() > 0) {
            intent.setComponent(ComponentName.unflattenFromString(Config.IMD_component));
        } else {
            applicationContext.sendBroadcast(intent);
        }
    }

    public static void onExitPressed() {
        DebugLogger.D4("IntentMutingDevice", "onExitPressed");
        SendIntent(Config.IMD_exit_action);
    }

    public IntentMutingDevice() {
        AndroidGo.getInstance().registerFunctor("android.on_exit_pressed", this, "onExitPressed");
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Mute(int i, int i2, int i3) {
        DebugLogger.D4("IntentMutingDevice", "Mute Intent: " + Config.IMD_start_action);
        SendIntent(Config.IMD_start_action);
        if (Config.IMD_app_mute) {
            AudiofocusChanged(0, i);
        }
    }

    @Override // com.navngo.igo.javaclient.ebp.IMutingDevice
    public void Unmute() {
        DebugLogger.D4("IntentMutingDevice", "Unmute Intent: " + Config.IMD_stop_action);
        SendIntent(Config.IMD_stop_action);
        if (Config.IMD_app_mute) {
            AudiofocusChanged(1, 0);
        }
    }
}
