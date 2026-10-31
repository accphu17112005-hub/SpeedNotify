package com.navngo.igo.javaclient;

import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class SLAPIService extends Service {
    public static final String BYE_INTENT = "com.navngo.igo.javaclient.SLAPI_SERVER_BYE";
    public static final String HELLO_INTENT = "com.navngo.igo.javaclient.SLAPI_SERVER_HELLO";
    public static final String MSGBOX_INTENT = "com.navngo.igo.javaclient.SLAPI_MESSAGE_BOX_PRESSED";
    public static SLAPIService instance = null;
    private static final String logname = "SLAPIService";
    protected Messenger mMessenger;
    private Object mLock = new Object();
    Map<Integer, Messenger> mClients = new HashMap();
    MsgBoxBroadcastReceiver msgBoxBroadcastReceiver = null;

    @Override // android.app.Service
    public void onCreate() {
        DebugLogger.D5(logname, "SLAPIService.onCreate()");
        instance = this;
        MsgBoxBroadcastReceiver msgBoxBroadcastReceiver = new MsgBoxBroadcastReceiver();
        this.msgBoxBroadcastReceiver = msgBoxBroadcastReceiver;
        registerReceiver(msgBoxBroadcastReceiver, new IntentFilter(MSGBOX_INTENT));
    }

    @Override // android.app.Service
    public void onDestroy() {
        DebugLogger.D5(logname, "SLAPIService.onDestroy()");
        instance = null;
        MsgBoxBroadcastReceiver msgBoxBroadcastReceiver = this.msgBoxBroadcastReceiver;
        if (msgBoxBroadcastReceiver != null) {
            unregisterReceiver(msgBoxBroadcastReceiver);
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        DebugLogger.D5(logname, "SLAPIService.onBind()");
        synchronized (this.mLock) {
            if (this.mMessenger == null) {
                createMessenger();
            }
        }
        return this.mMessenger.getBinder();
    }

    protected void createMessenger() {
        this.mMessenger = new Messenger(new IncomingHandler(this));
    }

    private boolean sendMessage(Integer num, Messenger messenger, Message message) {
        DebugLogger.D5(logname, "Sending message to " + num);
        try {
            messenger.send(message);
            return true;
        } catch (RemoteException unused) {
            DebugLogger.D5(logname, "Removing dead client with Id " + num);
            this.mClients.remove(num);
            return false;
        }
    }

    public static boolean sendSimpleMessage2SLAPIClient(int i, int i2, int i3, int i4) {
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendSimpleMessage2SLAPIClient(i, i2, i3, i4);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:28:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private boolean _sendSimpleMessage2SLAPIClient(int r8, int r9, int r10, int r11) {
        /*
            Method dump skipped, instruction units count: 278
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.SLAPIService._sendSimpleMessage2SLAPIClient(int, int, int, int):boolean");
    }

    public static boolean sendStringMessage2SLAPIClient(int i, int i2, String str) {
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendStringMessage2SLAPIClient(i, i2, str);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:23:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private boolean _sendStringMessage2SLAPIClient(int r6, int r7, java.lang.String r8) {
        /*
            r5 = this;
            java.lang.String r0 = "SLAPIService"
            java.lang.String r1 = "SLAPIService.sendStringMessage2SLAPIClient()"
            com.navngo.igo.javaclient.DebugLogger.D5(r0, r1)
            java.lang.Integer r6 = java.lang.Integer.valueOf(r6)
            android.os.Messenger r1 = r5.getClient(r6)
            r2 = 0
            if (r1 != 0) goto L49
            int r8 = r6.intValue()
            r1 = -1330787753(0xffffffffb0adca57, float:-1.2644915E-9)
            if (r8 != r1) goto L34
            java.lang.StringBuilder r6 = new java.lang.StringBuilder
            r6.<init>()
            java.lang.String r8 = "Broadcast is not allowed for "
            r6.append(r8)
            java.lang.String r7 = com.navngo.igo.javaclient.SLAPIMessageIds.MessageName(r7)
            r6.append(r7)
            java.lang.String r6 = r6.toString()
            com.navngo.igo.javaclient.DebugLogger.D5(r0, r6)
            goto L8d
        L34:
            java.lang.StringBuilder r7 = new java.lang.StringBuilder
            r7.<init>()
            java.lang.String r8 = "Invalid client id:"
            r7.append(r8)
            r7.append(r6)
            java.lang.String r6 = r7.toString()
            com.navngo.igo.javaclient.DebugLogger.D5(r0, r6)
            goto L8d
        L49:
            r3 = 0
            android.os.Message r3 = android.os.Message.obtain(r3, r7)
            r4 = 314(0x13a, float:4.4E-43)
            if (r7 == r4) goto L7d
            r4 = 315(0x13b, float:4.41E-43)
            if (r7 == r4) goto L7d
            r4 = 325(0x145, float:4.55E-43)
            if (r7 == r4) goto L73
            java.lang.StringBuilder r8 = new java.lang.StringBuilder
            r8.<init>()
            java.lang.String r4 = "(String) is wrong signature for message "
            r8.append(r4)
            java.lang.String r7 = com.navngo.igo.javaclient.SLAPIMessageIds.MessageName(r7)
            r8.append(r7)
            java.lang.String r7 = r8.toString()
            com.navngo.igo.javaclient.DebugLogger.D5(r0, r7)
            goto L87
        L73:
            android.os.Bundle r7 = r3.getData()
            java.lang.String r0 = "Version"
            r7.putString(r0, r8)
            goto L86
        L7d:
            android.os.Bundle r7 = r3.getData()
            java.lang.String r0 = "Address"
            r7.putString(r0, r8)
        L86:
            r2 = 1
        L87:
            if (r2 == 0) goto L8d
            boolean r2 = r5.sendMessage(r6, r1, r3)
        L8d:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.SLAPIService._sendStringMessage2SLAPIClient(int, int, java.lang.String):boolean");
    }

    public static boolean sendUTCTimeMessage2SLAPIClient(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10) {
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendUTCTimeMessage2SLAPIClient(i, i2, i3, i4, i5, i6, i7, i8, i9, i10);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _sendUTCTimeMessage2SLAPIClient(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10) {
        DebugLogger.D5(logname, "SLAPIService.sendUTCTimeMessage2SLAPIClient()");
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        boolean z = false;
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(i2));
                return false;
            }
            DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
            return false;
        }
        Message messageObtain = Message.obtain((Handler) null, i2);
        Bundle data = messageObtain.getData();
        if (i2 == 320) {
            data.putInt("Year", i3);
            data.putInt("Month", i4);
            data.putInt("DayOfWeek", i5);
            data.putInt("Day", i6);
            data.putInt("Hour", i7);
            data.putInt("Minute", i8);
            data.putInt("Second", i9);
            data.putInt("Milliseconds", i10);
            z = true;
        } else {
            DebugLogger.D5(logname, "(UTCTime) is wrong signature for message " + SLAPIMessageIds.MessageName(i2));
        }
        return z ? sendMessage(numValueOf, client, messageObtain) : z;
    }

    public static boolean sendGPSStatusMessage2SLAPIClient(int i, int i2, int i3, int i4, int i5, float f, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, float f2, float f3, int i14, int i15, int i16) {
        DebugLogger.D5(logname, "sendGPSStatusMessage2SLAPIClient");
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendGPSStatusMessage2SLAPIClient(i, i2, i3, i4, i5, f, i6, i7, i8, i9, i10, i11, i12, i13, f2, f3, i14, i15, i16);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _sendGPSStatusMessage2SLAPIClient(int i, int i2, int i3, int i4, int i5, float f, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, float f2, float f3, int i14, int i15, int i16) {
        DebugLogger.D5(logname, "SLAPIService.sendGPSStatusMessage2SLAPIClient()");
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        boolean z = false;
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(i2));
                return false;
            }
            DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
            return false;
        }
        Message messageObtain = Message.obtain((Handler) null, i2);
        Bundle data = messageObtain.getData();
        if (i2 == 319) {
            data.putInt("Year", i6);
            data.putInt("Month", i7);
            data.putInt("DayOfWeek", i8);
            data.putInt("Day", i9);
            data.putInt("Hour", i10);
            data.putInt("Minute", i11);
            data.putInt("Second", i12);
            data.putInt("Milliseconds", i13);
            data.putInt("GPSFix", i3);
            data.putInt("NofSatellitesTracked", i4);
            data.putInt("NofSatellitesinView", i5);
            data.putFloat("HDOP", f);
            data.putFloat("Latitude", f2);
            data.putFloat("Longitude", f3);
            data.putInt("Altitude", i14);
            data.putInt("Course", i15);
            data.putInt("Speed", i16);
            z = true;
        } else {
            DebugLogger.D5(logname, "(UTCTime) is wrong signature for message " + SLAPIMessageIds.MessageName(i2));
        }
        return z ? sendMessage(numValueOf, client, messageObtain) : z;
    }

    public static boolean sendErrorMessage2SLAPIClient(int i, int i2, int i3, int i4, String str) {
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendErrorMessage2SLAPIClient(i, i2, i3, i4, str);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _sendErrorMessage2SLAPIClient(int i, int i2, int i3, int i4, String str) {
        DebugLogger.D5(logname, "SLAPIService.sendErrorMessage2SLAPIClient()");
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        boolean z = false;
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(i2));
                return false;
            }
            DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
            return false;
        }
        Message messageObtain = Message.obtain((Handler) null, i2);
        Bundle data = messageObtain.getData();
        if (i2 == 318) {
            data.putInt("OriginalMessage", i3);
            data.putInt("ErrorCode", i4);
            data.putString("ErrorMessage", str);
            z = true;
        } else {
            DebugLogger.D5(logname, "(int, int, String) is wrong signature for message " + SLAPIMessageIds.MessageName(i2));
        }
        return z ? sendMessage(numValueOf, client, messageObtain) : z;
    }

    public static boolean sendBytesMessage2SLAPIClient(int i, int i2, byte[] bArr, int i3) {
        DebugLogger.D5(logname, "sendBytesMessage2SLAPIClient(" + i + "," + i2 + ",," + i3 + ")");
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendBytesMessage2SLAPIClient(i, i2, bArr);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _sendBytesMessage2SLAPIClient(int i, int i2, byte[] bArr) {
        DebugLogger.D5(logname, "SLAPIService.sendBytesMessage2SLAPIClient()");
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        boolean z = true;
        if (i2 == 323 && processASRCallback(bArr)) {
            return true;
        }
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(i2));
                return false;
            }
            if (i != 777) {
                DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
                return false;
            }
            if (i2 == 323) {
                DebugLogger.D5(logname, "ASR client received invalid callback ");
                return false;
            }
            if (i2 == 324) {
                return true;
            }
            DebugLogger.D5(logname, "ASR client mustn't receive message " + SLAPIMessageIds.MessageName(i2));
            return false;
        }
        Message messageObtain = Message.obtain((Handler) null, i2);
        Bundle data = messageObtain.getData();
        if (i2 == 323 || i2 == 324) {
            data.putByteArray("Bytes", bArr);
        } else {
            DebugLogger.D5(logname, "(byte[]) is wrong signature for message " + SLAPIMessageIds.MessageName(i2));
            z = false;
        }
        if (z) {
            DebugLogger.D5(logname, "sendMessage(" + numValueOf + ")");
            sendMessage(numValueOf, client, messageObtain);
        }
        return z;
    }

    private boolean processASRCallback(byte[] bArr) {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        if (byteBufferWrap.capacity() != 11 && byteBufferWrap.capacity() != 21) {
            DebugLogger.D5(logname, "Incorrect capacity: it cannot be ASR callback " + byteBufferWrap.capacity());
            return false;
        }
        byte b = byteBufferWrap.get();
        if (b != 1 && b != 2) {
            DebugLogger.D5(logname, "Incorrect req type " + ((int) b));
            return false;
        }
        byte b2 = byteBufferWrap.get();
        if (b2 == 1) {
            if (byteBufferWrap.get() != 1 || byteBufferWrap.get() != 1 || byteBufferWrap.get() != 1) {
                DebugLogger.D5(logname, "Invalid req id: it cannot be cb_ASRListen()");
                return false;
            }
            if (byteBufferWrap.get() != 0) {
                DebugLogger.D5(logname, "Missing empty byte: it cannot be cb_ASRListen()");
                return false;
            }
            if (byteBufferWrap.get() != 6 || byteBufferWrap.get() != 0) {
                DebugLogger.D5(logname, "Invalid num of args: it cannot be cb_ASRListen()");
                return false;
            }
            DebugLogger.D5(logname, "cb_ASRListen recognized");
            ASRRecognizer aSRRecognizer = Application.getASRRecognizer();
            if (aSRRecognizer != null) {
                aSRRecognizer.listen();
                return true;
            }
        } else if (b2 == 2) {
            if (byteBufferWrap.get() != 2 || byteBufferWrap.get() != 2 || byteBufferWrap.get() != 2) {
                DebugLogger.D5(logname, "Invalid req id: it cannot be cb_messageProcessed()");
            } else {
                if (byteBufferWrap.get() != 0) {
                    DebugLogger.D5(logname, "Missing empty byte: it cannot be cb_messageProcessed()");
                    return false;
                }
                if (byteBufferWrap.get() != 6 || byteBufferWrap.get() != 2 || byteBufferWrap.get() != 0 || byteBufferWrap.get() != 0 || byteBufferWrap.get() != 0) {
                    DebugLogger.D5(logname, "Invalid num of args: it cannot be cb_messageProcessed()");
                    return false;
                }
                byte b3 = byteBufferWrap.get();
                if (b3 != 1 && b3 != 2) {
                    DebugLogger.D5(logname, "Invalid arg type 1: it cannot be cb_messageProcessed() " + ((int) b3));
                    return false;
                }
                byte b4 = byteBufferWrap.get();
                if (byteBufferWrap.get() != 0 || byteBufferWrap.get() != 0 || byteBufferWrap.get() != 0) {
                    DebugLogger.D5(logname, "Arg 1 is too big: it cannot be cb_messageProcessed()");
                    return false;
                }
                byte b5 = byteBufferWrap.get();
                if (b5 != 1 && b5 != 2) {
                    DebugLogger.D5(logname, "Invalid arg type 2: it cannot be cb_messageProcessed()");
                    return false;
                }
                byte b6 = byteBufferWrap.get();
                if (byteBufferWrap.get() != 0 || byteBufferWrap.get() != 0 || byteBufferWrap.get() != 0) {
                    DebugLogger.D5(logname, "Arg 2 is too big: it cannot be cb_messageProcessed()");
                    return false;
                }
                DebugLogger.D5(logname, "cb_messageProcessed recognized");
                ASRRecognizer aSRRecognizer2 = Application.getASRRecognizer();
                if (aSRRecognizer2 != null) {
                    aSRRecognizer2.messageProcessed(b4, b6);
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean sendRouteInfo2SLAPIClient(int i, int i2, int i3, float[] fArr) {
        DebugLogger.D5(logname, "sendRouteInfo2SLAPIClient(" + i + "," + i2 + "," + i3 + ")");
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendRouteInfo2SLAPIClient(i, i2, i3, fArr);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _sendRouteInfo2SLAPIClient(int i, int i2, int i3, float[] fArr) {
        DebugLogger.D5(logname, "SLAPIService.sendRouteInfo2SLAPIClient()");
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(322));
                return false;
            }
            DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
            return false;
        }
        if (fArr.length != i3 * 4) {
            DebugLogger.D5(logname, "Invalid number of waypoints: " + fArr.length + " vs. " + i3);
            return false;
        }
        Message messageObtain = Message.obtain((Handler) null, 322);
        Bundle data = messageObtain.getData();
        data.putInt("PlanMode", i2);
        data.putFloatArray("WayPoints", fArr);
        DebugLogger.D5(logname, "sendMessage(" + numValueOf + ")");
        sendMessage(numValueOf, client, messageObtain);
        return true;
    }

    public static boolean sendRouteGuidanceData2SLAPIClient(int i, int i2, int i3, int i4, int i5, String str, String str2, int i6, int i7, byte[] bArr) {
        DebugLogger.D5(logname, "sendRouteGuidanceData2SLAPIClient(" + i + ", ...)");
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._sendRouteGuidanceData2SLAPIClient(i, i2, i3, i4, i5, str, str2, i6, i7, bArr);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _sendRouteGuidanceData2SLAPIClient(int i, int i2, int i3, int i4, int i5, String str, String str2, int i6, int i7, byte[] bArr) {
        DebugLogger.D5(logname, "SLAPIService.sendRouteGuidanceData2SLAPIClient()");
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(321));
                return false;
            }
            DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
            return false;
        }
        Message messageObtain = Message.obtain((Handler) null, 321);
        Bundle data = messageObtain.getData();
        data.putInt("DirIcon", i2);
        data.putInt("ExitIndex", i3);
        data.putInt("Distance", i4);
        data.putInt("ManouvreID", i5);
        data.putString("DistanceString", str);
        data.putString("StreetName", str2);
        data.putInt("ProgressPercent", i6);
        data.putInt("RoundaboutArrowIndex", i7);
        data.putByteArray("RoundaboutExits", bArr);
        DebugLogger.D5(logname, "sendMessage(" + numValueOf + ")");
        sendMessage(numValueOf, client, messageObtain);
        return true;
    }

    public static boolean showHMI(boolean z) {
        SLAPIService sLAPIService = instance;
        if (sLAPIService != null) {
            return sLAPIService._showHMI(z);
        }
        DebugLogger.D5(logname, "SLAPIService is down");
        return false;
    }

    private boolean _showHMI(boolean z) {
        DebugLogger.D5(logname, "SLAPIService.showHMI()");
        if (z) {
            IgoActivity.startInForeground(0);
        } else {
            Application.getIgoActivity().moveTaskToBack(true);
        }
        return true;
    }

    private class MsgBoxBroadcastReceiver extends BroadcastReceiver {
        private MsgBoxBroadcastReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            DebugLogger.D5(SLAPIService.logname, "onReceive");
            if (intent.hasExtra("ClientId")) {
                int i = intent.getExtras().getInt("ClientId", 0);
                int i2 = intent.getExtras().getInt("Button", 1);
                DebugLogger.D5(SLAPIService.logname, "clientId=" + i + " buttonId=" + i2);
                SLAPIService.this.sendMessageBoxPressed(i, i2);
            }
        }
    }

    public void sendMessageBoxPressed(int i, int i2) {
        Integer numValueOf = Integer.valueOf(i);
        Messenger client = getClient(numValueOf);
        if (client == null) {
            if (numValueOf.intValue() == -1330787753) {
                DebugLogger.D5(logname, "Broadcast is not allowed for " + SLAPIMessageIds.MessageName(326));
                return;
            }
            DebugLogger.D5(logname, "Invalid client id:" + numValueOf);
            return;
        }
        Message messageObtain = Message.obtain((Handler) null, 326);
        messageObtain.getData().putInt("Button", i2);
        DebugLogger.D5(logname, "sendMessage(" + SLAPIMessageIds.MessageName(326) + "," + numValueOf + ")");
        sendMessage(numValueOf, client, messageObtain);
    }

    public Messenger getClient(Integer num) {
        return this.mClients.get(num);
    }

    public void addClient(Integer num, Messenger messenger) {
        this.mClients.put(num, messenger);
    }

    public void removeClient(Integer num) {
        this.mClients.remove(num);
    }
}
