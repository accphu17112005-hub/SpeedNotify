package com.navngo.igo.javaclient.tts.cyberon;

import com.cyberon.engine.CReaderHL;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.igo.javaclient.receiver.PetzaCommandReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class TTSCyberon implements IFunctorCollection {
    private static final String tag = "TTSCyberon";
    private long libHandle = 0;

    public TTSCyberon() {
        CReaderHL.mCallback = new CReaderHL.CALLBACK_CReader_Play() { // from class: com.navngo.igo.javaclient.tts.cyberon.TTSCyberon$$ExternalSyntheticLambda0
            @Override // com.cyberon.engine.CReaderHL.CALLBACK_CReader_Play
            public final int PlayCallbackMethod(long j, Object[] objArr, int i, long j2, byte[] bArr) {
                return TTSCyberon.lambda$new$0(j, objArr, i, j2, bArr);
            }
        };
    }

    static /* synthetic */ int lambda$new$0(long j, Object[] objArr, int i, long j2, byte[] bArr) {
        AndroidGo.getInstance().callIgo("tts.cyberon.callback_play", null, Integer.valueOf(i));
        return 0;
    }

    public boolean loadLibrary() {
        return CReaderHL.loadLibrary(Application.anApplication.getApplicationContext());
    }

    public int init(byte[] bArr, int i, String str) {
        int[] iArr = new int[1];
        long j = this.libHandle;
        if (0 < j) {
            CReaderHL.CReaderHL_Release(j);
        }
        long jCReaderHL_Init = CReaderHL.CReaderHL_Init(Application.anApplication.getApplicationContext(), bArr, i, str, iArr);
        this.libHandle = jCReaderHL_Init;
        if (0 != jCReaderHL_Init) {
            DebugLogger.D3(tag, "CReaderHL created");
        } else {
            DebugLogger.D2(tag, "Failed to create CReaderHL");
        }
        return iArr[0];
    }

    public int setSpeed(int i) {
        return CReaderHL.CReaderHL_SetSpeed(this.libHandle, i);
    }

    public int play(String str) {
        int iCReaderHL_AddToPlaylist = CReaderHL.CReaderHL_AddToPlaylist(this.libHandle, str.getBytes());
        if (iCReaderHL_AddToPlaylist < 0) {
            DebugLogger.D2(tag, "error: " + iCReaderHL_AddToPlaylist);
            return iCReaderHL_AddToPlaylist;
        }
        return CReaderHL.CReaderHL_Play(this.libHandle, 0L);
    }

    public int stop() {
        return CReaderHL.CReaderHL_Stop(this.libHandle);
    }

    public boolean isPlaying() {
        return CReaderHL.CReaderHL_IsPlaying(this.libHandle);
    }

    public String getVersion() {
        char[] cArr = new char[1024];
        int iCReaderHL_GetVersion = CReaderHL.CReaderHL_GetVersion(this.libHandle, cArr);
        if (iCReaderHL_GetVersion < 0) {
            DebugLogger.D2(tag, "error code: " + iCReaderHL_GetVersion + "message: " + getErrorMessage(iCReaderHL_GetVersion));
            return Config.def_additional_assets;
        }
        return String.copyValueOf(cArr, 0, iCReaderHL_GetVersion);
    }

    public String getErrorMessage(int i) {
        return CReaderHL.CReaderHL_GetErrorMessage(i);
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("tts.cyberon.load_library", this, "loadLibrary");
        androidGo.registerFunctor("tts.cyberon.init", this, "init");
        androidGo.registerFunctor("tts.cyberon.set_speed", this, "setSpeed");
        androidGo.registerFunctor("tts.cyberon.play", this, "play");
        androidGo.registerFunctor("tts.cyberon.stop", this, PetzaCommandReceiver.PETZA_STOP);
        androidGo.registerFunctor("tts.cyberon.is_playing", this, "isPlaying");
        androidGo.registerFunctor("tts.cyberon.get_version", this, "getVersion");
        androidGo.registerFunctor("tts.cyberon.get_error_message", this, "getErrorMessage");
    }
}
