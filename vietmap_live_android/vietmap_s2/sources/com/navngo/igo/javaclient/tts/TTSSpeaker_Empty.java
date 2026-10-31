package com.navngo.igo.javaclient.tts;

import android.content.Intent;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.CString;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class TTSSpeaker_Empty extends TTSSpeakerAndroidGo {
    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void create() {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void destroy() {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public String getVariant() {
        return "male";
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void onActivityResult(int i, int i2, Intent intent) {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public boolean setLanguageAndVoice(String str, String str2) {
        return false;
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void setSampleRate(int i) {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void setSpeed(int i) {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void stop() {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public boolean testLanguageAndVoice(String str, String str2) {
        return false;
    }

    TTSSpeaker_Empty() {
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void say(int i, String str) {
        AndroidGo.getInstance().callIgo("sound.tts_ssml.sound_finished_callback", null, Integer.valueOf(i));
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public CString GetSupportedLanguages() {
        return new CString(Config.def_additional_assets);
    }
}
