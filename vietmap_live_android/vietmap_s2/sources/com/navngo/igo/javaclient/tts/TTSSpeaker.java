package com.navngo.igo.javaclient.tts;

import android.content.Intent;
import com.navngo.igo.javaclient.androidgo.types.CString;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface TTSSpeaker {
    CString GetSupportedLanguages();

    void create();

    void destroy();

    String getVariant();

    void onActivityResult(int i, int i2, Intent intent);

    void say(int i, String str);

    boolean setLanguageAndVoice(String str, String str2);

    void setSampleRate(int i);

    void setSpeed(int i);

    void stop();

    boolean testLanguageAndVoice(String str, String str2);
}
