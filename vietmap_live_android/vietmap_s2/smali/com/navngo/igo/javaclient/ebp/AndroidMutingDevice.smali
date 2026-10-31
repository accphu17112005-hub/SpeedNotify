###### Class com.navngo.igo.javaclient.ebp.AndroidMutingDevice (com.navngo.igo.javaclient.ebp.AndroidMutingDevice)
.class public Lcom/navngo/igo/javaclient/ebp/AndroidMutingDevice;
.super Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;
.source "AndroidMutingDevice.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/ebp/IMutingDevice;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;-><init>()V

    return-void
.end method


# virtual methods
.method public Mute(III)V
    .registers 5

    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Mute("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p3, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "AndroidMutingDevice"

    invoke-static {p3, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object p2

    const/4 p3, 0x3

    const/4 v0, 0x1

    invoke-virtual {p2, p3, v0}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    const/4 p2, 0x0

    .line 20
    invoke-virtual {p0, p2, p1}, Lcom/navngo/igo/javaclient/ebp/AndroidMutingDevice;->AudiofocusChanged(II)V

    return-void
.end method

.method public Unmute()V
    .registers 4

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unmute("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AndroidMutingDevice"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0, v2}, Lcom/navngo/igo/javaclient/ebp/AndroidMutingDevice;->AudiofocusChanged(II)V

    return-void
.end method
