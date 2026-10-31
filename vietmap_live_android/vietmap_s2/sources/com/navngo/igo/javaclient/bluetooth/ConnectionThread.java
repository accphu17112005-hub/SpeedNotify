package com.navngo.igo.javaclient.bluetooth;

import android.bluetooth.BluetoothServerSocket;
import android.bluetooth.BluetoothSocket;
import com.navngo.igo.javaclient.DebugLogger;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ConnectionThread extends Thread {
    private static final UUID MY_UUID_SECURE = UUID.fromString("36227d3a-61b2-4012-a9f2-b752390a761a");
    private static final String NAME_SECURE = "BluetoothSecure";
    private final String TAG = getClass().getSimpleName();
    private BluetoothService mBlueToothService;
    public boolean mInitSuccess;
    private BluetoothServerSocket mServerSocket;

    public ConnectionThread(BluetoothService bluetoothService) {
        BluetoothServerSocket bluetoothServerSocket;
        InvocationTargetException e;
        NoSuchMethodException e2;
        IllegalAccessException e3;
        this.mInitSuccess = false;
        this.mBlueToothService = bluetoothService;
        BluetoothServerSocket bluetoothServerSocket2 = null;
        while (!this.mInitSuccess) {
            try {
                DebugLogger.D3(this.TAG, "Get Bluetooth socket");
                bluetoothServerSocket = (BluetoothServerSocket) this.mBlueToothService.getAdapter().getClass().getDeclaredMethod("listenUsingRfcommWithServiceRecord", String.class, UUID.class).invoke(this.mBlueToothService.getAdapter(), NAME_SECURE, MY_UUID_SECURE);
                if (bluetoothServerSocket != null) {
                    try {
                        this.mInitSuccess = true;
                        DebugLogger.D3(this.TAG, "Successfully Initialized ConnectionThread.");
                    } catch (IllegalAccessException e4) {
                        e3 = e4;
                        e3.printStackTrace();
                        DebugLogger.D3(this.TAG, "failed IllegalAccessException. " + e3.toString());
                    } catch (NoSuchMethodException e5) {
                        e2 = e5;
                        e2.printStackTrace();
                        DebugLogger.D3(this.TAG, "NoSuchMethodException. " + e2.toString());
                    } catch (InvocationTargetException e6) {
                        e = e6;
                        e.printStackTrace();
                        DebugLogger.D3(this.TAG, "failed InvocationTargetException. " + e.toString());
                    }
                } else {
                    this.mInitSuccess = false;
                    DebugLogger.D3(this.TAG, "ConnectionThread Initialization Failed.");
                }
            } catch (IllegalAccessException e7) {
                bluetoothServerSocket = bluetoothServerSocket2;
                e3 = e7;
            } catch (NoSuchMethodException e8) {
                bluetoothServerSocket = bluetoothServerSocket2;
                e2 = e8;
            } catch (InvocationTargetException e9) {
                bluetoothServerSocket = bluetoothServerSocket2;
                e = e9;
            }
            bluetoothServerSocket2 = bluetoothServerSocket;
        }
        this.mServerSocket = bluetoothServerSocket2;
        this.mBlueToothService.updateState(1);
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        DebugLogger.D3(this.TAG, "ConnectionThread is running...");
        setName("ConnectionThread");
        while (this.mBlueToothService.getState() != 2) {
            try {
                BluetoothSocket bluetoothSocketAccept = this.mServerSocket.accept();
                DebugLogger.D3(this.TAG, "ConnectionThread -  Successful Connection !");
                if (bluetoothSocketAccept != null) {
                    synchronized (this.mBlueToothService) {
                        int state = this.mBlueToothService.getState();
                        if (state == 1) {
                            DebugLogger.D3(this.TAG, "ConnectionThread connected");
                            this.mBlueToothService.connected(bluetoothSocketAccept, bluetoothSocketAccept.getRemoteDevice(), "secure");
                        } else if (state == 2) {
                            DebugLogger.D3(this.TAG, "ConnectionThread close socket");
                            try {
                                bluetoothSocketAccept.close();
                            } catch (IOException e) {
                                DebugLogger.D3(this.TAG, "Could not close unwanted socket. " + e.toString());
                            }
                        }
                    }
                }
            } catch (IOException e2) {
                DebugLogger.D3(this.TAG, "Socket accept() failed. " + e2.toString());
                return;
            }
        }
    }

    public void cancel() {
        DebugLogger.D3(this.TAG, "connection canceled!");
        try {
            this.mServerSocket.close();
        } catch (IOException e) {
            DebugLogger.D3(this.TAG, "Failed to close server socket : " + e.toString());
        }
    }
}
