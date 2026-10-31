###### Class com.navngo.igo.javaclient.ebp.AudioFocusHandler (com.navngo.igo.javaclient.ebp.AudioFocusHandler)
.class public Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;
.super Ljava/lang/Object;
.source "AudioFocusHandler.java"


# static fields
.field private static final logname:Ljava/lang/String; = "AudioFocusHandler"


# instance fields
.field private mCurrentContentType:I

.field private mCurrentFocusGainMethod:I

.field private mCurrentUsage:I

.field private final mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private mFocusRequest:Landroid/media/AudioFocusRequest;

.field private mPlaybackAttributes:Landroid/media/AudioAttributes;


# direct methods
.method public constructor <init>(Landroid/media/AudioManager$OnAudioFocusChangeListener;)V
    .registers 4

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    sget v0, Lcom/navngo/igo/javaclient/Config;->android_audiofocus_gain_method:I

    iput v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentFocusGainMethod:I

    .line 16
    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    iput v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentUsage:I

    .line 17
    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    iput v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentContentType:I

    const-string v0, "AudioFocusHandler"

    const-string v1, "new AudioFocusHandler"

    .line 23
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_51

    .line 28
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    sget v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    .line 29
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    sget v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    .line 30
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mPlaybackAttributes:Landroid/media/AudioAttributes;

    .line 33
    new-instance v0, Landroid/media/AudioFocusRequest$Builder;

    iget v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentFocusGainMethod:I

    invoke-direct {v0, v1}, Landroid/media/AudioFocusRequest$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mPlaybackAttributes:Landroid/media/AudioAttributes;

    .line 34
    invoke-virtual {v0, v1}, Landroid/media/AudioFocusRequest$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v0

    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Landroid/media/AudioFocusRequest$Builder;->setAcceptsDelayedFocusGain(Z)Landroid/media/AudioFocusRequest$Builder;

    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Landroid/media/AudioFocusRequest$Builder;->setOnAudioFocusChangeListener(Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object p1

    .line 37
    invoke-virtual {p1}, Landroid/media/AudioFocusRequest$Builder;->build()Landroid/media/AudioFocusRequest;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusRequest:Landroid/media/AudioFocusRequest;

    :cond_51
    return-void
.end method


# virtual methods
.method public abandonFocus()V
    .registers 3

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_10

    .line 68
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusRequest:Landroid/media/AudioFocusRequest;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocusRequest(Landroid/media/AudioFocusRequest;)I

    goto :goto_19

    .line 70
    :cond_10
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    :goto_19
    return-void
.end method

.method public requestFocus(II)I
    .registers 5

    .line 42
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_65

    .line 43
    iget p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentFocusGainMethod:I

    if-ne p2, p1, :cond_16

    iget p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentUsage:I

    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    if-ne p2, v0, :cond_16

    iget p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentContentType:I

    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    if-eq p2, v0, :cond_5a

    :cond_16
    const-string p2, "AudioFocusHandler"

    const-string v0, "new FocusRequest"

    .line 44
    invoke-static {p2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    new-instance p2, Landroid/media/AudioAttributes$Builder;

    invoke-direct {p2}, Landroid/media/AudioAttributes$Builder;-><init>()V

    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    .line 47
    invoke-virtual {p2, v0}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p2

    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    .line 48
    invoke-virtual {p2, v0}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p2

    .line 49
    invoke-virtual {p2}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object p2

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mPlaybackAttributes:Landroid/media/AudioAttributes;

    .line 50
    new-instance p2, Landroid/media/AudioFocusRequest$Builder;

    invoke-direct {p2, p1}, Landroid/media/AudioFocusRequest$Builder;-><init>(I)V

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mPlaybackAttributes:Landroid/media/AudioAttributes;

    .line 51
    invoke-virtual {p2, v0}, Landroid/media/AudioFocusRequest$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object p2

    const/4 v0, 0x1

    .line 52
    invoke-virtual {p2, v0}, Landroid/media/AudioFocusRequest$Builder;->setAcceptsDelayedFocusGain(Z)Landroid/media/AudioFocusRequest$Builder;

    move-result-object p2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 53
    invoke-virtual {p2, v0}, Landroid/media/AudioFocusRequest$Builder;->setOnAudioFocusChangeListener(Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    move-result-object p2

    .line 54
    invoke-virtual {p2}, Landroid/media/AudioFocusRequest$Builder;->build()Landroid/media/AudioFocusRequest;

    move-result-object p2

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusRequest:Landroid/media/AudioFocusRequest;

    .line 56
    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentFocusGainMethod:I

    .line 57
    sget p1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentUsage:I

    .line 58
    sget p1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mCurrentContentType:I

    .line 61
    :cond_5a
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusRequest:Landroid/media/AudioFocusRequest;

    invoke-virtual {p1, p2}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I

    move-result p1

    return p1

    .line 63
    :cond_65
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {v0, v1, p2, p1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result p1

    return p1
.end method
