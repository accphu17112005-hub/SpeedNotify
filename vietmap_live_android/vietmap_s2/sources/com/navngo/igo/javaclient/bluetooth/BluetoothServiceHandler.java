package com.navngo.igo.javaclient.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum BluetoothServiceHandler {
    INSTANCE;

    public static final int MESSAGE_CONNECTION_ESTABLISHED = 1;
    public static final int MESSAGE_CONNECTION_PROBLEM = 2;
    private BluetoothAdapter mBluetoothAdapter;
    private String mConnectedDeviceName;
    private final String TAG = getClass().getSimpleName();
    private BluetoothService mBluetoothService = null;
    private Context mContext = Application.anApplication.getApplicationContext();

    BluetoothServiceHandler() {
        AndroidGo.getInstance().registerFunctor("android.bluetooth.send_message", this, "sendMessage");
    }

    public static void startBluetoothService() {
        INSTANCE.start();
    }

    public void setConnectedDeviceName(String str) {
        this.mConnectedDeviceName = str;
    }

    public void handleConnectionStatus(int i, String str) {
        if (i == 1) {
            AndroidGo.getInstance().callIgo("android.bluetooth.set_device_connected", null, true);
            DebugLogger.D3(this.TAG, "Connection established with device " + this.mConnectedDeviceName);
            return;
        }
        if (i != 2) {
            return;
        }
        AndroidGo.getInstance().callIgo("android.bluetooth.set_device_connected", null, false);
        DebugLogger.D3(this.TAG, "Connection problem occured with device " + this.mConnectedDeviceName + " : " + str);
    }

    public void start() {
        this.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        try {
            DebugLogger.D3(this.TAG, "Bluetooth initialization...");
            if (this.mBluetoothAdapter == null) {
                DebugLogger.D3(this.TAG, "BluetoothAdapter is not available!");
                return;
            }
            DebugLogger.D3(this.TAG, "BluetoothAdapter is enabled: " + this.mBluetoothAdapter.isEnabled());
            if (!this.mBluetoothAdapter.isEnabled()) {
                DebugLogger.D3(this.TAG, "Request enable Bluetooth before start...");
                if (!this.mBluetoothAdapter.enable()) {
                    DebugLogger.D3(this.TAG, "Error Bluetooth can not enabled!");
                } else {
                    DebugLogger.D3(this.TAG, "Bluetooth successfully enabled!");
                }
            } else {
                DebugLogger.D3(this.TAG, "Bluetooth is already enabled!");
            }
            DebugLogger.D3(this.TAG, "Setting up Bluetooth Service...");
            if (this.mBluetoothService == null && this.mBluetoothAdapter.isEnabled()) {
                DebugLogger.D3(this.TAG, "Start new Bluetooth Service");
                BluetoothService bluetoothService = new BluetoothService(this.mContext);
                this.mBluetoothService = bluetoothService;
                if (bluetoothService.getState() == 0) {
                    DebugLogger.D3(this.TAG, "mBluetoothService.start();");
                    this.mBluetoothService.start();
                } else {
                    DebugLogger.D3(this.TAG, "mBluetoothService is NOT in BluetoothService.STATE_NONE");
                }
            } else if (this.mBluetoothService != null) {
                DebugLogger.D3(this.TAG, "Bluetooth Service already started");
            } else {
                DebugLogger.D3(this.TAG, "Error: Bluetooth is NOT Enabled");
            }
            DebugLogger.D3(this.TAG, "Bluetooth initialization is done!");
        } catch (Exception e) {
            DebugLogger.D3(this.TAG, "Bluetooth initialization Exception" + e.toString());
        }
    }

    public void stop() {
        this.mBluetoothService.stop();
    }

    public void sendMessage(String str) {
        if (this.mBluetoothService.getState() != 2) {
            DebugLogger.D3(this.TAG, "Bluetooth is not connected!");
        } else if (str.length() > 0) {
            this.mBluetoothService.write(str.getBytes());
        }
    }

    public void receiveMessage(String str) {
        AndroidGo.getInstance().callIgo("android.bluetooth.message_received", null, str);
    }
}
