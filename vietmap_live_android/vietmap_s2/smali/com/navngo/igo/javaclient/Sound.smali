###### Class com.navngo.igo.javaclient.Sound (com.navngo.igo.javaclient.Sound)
.class public final Lcom/navngo/igo/javaclient/Sound;
.super Landroid/content/BroadcastReceiver;
.source "Sound.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;
.implements Lcom/navngo/igo/javaclient/OnActivityDestroyedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/Sound$PlayerThread;,
        Lcom/navngo/igo/javaclient/Sound$Buffer;
    }
.end annotation


# static fields
.field private static final OS_MAX_VOLUME:I = 0xff

.field private static instance:Lcom/navngo/igo/javaclient/Sound; = null

.field private static final logname:Ljava/lang/String; = "Sound"


# instance fields
.field private final mAudioManager:Landroid/media/AudioManager;

.field private mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

.field private mIgnoreVolumeChangedEvent:Z

.field private mLogBufferPlayback:Z

.field private final mMaxVolume:I

.field protected mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

.field private mNumberOfBuffers:I

.field private final mPlayerLock:Ljava/lang/String;

.field private mPlayerThread:Lcom/navngo/igo/javaclient/Sound$PlayerThread;

.field private mPrecVolume:D

.field private final mQueuedBuffers:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/navngo/igo/javaclient/Sound$Buffer;",
            ">;"
        }
    .end annotation
.end field

.field public final mSoundStream:I

.field private mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;


# direct methods
.method protected constructor <init>()V
    .registers 5

    .line 72
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 v0, 0x0

    .line 50
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Sound;->mIgnoreVolumeChangedEvent:Z

    const/4 v1, 0x0

    .line 55
    iput-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    .line 56
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    .line 57
    iput-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    .line 58
    new-instance v2, Ljava/lang/String;

    const-string v3, "Sound.playerLock"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    .line 60
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Sound;->mLogBufferPlayback:Z

    .line 90
    iput-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    .line 73
    sput-object p0, Lcom/navngo/igo/javaclient/Sound;->instance:Lcom/navngo/igo/javaclient/Sound;

    .line 74
    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    iput v0, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    .line 75
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v1

    iput-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    .line 76
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v2

    iput v2, p0, Lcom/navngo/igo/javaclient/Sound;->mMaxVolume:I

    .line 77
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    int-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPrecVolume:D

    .line 78
    new-instance v0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;-><init>(Lcom/navngo/igo/javaclient/Sound;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerThread:Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    .line 79
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->start()V

    return-void
.end method

.method private GetAudioFormat(I)I
    .registers 3

    const/16 v0, 0x8

    if-ne p1, v0, :cond_6

    const/4 p1, 0x3

    goto :goto_7

    :cond_6
    const/4 p1, 0x2

    :goto_7
    return p1
.end method

.method private GetChannelConfig(I)I
    .registers 3

    const/4 v0, 0x1

    if-ne p1, v0, :cond_5

    const/4 p1, 0x4

    goto :goto_7

    :cond_5
    const/16 p1, 0xc

    :goto_7
    return p1
.end method

.method private NotifyIGONativeCodeOfStreamVolume()V
    .registers 8

    .line 368
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    .line 369
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Sound;->getVolume()I

    move-result v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    .line 370
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "android.external_set_volume"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v6, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    new-array v2, v2, [Ljava/lang/Object;

    .line 371
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v5

    const-string v1, "android.external_volume_changed"

    invoke-virtual {v0, v1, v6, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;
    .registers 1

    .line 40
    iget-object p0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;
    .registers 1

    .line 40
    iget-object p0, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    return-object p0
.end method

.method static synthetic access$102(Lcom/navngo/igo/javaclient/Sound;Lcom/navngo/igo/javaclient/Sound$Buffer;)Lcom/navngo/igo/javaclient/Sound$Buffer;
    .registers 2

    .line 40
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/Sound;)Ljava/util/LinkedList;
    .registers 1

    .line 40
    iget-object p0, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;
    .registers 1

    .line 40
    iget-object p0, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V
    .registers 2

    .line 40
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/Sound;
    .registers 1

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/Sound;->instance:Lcom/navngo/igo/javaclient/Sound;

    if-eqz v0, :cond_5

    return-object v0

    .line 87
    :cond_5
    new-instance v0, Lcom/navngo/igo/javaclient/Sound;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/Sound;-><init>()V

    return-object v0
.end method

.method private logBufferPlayback(Ljava/lang/String;)V
    .registers 3

    .line 169
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/Sound;->mLogBufferPlayback:Z

    if-eqz v0, :cond_9

    const-string v0, "Sound"

    .line 170
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    return-void
.end method


# virtual methods
.method public OnResume()V
    .registers 4

    const-string v0, "sound"

    const-string v1, "set_stream_volume_on_resume"

    const/4 v2, 0x1

    .line 362
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 363
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound;->NotifyIGONativeCodeOfStreamVolume()V

    :cond_e
    return-void
.end method

.method public canPlayBuffer()Z
    .registers 6

    .line 277
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter v0

    .line 278
    :try_start_3
    iget v1, p0, Lcom/navngo/igo/javaclient/Sound;->mNumberOfBuffers:I

    iget-object v2, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    .line 279
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    sub-int/2addr v1, v2

    .line 280
    iget-object v2, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_14

    const/4 v2, 0x0

    goto :goto_15

    :cond_14
    const/4 v2, 0x1

    :goto_15
    sub-int/2addr v1, v2

    if-lez v1, :cond_19

    const/4 v3, 0x1

    :cond_19
    monitor-exit v0

    return v3

    :catchall_1b
    move-exception v1

    .line 281
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v1
.end method

.method public close()V
    .registers 3

    const-string v0, "close"

    .line 220
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    .line 221
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter v0

    .line 222
    :try_start_8
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    if-eqz v1, :cond_12

    .line 223
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->release()V

    const/4 v1, 0x0

    .line 224
    iput-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    .line 226
    :cond_12
    monitor-exit v0

    return-void

    :catchall_14
    move-exception v1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_8 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public getMinBufferSize(III)I
    .registers 4

    .line 183
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/Sound;->GetChannelConfig(I)I

    move-result p2

    invoke-direct {p0, p3}, Lcom/navngo/igo/javaclient/Sound;->GetAudioFormat(I)I

    move-result p3

    invoke-static {p1, p2, p3}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result p1

    return p1
.end method

.method public getMutingDevice()Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;
    .registers 5

    .line 100
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    if-nez v0, :cond_42

    const-string v0, "sound"

    const-string v1, "android_muting_device"

    const/4 v2, 0x2

    .line 102
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    const-string v1, "Sound"

    if-eqz v0, :cond_36

    const/4 v3, 0x1

    if-eq v0, v3, :cond_29

    if-eq v0, v2, :cond_1c

    const-string v0, "MutingDevice: INVALID, falling back to Empty"

    .line 115
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_36

    :cond_1c
    const-string v0, "MutingDevice: AudioFocus"

    .line 110
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    new-instance v0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    goto :goto_42

    :cond_29
    const-string v0, "MutingDevice: Android"

    .line 105
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    new-instance v0, Lcom/navngo/igo/javaclient/ebp/AndroidMutingDevice;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/ebp/AndroidMutingDevice;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    goto :goto_42

    :cond_36
    :goto_36
    const-string v0, "MutingDevice: Empty"

    .line 119
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    new-instance v0, Lcom/navngo/igo/javaclient/ebp/EmptyMutingDevice;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/ebp/EmptyMutingDevice;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    .line 123
    :cond_42
    :goto_42
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    return-object v0
.end method

.method public getVolume()I
    .registers 7

    .line 294
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    iget v1, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    const/4 v1, 0x0

    .line 295
    move-object v2, v1

    check-cast v2, Ljava/util/Locale;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, p0, Lcom/navngo/igo/javaclient/Sound;->mMaxVolume:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    iget v3, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x2

    aput-object v3, v2, v5

    const-string v3, "Volume get: %d / %d on Sound Stream: %d"

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Sound"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/Sound;->mPrecVolume:D

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    if-eq v1, v0, :cond_3f

    int-to-double v0, v0

    .line 298
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPrecVolume:D

    .line 301
    :cond_3f
    iget v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMaxVolume:I

    if-eqz v0, :cond_4f

    const-wide v1, 0x406fe00000000000L    # 255.0

    iget-wide v3, p0, Lcom/navngo/igo/javaclient/Sound;->mPrecVolume:D

    mul-double v3, v3, v1

    int-to-double v0, v0

    div-double/2addr v3, v0

    double-to-int v4, v3

    :cond_4f
    return v4
.end method

.method public init(Landroid/app/Activity;)V
    .registers 3

    .line 160
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerThread:Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_12

    .line 161
    new-instance v0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;-><init>(Lcom/navngo/igo/javaclient/Sound;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerThread:Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    .line 162
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->start()V

    :cond_12
    if-eqz p1, :cond_19

    .line 165
    iget v0, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setVolumeControlStream(I)V

    :cond_19
    return-void
.end method

.method public isPlaying()Z
    .registers 3

    .line 286
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter v0

    .line 287
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    if-nez v1, :cond_12

    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_10

    goto :goto_12

    :cond_10
    const/4 v1, 0x0

    goto :goto_13

    :cond_12
    :goto_12
    const/4 v1, 0x1

    :goto_13
    monitor-exit v0

    return v1

    :catchall_15
    move-exception v1

    .line 288
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw v1
.end method

.method public linkControlBuffer(I)V
    .registers 6

    .line 254
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter v0

    .line 255
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "linkControlBuffer id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", queuedBuffers size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    .line 256
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_36

    .line 257
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/Sound$Buffer;

    goto :goto_3c

    .line 258
    :cond_36
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    if-eqz v1, :cond_3b

    goto :goto_3c

    :cond_3b
    const/4 v1, 0x0

    :goto_3c
    if-eqz v1, :cond_6a

    .line 264
    iget-object v2, v1, Lcom/navngo/igo/javaclient/Sound$Buffer;->controlBufferIDs:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "linkControlBuffer id ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ") linked to buffer("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v1, Lcom/navngo/igo/javaclient/Sound$Buffer;->bufferID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    .line 267
    :cond_6a
    monitor-exit v0
    :try_end_6b
    .catchall {:try_start_3 .. :try_end_6b} :catchall_90

    if-nez v1, :cond_8f

    const/4 v0, 0x1

    new-array v1, v0, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 270
    invoke-static {v2, v2, v0, v1}, Lcom/navngo/igo/javaclient/NNG;->Sound_Finished(ZII[I)V

    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "linkControlBuffer Sound_Finished("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    :cond_8f
    return-void

    :catchall_90
    move-exception p1

    .line 267
    :try_start_91
    monitor-exit v0
    :try_end_92
    .catchall {:try_start_91 .. :try_end_92} :catchall_90

    throw p1
.end method

.method public onActivityDestroyed(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 3

    .line 151
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter p1

    .line 152
    :try_start_3
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    if-eqz v0, :cond_d

    .line 153
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->release()V

    const/4 v0, 0x0

    .line 154
    iput-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    .line 156
    :cond_d
    monitor-exit p1

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9

    .line 331
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/Sound;->mIgnoreVolumeChangedEvent:Z

    const-string v1, "Sound"

    const/4 v2, 0x0

    if-eqz v0, :cond_f

    const-string p1, "onReceive - IgnoreVolumeChangedEvent"

    .line 332
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 333
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/Sound;->mIgnoreVolumeChangedEvent:Z

    return-void

    .line 337
    :cond_f
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v3, "android.media.EXTRA_VOLUME_STREAM_TYPE"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 338
    iget v3, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    const/4 v4, 0x1

    const/4 v5, 0x2

    if-ne v0, v3, :cond_5d

    const-string v0, "android.media.VOLUME_CHANGED_ACTION received"

    .line 339
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 340
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    .line 341
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v1, "android.media.EXTRA_VOLUME_STREAM_VALUE"

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    if-lez p2, :cond_59

    if-eqz v0, :cond_3a

    if-ne v0, v4, :cond_59

    .line 345
    :cond_3a
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-ge p2, v0, :cond_46

    .line 346
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {p1, v5}, Landroid/media/AudioManager;->setRingerMode(I)V

    goto :goto_59

    :cond_46
    const-string p2, "notification"

    .line 348
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/NotificationManager;

    .line 349
    invoke-virtual {p1}, Landroid/app/NotificationManager;->isNotificationPolicyAccessGranted()Z

    move-result p1

    if-eqz p1, :cond_59

    .line 351
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {p1, v5}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 355
    :cond_59
    :goto_59
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound;->NotifyIGONativeCodeOfStreamVolume()V

    goto :goto_7a

    :cond_5d
    const/4 p1, 0x0

    .line 357
    move-object p2, p1

    check-cast p2, Ljava/util/Locale;

    new-array p2, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v2

    iget v0, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    const-string v0, "android.media.VOLUME_CHANGED_ACTION received on other stream type: %d (igo uses: %d)"

    invoke-static {p1, v0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :goto_7a
    return-void
.end method

.method public playBuffer([BI)I
    .registers 7

    .line 242
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter v0

    .line 243
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    new-instance v2, Lcom/navngo/igo/javaclient/Sound$Buffer;

    invoke-direct {v2, p0, p1, p2}, Lcom/navngo/igo/javaclient/Sound$Buffer;-><init>(Lcom/navngo/igo/javaclient/Sound;[BI)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 244
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 245
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mQueuedBuffers:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    move-result p1

    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mCurrentBuffer:Lcom/navngo/igo/javaclient/Sound$Buffer;

    const/4 v2, 0x0

    if-nez v1, :cond_1f

    const/4 v1, 0x0

    goto :goto_20

    :cond_1f
    const/4 v1, 0x1

    :goto_20
    add-int/2addr p1, v1

    .line 246
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playBuffer id: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", bufferCnt: "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    .line 247
    iget p2, p0, Lcom/navngo/igo/javaclient/Sound;->mNumberOfBuffers:I

    sub-int/2addr p2, p1

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    monitor-exit v0

    return p1

    :catchall_46
    move-exception p1

    .line 248
    monitor-exit v0
    :try_end_48
    .catchall {:try_start_3 .. :try_end_48} :catchall_46

    throw p1
.end method

.method public declared-synchronized register()V
    .registers 4

    monitor-enter p0

    :try_start_1
    const-string v0, "sound"

    const-string v1, "disable_volume_changed_action"

    const/4 v2, 0x0

    .line 318
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_18

    .line 319
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.media.VOLUME_CHANGED_ACTION"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_1a

    .line 320
    :cond_18
    monitor-exit p0

    return-void

    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public registerFunctors()V
    .registers 4

    .line 127
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "Sound"

    const-string v2, "registering getVolume and setVolume"

    .line 128
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "android.getVolume"

    const-string v2, "getVolume"

    .line 129
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.setVolume"

    const-string v2, "setVolume"

    .line 130
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v1, Lcom/navngo/igo/javaclient/Sound$1;

    invoke-direct {v1, p0, p0}, Lcom/navngo/igo/javaclient/Sound$1;-><init>(Lcom/navngo/igo/javaclient/Sound;Lcom/navngo/igo/javaclient/Sound;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V

    .line 140
    new-instance v0, Lcom/navngo/igo/javaclient/Sound$2;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/Sound$2;-><init>(Lcom/navngo/igo/javaclient/Sound;)V

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->addEngineStoppedCallback(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setMutingDevice(Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;)V
    .registers 2

    .line 94
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    return-void
.end method

.method public setVolume(I)V
    .registers 9

    .line 307
    iget v0, p0, Lcom/navngo/igo/javaclient/Sound;->mMaxVolume:I

    mul-int v1, p1, v0

    add-int/lit16 v1, v1, 0xff

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    div-int/lit16 v1, v1, 0xff

    mul-int p1, p1, v0

    int-to-double v3, p1

    const-wide v5, 0x406fe00000000000L    # 255.0

    div-double/2addr v3, v5

    .line 308
    iput-wide v3, p0, Lcom/navngo/igo/javaclient/Sound;->mPrecVolume:D

    .line 309
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    iget v0, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p1

    if-eq p1, v1, :cond_52

    const/4 p1, 0x0

    .line 310
    move-object v0, p1

    check-cast v0, Ljava/util/Locale;

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v0, v4

    iget v3, p0, Lcom/navngo/igo/javaclient/Sound;->mMaxVolume:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v3, 0x2

    iget v5, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v0, v3

    const-string v3, "Volume set to: %d / %d on Sound Stream: %d"

    invoke-static {p1, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Sound"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/Sound;->mIgnoreVolumeChangedEvent:Z

    .line 312
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mAudioManager:Landroid/media/AudioManager;

    iget v0, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    invoke-virtual {p1, v0, v1, v4}, Landroid/media/AudioManager;->setStreamVolume(III)V

    :cond_52
    return-void
.end method

.method public start(IIIIII)V
    .registers 15

    const/16 v0, 0x8

    if-eq v0, p3, :cond_10

    const/16 v1, 0x10

    if-eq v1, p3, :cond_10

    const-string p1, "Sound"

    const-string p2, "start failed: only 8 or 16 bit mode is supported"

    .line 189
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_10
    if-eqz p6, :cond_14

    const/4 p6, 0x1

    goto :goto_15

    :cond_14
    const/4 p6, 0x0

    .line 192
    :goto_15
    iput-boolean p6, p0, Lcom/navngo/igo/javaclient/Sound;->mLogBufferPlayback:Z

    .line 193
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/Sound;->GetChannelConfig(I)I

    move-result v4

    .line 194
    invoke-direct {p0, p3}, Lcom/navngo/igo/javaclient/Sound;->GetAudioFormat(I)I

    move-result v5

    mul-int p4, p4, p3

    .line 198
    div-int/lit8 v6, p4, 0x8

    .line 199
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "start smpRate("

    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p6, ") channels("

    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") bits("

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") bufferSizeInBytes("

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") numberOfBuffers("

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ") MinBufferSize("

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-static {p1, v4, v5}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result p2

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 199
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    .line 202
    iput p5, p0, Lcom/navngo/igo/javaclient/Sound;->mNumberOfBuffers:I

    .line 203
    iget-object p2, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerThread:Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->waitPreviousPlayToFinish()V

    .line 204
    iget-object p2, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter p2

    .line 205
    :try_start_72
    invoke-static {}, Lcom/navngo/igo/javaclient/AudioTrackFactory;->getInstance()Lcom/navngo/igo/javaclient/AudioTrackFactory;

    move-result-object v1

    iget v2, p0, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    const/4 v7, 0x1

    move v3, p1

    invoke-virtual/range {v1 .. v7}, Lcom/navngo/igo/javaclient/AudioTrackFactory;->create(IIIIII)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    if-eqz p1, :cond_9f

    const-string p1, "Sound"

    .line 212
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "created AudioTrack, state: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p4, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    invoke-interface {p4}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->getState()I

    move-result p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a6

    :cond_9f
    const-string p1, "Sound"

    const-string p3, "failed to create AudioTrack, track == null"

    .line 214
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    :goto_a6
    monitor-exit p2

    return-void

    :catchall_a8
    move-exception p1

    monitor-exit p2
    :try_end_aa
    .catchall {:try_start_72 .. :try_end_aa} :catchall_a8

    throw p1
.end method

.method public stop()V
    .registers 3

    const-string v0, "stop"

    .line 232
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/Sound;->logBufferPlayback(Ljava/lang/String;)V

    .line 233
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerLock:Ljava/lang/String;

    monitor-enter v0

    .line 234
    :try_start_8
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound;->mTrack:Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    if-eqz v1, :cond_f

    .line 235
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->stop()V

    .line 237
    :cond_f
    monitor-exit v0

    return-void

    :catchall_11
    move-exception v1

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_8 .. :try_end_13} :catchall_11

    throw v1
.end method

.method public declared-synchronized unregister()V
    .registers 4

    monitor-enter p0

    :try_start_1
    const-string v0, "sound"

    const-string v1, "disable_volume_changed_action"

    const/4 v2, 0x0

    .line 323
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_11

    .line 324
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 325
    :cond_11
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound;->mPlayerThread:Lcom/navngo/igo/javaclient/Sound$PlayerThread;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->stopThread()V

    const/4 v0, 0x0

    .line 326
    sput-object v0, Lcom/navngo/igo/javaclient/Sound;->instance:Lcom/navngo/igo/javaclient/Sound;
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1b

    .line 327
    monitor-exit p0

    return-void

    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

###### Class com.navngo.igo.javaclient.Sound.AnonymousClass1 (com.navngo.igo.javaclient.Sound$1)
.class Lcom/navngo/igo/javaclient/Sound$1;
.super Ljava/lang/Object;
.source "Sound.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Application$IActivityCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Sound;->registerFunctors()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Sound;

.field final synthetic val$tthis:Lcom/navngo/igo/javaclient/Sound;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Sound;Lcom/navngo/igo/javaclient/Sound;)V
    .registers 3

    .line 132
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound$1;->this$0:Lcom/navngo/igo/javaclient/Sound;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/Sound$1;->val$tthis:Lcom/navngo/igo/javaclient/Sound;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 3

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$1;->val$tthis:Lcom/navngo/igo/javaclient/Sound;

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->registerOnActivityDestroyedListener(Lcom/navngo/igo/javaclient/OnActivityDestroyedListener;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Sound.AnonymousClass2 (com.navngo.igo.javaclient.Sound$2)
.class Lcom/navngo/igo/javaclient/Sound$2;
.super Ljava/lang/Object;
.source "Sound.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Sound;->registerFunctors()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Sound;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Sound;)V
    .registers 2

    .line 140
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound$2;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 143
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$2;->this$0:Lcom/navngo/igo/javaclient/Sound;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->Close()V

    .line 144
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$2;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/navngo/igo/javaclient/Sound;->mMutingDevice:Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    return-void
.end method

###### Class com.navngo.igo.javaclient.Sound.Buffer (com.navngo.igo.javaclient.Sound$Buffer)
.class Lcom/navngo/igo/javaclient/Sound$Buffer;
.super Ljava/lang/Object;
.source "Sound.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Sound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Buffer"
.end annotation


# instance fields
.field final buf:[B

.field final bufferID:I

.field final controlBufferIDs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/navngo/igo/javaclient/Sound;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Sound;[BI)V
    .registers 4

    .line 66
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound$Buffer;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound$Buffer;->controlBufferIDs:Ljava/util/List;

    .line 67
    iput-object p2, p0, Lcom/navngo/igo/javaclient/Sound$Buffer;->buf:[B

    .line 68
    iput p3, p0, Lcom/navngo/igo/javaclient/Sound$Buffer;->bufferID:I

    return-void
.end method

###### Class com.navngo.igo.javaclient.Sound.PlayerThread (com.navngo.igo.javaclient.Sound$PlayerThread)
.class final Lcom/navngo/igo/javaclient/Sound$PlayerThread;
.super Ljava/lang/Thread;
.source "Sound.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Sound;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "PlayerThread"
.end annotation


# instance fields
.field private mDiscardAll:Z

.field private mInloop:Z

.field final synthetic this$0:Lcom/navngo/igo/javaclient/Sound;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Sound;)V
    .registers 2

    .line 379
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const-string p1, "Sound.PlayerThread"

    .line 380
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 381
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mDiscardAll:Z

    .line 382
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mInloop:Z

    return-void
.end method

.method private flushTrack()V
    .registers 3

    .line 469
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 470
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const-string v1, "flushTrack"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    .line 471
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->flush()V

    :cond_18
    return-void
.end method

.method private playCurrentBuffer()V
    .registers 9

    .line 484
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    const-string v1, "Sound"

    if-nez v0, :cond_10

    const-string v0, "Cannot write audio, track is null, navigation_audio_stream is misconfigured?"

    .line 485
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 488
    :cond_10
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/Sound$Buffer;->buf:[B

    array-length v0, v0

    .line 489
    iget-object v2, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "playCurrentBuffer: currentBuffer ID("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v4}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v4

    iget v4, v4, Lcom/navngo/igo/javaclient/Sound$Buffer;->bufferID:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ") length("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_45
    if-ge v2, v0, :cond_ae

    sub-int v3, v0, v2

    .line 492
    iget-object v5, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v5}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v5

    iget-object v6, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v6}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v6

    iget-object v6, v6, Lcom/navngo/igo/javaclient/Sound$Buffer;->buf:[B

    invoke-interface {v5, v6, v2, v3}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->write([BII)I

    move-result v3

    .line 493
    iget-object v5, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "playCurrentBuffer: track.write("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    if-gez v3, :cond_a9

    .line 496
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "playCurrentBuffer: cant write audio: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " pos: "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " end: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ae

    :cond_a9
    add-int/2addr v2, v3

    .line 500
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->startTrack()V

    goto :goto_45

    :cond_ae
    :goto_ae
    return-void
.end method

.method private reportCurrentBufferPlayed()V
    .registers 8

    .line 507
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v0

    iget v0, v0, Lcom/navngo/igo/javaclient/Sound$Buffer;->bufferID:I

    .line 508
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v1

    iget-object v1, v1, Lcom/navngo/igo/javaclient/Sound$Buffer;->controlBufferIDs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v2, v1, [I

    .line 510
    iget-object v3, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v3

    iget-object v3, v3, Lcom/navngo/igo/javaclient/Sound$Buffer;->controlBufferIDs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :goto_23
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v6, v4, 0x1

    .line 511
    aput v5, v2, v4

    move v4, v6

    goto :goto_23

    .line 512
    :cond_39
    iget-object v3, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/Sound;->access$102(Lcom/navngo/igo/javaclient/Sound;Lcom/navngo/igo/javaclient/Sound$Buffer;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    .line 513
    iget-object v3, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "reportPlayingBufferPlayed ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 514
    invoke-static {v3, v0, v1, v2}, Lcom/navngo/igo/javaclient/NNG;->Sound_Finished(ZII[I)V

    return-void
.end method

.method private startTrack()V
    .registers 3

    .line 462
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 463
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const-string v1, "startTrack"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    .line 464
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->play()V

    :cond_18
    return-void
.end method

.method private stopTrack()V
    .registers 3

    .line 476
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 477
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const-string v1, "stopTrack"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    .line 478
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v0

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->stop()V

    :cond_18
    return-void
.end method


# virtual methods
.method public discardAllBuffer()V
    .registers 4

    .line 453
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0

    .line 454
    :try_start_7
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const-string v2, "discardAllBuffer"

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    .line 455
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->stopTrack()V

    const/4 v1, 0x1

    .line 456
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mDiscardAll:Z

    .line 457
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 458
    monitor-exit v0

    return-void

    :catchall_1f
    move-exception v1

    monitor-exit v0
    :try_end_21
    .catchall {:try_start_7 .. :try_end_21} :catchall_1f

    throw v1
.end method

.method public run()V
    .registers 4

    .line 388
    :goto_0
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_7d

    .line 390
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0
    :try_end_11
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_11} :catch_76

    .line 391
    :try_start_11
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$200(Lcom/navngo/igo/javaclient/Sound;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/Sound$Buffer;

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/Sound;->access$102(Lcom/navngo/igo/javaclient/Sound;Lcom/navngo/igo/javaclient/Sound$Buffer;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    .line 392
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v1

    if-nez v1, :cond_33

    .line 393
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 394
    monitor-exit v0

    goto :goto_0

    .line 396
    :cond_33
    monitor-exit v0
    :try_end_34
    .catchall {:try_start_11 .. :try_end_34} :catchall_73

    .line 397
    :try_start_34
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0
    :try_end_3b
    .catch Ljava/lang/InterruptedException; {:try_start_34 .. :try_end_3b} :catch_76

    const/4 v1, 0x1

    .line 398
    :try_start_3c
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mInloop:Z

    .line 399
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v1

    if-eqz v1, :cond_55

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mDiscardAll:Z

    if-nez v1, :cond_55

    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$300(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-result-object v1

    if-eqz v1, :cond_55

    .line 400
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->playCurrentBuffer()V

    .line 402
    :cond_55
    monitor-exit v0
    :try_end_56
    .catchall {:try_start_3c .. :try_end_56} :catchall_70

    .line 403
    :try_start_56
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0
    :try_end_5d
    .catch Ljava/lang/InterruptedException; {:try_start_56 .. :try_end_5d} :catch_76

    .line 404
    :try_start_5d
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v1

    if-eqz v1, :cond_68

    .line 405
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->reportCurrentBufferPlayed()V

    :cond_68
    const/4 v1, 0x0

    .line 407
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mInloop:Z

    .line 408
    monitor-exit v0

    goto :goto_0

    :catchall_6d
    move-exception v1

    monitor-exit v0
    :try_end_6f
    .catchall {:try_start_5d .. :try_end_6f} :catchall_6d

    :try_start_6f
    throw v1
    :try_end_70
    .catch Ljava/lang/InterruptedException; {:try_start_6f .. :try_end_70} :catch_76

    :catchall_70
    move-exception v1

    .line 402
    :try_start_71
    monitor-exit v0
    :try_end_72
    .catchall {:try_start_71 .. :try_end_72} :catchall_70

    :try_start_72
    throw v1
    :try_end_73
    .catch Ljava/lang/InterruptedException; {:try_start_72 .. :try_end_73} :catch_76

    :catchall_73
    move-exception v1

    .line 396
    :try_start_74
    monitor-exit v0
    :try_end_75
    .catchall {:try_start_74 .. :try_end_75} :catchall_73

    :try_start_75
    throw v1
    :try_end_76
    .catch Ljava/lang/InterruptedException; {:try_start_75 .. :try_end_76} :catch_76

    :catch_76
    const-string v0, "Sound"

    const-string v1, "PlayerThread.run InterruptedException"

    .line 411
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7d
    return-void
.end method

.method public stopThread()V
    .registers 4

    .line 417
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->interrupt()V

    .line 419
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0

    .line 420
    :try_start_a
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 421
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->stopTrack()V

    .line 422
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->flushTrack()V

    .line 424
    :goto_19
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$200(Lcom/navngo/igo/javaclient/Sound;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-eqz v1, :cond_38

    .line 425
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$200(Lcom/navngo/igo/javaclient/Sound;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/Sound$Buffer;

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/Sound;->access$102(Lcom/navngo/igo/javaclient/Sound;Lcom/navngo/igo/javaclient/Sound$Buffer;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    .line 426
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->reportCurrentBufferPlayed()V

    goto :goto_19

    .line 428
    :cond_38
    monitor-exit v0

    return-void

    :catchall_3a
    move-exception v1

    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_a .. :try_end_3c} :catchall_3a

    throw v1
.end method

.method public waitPreviousPlayToFinish()V
    .registers 3

    .line 436
    :catch_0
    :goto_0
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->discardAllBuffer()V

    .line 437
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    const-string v1, "waitPreviousPlayToFinish"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/Sound;->access$400(Lcom/navngo/igo/javaclient/Sound;Ljava/lang/String;)V

    .line 438
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Sound;->access$000(Lcom/navngo/igo/javaclient/Sound;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0

    .line 439
    :try_start_11
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mInloop:Z

    if-nez v1, :cond_2e

    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$100(Lcom/navngo/igo/javaclient/Sound;)Lcom/navngo/igo/javaclient/Sound$Buffer;

    move-result-object v1

    if-nez v1, :cond_2e

    iget-object v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->this$0:Lcom/navngo/igo/javaclient/Sound;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Sound;->access$200(Lcom/navngo/igo/javaclient/Sound;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2e

    const/4 v1, 0x0

    .line 440
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/Sound$PlayerThread;->mDiscardAll:Z

    .line 441
    monitor-exit v0

    return-void

    .line 443
    :cond_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_11 .. :try_end_2f} :catchall_35

    const-wide/16 v0, 0x64

    .line 445
    :try_start_31
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_34
    .catch Ljava/lang/InterruptedException; {:try_start_31 .. :try_end_34} :catch_0

    goto :goto_0

    :catchall_35
    move-exception v1

    .line 443
    :try_start_36
    monitor-exit v0
    :try_end_37
    .catchall {:try_start_36 .. :try_end_37} :catchall_35

    throw v1
.end method
