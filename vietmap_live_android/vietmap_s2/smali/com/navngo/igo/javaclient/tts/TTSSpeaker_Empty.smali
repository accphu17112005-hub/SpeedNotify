###### Class com.navngo.igo.javaclient.tts.TTSSpeaker_Empty (com.navngo.igo.javaclient.tts.TTSSpeaker_Empty)
.class final Lcom/navngo/igo/javaclient/tts/TTSSpeaker_Empty;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;
.source "TTSSpeaker_Empty.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;-><init>()V

    return-void
.end method


# virtual methods
.method public GetSupportedLanguages()Lcom/navngo/igo/javaclient/androidgo/types/CString;
    .registers 3

    .line 51
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public create()V
    .registers 1

    return-void
.end method

.method public destroy()V
    .registers 1

    return-void
.end method

.method public getVariant()Ljava/lang/String;
    .registers 2

    const-string v0, "male"

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 4

    return-void
.end method

.method public say(ILjava/lang/String;)V
    .registers 5

    .line 22
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "sound.tts_ssml.sound_finished_callback"

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public setLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public setSampleRate(I)V
    .registers 2

    return-void
.end method

.method public setSpeed(I)V
    .registers 2

    return-void
.end method

.method public stop()V
    .registers 1

    return-void
.end method

.method public testLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method
