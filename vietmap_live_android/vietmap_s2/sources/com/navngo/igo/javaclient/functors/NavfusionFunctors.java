package com.navngo.igo.javaclient.functors;

import android.bluetooth.BluetoothAdapter;
import android.net.wifi.WifiManager;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Collections;
import java.util.Iterator;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class NavfusionFunctors implements IFunctorCollection {
    private static final String logname = "NavfusionFunctors";
    private WifiManager.MulticastLock mMulticastLock;

    public String GetFriendlyName() {
        try {
            BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
            if (defaultAdapter == null) {
                DebugLogger.D2(logname, "Bluetooth not supported");
                return Config.def_additional_assets;
            }
            return defaultAdapter.getName();
        } catch (Exception e) {
            DebugLogger.D1(logname, "GetFriendlyName exception", e);
            return Config.def_additional_assets;
        }
    }

    public String GetInterfaceAddresses() {
        try {
            return GetAllNetworkInterfaceAddresses();
        } catch (SocketException e) {
            DebugLogger.D1(logname, "SocketException while collecting NetworkInterfaces:", e);
            return Config.def_additional_assets;
        }
    }

    public void SetMulticastLock(boolean z) {
        try {
            if (z) {
                WifiManager.MulticastLock multicastLockCreateMulticastLock = ((WifiManager) Application.anApplication.getSystemService("wifi")).createMulticastLock("com.navngo.igo.javaclient.MulticastLock");
                this.mMulticastLock = multicastLockCreateMulticastLock;
                multicastLockCreateMulticastLock.setReferenceCounted(true);
                this.mMulticastLock.acquire();
                DebugLogger.D3(logname, "MulticastLock acquired");
                return;
            }
            WifiManager.MulticastLock multicastLock = this.mMulticastLock;
            if (multicastLock != null) {
                multicastLock.release();
                this.mMulticastLock = null;
            }
            DebugLogger.D3(logname, "MulticastLock released");
        } catch (Exception e) {
            DebugLogger.D1(logname, "Exception while changing wifi lock state:" + z, e);
        }
    }

    String GetAllNetworkInterfaceAddresses() throws SocketException {
        Iterator it = Collections.list(NetworkInterface.getNetworkInterfaces()).iterator();
        String str = Config.def_additional_assets;
        while (it.hasNext()) {
            str = str + GetNetworkInterfaceAddresses((NetworkInterface) it.next()) + ",";
        }
        return str;
    }

    String GetNetworkInterfaceAddresses(NetworkInterface networkInterface) throws SocketException {
        String str = Config.def_additional_assets;
        for (InterfaceAddress interfaceAddress : networkInterface.getInterfaceAddresses()) {
            if (!interfaceAddress.getAddress().isLoopbackAddress() && interfaceAddress.getBroadcast() != null) {
                str = str + interfaceAddress.getAddress().getHostAddress() + "," + interfaceAddress.getBroadcast().getHostAddress() + ",";
            }
        }
        return str;
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.navfusion.get_interface_addresses", this, "GetInterfaceAddresses");
        androidGo.registerFunctor("android.navfusion.get_friendly_name", this, "GetFriendlyName");
        androidGo.registerFunctor("android.navfusion.set_multicast_lock", this, "SetMulticastLock");
    }
}
