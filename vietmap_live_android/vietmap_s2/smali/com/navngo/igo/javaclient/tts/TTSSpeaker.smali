###### Class com.navngo.igo.javaclient.tts.TTSSpeaker (com.navngo.igo.javaclient.tts.TTSSpeaker)
.class public interface abstract Lcom/navngo/igo/javaclient/tts/TTSSpeaker;
.super Ljava/lang/Object;
.source "TTSSpeaker.java"


# virtual methods
.method public abstract GetSupportedLanguages()Lcom/navngo/igo/javaclient/androidgo/types/CString;
.end method

.method public abstract create()V
.end method

.method public abstract destroy()V
.end method

.method public abstract getVariant()Ljava/lang/String;
.end method

.method public abstract onActivityResult(IILandroid/content/Intent;)V
.end method

.method public abstract say(ILjava/lang/String;)V
.end method

.method public abstract setLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract setSampleRate(I)V
.end method

.method public abstract setSpeed(I)V
.end method

.method public abstract stop()V
.end method

.method public abstract testLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z
.end method
