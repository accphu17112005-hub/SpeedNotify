package com.navngo.igo.javaclient.bluetooth;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BluetoothService {
    public static final int STATE_CONNECTED = 2;
    public static final int STATE_LISTEN = 1;
    public static final int STATE_NONE = 0;
    private final String TAG;
    private final BluetoothAdapter mAdapter;
    private CommunicationThread mCommunicationThread;
    private ConnectionThread mConnectionThread;
    private int mState;

    public BluetoothService(Context context) {
        String simpleName = getClass().getSimpleName();
        this.TAG = simpleName;
        BluetoothAdapter defaultAdapter = BluetoothAdapter.getDefaultAdapter();
        this.mAdapter = defaultAdapter;
        this.mState = 0;
        if (defaultAdapter != null) {
            DebugLogger.D3(simpleName, "BluetoothAdapter is enabled : " + defaultAdapter.isEnabled());
            return;
        }
        DebugLogger.D3(simpleName, "BluetoothAdapter is null");
    }

    public BluetoothAdapter getAdapter() {
        return this.mAdapter;
    }

    public synchronized void updateState(int i) {
        DebugLogger.D3(this.TAG, "State updated: " + this.mState + " -> " + i);
        this.mState = i;
        if (i == 2) {
            BluetoothServiceHandler.INSTANCE.handleConnectionStatus(1, Config.def_additional_assets);
        }
    }

    public synchronized int getState() {
        return this.mState;
    }

    public synchronized void start() {
        DebugLogger.D3(this.TAG, "Start bluetooth service...");
        CommunicationThread communicationThread = this.mCommunicationThread;
        if (communicationThread != null) {
            communicationThread.cancel();
            this.mCommunicationThread = null;
        }
        if (this.mConnectionThread == null) {
            ConnectionThread connectionThread = new ConnectionThread(this);
            this.mConnectionThread = connectionThread;
            connectionThread.start();
        }
    }

    public synchronized void connected(BluetoothSocket bluetoothSocket, BluetoothDevice bluetoothDevice, String str) {
        CommunicationThread communicationThread = this.mCommunicationThread;
        if (communicationThread != null) {
            communicationThread.cancel();
            this.mCommunicationThread = null;
        }
        ConnectionThread connectionThread = this.mConnectionThread;
        if (connectionThread != null) {
            connectionThread.cancel();
            this.mConnectionThread = null;
        }
        CommunicationThread communicationThread2 = new CommunicationThread(this, bluetoothSocket, str);
        this.mCommunicationThread = communicationThread2;
        communicationThread2.start();
        BluetoothServiceHandler.INSTANCE.setConnectedDeviceName(bluetoothDevice.getName());
    }

    public synchronized void stop() {
        DebugLogger.D3(this.TAG, "Stop all threads...");
        CommunicationThread communicationThread = this.mCommunicationThread;
        if (communicationThread != null) {
            communicationThread.cancel();
            this.mCommunicationThread = null;
        }
        ConnectionThread connectionThread = this.mConnectionThread;
        if (connectionThread != null) {
            connectionThread.cancel();
            this.mConnectionThread = null;
        }
        updateState(0);
    }

    public void write(byte[] bArr) {
        DebugLogger.D3(this.TAG, "CommunicationThread write...");
        synchronized (this) {
            if (this.mState != 2) {
                DebugLogger.D3(this.TAG, "Error - Not connected !!!");
            } else {
                this.mCommunicationThread.write(bArr);
            }
        }
    }

    private void connectionFailed() {
        DebugLogger.D3(this.TAG, "Connection Failed !");
        BluetoothServiceHandler.INSTANCE.handleConnectionStatus(2, "Unable to connect device");
        updateState(0);
        start();
    }

    public void connectionLost() {
        DebugLogger.D3(this.TAG, "Connection Lost !");
        BluetoothServiceHandler.INSTANCE.handleConnectionStatus(2, "Device connection was lost");
        updateState(0);
        start();
    }
}
