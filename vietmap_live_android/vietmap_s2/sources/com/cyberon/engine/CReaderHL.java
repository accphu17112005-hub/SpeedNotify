package com.cyberon.engine;

import android.content.Context;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.tts.cyberon.utility.ToolKit;
import java.io.File;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CReaderHL {
    public static final int CReaderHL_STATUS_FINISH = 20502;
    public static final int CReaderHL_STATUS_START = 20501;
    public static final int CReaderHL_STATUS_SUBTITLE = 20504;
    public static final int CReaderHL_STATUS_TIMER = 20503;
    public static final int CReaderHL_STATUS_WORD = 20505;
    public static CALLBACK_CReader_Play mCallback;

    public interface CALLBACK_CReader_Play {
        int PlayCallbackMethod(long j, Object[] objArr, int i, long j2, byte[] bArr);
    }

    public static native int CReaderHL_AddToPlaylist(long j, byte[] bArr);

    public static native String CReaderHL_GetErrorMessage(int i);

    public static native int CReaderHL_GetPitch(long j);

    public static native int CReaderHL_GetSpeed(long j);

    public static native int CReaderHL_GetVersion(long j, char[] cArr);

    public static native int CReaderHL_GetVolume(long j);

    public static native long CReaderHL_Init(Object obj, byte[] bArr, int i, String str, int[] iArr);

    public static native boolean CReaderHL_IsPlaying(long j);

    public static native int CReaderHL_Play(long j, long j2);

    public static native int CReaderHL_Release(long j);

    public static native int CReaderHL_SetPitch(long j, int i);

    public static native int CReaderHL_SetPlayDevice(long j, String str);

    public static native int CReaderHL_SetSpeed(long j, int i);

    public static native int CReaderHL_SetVolume(long j, int i);

    public static native int CReaderHL_Stop(long j);

    public static boolean loadLibrary(Context context) {
        String str = ToolKit.getNativeLibPath(context) + "/libCReaderHL.so";
        try {
            if (new File(str).exists()) {
                System.load(str);
                return true;
            }
            System.loadLibrary("CReaderHL");
            return true;
        } catch (UnsatisfiedLinkError e) {
            DebugLogger.D1("CReaderHL", "Couldn't load CReaderHL lib", e);
            return false;
        }
    }

    public static int PlayCallback(long j, Object[] objArr, int i, long j2, byte[] bArr) {
        CALLBACK_CReader_Play cALLBACK_CReader_Play = mCallback;
        if (cALLBACK_CReader_Play != null) {
            return cALLBACK_CReader_Play.PlayCallbackMethod(j, objArr, i, j2, bArr);
        }
        return 0;
    }
}
