package com.navngo.igo.javaclient.androidgo;

import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import com.navngo.program.ProgramPhases;
import java.io.ByteArrayInputStream;
import java.io.IOException;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class SysConfig {
    private static final String logname = "SysConfig";
    private static SysConfig sSysConfig;
    volatile boolean isReady = false;

    public boolean getBool(String str, String str2, boolean z) {
        checkSysconfigIsReady();
        Object obj = get(str, str2, Boolean.valueOf(z));
        if (obj instanceof Boolean) {
            return ((Boolean) obj).booleanValue();
        }
        DebugLogger.D2(logname, String.format("getBool(%s, %s) return value isn't boolean. Returning default value", str, str2));
        return z;
    }

    public boolean getBool(String str, String str2) {
        return getBool(str, str2, false);
    }

    public String getString(String str, String str2, String str3) {
        checkSysconfigIsReady();
        Object obj = get(str, str2, str3);
        if (obj instanceof String) {
            return (String) obj;
        }
        DebugLogger.D2(logname, String.format("getString(%s, %s) return value isn't string. Returning default value", str, str2));
        return str3;
    }

    public String getString(String str, String str2) {
        return getString(str, str2, Config.def_additional_assets);
    }

    public int getInt(String str, String str2, int i) {
        checkSysconfigIsReady();
        Object obj = get(str, str2, Integer.valueOf(i));
        if (obj instanceof Integer) {
            return ((Integer) obj).intValue();
        }
        DebugLogger.D2(logname, String.format("getInt(%s, %s) return value isn't int. Returning default value", str, str2));
        return i;
    }

    public int getInt(String str, String str2) {
        return getInt(str, str2, 0);
    }

    public Object get(String str, String str2, Object obj) {
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect();
        AndroidGo.AndroidGoOutputStream androidGoOutputStream = new AndroidGo.AndroidGoOutputStream(byteArrayOutputStreamDirect);
        try {
            androidGoOutputStream.writeSupportedObject(obj);
            androidGoOutputStream.flush();
            ByteArrayOutputStreamDirect.ByteArrayRegion buffer = byteArrayOutputStreamDirect.getBuffer();
            byte[] fromSysConfig = NNG.getFromSysConfig(str, str2, buffer.buffer, buffer.size);
            androidGoOutputStream.close();
            AndroidGo.AndroidGoInputStream androidGoInputStream = new AndroidGo.AndroidGoInputStream(new ByteArrayInputStream(fromSysConfig));
            AndroidGo.AndroidGoObject supportedObject = androidGoInputStream.readSupportedObject();
            androidGoInputStream.close();
            return supportedObject.value;
        } catch (IOException unused) {
            return obj;
        }
    }

    private void checkSysconfigIsReady() {
        boolean z;
        synchronized (this) {
            z = this.isReady;
        }
        if (!z) {
            throw new RuntimeException("SyConfig isn't ready yet. Startup program phase isn't reached yet");
        }
    }

    private SysConfig() {
        ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.STARTUP, false, new Runnable() { // from class: com.navngo.igo.javaclient.androidgo.SysConfig.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (this) {
                    SysConfig.this.isReady = true;
                }
                DebugLogger.D3(SysConfig.logname, "Startup phase reached, config can be used");
            }
        });
    }

    public static SysConfig getInstance() {
        if (sSysConfig == null) {
            sSysConfig = new SysConfig();
        }
        return sSysConfig;
    }
}
