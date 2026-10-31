###### Class com.navngo.igo.javaclient.tts.TTSSpeakerAndroidGo (com.navngo.igo.javaclient.tts.TTSSpeakerAndroidGo)
.class public abstract Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;
.super Ljava/lang/Object;
.source "TTSSpeakerAndroidGo.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/tts/TTSSpeaker;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->registerFunctors()V

    return-void
.end method

.method private registerFunctors()V
    .registers 4

    .line 17
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "sound.tts_ssml.say"

    const-string v2, "sayFunctor"

    .line 18
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sound.tts_ssml.stop"

    const-string v2, "stopFunctor"

    .line 19
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sound.tts_ssml.get_supported_languages"

    const-string v2, "GetSupportedLanguagesFunctor"

    .line 20
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sound.tts_ssml.set_language_and_voice"

    const-string v2, "setLanguageAndVoiceFunctor"

    .line 21
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sound.tts_ssml.set_speed"

    const-string v2, "setSpeedFunctor"

    .line 22
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sound.tts_ssml.set_sample_rate"

    const-string v2, "setSampleRateFunctor"

    .line 23
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public GetSupportedLanguagesFunctor()Lcom/navngo/igo/javaclient/androidgo/types/CString;
    .registers 2

    .line 35
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->GetSupportedLanguages()Lcom/navngo/igo/javaclient/androidgo/types/CString;

    move-result-object v0

    return-object v0
.end method

.method public sayFunctor(ILjava/lang/String;)V
    .registers 3

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->say(ILjava/lang/String;)V

    return-void
.end method

.method public setLanguageAndVoiceFunctor(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->setLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public setSampleRateFunctor(I)V
    .registers 2

    .line 47
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->setSampleRate(I)V

    return-void
.end method

.method public setSpeedFunctor(I)V
    .registers 2

    .line 43
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->setSpeed(I)V

    return-void
.end method

.method public stopFunctor()V
    .registers 1

    .line 31
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;->stop()V

    return-void
.end method
