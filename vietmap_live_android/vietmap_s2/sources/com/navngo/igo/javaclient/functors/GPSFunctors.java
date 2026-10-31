package com.navngo.igo.javaclient.functors;

import android.content.Intent;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.LocationListenerImpl;
import com.navngo.igo.javaclient.NmeaListenerImpl;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GPSFunctors implements IFunctorCollection {
    static final String logname = "GPSFunctors";

    public boolean isGpsProviderEnabled() {
        boolean z = (LocationListenerImpl.isGpsDenied() && NmeaListenerImpl.isGpsDenied()) ? false : true;
        DebugLogger.D2(logname, String.format("isGpsProviderEnabled = %b", Boolean.valueOf(z)));
        return z;
    }

    public void openLocationSettingsDialog() {
        Application.getIgoActivity().startActivity(new Intent("android.settings.LOCATION_SOURCE_SETTINGS"));
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.gps.is_gps_enabled", this, "isGpsProviderEnabled");
        androidGo.registerFunctor("android.gps.open_location_settings_dialog", this, "openLocationSettingsDialog");
    }
}
