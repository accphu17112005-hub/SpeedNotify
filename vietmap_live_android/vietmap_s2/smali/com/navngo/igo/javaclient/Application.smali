###### Class com.navngo.igo.javaclient.Application (com.navngo.igo.javaclient.Application)
.class public Lcom/navngo/igo/javaclient/Application;
.super Ljava/lang/Object;
.source "Application.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/Application$IActivityCommand;,
        Lcom/navngo/igo/javaclient/Application$MultitouchSupport;,
        Lcom/navngo/igo/javaclient/Application$ScreenSizes;,
        Lcom/navngo/igo/javaclient/Application$GuiSurfaceCreatedCallback;
    }
.end annotation


# static fields
.field public static final APPICON_ID:I

.field public static volatile NNG_FullyLoaded:Z = false

.field public static volatile NNG_shouldMessageBoxOnRebuildDataDirFailure:Z = false

.field public static final NOTIFY_ID_MISSING_SDCARD:I = 0x1

.field public static final NOTIFY_ID_RUNNING_IN_BACKGROUND:I = 0x2

.field public static final SAT_AZIMUTH:I = 0x3

.field public static final SAT_DATA_COUNT:I = 0x5

.field public static final SAT_ELEVATION:I = 0x4

.field public static final SAT_PRN:I = 0x0

.field public static final SAT_SNR:I = 0x2

.field public static final SAT_USED:I = 0x1

.field public static anApplication:Lcom/navngo/igo/javaclient/Application; = null

.field private static antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility; = null

.field private static bootTime:J = 0x0L

.field public static volatile bufferB_ARGB8888:[I = null

.field private static final createMapViewLock:Ljava/lang/String;

.field public static exitOnDestroy:Z = false

.field private static hasPendingSDNotification:Z = false

.field private static httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility; = null

.field private static final logname:Ljava/lang/String; = "Application"

.field private static mAsrRecognizer:Lcom/navngo/igo/javaclient/ASRRecognizer;

.field private static mAudioManager:Landroid/media/AudioManager;

.field private static mTtsSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

.field private static final mainServiceLock:Ljava/lang/String;

.field private static final mediascanning_event:Ljava/lang/String;

.field private static mediascanning_timestamp:J

.field private static oslangcodes_ini_builtin:Ljava/lang/String;

.field private static oslangcodes_ini_content:Ljava/lang/String;

.field private static satellites:[I

.field private static savedOSLocale:Ljava/lang/String;

.field public static serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

.field private static final shortLock:Ljava/lang/String;

.field private static theGeocoder:Landroid/location/Geocoder;

.field private static theIgoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

.field private static theInsertSDCard:Lcom/navngo/igo/javaclient/InsertSDCard;

.field private static theMainService:Lcom/navngo/igo/javaclient/MainService;

.field private static theMapView:Lcom/navngo/igo/javaclient/view/IMapView;

.field private static theSensorUtility:Lcom/navngo/igo/javaclient/utils/SensorUtility;


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private guiSurfaceCreated:Z

.field private lastSurfaceHeight:I

.field private lastSurfaceWidth:I

.field private mActivityCommands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/Application$IActivityCommand;",
            ">;"
        }
    .end annotation
.end field

.field private mContentObservers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/observer/IObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mGuiSurfaceCreatedCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/Application$GuiSurfaceCreatedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mInitialized:Z

.field private mReceivers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/receiver/IReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private mainSurfacePresent:Z

.field private surfaceSizeTransferLockObj:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 86
    sget v0, Lcom/navngo/igo/javaclient/R$drawable;->appicon:I

    sput v0, Lcom/navngo/igo/javaclient/Application;->APPICON_ID:I

    .line 91
    new-instance v0, Lcom/navngo/igo/javaclient/Application;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/Application;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const/4 v0, 0x0

    .line 92
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    const/4 v1, 0x0

    .line 98
    sput-boolean v1, Lcom/navngo/igo/javaclient/Application;->exitOnDestroy:Z

    .line 100
    sput-boolean v1, Lcom/navngo/igo/javaclient/Application;->hasPendingSDNotification:Z

    .line 103
    new-instance v2, Ljava/lang/String;

    const-string v3, "shortLock: please DO NOT call any locking stuff under this lock!"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    .line 730
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theIgoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    .line 781
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theMainService:Lcom/navngo/igo/javaclient/MainService;

    .line 782
    new-instance v2, Ljava/lang/String;

    const-string v3, "mainServiceLock"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/navngo/igo/javaclient/Application;->mainServiceLock:Ljava/lang/String;

    .line 795
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theMapView:Lcom/navngo/igo/javaclient/view/IMapView;

    .line 802
    new-instance v2, Ljava/lang/String;

    const-string v3, "createMapViewLock"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/navngo/igo/javaclient/Application;->createMapViewLock:Ljava/lang/String;

    .line 830
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->mTtsSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    .line 849
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->mAudioManager:Landroid/media/AudioManager;

    .line 858
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->mAsrRecognizer:Lcom/navngo/igo/javaclient/ASRRecognizer;

    .line 877
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    .line 896
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    .line 916
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theInsertSDCard:Lcom/navngo/igo/javaclient/InsertSDCard;

    const-wide/16 v2, -0x1

    .line 928
    sput-wide v2, Lcom/navngo/igo/javaclient/Application;->bootTime:J

    .line 1008
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theSensorUtility:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    const-wide/16 v2, 0x0

    .line 1017
    sput-wide v2, Lcom/navngo/igo/javaclient/Application;->mediascanning_timestamp:J

    .line 1018
    new-instance v2, Ljava/lang/String;

    const-string v3, "MEDIA_SCANNER_FINISHED"

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/navngo/igo/javaclient/Application;->mediascanning_event:Ljava/lang/String;

    .line 1071
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theGeocoder:Landroid/location/Geocoder;

    .line 1105
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->savedOSLocale:Ljava/lang/String;

    .line 1209
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_builtin:Ljava/lang/String;

    const-string v2, ""

    .line 1210
    sput-object v2, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_content:Ljava/lang/String;

    .line 1242
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->satellites:[I

    .line 1274
    sput-boolean v1, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    const/4 v1, 0x1

    .line 1276
    sput-boolean v1, Lcom/navngo/igo/javaclient/Application;->NNG_shouldMessageBoxOnRebuildDataDirFailure:Z

    .line 1279
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->bufferB_ARGB8888:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 94
    iput-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    const/4 v0, 0x0

    .line 96
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->mInitialized:Z

    .line 108
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->guiSurfaceCreated:Z

    .line 109
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->mainSurfacePresent:Z

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mGuiSurfaceCreatedCallbacks:Ljava/util/List;

    const-string v0, "surfaceSizeTransferLockObj"

    .line 111
    iput-object v0, p0, Lcom/navngo/igo/javaclient/Application;->surfaceSizeTransferLockObj:Ljava/lang/String;

    .line 750
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mActivityCommands:Ljava/util/List;

    .line 1531
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mReceivers:Ljava/util/List;

    .line 1532
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mContentObservers:Ljava/util/List;

    return-void
.end method

.method public static TTS_TestLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)I
    .registers 3

    .line 872
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getTTSSpeaker()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeaker;->testLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;
    .registers 1

    .line 82
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->mTtsSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    return-object v0
.end method

.method static synthetic access$202(Lcom/navngo/igo/javaclient/ASRRecognizer;)Lcom/navngo/igo/javaclient/ASRRecognizer;
    .registers 1

    .line 82
    sput-object p0, Lcom/navngo/igo/javaclient/Application;->mAsrRecognizer:Lcom/navngo/igo/javaclient/ASRRecognizer;

    return-object p0
.end method

.method public static blockWhileExit(Z)V
    .registers 3

    const-string v0, "Application"

    const-string v1, "Exiting iGO..."

    .line 1360
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1361
    invoke-static {p0}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    const-string p0, "Blocking system shutdown until iGO has successfully exited."

    .line 1363
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1364
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->waitForClosingIgo()V

    const-string p0, "iGO closed successfully."

    .line 1365
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 1367
    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.method public static declared-synchronized checkForSDCard(Z)Z
    .registers 7

    const-class v0, Lcom/navngo/igo/javaclient/Application;

    monitor-enter v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 447
    :try_start_5
    sget-object v3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->isDirectory(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_19

    .line 448
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mounted"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_17} :catch_1d
    .catchall {:try_start_5 .. :try_end_17} :catchall_1b

    if-eqz v3, :cond_25

    :cond_19
    const/4 v3, 0x1

    goto :goto_26

    :catchall_1b
    move-exception p0

    goto :goto_5c

    :catch_1d
    move-exception v3

    :try_start_1e
    const-string v4, "Application"

    const-string v5, "checkForSDCard: unwanted exception"

    .line 450
    invoke-static {v4, v5, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_25
    const/4 v3, 0x0

    :goto_26
    if-nez v3, :cond_46

    const-string v2, "Application"

    .line 453
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SD card missing: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_5a

    .line 455
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->showSDNotification(Z)V

    goto :goto_5a

    .line 458
    :cond_46
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->showSDNotification(Z)V

    .line 459
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getInsertSDCard()Lcom/navngo/igo/javaclient/InsertSDCard;

    move-result-object p0

    if-eqz p0, :cond_5a

    .line 460
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getInsertSDCard()Lcom/navngo/igo/javaclient/InsertSDCard;

    move-result-object p0

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/InsertSDCard;->finish()V

    const/4 p0, 0x0

    .line 461
    invoke-static {p0}, Lcom/navngo/igo/javaclient/Application;->setInsertSDCard(Lcom/navngo/igo/javaclient/InsertSDCard;)V
    :try_end_5a
    .catchall {:try_start_1e .. :try_end_5a} :catchall_1b

    .line 465
    :cond_5a
    :goto_5a
    monitor-exit v0

    return v3

    :goto_5c
    monitor-exit v0

    throw p0
.end method

.method public static clearSatellites()V
    .registers 2

    .line 1220
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    new-array v1, v1, [I

    .line 1221
    sput-object v1, Lcom/navngo/igo/javaclient/Application;->satellites:[I

    .line 1222
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_d

    .line 1223
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->onSatellitesChanged()V

    return-void

    :catchall_d
    move-exception v1

    .line 1222
    :try_start_e
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_e .. :try_end_f} :catchall_d

    throw v1
.end method

.method public static debugSleep(I)V
    .registers 1

    return-void
.end method

.method public static dropAntHttpUtility()V
    .registers 3

    .line 908
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 909
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    const/4 v2, 0x0

    .line 910
    sput-object v2, Lcom/navngo/igo/javaclient/Application;->antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    .line 911
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_f

    if-eqz v1, :cond_e

    .line 913
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;->close()V

    :cond_e
    return-void

    :catchall_f
    move-exception v1

    .line 911
    :try_start_10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v1
.end method

.method public static dropHttpUtility()V
    .registers 3

    .line 888
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 889
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    const/4 v2, 0x0

    .line 890
    sput-object v2, Lcom/navngo/igo/javaclient/Application;->httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    .line 891
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_f

    if-eqz v1, :cond_e

    .line 893
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->close()V

    :cond_e
    return-void

    :catchall_f
    move-exception v1

    .line 891
    :try_start_10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v1
.end method

.method public static dropServices(Z)V
    .registers 3

    const-string v0, "Application"

    if-eqz p0, :cond_16

    const-string p0, "dropServices: request queued"

    .line 1373
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1374
    new-instance p0, Ljava/lang/Thread;

    new-instance v0, Lcom/navngo/igo/javaclient/Application$8;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/Application$8;-><init>()V

    const-string v1, "dropServices"

    invoke-direct {p0, v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    goto :goto_26

    :cond_16
    const-string p0, "dropServices: dropHttpUtility"

    .line 1382
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1383
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->dropHttpUtility()V

    const-string p0, "dropServices: dropAntHttpUtility"

    .line 1384
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1385
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->dropAntHttpUtility()V

    :goto_26
    return-void
.end method

.method public static exit(Z)V
    .registers 2

    .line 1289
    sput-boolean p0, Lcom/navngo/igo/javaclient/Application;->exitOnDestroy:Z

    .line 1290
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    if-eqz v0, :cond_11

    if-eqz p0, :cond_e

    .line 1292
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->stopServer()V

    goto :goto_11

    .line 1294
    :cond_e
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->suspendServer()V

    .line 1297
    :cond_11
    :goto_11
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p0

    if-eqz p0, :cond_1f

    .line 1299
    new-instance v0, Lcom/navngo/igo/javaclient/Application$6;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/Application$6;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1308
    :cond_1f
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    if-eqz p0, :cond_26

    .line 1309
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ServiceRunner;->stopServices()V

    :cond_26
    return-void
.end method

.method public static freeMemory()I
    .registers 8

    const-string v0, "/proc/meminfo"

    const-string v1, "closing /proc/meminfo"

    const-string v2, "Application"

    const/4 v3, 0x0

    .line 946
    :try_start_7
    sget-boolean v4, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    if-nez v4, :cond_10

    const-string v4, "Trying to open /proc/meminfo fd"

    .line 948
    invoke-static {v2, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 950
    :cond_10
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_15} :catch_41
    .catchall {:try_start_7 .. :try_end_15} :catchall_3f

    .line 951
    :try_start_15
    new-instance v3, Ljava/lang/String;

    const/16 v5, 0x7d0

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readInputStream(Ljava/io/InputStream;I)[B

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/String;-><init>([B)V

    const-string v5, "(?s).*MemFree:\\s+(\\d+).*"

    const-string v6, "$1"

    .line 952
    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_2c} :catch_3a
    .catchall {:try_start_15 .. :try_end_2c} :catchall_37

    shl-int/lit8 v0, v0, 0xa

    .line 960
    :try_start_2e
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_31} :catch_32

    goto :goto_53

    :catch_32
    move-exception v3

    .line 962
    invoke-static {v2, v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_53

    :catchall_37
    move-exception v0

    move-object v3, v4

    goto :goto_54

    :catch_3a
    move-exception v3

    move-object v7, v4

    move-object v4, v3

    move-object v3, v7

    goto :goto_42

    :catchall_3f
    move-exception v0

    goto :goto_54

    :catch_41
    move-exception v4

    .line 955
    :goto_42
    :try_start_42
    invoke-static {v2, v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 956
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v4
    :try_end_4d
    .catchall {:try_start_42 .. :try_end_4d} :catchall_3f

    long-to-int v0, v4

    if-eqz v3, :cond_53

    .line 960
    :try_start_50
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_53} :catch_32

    :cond_53
    :goto_53
    return v0

    :goto_54
    if-eqz v3, :cond_5e

    :try_start_56
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_59} :catch_5a

    goto :goto_5e

    :catch_5a
    move-exception v3

    .line 962
    invoke-static {v2, v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 965
    :cond_5e
    :goto_5e
    throw v0
.end method

.method public static getASRRecognizer()Lcom/navngo/igo/javaclient/ASRRecognizer;
    .registers 2

    .line 860
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->mAsrRecognizer:Lcom/navngo/igo/javaclient/ASRRecognizer;

    if-nez v0, :cond_16

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 861
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/Application$5;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/Application$5;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 867
    :cond_16
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->mAsrRecognizer:Lcom/navngo/igo/javaclient/ASRRecognizer;

    return-object v0
.end method

.method public static getAntHttpUtility()Lcom/navngo/igo/javaclient/utils/AntHttpUtility;
    .registers 2

    .line 899
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 900
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    if-nez v1, :cond_e

    .line 901
    new-instance v1, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/utils/AntHttpUtility;-><init>()V

    sput-object v1, Lcom/navngo/igo/javaclient/Application;->antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    .line 902
    :cond_e
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->antHttpUtility:Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    monitor-exit v0

    return-object v1

    :catchall_12
    move-exception v1

    .line 903
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v1
.end method

.method public static getAudioManager()Landroid/media/AudioManager;
    .registers 3

    .line 851
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 852
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->mAudioManager:Landroid/media/AudioManager;

    if-nez v1, :cond_13

    .line 853
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    sput-object v1, Lcom/navngo/igo/javaclient/Application;->mAudioManager:Landroid/media/AudioManager;

    .line 854
    :cond_13
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->mAudioManager:Landroid/media/AudioManager;

    monitor-exit v0

    return-object v1

    :catchall_17
    move-exception v1

    .line 855
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_17

    throw v1
.end method

.method public static getBootTime()J
    .registers 3

    .line 935
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 936
    :try_start_3
    sget-wide v1, Lcom/navngo/igo/javaclient/Application;->bootTime:J

    monitor-exit v0

    return-wide v1

    :catchall_7
    move-exception v1

    .line 937
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public static getGeocoder()Landroid/location/Geocoder;
    .registers 2

    .line 1073
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->theGeocoder:Landroid/location/Geocoder;

    if-nez v0, :cond_11

    .line 1074
    new-instance v0, Landroid/location/Geocoder;

    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/navngo/igo/javaclient/Application;->theGeocoder:Landroid/location/Geocoder;

    .line 1075
    :cond_11
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->theGeocoder:Landroid/location/Geocoder;

    return-object v0
.end method

.method public static getHttpUtility()Lcom/navngo/igo/javaclient/utils/HttpUtility;
    .registers 2

    .line 880
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 881
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    if-nez v1, :cond_e

    .line 882
    new-instance v1, Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/utils/HttpUtility;-><init>()V

    sput-object v1, Lcom/navngo/igo/javaclient/Application;->httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    .line 883
    :cond_e
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->httpUtility:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    monitor-exit v0

    return-object v1

    :catchall_12
    move-exception v1

    .line 884
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v1
.end method

.method public static getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;
    .registers 2

    .line 741
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 742
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theIgoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    .line 743
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public static getInsertSDCard()Lcom/navngo/igo/javaclient/InsertSDCard;
    .registers 2

    .line 923
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 924
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theInsertSDCard:Lcom/navngo/igo/javaclient/InsertSDCard;

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    .line 925
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public static getMapView()Lcom/navngo/igo/javaclient/view/IMapView;
    .registers 2

    .line 819
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 820
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theMapView:Lcom/navngo/igo/javaclient/view/IMapView;

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    .line 821
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public static getOSLanguageKeys()Ljava/lang/String;
    .registers 4

    .line 1116
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getOSLocale()Ljava/lang/String;

    move-result-object v0

    .line 1117
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->locale2LanguageKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5f

    .line 1118
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_1a

    const/4 v3, 0x0

    .line 1120
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->locale2LanguageKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1b

    :cond_1a
    const/4 v2, 0x0

    :goto_1b
    if-eqz v1, :cond_34

    if-eqz v2, :cond_3a

    .line 1126
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3a

    :cond_34
    if-eqz v2, :cond_38

    move-object v1, v2

    goto :goto_3a

    :cond_38
    const-string v1, "english US"

    .line 1137
    :cond_3a
    :goto_3a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOSLanguageKeys: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " => "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Application"

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public static getOSLocale()Ljava/lang/String;
    .registers 4

    const-string v0, "Application"

    .line 1152
    :try_start_2
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget-object v1, v1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_12} :catch_13

    goto :goto_1a

    :catch_13
    const-string v1, "Locale is not available, returning default"

    .line 1154
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "en_US"

    .line 1156
    :goto_1a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOSLocale: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public static getSatellites()[I
    .registers 5

    .line 1227
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 1228
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->satellites:[I

    array-length v2, v1

    new-array v2, v2, [I

    .line 1229
    array-length v3, v1

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1230
    monitor-exit v0

    return-object v2

    :catchall_f
    move-exception v1

    .line 1231
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v1
.end method

.method private static getSensorUtility()Lcom/navngo/igo/javaclient/utils/SensorUtility;
    .registers 2

    .line 1010
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 1011
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theSensorUtility:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    if-nez v1, :cond_e

    .line 1012
    new-instance v1, Lcom/navngo/igo/javaclient/utils/SensorUtility;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/utils/SensorUtility;-><init>()V

    sput-object v1, Lcom/navngo/igo/javaclient/Application;->theSensorUtility:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    .line 1013
    :cond_e
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theSensorUtility:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    monitor-exit v0

    return-object v1

    :catchall_12
    move-exception v1

    .line 1014
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v1
.end method

.method public static getSoundStream()I
    .registers 2

    .line 825
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 826
    :try_start_3
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v1

    iget v1, v1, Lcom/navngo/igo/javaclient/Sound;->mSoundStream:I

    monitor-exit v0

    return v1

    :catchall_b
    move-exception v1

    .line 827
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v1
.end method

.method public static getTTSSpeaker()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;
    .registers 3

    .line 832
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 833
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->mTtsSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    if-nez v1, :cond_17

    .line 834
    invoke-static {}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerFactory;->newInstance()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    move-result-object v1

    sput-object v1, Lcom/navngo/igo/javaclient/Application;->mTtsSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    .line 836
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v2, Lcom/navngo/igo/javaclient/Application$4;

    invoke-direct {v2}, Lcom/navngo/igo/javaclient/Application$4;-><init>()V

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/Application;->runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V

    .line 845
    :cond_17
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->mTtsSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    monitor-exit v0

    return-object v1

    :catchall_1b
    move-exception v1

    .line 846
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v1
.end method

.method public static declared-synchronized isThereSDNotification()Z
    .registers 2

    const-class v0, Lcom/navngo/igo/javaclient/Application;

    monitor-enter v0

    .line 506
    :try_start_3
    sget-boolean v1, Lcom/navngo/igo/javaclient/Application;->hasPendingSDNotification:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private killOldDebugger()V
    .registers 3

    .line 1400
    new-instance v0, Ljava/io/File;

    const-string v1, "/proc"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/navngo/igo/javaclient/Application$9;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/Application$9;-><init>(Lcom/navngo/igo/javaclient/Application;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    return-void
.end method

.method private static locale2LanguageKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 1166
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_builtin:Ljava/lang/String;

    const-string v1, "Application"

    if-nez v0, :cond_45

    .line 1167
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    if-nez v0, :cond_d

    .line 1168
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->reInit()V

    .line 1170
    :cond_d
    :try_start_d
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget v2, Lcom/navngo/igo/javaclient/R$raw;->oslangcodes:I

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_builtin:Ljava/lang/String;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_1b} :catch_1c

    goto :goto_22

    :catch_1c
    move-exception v0

    const-string v2, "locale2LanguageKey"

    .line 1174
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_22
    :try_start_22
    const-string v0, ""

    .line 1177
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_content:Ljava/lang/String;

    .line 1178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "content/config/oslangcodes.ini"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_content:Ljava/lang/String;
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_3f} :catch_40

    goto :goto_45

    :catch_40
    const-string v0, "locale2LanguageKey: content/config/oslangcodes.ini not found, using defaults"

    .line 1181
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1189
    :cond_45
    :goto_45
    invoke-static {p0}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "\\"

    const-string v3, "\\\\"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "^\\s*aLanguage\\s*=\\s*(\"?)([^\"]*)\\1"

    const-string v3, "aLanguage"

    .line 1188
    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x8

    .line 1191
    invoke-static {v0, v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 1192
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_content:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 1194
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    const/4 v4, 0x2

    if-eqz v3, :cond_71

    .line 1195
    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_83

    .line 1197
    :cond_71
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_builtin:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 1198
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_82

    .line 1199
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_83

    :cond_82
    const/4 v0, 0x0

    .line 1205
    :goto_83
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "locale2LanguageKey: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " = "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static localeHasBeenChanged()Z
    .registers 2

    .line 1102
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->savedOSLocale:Ljava/lang/String;

    if-eqz v0, :cond_10

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getOSLocale()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public static logBuild()V
    .registers 4

    .line 1248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BOARD = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->BOARD:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Application:logBuild"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1249
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BRAND = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DEVICE = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DISPLAY = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1253
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FINGERPRINT = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "HOST = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->HOST:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1255
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ID = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MODEL = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PRODUCT = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1259
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v0, v2, :cond_e4

    .line 1260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SERIAL = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1262
    :cond_e4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TAGS = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->TAGS:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TIME = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v2, Landroid/os/Build;->TIME:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1264
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TYPE = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1265
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "USER = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build;->USER:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1267
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VERSION.INCREMENTAL = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1268
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VERSION.RELEASE = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1270
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VERSION.SDK = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static maxMemory()J
    .registers 7

    const-string v0, "closing /proc/meminfo"

    const-string v1, "Application"

    const/4 v2, 0x0

    .line 973
    :try_start_5
    sget-boolean v3, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    if-nez v3, :cond_e

    const-string v3, "Trying to open /proc/meminfo fd"

    .line 975
    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 977
    :cond_e
    new-instance v3, Ljava/io/FileInputStream;

    const-string v4, "/proc/meminfo"

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_15} :catch_44
    .catchall {:try_start_5 .. :try_end_15} :catchall_42

    .line 978
    :try_start_15
    new-instance v2, Ljava/lang/String;

    const/16 v4, 0x7d0

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readInputStream(Ljava/io/InputStream;I)[B

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/String;-><init>([B)V

    const-string v4, "(?s).*MemTotal:\\s+(\\d+).*"

    const-string v5, "$1"

    .line 979
    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_2c} :catch_3d
    .catchall {:try_start_15 .. :try_end_2c} :catchall_38

    const/16 v2, 0xa

    shl-long/2addr v4, v2

    .line 986
    :try_start_2f
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_32} :catch_33

    goto :goto_52

    :catch_33
    move-exception v2

    .line 988
    invoke-static {v1, v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_52

    :catchall_38
    move-exception v2

    move-object v6, v3

    move-object v3, v2

    move-object v2, v6

    goto :goto_53

    :catch_3d
    move-exception v2

    move-object v6, v3

    move-object v3, v2

    move-object v2, v6

    goto :goto_45

    :catchall_42
    move-exception v3

    goto :goto_53

    :catch_44
    move-exception v3

    :goto_45
    :try_start_45
    const-string v4, "/proc/meminfo; maxMemory set to 1 GB"

    .line 981
    invoke-static {v1, v4, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4a
    .catchall {:try_start_45 .. :try_end_4a} :catchall_42

    const-wide/32 v4, 0x40000000

    if-eqz v2, :cond_52

    .line 986
    :try_start_4f
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_52} :catch_33

    :cond_52
    :goto_52
    return-wide v4

    :goto_53
    if-eqz v2, :cond_5d

    :try_start_55
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_59

    goto :goto_5d

    :catch_59
    move-exception v2

    .line 988
    invoke-static {v1, v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 991
    :cond_5d
    :goto_5d
    throw v3
.end method

.method public static reInit()V
    .registers 1

    const/4 v0, 0x0

    .line 1282
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_builtin:Ljava/lang/String;

    const-string v0, ""

    .line 1283
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->oslangcodes_ini_content:Ljava/lang/String;

    const/4 v0, 0x1

    .line 1284
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    .line 1285
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->reInit()V

    return-void
.end method

.method private declared-synchronized runActivityCommands()V
    .registers 4

    monitor-enter p0

    .line 767
    :try_start_1
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    .line 768
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/Application;->mActivityCommands:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 769
    iget-object v2, p0, Lcom/navngo/igo/javaclient/Application;->mActivityCommands:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 771
    new-instance v2, Lcom/navngo/igo/javaclient/Application$3;

    invoke-direct {v2, p0, v1, v0}, Lcom/navngo/igo/javaclient/Application$3;-><init>(Lcom/navngo/igo/javaclient/Application;Ljava/util/List;Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1b

    .line 779
    monitor-exit p0

    return-void

    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private saveBuildTimeStamp()V
    .registers 5

    const-string v0, "PREVIOUS_TIMESTAMP"

    const/4 v1, 0x0

    .line 1094
    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1095
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "build_timestamp"

    const-wide v2, 0x185ab57e8e3L

    .line 1096
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 1097
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static saveCurrentLocale()Z
    .registers 1

    .line 1143
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getOSLocale()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Application;->savedOSLocale:Ljava/lang/String;

    const/4 v0, 0x1

    return v0
.end method

.method public static setBootTime(J)V
    .registers 3

    .line 930
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 931
    :try_start_3
    sput-wide p0, Lcom/navngo/igo/javaclient/Application;->bootTime:J

    .line 932
    monitor-exit v0

    return-void

    :catchall_7
    move-exception p0

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw p0
.end method

.method public static setIgoActivity(Lcom/navngo/igo/javaclient/IgoActivity;Z)V
    .registers 3

    .line 732
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 733
    :try_start_3
    sput-object p0, Lcom/navngo/igo/javaclient/Application;->theIgoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    .line 734
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_10

    if-eqz p0, :cond_f

    if-eqz p1, :cond_f

    .line 737
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Application;->runActivityCommands()V

    :cond_f
    return-void

    :catchall_10
    move-exception p0

    .line 734
    :try_start_11
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_10

    throw p0
.end method

.method public static setInsertSDCard(Lcom/navngo/igo/javaclient/InsertSDCard;)V
    .registers 2

    .line 918
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 919
    :try_start_3
    sput-object p0, Lcom/navngo/igo/javaclient/Application;->theInsertSDCard:Lcom/navngo/igo/javaclient/InsertSDCard;

    .line 920
    monitor-exit v0

    return-void

    :catchall_7
    move-exception p0

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw p0
.end method

.method public static setMainService(Lcom/navngo/igo/javaclient/MainService;)V
    .registers 3

    .line 784
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->mainServiceLock:Ljava/lang/String;

    monitor-enter v0

    .line 785
    :try_start_3
    sput-object p0, Lcom/navngo/igo/javaclient/Application;->theMainService:Lcom/navngo/igo/javaclient/MainService;

    if-eqz p0, :cond_f

    .line 787
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    sget-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->RUNNING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/ServiceRunner;->setMainServiceState(Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;)V

    goto :goto_16

    .line 789
    :cond_f
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    sget-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/ServiceRunner;->setMainServiceState(Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;)V

    .line 791
    :goto_16
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 792
    monitor-exit v0

    return-void

    :catchall_1b
    move-exception p0

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw p0
.end method

.method public static setMapView(Lcom/navngo/igo/javaclient/view/IMapView;)V
    .registers 4

    .line 797
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    :try_start_3
    const-string v1, "Application"

    if-nez p0, :cond_a

    const-string v2, "setMapView NULL"

    goto :goto_c

    :cond_a
    const-string v2, "setMapView VALID"

    .line 798
    :goto_c
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 799
    sput-object p0, Lcom/navngo/igo/javaclient/Application;->theMapView:Lcom/navngo/igo/javaclient/view/IMapView;

    .line 800
    monitor-exit v0

    return-void

    :catchall_13
    move-exception p0

    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw p0
.end method

.method public static setMediaScanning(Z)V
    .registers 4

    .line 1020
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    if-eqz p0, :cond_c

    .line 1021
    :try_start_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    goto :goto_e

    :catchall_a
    move-exception p0

    goto :goto_1f

    :cond_c
    const-wide/16 v1, 0x0

    :goto_e
    sput-wide v1, Lcom/navngo/igo/javaclient/Application;->mediascanning_timestamp:J

    .line 1022
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_5 .. :try_end_11} :catchall_a

    if-nez p0, :cond_1e

    .line 1024
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->mediascanning_event:Ljava/lang/String;

    monitor-enter p0

    .line 1025
    :try_start_16
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1026
    monitor-exit p0

    goto :goto_1e

    :catchall_1b
    move-exception v0

    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_16 .. :try_end_1d} :catchall_1b

    throw v0

    :cond_1e
    :goto_1e
    return-void

    .line 1022
    :goto_1f
    :try_start_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_a

    throw p0
.end method

.method public static declared-synchronized setSDNotificationCleared(Z)V
    .registers 2

    const-class v0, Lcom/navngo/igo/javaclient/Application;

    monitor-enter v0

    if-nez p0, :cond_7

    const/4 p0, 0x1

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    .line 511
    :goto_8
    :try_start_8
    sput-boolean p0, Lcom/navngo/igo/javaclient/Application;->hasPendingSDNotification:Z
    :try_end_a
    .catchall {:try_start_8 .. :try_end_a} :catchall_c

    .line 512
    monitor-exit v0

    return-void

    :catchall_c
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static setSatellites([I)V
    .registers 2

    .line 1213
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 1214
    :try_start_3
    sput-object p0, Lcom/navngo/igo/javaclient/Application;->satellites:[I

    .line 1215
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_a

    .line 1216
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->onSatellitesChanged()V

    return-void

    :catchall_a
    move-exception p0

    .line 1215
    :try_start_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw p0
.end method

.method public static setupAudioPath(Landroid/media/AudioManager;)V
    .registers 7

    const-string v0, "android"

    const-string v1, "setup_audio_path"

    const/4 v2, 0x0

    .line 1049
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_a2

    const/16 v1, 0x10

    const-string v3, "bt_route"

    .line 1050
    invoke-static {v0, v3, v1}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    and-int/lit8 v3, v1, 0x14

    const/4 v4, 0x1

    if-eqz v3, :cond_1a

    const/4 v3, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v3, 0x0

    :goto_1b
    const-string v5, "bt_sco_on"

    .line 1052
    invoke-static {v0, v5, v3}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_26

    goto :goto_27

    :cond_26
    const/4 v4, 0x0

    :goto_27
    const-string v1, "speakerphone_on"

    .line 1053
    invoke-static {v0, v1, v4}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    .line 1055
    invoke-virtual {p0, v2}, Landroid/media/AudioManager;->setMode(I)V

    .line 1057
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SCO BT before: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Application"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_4f

    .line 1059
    invoke-virtual {p0}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 1060
    :cond_4f
    invoke-virtual {p0, v3}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    if-nez v3, :cond_57

    .line 1062
    invoke-virtual {p0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 1063
    :cond_57
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SCO BT after: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1065
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Speakerphone before: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1066
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 1067
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Speakerphone after: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a2
    return-void
.end method

.method private static showSDNotification(Z)V
    .registers 10

    .line 469
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 471
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->isThereSDNotification()Z

    move-result v1

    if-ne v1, p0, :cond_11

    return-void

    :cond_11
    const/4 v1, 0x1

    if-eqz p0, :cond_67

    .line 476
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget v3, Lcom/navngo/igo/javaclient/R$string;->sdcard_missing:I

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/Application;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 477
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.navngo.igo.javaclient.InsertSDCard.DEFAULT"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const v4, 0x34000004

    .line 478
    invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 483
    sget-object v4, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    const/high16 v6, 0x4000000

    invoke-static {v4, v5, v3, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 484
    sget-object v4, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    .line 485
    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sget-object v7, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget v8, Lcom/navngo/igo/javaclient/R$string;->app_name:I

    .line 486
    invoke-virtual {v7, v8}, Lcom/navngo/igo/javaclient/Application;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 484
    invoke-static {v4, v7, v2, v3}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v2

    .line 489
    new-instance v3, Landroid/content/Intent;

    const-string v4, "com.navngo.igo.javaclient.InsertSDCard.CLEAR"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const v4, 0x24000004

    .line 490
    invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 494
    sget-object v4, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v5, v3, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    iput-object v3, v2, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 495
    iput v5, v2, Landroid/app/Notification;->defaults:I

    .line 496
    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto :goto_6a

    .line 499
    :cond_67
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 501
    :goto_6a
    sput-boolean p0, Lcom/navngo/igo/javaclient/Application;->hasPendingSDNotification:Z

    return-void
.end method

.method public static startSensors()V
    .registers 3

    const-string v0, "gps"

    const-string v1, "sensors_on"

    const/4 v2, 0x0

    .line 996
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_c

    return-void

    .line 998
    :cond_c
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getSensorUtility()Lcom/navngo/igo/javaclient/utils/SensorUtility;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/SensorUtility;->startSensors()V

    return-void
.end method

.method public static stopSensors()V
    .registers 2

    .line 1002
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 1003
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theSensorUtility:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    .line 1004
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_c

    if-eqz v1, :cond_b

    .line 1006
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/utils/SensorUtility;->stopSensors()V

    :cond_b
    return-void

    :catchall_c
    move-exception v1

    .line 1004
    :try_start_d
    monitor-exit v0
    :try_end_e
    .catchall {:try_start_d .. :try_end_e} :catchall_c

    throw v1
.end method

.method public static waitMediaScanning()V
    .registers 10

    .line 1031
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->shortLock:Ljava/lang/String;

    monitor-enter v0

    .line 1032
    :try_start_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 1033
    sget-wide v3, Lcom/navngo/igo/javaclient/Application;->mediascanning_timestamp:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_1d

    const-string v7, "android"

    const-string v8, "mediascanning_timeout"

    const/16 v9, 0x4e20

    .line 1034
    invoke-static {v7, v8, v9}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v3, v7

    sub-long/2addr v1, v3

    goto :goto_1e

    :cond_1d
    move-wide v1, v5

    .line 1036
    :goto_1e
    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_31

    cmp-long v0, v1, v5

    if-lez v0, :cond_30

    .line 1038
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->mediascanning_event:Ljava/lang/String;

    monitor-enter v0

    .line 1040
    :try_start_26
    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_29
    .catch Ljava/lang/InterruptedException; {:try_start_26 .. :try_end_29} :catch_2c
    .catchall {:try_start_26 .. :try_end_29} :catchall_2a

    goto :goto_2c

    :catchall_2a
    move-exception v1

    goto :goto_2e

    .line 1044
    :catch_2c
    :goto_2c
    :try_start_2c
    monitor-exit v0

    goto :goto_30

    :goto_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2c .. :try_end_2f} :catchall_2a

    throw v1

    :cond_30
    :goto_30
    return-void

    :catchall_31
    move-exception v1

    .line 1036
    :try_start_32
    monitor-exit v0
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    throw v1
.end method


# virtual methods
.method public Initialize()V
    .registers 5

    .line 235
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->mInitialized:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 237
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->mInitialized:Z

    .line 239
    invoke-static {}, Lcom/navngo/igo/javaclient/DebugLogger;->init()V

    .line 240
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->initialize()V

    .line 242
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->setParams()V

    .line 244
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 246
    sget-object v2, Lcom/navngo/igo/javaclient/Config;->serverStartDir:Ljava/lang/String;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/NNG;->chdir(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_48

    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget v3, Lcom/navngo/igo/javaclient/R$string;->missing_or_incomplete_folder:I

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/Application;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->serverStartDir:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget v2, Lcom/navngo/igo/javaclient/R$string;->app_name:I

    .line 248
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 247
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/NNG;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    return-void

    .line 252
    :cond_48
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->timeStampMatch()Z

    move-result v2

    xor-int/2addr v0, v2

    if-eqz v0, :cond_52

    .line 254
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Application;->saveBuildTimeStamp()V

    .line 258
    :cond_52
    :try_start_52
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DataInstaller;->RebuildDataDir(Landroid/content/res/Resources;Z)Ljava/lang/Exception;

    move-result-object v0

    const/4 v2, 0x5

    .line 259
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Config;->reload(I)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_5a} :catch_5b

    goto :goto_5c

    :catch_5b
    move-exception v0

    .line 263
    :goto_5c
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/NNG;->showRebuildError(Landroid/content/res/Resources;Ljava/lang/Exception;)V

    .line 266
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->resetScreenSizes()V

    return-void
.end method

.method public alert(I)V
    .registers 3

    .line 440
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/Application;->alert(Ljava/lang/String;)V

    return-void
.end method

.method public alert(Ljava/lang/String;)V
    .registers 4

    .line 401
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "alert: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Application"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.navngo.igo.javaclient.WarnerBrothers.DEFAULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 404
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    .line 405
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    .line 408
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 409
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public varargs alert(Ljava/lang/String;ILjava/lang/String;I[Ljava/lang/String;)V
    .registers 9

    .line 413
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "alert: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Application"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.navngo.igo.javaclient.WarnerBrothers.DEFAULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 416
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    .line 417
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    .line 420
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "ClientId"

    .line 421
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "Intent"

    .line 422
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "Timeout"

    .line 423
    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 425
    array-length p1, p5

    const/4 p2, 0x0

    const/4 p3, 0x0

    :goto_40
    if-ge p2, p1, :cond_6c

    aget-object p4, p5, p2

    if-eqz p4, :cond_6c

    const-string v1, ""

    .line 426
    invoke-virtual {p4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4f

    goto :goto_6c

    :cond_4f
    add-int/lit8 p3, p3, 0x1

    .line 430
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Button"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p4, 0x3

    if-ne p3, p4, :cond_69

    goto :goto_6c

    :cond_69
    add-int/lit8 p2, p2, 0x1

    goto :goto_40

    :cond_6c
    :goto_6c
    const-string p1, "NofUserButtons"

    .line 435
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 436
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public final createMapView()Lcom/navngo/igo/javaclient/view/IMapView;
    .registers 5

    .line 804
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->createMapViewLock:Ljava/lang/String;

    monitor-enter v0

    .line 805
    :try_start_3
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v1

    if-nez v1, :cond_43

    const-string v1, "rawdisplay"

    const-string v2, "driver"

    const-string v3, ""

    .line 807
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 808
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_27

    const-string v2, "GLES"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_37

    :cond_27
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->is_gles2_supported()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 809
    new-instance v1, Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/navngo/igo/javaclient/view/GLMapView;-><init>(Landroid/content/Context;)V

    goto :goto_40

    .line 811
    :cond_37
    new-instance v1, Lcom/navngo/igo/javaclient/view/MapView;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/navngo/igo/javaclient/view/MapView;-><init>(Landroid/content/Context;)V

    .line 813
    :goto_40
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->setMapView(Lcom/navngo/igo/javaclient/view/IMapView;)V

    .line 815
    :cond_43
    monitor-exit v0

    return-object v1

    :catchall_45
    move-exception v1

    .line 816
    monitor-exit v0
    :try_end_47
    .catchall {:try_start_3 .. :try_end_47} :catchall_45

    throw v1
.end method

.method public generateHapticFeedback(Z)V
    .registers 4

    .line 711
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/view/IMapView;->asView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz p1, :cond_d

    const/4 p1, 0x1

    goto :goto_f

    :cond_d
    const/16 p1, 0x8

    :goto_f
    invoke-virtual {v0, p1, v1}, Landroid/view/View;->performHapticFeedback(II)Z

    return-void
.end method

.method public getAndroidPackageName()Ljava/lang/String;
    .registers 2

    .line 134
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationContext()Landroid/content/Context;
    .registers 2

    .line 126
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getApplicationInfo()Landroid/content/pm/ApplicationInfo;
    .registers 2

    .line 130
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    return-object v0
.end method

.method public getContentResolver()Landroid/content/ContentResolver;
    .registers 2

    .line 142
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceDependentMaxMemory()I
    .registers 9

    .line 687
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->maxMemory()J

    move-result-wide v0

    long-to-float v0, v0

    const-string v1, "gtmc"

    const-string v2, "reference_resolution"

    const v3, 0x5dc00

    .line 688
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    int-to-float v2, v2

    const-string v3, "reference_memory"

    const/high16 v4, 0x20000000

    .line 689
    invoke-static {v1, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    int-to-float v3, v3

    .line 691
    iget v4, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    if-lez v4, :cond_5d

    iget v4, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    if-lez v4, :cond_5d

    const/4 v4, 0x0

    cmpl-float v5, v0, v4

    if-lez v5, :cond_5d

    cmpl-float v5, v2, v4

    if-lez v5, :cond_5d

    cmpl-float v4, v3, v4

    if-lez v4, :cond_5d

    const/high16 v4, 0x1000000

    const-string v5, "memory_per_resolution_ratio"

    .line 693
    invoke-static {v1, v5, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x5000000

    const-string v6, "memory_per_max_memory_ratio"

    .line 694
    invoke-static {v1, v6, v5}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    int-to-float v5, v5

    .line 697
    iget v6, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    iget v7, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    mul-int v6, v6, v7

    int-to-float v6, v6

    div-float/2addr v6, v2

    mul-float v4, v4, v6

    div-float/2addr v0, v3

    mul-float v5, v5, v0

    const/high16 v0, 0x12c00000

    const-string v2, "max_memory_limit"

    .line 704
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    add-float/2addr v4, v5

    float-to-int v1, v4

    .line 705
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_5e

    :cond_5d
    const/4 v0, -0x1

    :goto_5e
    return v0
.end method

.method public getDisplayDensityDpi()I
    .registers 2

    .line 660
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    return v0
.end method

.method public getDisplayMultitouchSupport()I
    .registers 3

    .line 675
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.touchscreen.multitouch.jazzhand"

    .line 676
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->JazzHand:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    iget v0, v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->code:I

    return v0

    :cond_11
    const-string v1, "android.hardware.touchscreen.multitouch.distinct"

    .line 677
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    sget-object v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->Distinct:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    iget v0, v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->code:I

    return v0

    :cond_1e
    const-string v1, "android.hardware.touchscreen.multitouch"

    .line 678
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2b

    sget-object v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->Basic:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    iget v0, v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->code:I

    return v0

    .line 679
    :cond_2b
    sget-object v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->None:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    iget v0, v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->code:I

    return v0
.end method

.method public getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;
    .registers 4

    .line 146
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_d

    .line 147
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object p1

    return-object p1

    :cond_d
    const/4 p1, 0x0

    new-array p1, p1, [Ljava/io/File;

    return-object p1
.end method

.method public getFilesDir()Ljava/io/File;
    .registers 2

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getOSVersion()I
    .registers 2

    .line 138
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method

.method public getPackageManager()Landroid/content/pm/PackageManager;
    .registers 2

    .line 157
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 2

    .line 161
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .registers 2

    .line 165
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getScreenSizes()Lcom/navngo/igo/javaclient/Application$ScreenSizes;
    .registers 30

    move-object/from16 v0, p0

    .line 558
    new-instance v1, Lcom/navngo/igo/javaclient/Application$ScreenSizes;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/navngo/igo/javaclient/Application$ScreenSizes;-><init>(Lcom/navngo/igo/javaclient/Application;Lcom/navngo/igo/javaclient/Application$1;)V

    .line 562
    iget v3, v0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    .line 563
    iget v4, v0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    .line 564
    rem-int/lit8 v5, v3, 0x2

    const-string v6, "), correcting"

    const-string v7, "x"

    const-string v8, "Application"

    const/4 v9, 0x0

    const/4 v10, 0x2

    if-nez v5, :cond_1c

    rem-int/lit8 v11, v4, 0x2

    if-eqz v11, :cond_49

    .line 565
    :cond_1c
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getScreenSizes: odd display size reported by getDisplayResolution(): ("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v8, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_3e

    rsub-int/lit8 v5, v5, 0x2

    goto :goto_3f

    :cond_3e
    const/4 v5, 0x0

    :goto_3f
    add-int/2addr v3, v5

    .line 567
    rem-int/lit8 v5, v4, 0x2

    if-eqz v5, :cond_47

    rsub-int/lit8 v5, v5, 0x2

    goto :goto_48

    :cond_47
    const/4 v5, 0x0

    :goto_48
    add-int/2addr v4, v5

    .line 569
    :cond_49
    move-object v5, v2

    check-cast v5, Ljava/util/Locale;

    new-array v5, v10, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v5, v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v12, 0x1

    aput-object v11, v5, v12

    const-string v11, "getScreenSizes: Display: width=%d height=%d"

    invoke-static {v2, v11, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "rawdisplay"

    const-string v11, "screen_xy"

    const-string v13, "auto"

    .line 572
    invoke-static {v5, v11, v13}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 573
    invoke-virtual {v11, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_eb

    .line 575
    iget v11, v0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    .line 576
    iget v13, v0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    .line 578
    rem-int/lit8 v17, v11, 0x2

    if-nez v17, :cond_80

    rem-int/lit8 v18, v13, 0x2

    if-eqz v18, :cond_ad

    .line 579
    :cond_80
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getScreenSizes: odd size reported by getAvailableScreenSize(true): ("

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v17, :cond_a2

    rsub-int/lit8 v2, v17, 0x2

    goto :goto_a3

    :cond_a2
    const/4 v2, 0x0

    :goto_a3
    add-int/2addr v11, v2

    .line 581
    rem-int/lit8 v2, v13, 0x2

    if-eqz v2, :cond_ab

    rsub-int/lit8 v2, v2, 0x2

    goto :goto_ac

    :cond_ab
    const/4 v2, 0x0

    :goto_ac
    add-int/2addr v13, v2

    .line 584
    :cond_ad
    iget v2, v0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    .line 585
    iget v15, v0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    .line 587
    rem-int/lit8 v17, v15, 0x2

    if-nez v17, :cond_bd

    rem-int/lit8 v19, v2, 0x2

    if-eqz v19, :cond_ba

    goto :goto_bd

    :cond_ba
    :goto_ba
    move-object v0, v1

    goto/16 :goto_270

    .line 588
    :cond_bd
    :goto_bd
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getScreenSizes: odd size reported by getAvailableScreenSize(false): ("

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v17, :cond_df

    rsub-int/lit8 v6, v17, 0x2

    goto :goto_e0

    :cond_df
    const/4 v6, 0x0

    :goto_e0
    add-int/2addr v15, v6

    .line 590
    rem-int/lit8 v6, v2, 0x2

    if-eqz v6, :cond_e8

    rsub-int/lit8 v6, v6, 0x2

    goto :goto_e9

    :cond_e8
    const/4 v6, 0x0

    :goto_e9
    add-int/2addr v2, v6

    goto :goto_ba

    :cond_eb
    const-wide/16 v6, 0x0

    .line 595
    sget-boolean v2, Lcom/navngo/igo/javaclient/Config;->fullscreen:Z

    if-ge v3, v4, :cond_f6

    xor-int/2addr v3, v4

    xor-int/2addr v4, v3

    xor-int/2addr v3, v4

    const/4 v9, 0x1

    goto :goto_f7

    :cond_f6
    const/4 v9, 0x0

    :goto_f7
    const-string v13, ","

    .line 602
    invoke-virtual {v11, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    const-string v13, "(\\d+)_(\\d+):(\\d+)x(\\d+)/(\\d+)x(\\d+)((:fullscreen)?)"

    .line 603
    invoke-static {v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v13

    .line 604
    array-length v14, v11

    const/4 v15, 0x0

    const/16 v17, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    :goto_10d
    if-ge v15, v14, :cond_23b

    aget-object v10, v11, v15

    .line 605
    invoke-virtual {v13, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    .line 606
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->matches()Z

    move-result v23

    if-nez v23, :cond_140

    .line 607
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "getScreenSizes screen_xy entry: ("

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v25, v1

    move/from16 v26, v2

    move-wide/from16 v27, v6

    move-object/from16 v23, v13

    move/from16 v24, v14

    goto/16 :goto_229

    :cond_140
    const/4 v0, 0x1

    .line 610
    invoke-virtual {v12, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v10, 0x2

    .line 611
    invoke-virtual {v12, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    move-object/from16 v23, v13

    move/from16 v24, v14

    int-to-long v13, v0

    move-object/from16 v25, v1

    move/from16 v26, v2

    int-to-long v1, v10

    mul-long v13, v13, v1

    const-string v1, ":fullscreen"

    if-lt v3, v0, :cond_198

    if-lt v4, v10, :cond_198

    cmp-long v2, v13, v6

    if-ltz v2, :cond_198

    const/4 v2, 0x3

    .line 616
    invoke-virtual {v12, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    const/4 v0, 0x4

    .line 617
    invoke-virtual {v12, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    const/4 v0, 0x5

    .line 618
    invoke-virtual {v12, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    const/4 v0, 0x6

    .line 619
    invoke-virtual {v12, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    const/4 v0, 0x7

    .line 620
    invoke-virtual {v12, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    move v2, v0

    goto/16 :goto_227

    :cond_198
    move-wide/from16 v27, v6

    const/4 v2, 0x4

    new-array v6, v2, [Ljava/lang/Object;

    .line 623
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v16, 0x1

    aput-object v2, v6, v16

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v16, 0x2

    aput-object v2, v6, v16

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v7, 0x3

    aput-object v2, v6, v7

    const-string v2, "getScreenSizes: display (%dx%d) is smaller than required (%dx%d)"

    const/4 v7, 0x0

    invoke-static {v7, v2, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v17, :cond_229

    const/4 v6, 0x0

    new-array v7, v6, [Ljava/lang/Object;

    const-string v6, "getScreenSizes: display was detected 0x0, choosing the first one"

    .line 625
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v6, 0x3

    .line 627
    invoke-virtual {v12, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    const/4 v6, 0x4

    .line 628
    invoke-virtual {v12, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    const/4 v7, 0x5

    .line 629
    invoke-virtual {v12, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v20

    const/4 v7, 0x6

    .line 630
    invoke-virtual {v12, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    const/4 v7, 0x7

    .line 631
    invoke-virtual {v12, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    new-array v7, v6, [Ljava/lang/Object;

    .line 632
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v12, 0x0

    aput-object v6, v7, v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v12, 0x1

    aput-object v6, v7, v12

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x2

    aput-object v0, v7, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x3

    aput-object v0, v7, v6

    const/4 v0, 0x0

    invoke-static {v0, v2, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v1

    :goto_227
    move-wide v6, v13

    goto :goto_22d

    :cond_229
    :goto_229
    move/from16 v2, v26

    move-wide/from16 v6, v27

    :goto_22d
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    move-object/from16 v13, v23

    move/from16 v14, v24

    move-object/from16 v1, v25

    const/4 v10, 0x2

    const/4 v12, 0x1

    goto/16 :goto_10d

    :cond_23b
    move-object/from16 v25, v1

    move/from16 v26, v2

    if-eqz v9, :cond_24f

    xor-int v0, v17, v20

    xor-int v1, v20, v0

    xor-int/2addr v0, v1

    xor-int v2, v21, v22

    xor-int v6, v22, v2

    xor-int/2addr v2, v6

    move v11, v0

    move v15, v1

    move v13, v6

    goto :goto_257

    :cond_24f
    move/from16 v11, v17

    move/from16 v15, v20

    move/from16 v2, v21

    move/from16 v13, v22

    .line 640
    :goto_257
    sput-boolean v26, Lcom/navngo/igo/javaclient/Config;->fullscreen:Z

    move-object/from16 v0, v25

    .line 642
    iput v11, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x:I

    .line 643
    iput v13, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y:I

    .line 644
    iput v15, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x2:I

    .line 645
    iput v2, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y2:I

    if-nez v15, :cond_267

    if-ne v11, v13, :cond_26b

    :cond_267
    if-nez v11, :cond_26d

    if-eq v15, v2, :cond_26d

    :cond_26b
    const/4 v1, 0x1

    goto :goto_26e

    :cond_26d
    const/4 v1, 0x0

    .line 646
    :goto_26e
    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mOrientationIsFixed:Z

    :goto_270
    const-string v1, "orientation"

    const/4 v6, -0x1

    .line 649
    invoke-static {v5, v1, v6}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 650
    iget-boolean v5, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mOrientationIsFixed:Z

    if-eq v1, v6, :cond_27d

    const/4 v1, 0x1

    goto :goto_27e

    :cond_27d
    const/4 v1, 0x0

    :goto_27e
    or-int/2addr v1, v5

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mOrientationIsFixed:Z

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    .line 652
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x0

    aput-object v3, v1, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v1, v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v1, v4

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    aput-object v3, v1, v4

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x4

    aput-object v3, v1, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x5

    aput-object v2, v1, v3

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->isOrientationFixed()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x6

    aput-object v2, v1, v3

    const-string v2, "getScreenSizes: %d,%d --> %d,%d %d,%d is_orientation_fixed: %b"

    const/4 v3, 0x0

    invoke-static {v3, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v8, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    .registers 4

    .line 169
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    return-object p1
.end method

.method public getString(I)Ljava/lang/String;
    .registers 3

    .line 173
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSurfaceSize()Lcom/navngo/igo/javaclient/androidgo/OutArgs;
    .registers 5

    .line 683
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/Application;->mainSurfacePresent:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .line 177
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public isAppInForeground()Z
    .registers 7

    .line 297
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "Application"

    if-nez v0, :cond_f

    const-string v0, "isAppInForeground: context is null"

    .line 299
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_f
    const-string v3, "activity"

    .line 302
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    if-nez v0, :cond_1f

    const-string v0, "isAppInForeground: failed to get ACTIVITY_SERVICE"

    .line 304
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 307
    :cond_1f
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_2b

    const-string v0, "isAppInForeground: getRunningAppProcesses() returned null!"

    .line 309
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 312
    :cond_2b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isAppInForeground: getRunningAppProcesses() returned "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " item(s)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 314
    iget v4, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    if-ne v4, v5, :cond_4c

    .line 315
    iget v0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v4, 0x64

    if-gt v0, v4, :cond_67

    const/4 v1, 0x1

    .line 316
    :cond_67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isAppInForeground: pid="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", importance="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", isForeground="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8f
    return v1
.end method

.method public isGuiSurfaceCreated()Z
    .registers 2

    .line 120
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->guiSurfaceCreated:Z

    return v0
.end method

.method public is_gles2_supported()Z
    .registers 3

    const-string v0, "activity"

    .line 715
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 716
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object v0

    .line 717
    iget v0, v0, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    const/high16 v1, 0x20000

    if-lt v0, v1, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public onGuiSurfaceCreated()V
    .registers 3

    const/4 v0, 0x1

    .line 328
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->guiSurfaceCreated:Z

    .line 329
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mGuiSurfaceCreatedCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/Application$GuiSurfaceCreatedCallback;

    .line 330
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/Application$GuiSurfaceCreatedCallback;->onGuiSurfaceCreated()V

    goto :goto_9

    :cond_19
    return-void
.end method

.method public onPermissionsGranted()V
    .registers 7

    const-string v0, "Application"

    .line 270
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->Initialize()V

    const/4 v1, 0x0

    .line 276
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    const-string v2, "debug"

    const-string v3, "gdb"

    .line 278
    invoke-static {v2, v3, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_91

    :try_start_13
    const-string v2, "trying to start gdb"

    .line 280
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v2}, Lcom/navngo/igo/javaclient/DataInstaller;->unpackDebugger(Landroid/content/res/Resources;)V

    .line 282
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/Application;->killOldDebugger()V

    const-string v2, "native load start"

    .line 283
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    sget-boolean v2, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    if-nez v2, :cond_2e

    .line 285
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->reInit()V

    :cond_2e
    const-string v2, "native load done, waiting for debugger..."

    .line 286
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "gdbserver"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    const/4 v1, 0x1

    const-string v4, ":1234"

    aput-object v4, v3, v1

    const/4 v1, 0x2

    const-string v4, "--attach"

    aput-object v4, v3, v1

    const/4 v1, 0x3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    const-string v1, "android"

    const-string v2, "wait_for_gdbserver"

    const v3, 0xea60

    .line 288
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    const-string v1, "debugger wait done"

    .line 289
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_88} :catch_89

    goto :goto_91

    :catch_89
    move-exception v1

    .line 291
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_91
    :goto_91
    return-void
.end method

.method public registerApplicationFunctors()V
    .registers 4

    .line 200
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.wantGpsListener"

    const-string v2, "uiWantGpsListener"

    .line 201
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.getdisplaydensity"

    const-string v2, "getDisplayDensityDpi"

    .line 202
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.display.get_multitouch_support"

    const-string v2, "getDisplayMultitouchSupport"

    .line 203
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.activity.request_orientation"

    const-string v2, "requestActivityOrientation"

    .line 204
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.getSurfaceSize"

    const-string v2, "getSurfaceSize"

    .line 205
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.getDeviceDependentMaxMemory"

    const-string v2, "getDeviceDependentMaxMemory"

    .line 206
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.onGuiSurfaceCreated"

    const-string v2, "onGuiSurfaceCreated"

    .line 207
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.is_gles2_supported"

    const-string v2, "is_gles2_supported"

    .line 208
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.startInForeground"

    const-string v2, "startMainActivityInForeground"

    .line 209
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.sendCurrentTimeZone"

    const-string v2, "sendCurrentTimeZone"

    .line 210
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.getPackageName"

    const-string v2, "getAndroidPackageName"

    .line 211
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.setSleepMode"

    const-string v2, "setSleepMode"

    .line 212
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.setShutdownBlock"

    const-string v2, "setShutdownBlock"

    .line 213
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.generateHapticFeedback"

    const-string v2, "generateHapticFeedback"

    .line 214
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.get_android_os_version"

    const-string v2, "getOSVersion"

    .line 215
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.rollback"

    const-string v2, "rollback"

    .line 216
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.syncdirs"

    const-string v2, "syncDirsThenExit"

    .line 217
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.showMessageBox"

    const-string v2, "showMessageBox"

    .line 218
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 219
    sget-object v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->INSTANCE:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->registerFunctors()V

    return-void
.end method

.method public final registerCommonReceivers()V
    .registers 4

    .line 1509
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->def_notify_network_status:Z

    const-string v1, "android"

    const-string v2, "notify_network_status"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1510
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    .line 1512
    :cond_11
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    .line 1513
    invoke-static {}, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->getState()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->processState(Ljava/lang/String;)V

    .line 1514
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/TimeReceiver;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    .line 1515
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    .line 1516
    sget-object v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->INSTANCE:Lcom/navngo/igo/javaclient/BatteryStatusReceiver;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    .line 1517
    sget-object v0, Lcom/navngo/igo/javaclient/AndroidOSEventsBridge;->instance:Lcom/navngo/igo/javaclient/AndroidOSEventsBridge;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    .line 1519
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    return-void
.end method

.method public final registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V
    .registers 2

    .line 1524
    invoke-interface {p1}, Lcom/navngo/igo/javaclient/functors/IFunctorCollection;->registerFunctors()V

    return-void
.end method

.method public registerGuiSurfaceCreatedCallback(Lcom/navngo/igo/javaclient/Application$GuiSurfaceCreatedCallback;)V
    .registers 3

    .line 117
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mGuiSurfaceCreatedCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final registerInterfaces()V
    .registers 5

    const-string v0, "Application"

    const-string v1, "registerInterfaces()"

    .line 1422
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 1424
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->registerApplicationFunctors()V

    .line 1427
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->mainServiceLock:Ljava/lang/String;

    monitor-enter v0

    .line 1429
    :catch_d
    :goto_d
    :try_start_d
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->theMainService:Lcom/navngo/igo/javaclient/MainService;
    :try_end_f
    .catchall {:try_start_d .. :try_end_f} :catchall_30

    if-nez v1, :cond_20

    :try_start_11
    const-string v1, "Application"

    const-string v2, "registerInterfaces(): waiting for MainService"

    .line 1431
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1432
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->mainServiceLock:Ljava/lang/String;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_11 .. :try_end_1f} :catch_d
    .catchall {:try_start_11 .. :try_end_1f} :catchall_30

    goto :goto_d

    :cond_20
    :try_start_20
    const-string v1, "Application"

    const-string v2, "registerInterfaces(): MainService created"

    .line 1437
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_20 .. :try_end_28} :catchall_30

    .line 1441
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->theMainService:Lcom/navngo/igo/javaclient/MainService;

    if-eqz v0, :cond_2f

    .line 1443
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/MainService;->registerInterfaces()V

    :cond_2f
    return-void

    :catchall_30
    move-exception v1

    .line 1438
    :try_start_31
    monitor-exit v0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw v1
.end method

.method public final registerObserver(Lcom/navngo/igo/javaclient/observer/IObserver;)V
    .registers 4

    .line 1461
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1462
    iget-object v1, p0, Lcom/navngo/igo/javaclient/Application;->mContentObservers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1463
    invoke-interface {p1, v0}, Lcom/navngo/igo/javaclient/observer/IObserver;->registerContentObserver(Landroid/content/ContentResolver;)V

    return-void
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    .registers 4

    .line 189
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1, p2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p1

    return-object p1
.end method

.method public final registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V
    .registers 3

    .line 1480
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mReceivers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1481
    invoke-interface {p1}, Lcom/navngo/igo/javaclient/receiver/IReceiver;->register()V

    return-void
.end method

.method public requestActivityOrientation(I)V
    .registers 3

    .line 721
    new-instance v0, Lcom/navngo/igo/javaclient/Application$1;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/Application$1;-><init>(Lcom/navngo/igo/javaclient/Application;I)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V

    return-void
.end method

.method public resetScreenSizes()V
    .registers 5

    const-string v0, "window"

    .line 540
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 542
    new-instance v1, Landroid/graphics/Point;

    const/16 v2, 0x320

    const/16 v3, 0x1e0

    invoke-direct {v1, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 545
    :try_start_11
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_18} :catch_19

    goto :goto_21

    :catch_19
    move-exception v0

    const-string v2, "Application"

    const-string v3, "Could not get screen sizes"

    .line 549
    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 552
    :goto_21
    iget v0, v1, Landroid/graphics/Point;->x:I

    iput v0, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    .line 553
    iget v0, v1, Landroid/graphics/Point;->y:I

    iput v0, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    return-void
.end method

.method public rollback()V
    .registers 5

    const-string v0, "Application"

    const-string v1, "Rollback called"

    .line 1314
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "folders"

    const-string v2, "content_store"

    const-string v3, ""

    .line 1315
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1316
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1317
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_22

    const-string v1, "Content store not found"

    .line 1318
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1321
    :cond_22
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/navngo/igo/javaclient/Application;->syncDirsThenExit(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V
    .registers 4

    monitor-enter p0

    .line 753
    :try_start_1
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 755
    new-instance v1, Lcom/navngo/igo/javaclient/Application$2;

    invoke-direct {v1, p0, p1, v0}, Lcom/navngo/igo/javaclient/Application$2;-><init>(Lcom/navngo/igo/javaclient/Application;Lcom/navngo/igo/javaclient/Application$IActivityCommand;Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_15

    .line 762
    :cond_10
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mActivityCommands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_17

    .line 764
    :goto_15
    monitor-exit p0

    return-void

    :catchall_17
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public sendBroadcast(Landroid/content/Intent;)V
    .registers 3

    .line 181
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public sendCurrentTimeZone(I)V
    .registers 7

    if-gez p1, :cond_5

    const/16 v0, 0x2d

    goto :goto_7

    :cond_5
    const/16 v0, 0x2b

    .line 337
    :goto_7
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    .line 338
    div-int/lit8 v1, p1, 0x3c

    .line 339
    rem-int/lit8 p1, p1, 0x3c

    .line 342
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v0

    const-string p1, "GMT%c%02d:%02d"

    invoke-static {v2, p1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 343
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Setting timeZone to \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Application"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    const-string v2, "android.permission.SET_TIME_ZONE"

    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5c

    const-string p1, "Missing SET_TIME_ZONE permission"

    .line 346
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_5c
    const-string v0, "alarm"

    .line 349
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 350
    invoke-virtual {v0, p1}, Landroid/app/AlarmManager;->setTimeZone(Ljava/lang/String;)V

    return-void
.end method

.method public setApplicationContext(Landroid/content/Context;)V
    .registers 4

    .line 223
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    if-nez v0, :cond_b

    .line 224
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    goto :goto_22

    .line 225
    :cond_b
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "Application"

    const-string v1, "Application context changed"

    .line 226
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    .line 230
    :cond_22
    :goto_22
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->loadConfigFromApk()V

    .line 231
    new-instance p1, Lcom/navngo/igo/javaclient/ServiceRunner;

    invoke-direct {p1}, Lcom/navngo/igo/javaclient/ServiceRunner;-><init>()V

    sput-object p1, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    return-void
.end method

.method public setShutdownBlock(Z)V
    .registers 4

    .line 364
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setShutdownBlock "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Application"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->setShutdownBlock(Z)V

    return-void
.end method

.method public setSleepMode(Z)V
    .registers 5

    .line 355
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 358
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSleepMode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " igo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Application"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->SetSleepMode(Z)V

    :cond_27
    return-void
.end method

.method public showMessageBox(Ljava/lang/String;)V
    .registers 4

    .line 397
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/navngo/igo/javaclient/R$string;->app_name:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/navngo/igo/javaclient/NNG;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    return-void
.end method

.method public startActivity(Landroid/content/Intent;)V
    .registers 3

    .line 185
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public startMainActivityInForeground()V
    .registers 2

    const/4 v0, 0x0

    .line 515
    invoke-static {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForeground(I)V

    return-void
.end method

.method public surfaceDestroyed(I)V
    .registers 7

    .line 386
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->surfaceSizeTransferLockObj:Ljava/lang/String;

    monitor-enter v0

    const/4 v1, 0x0

    if-nez p1, :cond_8

    .line 387
    :try_start_6
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/Application;->mainSurfacePresent:Z

    .line 388
    :cond_8
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/Application;->guiSurfaceCreated:Z

    if-eqz v2, :cond_1e

    .line 390
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v2

    const-string v3, "android.surface_destroyed"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    .line 391
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v1

    invoke-virtual {v2, v3, v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgoSync(Ljava/lang/String;[Ljava/lang/Object;)Z

    .line 393
    :cond_1e
    monitor-exit v0

    return-void

    :catchall_20
    move-exception p1

    monitor-exit v0
    :try_end_22
    .catchall {:try_start_6 .. :try_end_22} :catchall_20

    throw p1
.end method

.method public surfaceSizeChanged(III)V
    .registers 11

    .line 370
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->surfaceSizeTransferLockObj:Ljava/lang/String;

    monitor-enter v0

    .line 371
    :try_start_3
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/Application;->guiSurfaceCreated:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_28

    .line 373
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v1

    const-string v3, "android.surface_size_changed"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 374
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v2

    const/4 v5, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v3, v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgoSync(Ljava/lang/String;[Ljava/lang/Object;)Z

    :cond_28
    if-nez p1, :cond_30

    .line 377
    iput p2, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceWidth:I

    .line 378
    iput p3, p0, Lcom/navngo/igo/javaclient/Application;->lastSurfaceHeight:I

    .line 379
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/Application;->mainSurfacePresent:Z

    .line 381
    :cond_30
    monitor-exit v0

    return-void

    :catchall_32
    move-exception p1

    monitor-exit v0
    :try_end_34
    .catchall {:try_start_3 .. :try_end_34} :catchall_32

    throw p1
.end method

.method public syncDirsThenExit(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    const-string v0, "\\&"

    .line 1325
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 1326
    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 1328
    array-length v0, p1

    array-length v1, p2

    const-string v2, "Application"

    if-eq v0, v1, :cond_16

    const-string p1, "file sync failed unequal number of input and output file paths"

    .line 1329
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_16
    const/4 v0, 0x1

    .line 1333
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    .line 1334
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->waitForClosingIgo()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1337
    :goto_1f
    :try_start_1f
    array-length v3, p1

    if-ge v1, v3, :cond_61

    .line 1338
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Sync from ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, p1, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "] to ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, p2, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1339
    new-instance v3, Ljava/io/File;

    aget-object v4, p1, v1

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    aget-object v5, p2, v1

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DataInstaller;->SyncDirs(Ljava/io/File;Ljava/io/File;)V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_58} :catch_5b

    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    :catch_5b
    move-exception p1

    const-string p2, "Exception while sync files:"

    .line 1342
    invoke-static {v2, p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_61
    const-string p1, "File sync completed, exiting..."

    .line 1345
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1346
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    if-eqz p1, :cond_74

    .line 1348
    new-instance p2, Lcom/navngo/igo/javaclient/Application$7;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/Application$7;-><init>(Lcom/navngo/igo/javaclient/Application;)V

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1355
    :cond_74
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.method public timeStampMatch()Z
    .registers 7

    const-string v0, "PREVIOUS_TIMESTAMP"

    const/4 v1, 0x0

    .line 1082
    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "build_timestamp"

    const-wide/16 v3, 0x0

    .line 1084
    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    const-wide v4, 0x185ab57e8e3L

    cmp-long v0, v2, v4

    if-nez v0, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1
.end method

.method public uiWantGpsListener(I)V
    .registers 4

    .line 519
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "uiWantGpsListener: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Application"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_1a

    const/4 p1, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    .line 520
    :goto_1b
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->uiWantGpsListener(Z)V

    return-void
.end method

.method public final unregisterFunctorCollections()V
    .registers 1

    .line 1528
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->destroy()V

    return-void
.end method

.method public final unregisterInterfaces()V
    .registers 3

    const-string v0, "Application"

    const-string v1, "unregisterInterfaces()"

    .line 1447
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1448
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/Application;->guiSurfaceCreated:Z

    .line 1450
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, v0}, Lcom/navngo/igo/javaclient/Application;->unregisterObservers(Z)V

    .line 1451
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, v0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceivers(Z)V

    .line 1452
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->unregisterFunctorCollections()V

    return-void
.end method

.method public final unregisterObservers(Z)V
    .registers 4

    .line 1467
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 1469
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->mContentObservers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/observer/IObserver;

    .line 1470
    invoke-interface {v1, p1}, Lcom/navngo/igo/javaclient/observer/IObserver;->unregisterContentObserver(Landroid/content/ContentResolver;)V

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .registers 3

    .line 193
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method

.method public final unregisterReceivers(Z)V
    .registers 3

    .line 1486
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Application;->mReceivers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/receiver/IReceiver;

    .line 1488
    :try_start_12
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/receiver/IReceiver;->unregister()V
    :try_end_15
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12 .. :try_end_15} :catch_16

    goto :goto_6

    :catch_16
    nop

    goto :goto_6

    .line 1493
    :cond_18
    iget-object p1, p0, Lcom/navngo/igo/javaclient/Application;->mReceivers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass1 (com.navngo.igo.javaclient.Application$1)
.class Lcom/navngo/igo/javaclient/Application$1;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Application$IActivityCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->requestActivityOrientation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Application;

.field final synthetic val$orientation:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Application;I)V
    .registers 3

    .line 721
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$1;->this$0:Lcom/navngo/igo/javaclient/Application;

    iput p2, p0, Lcom/navngo/igo/javaclient/Application$1;->val$orientation:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 3

    .line 724
    iget v0, p0, Lcom/navngo/igo/javaclient/Application$1;->val$orientation:I

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->requestOrientation(I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass2 (com.navngo.igo.javaclient.Application$2)
.class Lcom/navngo/igo/javaclient/Application$2;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Application;

.field final synthetic val$command:Lcom/navngo/igo/javaclient/Application$IActivityCommand;

.field final synthetic val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Application;Lcom/navngo/igo/javaclient/Application$IActivityCommand;Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 4

    .line 755
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$2;->this$0:Lcom/navngo/igo/javaclient/Application;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/Application$2;->val$command:Lcom/navngo/igo/javaclient/Application$IActivityCommand;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/Application$2;->val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 758
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application$2;->val$command:Lcom/navngo/igo/javaclient/Application$IActivityCommand;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/Application$2;->val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-interface {v0, v1}, Lcom/navngo/igo/javaclient/Application$IActivityCommand;->run(Lcom/navngo/igo/javaclient/IgoActivity;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass3 (com.navngo.igo.javaclient.Application$3)
.class Lcom/navngo/igo/javaclient/Application$3;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->runActivityCommands()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Application;

.field final synthetic val$commands:Ljava/util/List;

.field final synthetic val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Application;Ljava/util/List;Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 4

    .line 771
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$3;->this$0:Lcom/navngo/igo/javaclient/Application;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/Application$3;->val$commands:Ljava/util/List;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/Application$3;->val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 774
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application$3;->val$commands:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/Application$IActivityCommand;

    .line 775
    iget-object v2, p0, Lcom/navngo/igo/javaclient/Application$3;->val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-interface {v1, v2}, Lcom/navngo/igo/javaclient/Application$IActivityCommand;->run(Lcom/navngo/igo/javaclient/IgoActivity;)V

    goto :goto_6

    :cond_18
    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass4 (com.navngo.igo.javaclient.Application$4)
.class Lcom/navngo/igo/javaclient/Application$4;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Application$IActivityCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->getTTSSpeaker()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 836
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 4

    .line 840
    new-instance v0, Lcom/navngo/igo/javaclient/activityresulthandler/TTSSupportedLangResultHandler;

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->access$100()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/activityresulthandler/TTSSupportedLangResultHandler;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeaker;)V

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->addActivityResultHandler(Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass5 (com.navngo.igo.javaclient.Application$5)
.class Lcom/navngo/igo/javaclient/Application$5;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->getASRRecognizer()Lcom/navngo/igo/javaclient/ASRRecognizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 861
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 863
    new-instance v0, Lcom/navngo/igo/javaclient/ASRRecognizer;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/ASRRecognizer;-><init>()V

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->access$202(Lcom/navngo/igo/javaclient/ASRRecognizer;)Lcom/navngo/igo/javaclient/ASRRecognizer;

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass6 (com.navngo.igo.javaclient.Application$6)
.class Lcom/navngo/igo/javaclient/Application$6;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->exit(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ma:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1299
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$6;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1302
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application$6;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->finish()V

    const/4 v0, 0x1

    .line 1303
    sput-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_shouldMessageBoxOnRebuildDataDirFailure:Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass7 (com.navngo.igo.javaclient.Application$7)
.class Lcom/navngo/igo/javaclient/Application$7;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->syncDirsThenExit(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Application;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Application;)V
    .registers 2

    .line 1348
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$7;->this$0:Lcom/navngo/igo/javaclient/Application;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1350
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Application$7;->this$0:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "File sync completed"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass8 (com.navngo.igo.javaclient.Application$8)
.class Lcom/navngo/igo/javaclient/Application$8;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->dropServices(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 1374
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    const/4 v0, 0x0

    .line 1377
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->dropServices(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.Application.AnonymousClass9 (com.navngo.igo.javaclient.Application$9)
.class Lcom/navngo/igo/javaclient/Application$9;
.super Ljava/lang/Object;
.source "Application.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/Application;->killOldDebugger()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/Application;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/Application;)V
    .registers 2

    .line 1400
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$9;->this$0:Lcom/navngo/igo/javaclient/Application;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 7

    const/4 v0, 0x0

    .line 1403
    :try_start_1
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1405
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string p1, "cmdline"

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1406
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result p2

    if-gez p2, :cond_20

    return v0

    .line 1409
    :cond_20
    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string p2, "gdbserver"

    invoke-virtual {p1, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2d

    return v0

    :cond_2d
    const-string p1, "Application"

    .line 1411
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "killing old debugger. pid = "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 1412
    invoke-static {v1}, Landroid/os/Process;->killProcess(I)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_46} :catch_46

    :catch_46
    return v0
.end method

###### Class com.navngo.igo.javaclient.Application.GuiSurfaceCreatedCallback (com.navngo.igo.javaclient.Application$GuiSurfaceCreatedCallback)
.class public interface abstract Lcom/navngo/igo/javaclient/Application$GuiSurfaceCreatedCallback;
.super Ljava/lang/Object;
.source "Application.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Application;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GuiSurfaceCreatedCallback"
.end annotation


# virtual methods
.method public abstract onGuiSurfaceCreated()V
.end method

###### Class com.navngo.igo.javaclient.Application.IActivityCommand (com.navngo.igo.javaclient.Application$IActivityCommand)
.class interface abstract Lcom/navngo/igo/javaclient/Application$IActivityCommand;
.super Ljava/lang/Object;
.source "Application.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Application;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "IActivityCommand"
.end annotation


# virtual methods
.method public abstract run(Lcom/navngo/igo/javaclient/IgoActivity;)V
.end method

###### Class com.navngo.igo.javaclient.Application.MultitouchSupport (com.navngo.igo.javaclient.Application$MultitouchSupport)
.class final enum Lcom/navngo/igo/javaclient/Application$MultitouchSupport;
.super Ljava/lang/Enum;
.source "Application.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Application;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "MultitouchSupport"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/Application$MultitouchSupport;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

.field public static final enum Basic:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

.field public static final enum Distinct:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

.field public static final enum JazzHand:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

.field public static final enum None:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;


# instance fields
.field public final code:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 665
    new-instance v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->None:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    .line 666
    new-instance v1, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    const-string v3, "Basic"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->Basic:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    .line 667
    new-instance v3, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    const-string v5, "Distinct"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->Distinct:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    .line 668
    new-instance v5, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    const-string v7, "JazzHand"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->JazzHand:Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 664
    sput-object v7, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->$VALUES:[Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 671
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->code:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/Application$MultitouchSupport;
    .registers 2

    .line 664
    const-class v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/Application$MultitouchSupport;
    .registers 1

    .line 664
    sget-object v0, Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->$VALUES:[Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/Application$MultitouchSupport;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/Application$MultitouchSupport;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.Application.ScreenSizes (com.navngo.igo.javaclient.Application$ScreenSizes)
.class public final Lcom/navngo/igo/javaclient/Application$ScreenSizes;
.super Ljava/lang/Object;
.source "Application.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Application;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ScreenSizes"
.end annotation


# instance fields
.field mOrientationIsFixed:Z

.field public mSize_x:I

.field public mSize_x2:I

.field public mSize_y:I

.field public mSize_y2:I

.field final synthetic this$0:Lcom/navngo/igo/javaclient/Application;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/Application;)V
    .registers 2

    .line 529
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->this$0:Lcom/navngo/igo/javaclient/Application;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/Application;Lcom/navngo/igo/javaclient/Application$1;)V
    .registers 3

    .line 526
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/Application$ScreenSizes;-><init>(Lcom/navngo/igo/javaclient/Application;)V

    return-void
.end method


# virtual methods
.method public isOrientationFixed()Z
    .registers 2

    .line 533
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mOrientationIsFixed:Z

    return v0
.end method
