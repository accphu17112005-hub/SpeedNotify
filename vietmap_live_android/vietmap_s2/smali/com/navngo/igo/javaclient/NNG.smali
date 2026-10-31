###### Class com.navngo.igo.javaclient.NNG (com.navngo.igo.javaclient.NNG)
.class public final Lcom/navngo/igo/javaclient/NNG;
.super Ljava/lang/Object;
.source "NNG.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;,
        Lcom/navngo/igo/javaclient/NNG$ImproperContent;
    }
.end annotation


# static fields
.field public static final GPSDATA_HEADING_CHANGED:I = 0x40

.field public static final GPSDATA_NOTHING_CHANGED:I = 0x0

.field public static final GPSDATA_POSITION_CHANGED:I = 0x1

.field public static final GPSDATA_PRECISION_CHANGED:I = 0x2

.field public static final GPSDATA_SATELLITES_CHANGED:I = 0x4

.field public static final GPSDATA_SPEED_CHANGED:I = 0x20

.field public static final GPSDATA_STATUS_CHANGED:I = 0x10

.field public static final GPSDATA_TIME_CHANGED:I = 0x8

.field public static final INTPARAM_APPLICATION_INFO_FLAGS:I = 0x8

.field public static final INTPARAM_CACHESIZE:I = 0x1

.field public static final INTPARAM_DELETEPRL:I = 0x0

.field public static final INTPARAM_SDK_INT:I = 0x9

.field public static final INTPARAM_STARTENGINE_TIMEOUT:I = 0x2

.field private static final INTPARAM_count:I = 0xa

.field public static final INTPARAM_screen_x:I = 0x4

.field public static final INTPARAM_screen_x2:I = 0x6

.field public static final INTPARAM_screen_y:I = 0x5

.field public static final INTPARAM_screen_y2:I = 0x7

.field public static final NNG_ENGINE_ALMOST_STARTED:I = 0x1c2

.field public static final NNG_ENGINE_CREATED:I = 0x64

.field public static final NNG_ENGINE_DESTROYED:I = 0x384

.field public static final NNG_ENGINE_JUSTENTERINGMAINLOOP:I = 0x190

.field public static final NNG_ENGINE_JUSTLEAVINGMAINLOOP:I = 0x258

.field public static final NNG_ENGINE_LOSING_FOCUS:I = 0x8fc

.field public static final NNG_ENGINE_LOST_FOCUS:I = 0x960

.field public static final NNG_ENGINE_RESTARTING:I = 0x12c

.field public static final NNG_ENGINE_SETTING_FOCUS:I = 0x834

.field public static final NNG_ENGINE_SET_FOCUS:I = 0x898

.field public static final NNG_ENGINE_STARTED:I = 0x1f4

.field public static final NNG_ENGINE_STARTING:I = 0xc8

.field public static final NNG_ENGINE_STOPPED:I = 0x320

.field public static final NNG_ENGINE_STOPPING:I = 0x2bc

.field public static final OBJPARAM_CLIENT_PACKAGE:I = 0x9

.field public static final OBJPARAM_LIBEGL:I = 0x1

.field public static final OBJPARAM_LINKED_ROOT:I = 0x8

.field public static final OBJPARAM_NATIVE_LIBRARY_DIR:I = 0xb

.field public static final OBJPARAM_OSBUILD_DEVICE:I = 0x4

.field public static final OBJPARAM_OSBUILD_PRODUCT:I = 0x7

.field public static final OBJPARAM_OSBUILD_PRODUCTBRAND:I = 0x5

.field public static final OBJPARAM_OSBUILD_PRODUCTMODEL:I = 0x6

.field public static final OBJPARAM_OSBUILD_VERSION_RELEASE:I = 0xa

.field public static final OBJPARAM_SAVEDIR:I = 0x0

.field public static final OBJPARAM_SDCARDDIR:I = 0x3

.field public static final OBJPARAM_SDCARDROOT:I = 0x2

.field public static final OBJPARAM_SYSTEM_LIBRARY_DIR:I = 0xc

.field private static final OBJPARAM_count:I = 0xd

.field private static http_enabled:Z = false

.field public static final intParams:[I

.field public static volatile javaPainting:Z = false

.field private static locCalendar:Ljava/util/Calendar; = null

.field private static final logname:Ljava/lang/String; = "NNG"

.field private static mMsgWriter:Lcom/navngo/igo/javaclient/MessageWriter;

.field public static objParams:[Ljava/lang/Object;

.field private static volatile sIntroEnded:Z

.field private static waitInfinitelyLock:Ljava/lang/String;

.field private static waitInfinitelySynchronized:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 46
    new-instance v0, Lcom/navngo/igo/javaclient/NNG$1;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/NNG$1;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/NNG;->mMsgWriter:Lcom/navngo/igo/javaclient/MessageWriter;

    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 178
    sput-object v0, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/Object;

    .line 196
    sput-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    .line 229
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->reInit()V

    const/4 v0, 0x0

    .line 301
    sput-boolean v0, Lcom/navngo/igo/javaclient/NNG;->javaPainting:Z

    .line 460
    sput-boolean v0, Lcom/navngo/igo/javaclient/NNG;->sIntroEnded:Z

    .line 480
    sput-boolean v0, Lcom/navngo/igo/javaclient/NNG;->http_enabled:Z

    .line 526
    new-instance v1, Ljava/lang/String;

    const-string v2, "waitInfinitely"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelyLock:Ljava/lang/String;

    .line 527
    sput-boolean v0, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelySynchronized:Z

    .line 528
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static BeginPaint()Z
    .registers 1

    .line 330
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 332
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/view/IMapView;->BeginPaint()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public static native CacheAssetManager(Ljava/lang/Object;)V
.end method

.method public static EndPaint()V
    .registers 1

    .line 341
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 343
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/view/IMapView;->EndPaint()V

    :cond_9
    return-void
.end method

.method public static EngineStatus(I)V
    .registers 2

    .line 395
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->EngineStatus(I)V

    const/16 v0, 0x12c

    if-eq p0, v0, :cond_10

    const/16 v0, 0x258

    if-eq p0, v0, :cond_c

    goto :goto_13

    :cond_c
    const/4 p0, 0x0

    .line 401
    sput-boolean p0, Lcom/navngo/igo/javaclient/NNG;->http_enabled:Z

    goto :goto_13

    :cond_10
    const/4 p0, 0x1

    .line 398
    sput-boolean p0, Lcom/navngo/igo/javaclient/NNG;->http_enabled:Z

    :goto_13
    return-void
.end method

.method public static GetBlockDeviceMajMin(Ljava/lang/String;)Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;
    .registers 4

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 221
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/NNG;->GetBlockDeviceMajMin(Ljava/lang/String;[I)Z

    move-result p0

    const/4 v1, 0x0

    if-eqz p0, :cond_15

    .line 222
    new-instance p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v0, v0, v2

    invoke-direct {p0, v1, v0, v2}, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;-><init>(IIZ)V

    return-object p0

    .line 224
    :cond_15
    new-instance p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;

    invoke-direct {p0, v1, v1, v1}, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;-><init>(IIZ)V

    return-object p0
.end method

.method private static native GetBlockDeviceMajMin(Ljava/lang/String;[I)Z
.end method

.method public static native GpsConnect(Z)V
.end method

.method public static native GpsDataUpdate(DDIIIIIIIDIII)V
.end method

.method public static native GpsDenied()V
.end method

.method public static native GpsEnabled()V
.end method

.method public static native GpsJsonUpdate(ILjava/lang/String;)V
.end method

.method public static native GpsLost()V
.end method

.method public static native GpsNmeaUpdate(JLjava/lang/String;)V
.end method

.method public static native GpsSatellitesUpdate(J[I)V
.end method

.method public static native I18N(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static IsIntroEnded()Z
    .registers 1

    .line 454
    sget-boolean v0, Lcom/navngo/igo/javaclient/NNG;->sIntroEnded:Z

    return v0
.end method

.method public static synchronized native KeyDown(I)V
.end method

.method public static synchronized native KeyUp(I)V
.end method

.method public static MessageBox(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 5

    .line 639
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->mMsgWriter:Lcom/navngo/igo/javaclient/MessageWriter;

    const-string v1, "NNG"

    invoke-interface {v0, v1, p0, p1, p2}, Lcom/navngo/igo/javaclient/MessageWriter;->Write(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static OpenGL_ChangeHWDisplay(I)V
    .registers 3

    .line 378
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 379
    instance-of v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    if-eqz v1, :cond_f

    .line 380
    check-cast v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->OpenGL_ChangeHWDisplay(I)V

    :cond_f
    return-void
.end method

.method public static OpenGL_CreateBuffers()Z
    .registers 2

    .line 319
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 320
    instance-of v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    if-eqz v1, :cond_11

    .line 321
    check-cast v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/GLMapView;->OpenGL_CreateBuffers()Z

    move-result v0

    return v0

    :cond_11
    const/4 v0, 0x0

    return v0
.end method

.method public static OpenGL_CreateSurface(IIIZI)Z
    .registers 13

    .line 360
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 361
    instance-of v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    if-eqz v1, :cond_17

    .line 362
    move-object v2, v0

    check-cast v2, Lcom/navngo/igo/javaclient/view/GLMapView;

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-virtual/range {v2 .. v7}, Lcom/navngo/igo/javaclient/view/GLMapView;->OpenGL_CreateSurface(IIIZI)Z

    move-result p0

    return p0

    :cond_17
    const/4 p0, 0x0

    return p0
.end method

.method public static OpenGL_DeleteBuffers()Z
    .registers 3

    const-string v0, "NNG"

    const-string v1, "OpenGL_DeleteBuffers"

    .line 348
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 350
    instance-of v2, v1, Lcom/navngo/igo/javaclient/view/GLMapView;

    if-eqz v2, :cond_18

    .line 351
    check-cast v1, Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/view/GLMapView;->OpenGL_DeleteBuffers()Z

    move-result v0

    return v0

    :cond_18
    const-string v1, "OpenGL_DeleteBuffers: no MapView!"

    .line 353
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public static OpenGL_DeleteSurface(I)V
    .registers 3

    .line 370
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 371
    instance-of v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    if-eqz v1, :cond_f

    .line 372
    check-cast v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->OpenGL_DeleteSurface(I)V

    :cond_f
    return-void
.end method

.method public static OpenGL_SwapBuffers(I)V
    .registers 3

    .line 386
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 387
    instance-of v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    if-eqz v1, :cond_f

    .line 388
    check-cast v0, Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->OpenGL_SwapBuffers(I)V

    :cond_f
    return-void
.end method

.method public static native OrientationChanged(I)V
.end method

.method public static native RecreateSoftlink(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public static native Resume()V
.end method

.method public static native SendFirstFrameEvent()V
.end method

.method public static SendHttpRequest(Ljava/lang/String;[BLjava/lang/String;I)V
    .registers 10

    .line 484
    sget-boolean v0, Lcom/navngo/igo/javaclient/NNG;->http_enabled:Z

    const-string v1, ")"

    const-string v2, "("

    const-string v3, " "

    const-string v4, "NNG"

    if-eqz v0, :cond_37

    .line 485
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SendHttpRequest: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getHttpUtility()Lcom/navngo/igo/javaclient/utils/HttpUtility;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->getHttpRequest(Ljava/lang/String;[BLjava/lang/String;I)V

    goto :goto_5f

    .line 488
    :cond_37
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "SendHttpRequest: Ignored: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v4, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    const/4 p1, -0x1

    .line 489
    invoke-static {p3, p0, p1}, Lcom/navngo/igo/javaclient/NNG;->putHttpBuffer(I[BI)V

    :goto_5f
    return-void
.end method

.method public static native SendTimeChangedEvent()V
.end method

.method public static native SendTouch(IIIIIJ)V
.end method

.method public static native SetDeviceId(Ljava/lang/String;)V
.end method

.method public static SetIntroEnded(Z)V
    .registers 1

    .line 457
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->onIntroStatusChanged(Z)V

    return-void
.end method

.method public static native SetJavaFreeMemory(I)V
.end method

.method public static native SetPlatformId(Ljava/lang/String;)V
.end method

.method public static native Sound_Finished(ZII[I)V
.end method

.method public static native StartEngine()Z
.end method

.method public static native StopEngine()V
.end method

.method public static native Suspend()V
.end method

.method public static TTS_TestLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)I
    .registers 2

    .line 429
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/Application;->TTS_TestLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static native callFunctor(J)V
.end method

.method public static native callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[BILcom/navngo/igo/javaclient/androidgo/Batch;ZZ)Z
.end method

.method public static callOnPaintCallback(IIIIII)V
    .registers 13

    .line 310
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    if-eqz v0, :cond_f

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .line 312
    invoke-interface/range {v0 .. v6}, Lcom/navngo/igo/javaclient/view/IMapView;->onPaintCallback(IIIIII)V

    :cond_f
    return-void
.end method

.method public static native chdir(Ljava/lang/String;)Z
.end method

.method private static synchronized native forceCaching()V
.end method

.method public static native garbageCollect(IZ)V
.end method

.method public static getDeviceIDs()Ljava/lang/String;
    .registers 1

    .line 649
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getDeviceIDs()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static native getFromSysConfig(Ljava/lang/String;Ljava/lang/String;[BI)[B
.end method

.method public static getJavaTimeZone()I
    .registers 3

    .line 670
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const/16 v1, 0xf

    .line 671
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    add-int/2addr v1, v0

    div-int/lit16 v1, v1, 0x3e8

    return v1
.end method

.method public static native getModelValue(Ljava/lang/String;I)Ljava/lang/String;
.end method

.method public static getOSLanguageKeys()Ljava/lang/String;
    .registers 1

    .line 644
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getOSLanguageKeys()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getScreenOrientation()I
    .registers 1

    .line 286
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->GetOrientation()I

    move-result v0

    return v0
.end method

.method public static getStatusThread()Ljava/lang/Object;
    .registers 1

    .line 291
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    return-object v0
.end method

.method public static gps_background_navigation_viewer(I)V
    .registers 3

    .line 662
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gps_background_navigation_viewer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NNG"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    .line 663
    :goto_1b
    sput-boolean p0, Lcom/navngo/igo/javaclient/ServerRunner;->background_navigation:Z

    return-void
.end method

.method public static gps_started_viewer(I)V
    .registers 3

    .line 656
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gps_started_viewer: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NNG"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    .line 657
    :goto_1b
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->uiWantGpsListener(Z)V

    return-void
.end method

.method public static native isOnTheRoad()Z
.end method

.method public static native loadImage(Ljava/lang/String;)[B
.end method

.method public static loadImageAsDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 682
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return-object v1

    .line 688
    :cond_8
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->loadImage(Ljava/lang/String;)[B

    move-result-object v0

    if-eqz v0, :cond_19

    .line 691
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v0, "menuIcon"

    .line 692
    invoke-static {v1, v0}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_19
    if-nez v1, :cond_31

    .line 695
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error loading icon for options menu: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NNG"

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :cond_31
    return-object v1
.end method

.method private static loadNative()V
    .registers 1

    const-string v0, "igo_jni"

    .line 256
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 257
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->forceCaching()V

    const/4 v0, 0x1

    .line 259
    sput-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    return-void
.end method

.method public static native log(ILjava/lang/String;Ljava/lang/String;)V
.end method

.method public static onIntroStatusChanged(Z)V
    .registers 4

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 467
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "Intro status changed. Ended = %b"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "NNG"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    sput-boolean p0, Lcom/navngo/igo/javaclient/NNG;->sIntroEnded:Z

    if-eqz p0, :cond_25

    .line 470
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->notifyStatusThread()V

    .line 472
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p0

    if-eqz p0, :cond_25

    .line 475
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->onIgoStarted()V

    :cond_25
    return-void
.end method

.method public static onLocationChanged(Landroid/location/Location;)V
    .registers 23

    const/16 v0, 0xa

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p0, :cond_d8

    .line 545
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getTime()J

    move-result-wide v4

    .line 547
    sget-boolean v6, Lcom/navngo/igo/javaclient/Config;->check_gps_timestamp:Z

    if-eqz v6, :cond_38

    const-wide/32 v6, 0x57b12c00

    cmp-long v8, v4, v6

    if-gez v8, :cond_38

    .line 549
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    .line 550
    move-object v9, v8

    check-cast v9, Ljava/util/Locale;

    new-array v9, v1, [Ljava/lang/Object;

    .line 551
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v9, v3

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v9, v2

    const-string v4, "Wrong GPS time received (%d). correcting it to: (%d)"

    .line 550
    invoke-static {v8, v4, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "NNG"

    invoke-static {v5, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    move-wide v4, v6

    .line 554
    :cond_38
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    .line 555
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v8

    .line 556
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getAltitude()D

    move-result-wide v10

    double-to-int v10, v10

    .line 557
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getBearing()F

    move-result v11

    float-to-int v11, v11

    .line 560
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getSpeed()F

    move-result v12

    float-to-double v12, v12

    const-wide v14, 0x400ccccccccccccdL    # 3.6

    mul-double v12, v12, v14

    const-wide/high16 v14, 0x3fe0000000000000L    # 0.5

    add-double/2addr v12, v14

    double-to-int v12, v12

    .line 561
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->hasSpeed()Z

    move-result v13

    if-eqz v13, :cond_63

    const/16 v13, 0x21

    goto :goto_64

    :cond_63
    const/4 v13, 0x1

    .line 564
    :goto_64
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->hasBearing()Z

    move-result v14

    if-eqz v14, :cond_80

    .line 566
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->hasSpeed()Z

    move-result v14

    if-eqz v14, :cond_80

    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getSpeed()F

    move-result v14

    float-to-double v14, v14

    const-wide v16, 0x3fd3333333333333L    # 0.3

    cmpl-double v18, v14, v16

    if-lez v18, :cond_80

    or-int/lit8 v13, v13, 0x40

    .line 570
    :cond_80
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v14

    const-string v15, "network"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8f

    or-int/lit8 v13, v13, 0x20

    const/4 v12, 0x0

    .line 577
    :cond_8f
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->getAccuracy()F

    move-result v15

    .line 578
    sget-boolean v16, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    if-eqz v16, :cond_a1

    invoke-static {}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->getOvrHasAccuracy()Z

    move-result v16

    if-eqz v16, :cond_a1

    .line 579
    invoke-static {}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->getOvrFlAccuracy()F

    move-result v15

    :cond_a1
    if-eqz v14, :cond_ae

    .line 581
    sget v14, Lcom/navngo/igo/javaclient/Config;->horizontal_accuracy_treshold:I

    int-to-float v14, v14

    cmpg-float v14, v15, v14

    if-gez v14, :cond_ae

    .line 582
    sget v14, Lcom/navngo/igo/javaclient/Config;->horizontal_accuracy_treshold:I

    add-int/2addr v14, v0

    int-to-float v15, v14

    .line 584
    :cond_ae
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->hasAccuracy()Z

    move-result v14

    if-nez v14, :cond_c8

    sget-boolean v14, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    if-eqz v14, :cond_ca

    invoke-static {}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->getOvrHasAccuracy()Z

    move-result v14

    if-eqz v14, :cond_ca

    const-wide/16 v16, 0x0

    cmpl-double v14, v6, v16

    if-nez v14, :cond_c8

    cmpl-double v14, v8, v16

    if-eqz v14, :cond_ca

    :cond_c8
    or-int/lit8 v13, v13, 0x2

    .line 587
    :cond_ca
    invoke-virtual/range {p0 .. p0}, Landroid/location/Location;->hasAltitude()Z

    move-result v14

    if-eqz v14, :cond_d2

    const/4 v14, 0x2

    goto :goto_d3

    :cond_d2
    const/4 v14, 0x1

    :goto_d3
    move/from16 v21, v13

    move/from16 v19, v14

    goto :goto_ea

    .line 590
    :cond_d8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 591
    sget-wide v6, Lcom/navngo/igo/javaclient/Config;->default_latitude:D

    .line 592
    sget-wide v8, Lcom/navngo/igo/javaclient/Config;->default_longitude:D

    const/16 v10, 0x64

    const/high16 v15, 0x41200000    # 10.0f

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v19, 0x1

    const/16 v21, 0x1

    .line 600
    :goto_ea
    sget-object v13, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    invoke-virtual {v13}, Ljava/util/Calendar;->clear()V

    .line 601
    sget-object v13, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const-string v14, "GMT+00:00"

    invoke-static {v14}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 602
    sget-object v13, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/16 v14, 0xf

    invoke-virtual {v13, v14, v3}, Ljava/util/Calendar;->set(II)V

    .line 603
    sget-object v13, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/16 v14, 0x10

    invoke-virtual {v13, v14, v3}, Ljava/util/Calendar;->set(II)V

    .line 605
    sget-object v13, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    invoke-virtual {v13, v4, v5}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 607
    sget-object v13, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    invoke-virtual {v13, v2}, Ljava/util/Calendar;->get(I)I

    move-result v13

    .line 608
    sget-object v14, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    invoke-virtual {v14, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/lit8 v14, v1, 0x1

    .line 609
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 611
    sget-object v2, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    invoke-virtual {v2, v0, v3}, Ljava/util/Calendar;->set(II)V

    .line 612
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/16 v2, 0xb

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 613
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/16 v2, 0xc

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 614
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/16 v2, 0xd

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 615
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    const/16 v2, 0xe

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 617
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->locCalendar:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    sub-long/2addr v4, v2

    long-to-int v0, v4

    float-to-double v2, v15

    const/16 v20, 0x63

    move v15, v1

    move/from16 v16, v0

    move-wide/from16 v17, v2

    .line 619
    invoke-static/range {v6 .. v21}, Lcom/navngo/igo/javaclient/NNG;->GpsDataUpdate(DDIIIIIIIDIII)V

    return-void
.end method

.method public static onNmeaReceived(JLjava/lang/String;)V
    .registers 3

    .line 634
    invoke-static {p0, p1, p2}, Lcom/navngo/igo/javaclient/NNG;->GpsNmeaUpdate(JLjava/lang/String;)V

    return-void
.end method

.method public static onRemoteCall(Ljava/lang/String;[B)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 4

    .line 436
    :try_start_0
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callFunctor(Ljava/lang/String;Ljava/io/InputStream;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    goto :goto_13

    :catch_e
    move-exception p0

    .line 438
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, 0x0

    :goto_13
    if-nez p0, :cond_1d

    .line 443
    new-instance p0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    const/4 p1, 0x2

    new-array v0, p1, [B

    invoke-direct {p0, v0, p1}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;-><init>([BI)V

    :cond_1d
    return-object p0
.end method

.method public static onSatellitesChanged()V
    .registers 5

    .line 627
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 628
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getSatellites()[I

    move-result-object v2

    .line 629
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "calling GpsSatellitesUpdate("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "NNG"

    invoke-static {v4, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 630
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/NNG;->GpsSatellitesUpdate(J[I)V

    return-void
.end method

.method public static native putHttpBuffer(I[BI)V
.end method

.method public static native queryModelValue(Lcom/navngo/igo/javaclient/androidgo/IgoModel;Ljava/lang/String;B)[B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "*>;",
            "Ljava/lang/String;",
            "B)[B"
        }
    .end annotation
.end method

.method public static declared-synchronized reInit()V
    .registers 2

    const-class v0, Lcom/navngo/igo/javaclient/NNG;

    monitor-enter v0

    .line 234
    :try_start_3
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->loadNative()V

    .line 235
    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->nativeLoaded()V
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_d

    .line 236
    monitor-exit v0

    return-void

    :catchall_d
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static native sendBytesSLAPIMessage2iGO(II[BI)Z
.end method

.method public static native sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z
.end method

.method public static native sendSimpleSLAPIMessage2iGO(IIII)Z
.end method

.method public static native setBuffer888([I)V
.end method

.method public static native setModelValue(Lcom/navngo/igo/javaclient/androidgo/IgoModel;Ljava/lang/String;[BI)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "*>;",
            "Ljava/lang/String;",
            "[BI)V"
        }
    .end annotation
.end method

.method public static native setNativeWaitInfinitely(Z)V
.end method

.method public static setParams()V
    .registers 3

    .line 239
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->serverStartDir:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "save"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 240
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->find_libEGL()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 241
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 242
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 243
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 244
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 245
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 246
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 247
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    .line 248
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    const/16 v1, 0x8

    const-string v2, "android_linked_root"

    aput-object v2, v0, v1

    .line 249
    sget-object v1, Lcom/navngo/igo/javaclient/Config;->packageName:Ljava/lang/String;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 250
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    .line 251
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->objParams:[Ljava/lang/Object;

    const-string v1, "java.library.path"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xc

    aput-object v1, v0, v2

    return-void
.end method

.method public static setWaitInfinitely(Z)V
    .registers 2

    .line 517
    sget-object v0, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelyLock:Ljava/lang/String;

    monitor-enter v0

    .line 519
    :try_start_3
    sput-boolean p0, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelySynchronized:Z

    .line 520
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->setNativeWaitInfinitely(Z)V

    if-nez p0, :cond_f

    .line 522
    sget-object p0, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelyLock:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 523
    :cond_f
    monitor-exit v0

    return-void

    :catchall_11
    move-exception p0

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw p0
.end method

.method public static setWriter(Lcom/navngo/igo/javaclient/MessageWriter;)V
    .registers 1

    .line 707
    sput-object p0, Lcom/navngo/igo/javaclient/NNG;->mMsgWriter:Lcom/navngo/igo/javaclient/MessageWriter;

    return-void
.end method

.method public static showRebuildError(Landroid/content/res/Resources;Ljava/lang/Exception;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    if-eqz p1, :cond_52

    .line 265
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, "NNG"

    invoke-static {v0, p0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 266
    sget-boolean p0, Lcom/navngo/igo/javaclient/Application;->NNG_shouldMessageBoxOnRebuildDataDirFailure:Z

    if-eqz p0, :cond_52

    .line 268
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->def_customMissingContentMessage:Ljava/lang/String;

    const-string v0, "android"

    const-string v1, "customMissingContentMessage"

    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, ""

    if-ne p0, v0, :cond_3d

    .line 270
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget v1, Lcom/navngo/igo/javaclient/R$string;->missing_or_incomplete_folder:I

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 273
    :cond_3d
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    if-eqz p1, :cond_4a

    .line 274
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/navngo/igo/javaclient/IgoActivity;->mNoSystemExit:Z

    .line 276
    :cond_4a
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1, p0}, Lcom/navngo/igo/javaclient/Application;->alert(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 278
    sput-boolean p0, Lcom/navngo/igo/javaclient/Application;->NNG_shouldMessageBoxOnRebuildDataDirFailure:Z

    :cond_52
    return-void
.end method

.method public static startNNGThread(Ljava/lang/Object;J)V
    .registers 3

    .line 297
    check-cast p0, Lcom/navngo/igo/javaclient/NNGThread;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/NNGThread;->start(J)V

    return-void
.end method

.method public static waitInfinitely()V
    .registers 8

    .line 496
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    const-string v2, "NNG"

    .line 497
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "waitInfinitely: th = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " BEGIN"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    sget-object v2, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelyLock:Ljava/lang/String;

    monitor-enter v2

    .line 501
    :try_start_26
    sget-boolean v3, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelySynchronized:Z

    if-eqz v3, :cond_42

    .line 502
    sget-wide v3, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_3a

    .line 503
    sget-object v3, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelyLock:Ljava/lang/String;

    sget-wide v4, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/Object;->wait(J)V

    goto :goto_42

    .line 505
    :cond_3a
    sget-object v3, Lcom/navngo/igo/javaclient/NNG;->waitInfinitelyLock:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_3f
    .catch Ljava/lang/InterruptedException; {:try_start_26 .. :try_end_3f} :catch_42
    .catchall {:try_start_26 .. :try_end_3f} :catchall_40

    goto :goto_42

    :catchall_40
    move-exception v0

    goto :goto_5f

    .line 511
    :catch_42
    :cond_42
    :goto_42
    :try_start_42
    monitor-exit v2
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_40

    const-string v2, "NNG"

    .line 512
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "waitInfinitely: th = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " END"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 511
    :goto_5f
    :try_start_5f
    monitor-exit v2
    :try_end_60
    .catchall {:try_start_5f .. :try_end_60} :catchall_40

    throw v0
.end method

###### Class com.navngo.igo.javaclient.NNG.AnonymousClass1 (com.navngo.igo.javaclient.NNG$1)
.class Lcom/navngo/igo/javaclient/NNG$1;
.super Ljava/lang/Object;
.source "NNG.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/MessageWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/NNG;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public Write(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I
    .registers 6

    .line 50
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 52
    invoke-virtual {v0, p2, p3, p4}, Lcom/navngo/igo/javaclient/IgoActivity;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p1

    return p1

    .line 54
    :cond_b
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "MessageBox: ["

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "] "

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x5

    return p1
.end method

###### Class com.navngo.igo.javaclient.NNG.ImproperContent (com.navngo.igo.javaclient.NNG$ImproperContent)
.class public Lcom/navngo/igo/javaclient/NNG$ImproperContent;
.super Ljava/lang/Exception;
.source "NNG.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/NNG;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImproperContent"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 40
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.NNG.MajMinNumbers (com.navngo.igo.javaclient.NNG$MajMinNumbers)
.class public Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;
.super Ljava/lang/Object;
.source "NNG.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/NNG;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MajMinNumbers"
.end annotation


# instance fields
.field public final major:I

.field public final minor:I

.field public final valid:Z


# direct methods
.method constructor <init>(IIZ)V
    .registers 4

    .line 212
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    iput p1, p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;->major:I

    .line 214
    iput p2, p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;->minor:I

    .line 215
    iput-boolean p3, p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;->valid:Z

    return-void
.end method
