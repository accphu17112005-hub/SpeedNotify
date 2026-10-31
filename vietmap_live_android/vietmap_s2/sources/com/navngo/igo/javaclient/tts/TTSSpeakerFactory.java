package com.navngo.igo.javaclient.tts;

import com.navngo.igo.javaclient.DebugLogger;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class TTSSpeakerFactory {
    private static final String logname = "TTSSpeakerFactory";

    public static TTSSpeaker newInstance() {
        try {
            return (TTSSpeaker) Class.forName("com.navngo.igo.javaclient.tts.TTSSpeakerImpl").newInstance();
        } catch (Throwable th) {
            DebugLogger.D1(logname, "TTS not available: " + th.getMessage(), th);
            return new TTSSpeaker_Empty();
        }
    }
}
