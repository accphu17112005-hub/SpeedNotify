package com.navngo.igo.javaclient;

import java.util.HashMap;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AudioTrackFactory {
    private static final String defaultName = "android";
    private static final AudioTrackFactory instance = new AudioTrackFactory();
    private static final String logname = "AudioTrackFactory";
    private HashMap<String, Class<? extends IAudioTrackAdapter>> adapterMap = new HashMap<>();

    private AudioTrackFactory() {
        DebugLogger.D3(logname, "AudioTrackFactory constructor started");
        register(defaultName, AndroidAudioTrackAdapter.class);
    }

    public <T extends IAudioTrackAdapter> void register(String str, Class<T> cls) {
        this.adapterMap.put(str, cls);
    }

    public IAudioTrackAdapter create(int i, int i2, int i3, int i4, int i5, int i6) {
        String string = Config.getString("sound", "audio_track_adapter", defaultName);
        Class<? extends IAudioTrackAdapter> cls = this.adapterMap.get(string);
        DebugLogger.D3(logname, "adapterClass for " + string + ": " + cls);
        if (cls == null && !string.equals(defaultName)) {
            cls = this.adapterMap.get(defaultName);
            DebugLogger.D3(logname, "adapterClass was null for" + string + " trying " + defaultName);
        }
        if (cls == null) {
            return null;
        }
        try {
            IAudioTrackAdapter iAudioTrackAdapterNewInstance = cls.newInstance();
            iAudioTrackAdapterNewInstance.initFromFactory(i, i2, i3, i4, i5, i6);
            return iAudioTrackAdapterNewInstance;
        } catch (Exception e) {
            DebugLogger.D1(logname, "Exception caught while creating " + cls, e);
            return null;
        }
    }

    public static AudioTrackFactory getInstance() {
        return instance;
    }
}
