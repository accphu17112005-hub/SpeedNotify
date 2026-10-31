package com.navngo.igo.javaclient.bluetooth;

import android.bluetooth.BluetoothSocket;
import com.navngo.igo.javaclient.DebugLogger;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CommunicationThread extends Thread {
    private final String TAG;
    private BluetoothService mBluetoothService;
    private final InputStream mInStream;
    private final OutputStream mOutStream;
    private final BluetoothSocket mSocket;

    public CommunicationThread(BluetoothService bluetoothService, BluetoothSocket bluetoothSocket, String str) {
        IOException iOException;
        OutputStream outputStream;
        InputStream inputStream;
        String simpleName = getClass().getSimpleName();
        this.TAG = simpleName;
        DebugLogger.D3(simpleName, "Create ConnectedThread: " + str);
        this.mSocket = bluetoothSocket;
        this.mBluetoothService = bluetoothService;
        InputStream inputStream2 = null;
        OutputStream outputStream2 = null;
        try {
            inputStream = bluetoothSocket.getInputStream();
        } catch (IOException e) {
            iOException = e;
            outputStream = null;
        }
        try {
            outputStream2 = bluetoothSocket.getOutputStream();
            DebugLogger.D3(simpleName, "Temporary socket streams are created");
        } catch (IOException e2) {
            outputStream = outputStream2;
            inputStream2 = inputStream;
            iOException = e2;
            DebugLogger.D3(this.TAG, "Temporary socket stream Exception! " + iOException.toString());
            inputStream = inputStream2;
            outputStream2 = outputStream;
        }
        this.mInStream = inputStream;
        this.mOutStream = outputStream2;
        this.mBluetoothService.updateState(2);
        DebugLogger.D3(this.TAG, "State is now connected.");
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        DebugLogger.D3(this.TAG, "ConnectedThread - run");
        byte[] bArr = new byte[1024];
        while (this.mBluetoothService.getState() == 2) {
            try {
                this.mInStream.read(bArr);
                BluetoothServiceHandler.INSTANCE.receiveMessage(new String(bArr, StandardCharsets.UTF_8));
            } catch (IOException e) {
                DebugLogger.D3(this.TAG, "Disconnected " + e.toString());
                this.mBluetoothService.connectionLost();
                return;
            }
        }
    }

    public void write(byte[] bArr) {
        DebugLogger.D3(this.TAG, "ConnectedThread write");
        try {
            this.mOutStream.write(bArr);
            this.mOutStream.flush();
            String str = new String(bArr, "UTF-8");
            DebugLogger.D3(this.TAG, "Buffer: " + str);
        } catch (IOException e) {
            DebugLogger.D3(this.TAG, "Exception during ConnectedThread write! " + e.toString());
        }
    }

    public void cancel() {
        try {
            this.mSocket.close();
        } catch (IOException e) {
            DebugLogger.D3(this.TAG, "close() of connect socket failed" + e.toString());
        }
    }
}
