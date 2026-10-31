package com.navngo.igo.javaclient.tts;

import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.CString;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class TTSSpeakerAndroidGo implements TTSSpeaker {
    public TTSSpeakerAndroidGo() {
        registerFunctors();
    }

    private void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("sound.tts_ssml.say", this, "sayFunctor");
        androidGo.registerFunctor("sound.tts_ssml.stop", this, "stopFunctor");
        androidGo.registerFunctor("sound.tts_ssml.get_supported_languages", this, "GetSupportedLanguagesFunctor");
        androidGo.registerFunctor("sound.tts_ssml.set_language_and_voice", this, "setLanguageAndVoiceFunctor");
        androidGo.registerFunctor("sound.tts_ssml.set_speed", this, "setSpeedFunctor");
        androidGo.registerFunctor("sound.tts_ssml.set_sample_rate", this, "setSampleRateFunctor");
    }

    public void sayFunctor(int i, String str) {
        say(i, str);
    }

    public void stopFunctor() {
        stop();
    }

    public CString GetSupportedLanguagesFunctor() {
        return GetSupportedLanguages();
    }

    public boolean setLanguageAndVoiceFunctor(String str, String str2) {
        return setLanguageAndVoice(str, str2);
    }

    public void setSpeedFunctor(int i) {
        setSpeed(i);
    }

    public void setSampleRateFunctor(int i) {
        setSampleRate(i);
    }
}
