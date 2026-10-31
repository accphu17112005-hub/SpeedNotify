###### Class com.navngo.igo.javaclient.ebp.MutingDeviceBase (com.navngo.igo.javaclient.ebp.MutingDeviceBase)
.class public abstract Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;
.super Ljava/lang/Object;
.source "MutingDeviceBase.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/ebp/IMutingDevice;
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# instance fields
.field private mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    return-void
.end method


# virtual methods
.method public final AudioFocusGet(III)V
    .registers 4

    .line 22
    invoke-virtual {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->Mute(III)V

    return-void
.end method

.method public final AudioFocusRelease()V
    .registers 1

    .line 26
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->Unmute()V

    return-void
.end method

.method public final AudiofocusChanged(II)V
    .registers 6

    .line 34
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v1, p2

    const-string p1, "sound.on_audiofocus_change"

    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgoSync(Ljava/lang/String;[Ljava/lang/Object;)Z

    return-void
.end method

.method public Close()V
    .registers 1

    return-void
.end method

.method public final OnAudioFocusLoss()V
    .registers 4

    .line 30
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "sound.on_audiofocus_loss"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgoSync(Ljava/lang/String;[Ljava/lang/Object;)Z

    return-void
.end method

.method public final registerFunctors()V
    .registers 4

    .line 17
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "sound.audiofocus_get"

    const-string v2, "AudioFocusGet"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "sound.audiofocus_release"

    const-string v2, "AudioFocusRelease"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
