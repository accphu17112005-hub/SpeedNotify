package com.navngo.igo.javaclient;

import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Messenger;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IncomingHandler extends Handler {
    private static final String logname = "IncomingHandler";
    protected WeakReference<SLAPIService> mService;

    public IncomingHandler(SLAPIService sLAPIService) {
        this.mService = new WeakReference<>(sLAPIService);
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        SLAPIService sLAPIService = this.mService.get();
        if (sLAPIService == null) {
            DebugLogger.D2(logname, "SLAPIService is not available!");
        } else {
            handleMessage(sLAPIService, message);
        }
    }

    private void handleMessage(SLAPIService sLAPIService, Message message) {
        String string;
        Integer numValueOf = Integer.valueOf(message.replyTo.hashCode());
        DebugLogger.D5(logname, "SLAPIService.handleMessage(" + message.replyTo.hashCode() + "," + SLAPIMessageIds.MessageName(message.what) + ")");
        Bundle data = message.getData();
        Messenger client = sLAPIService.getClient(numValueOf);
        if (message.what == 1) {
            if (client == null) {
                Messenger messenger = message.replyTo;
                DebugLogger.D5(logname, "Register client with Id " + numValueOf);
                sLAPIService.addClient(numValueOf, messenger);
                NNG.sendSimpleSLAPIMessage2iGO(numValueOf.intValue(), message.what, message.arg1, message.arg2);
            }
            return;
        }
        if (message.what == 3 && client != null) {
            DebugLogger.D5(logname, "Disconnect client with Id " + numValueOf);
            sLAPIService.removeClient(numValueOf);
            NNG.sendSimpleSLAPIMessage2iGO(numValueOf.intValue(), message.what, message.arg1, message.arg2);
            return;
        }
        if (client == null) {
            DebugLogger.D2(logname, "Client is null!");
            return;
        }
        int i = message.what;
        switch (i) {
            case 100:
            case 101:
            case 102:
            case 103:
            case 104:
            case 105:
            case 106:
            case 107:
            case 108:
            case 109:
            case 110:
            case 111:
            case 112:
            case 113:
            case 114:
            case 115:
            case 116:
            case 117:
            case 118:
            case 119:
            case 120:
            case 121:
            case 122:
            case 123:
                if (NNG.sendSimpleSLAPIMessage2iGO(numValueOf.intValue(), message.what, message.arg1, message.arg2)) {
                    DebugLogger.D2(logname, "SLAPI call : " + SLAPIMessageIds.MessageName(message.what) + " failed!");
                }
                break;
            default:
                switch (i) {
                    case 201:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, 0, 0, 0, 0.0f, 0.0f, data.getString("Name"), data.getString("Address"));
                        break;
                    case 202:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, 0, 0, 0, data.getFloat("Latitude"), data.getFloat("Longitude"), data.getString("Name"), Config.def_additional_assets);
                        break;
                    case SLAPIMessageIds.SLAPI_GETPOSFROMADDRESS /* 203 */:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, 0, 0, 0, 0.0f, 0.0f, data.getString("Address"), Config.def_additional_assets);
                        break;
                    case 204:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, 0, 0, 0, 0.0f, 0.0f, data.getString("Path"), Config.def_additional_assets);
                        break;
                    case SLAPIMessageIds.SLAPI_SETDESTINATIONADDRESS /* 205 */:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, data.getInt("PlanMode"), 0, 0, 0.0f, 0.0f, data.getString("Address"), Config.def_additional_assets);
                        break;
                    case SLAPIMessageIds.SLAPI_SETDESTINATIONPOS /* 206 */:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, data.getInt("PlanMode"), 0, 0, data.getFloat("Latitude"), data.getFloat("Longitude"), Config.def_additional_assets, Config.def_additional_assets);
                        break;
                    case 207:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, data.getInt("MarkerId"), 0, 0, data.getFloat("Latitude"), data.getFloat("Longitude"), data.getString("Category"), data.getString("Label"));
                        break;
                    case 208:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, 0, 0, 0, 0.0f, 0.0f, data.getString("Address"), Config.def_additional_assets);
                        break;
                    case 209:
                        DebugLogger.D5(logname, "Message id " + SLAPIMessageIds.MessageName(message.what) + " is not yet implemented");
                        break;
                    case 210:
                        byte[] byteArray = data.getByteArray("Bytes");
                        if (byteArray != null) {
                            NNG.sendBytesSLAPIMessage2iGO(numValueOf.intValue(), message.what, byteArray, byteArray.length);
                        } else {
                            DebugLogger.D5(logname, "Message id " + SLAPIMessageIds.MessageName(message.what) + " is not yet implemented");
                        }
                        break;
                    case 211:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, data.getInt("Order", -1), 0, 0, 0.0f, 0.0f, data.getString("Address"), Config.def_additional_assets);
                        break;
                    case SLAPIMessageIds.SLAPI_SETWAYPOINTPOS /* 212 */:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, data.getInt("Order", -1), 0, 0, data.getFloat("Latitude"), data.getFloat("Longitude"), Config.def_additional_assets, Config.def_additional_assets);
                        break;
                    case 213:
                        NNG.sendComplexSLAPIMessage2iGO(numValueOf.intValue(), message.what, data.getInt("ZoomLevel"), 0, 0, data.getFloat("Latitude"), data.getFloat("Longitude"), Config.def_additional_assets, Config.def_additional_assets);
                        break;
                    case 214:
                    case 215:
                    case 216:
                    case SLAPIMessageIds.SLAPI_UX_REGISTER_CALLBACK /* 217 */:
                    case 218:
                    case 219:
                    case SLAPIMessageIds.SLAPI_UX_EVAL /* 221 */:
                        byte[] byteArray2 = data.getByteArray("Bytes");
                        if (byteArray2 != null) {
                            NNG.sendBytesSLAPIMessage2iGO(numValueOf.intValue(), message.what, byteArray2, byteArray2.length);
                        } else {
                            DebugLogger.D5(logname, "Message id " + SLAPIMessageIds.MessageName(message.what) + ": 'Bytes' entry is not set");
                        }
                        break;
                    case 220:
                        String string2 = data.getString("Button1");
                        int i2 = data.getInt("Timeout", 0);
                        if (string2 != null) {
                            String string3 = data.getString("Button2");
                            string = string3 != null ? data.getString("Button3") : null;
                            str = string3;
                        } else {
                            string = null;
                        }
                        Application.anApplication.alert(data.getString("Message"), numValueOf.intValue(), SLAPIService.MSGBOX_INTENT, i2, string2, str, string);
                        break;
                    default:
                        DebugLogger.D2(logname, "Message id " + SLAPIMessageIds.MessageName(message.what) + " is invalid or not implemented");
                        super.handleMessage(message);
                        break;
                }
                break;
        }
    }
}
