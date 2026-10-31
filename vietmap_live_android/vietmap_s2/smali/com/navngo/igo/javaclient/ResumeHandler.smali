###### Class com.navngo.igo.javaclient.ResumeHandler (com.navngo.igo.javaclient.ResumeHandler)
.class public final enum Lcom/navngo/igo/javaclient/ResumeHandler;
.super Ljava/lang/Enum;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;,
        Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;,
        Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;,
        Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;,
        Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;,
        Lcom/navngo/igo/javaclient/ResumeHandler$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/ResumeHandler;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

.field private static final logname:Ljava/lang/String; = "ResumeHandler"


# instance fields
.field private backgroundWalkArea:Lcom/navngo/igo/javaclient/matek/GeoArea;

.field private mExternalLogic:Lcom/navngo/igo/javaclient/IExternalResumeLogic;

.field private mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

.field private mIgnoreKeyGuard:Z

.field private mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

.field private mIsOnTheRoadRunnable:Ljava/lang/Runnable;

.field private mKeyguardManager:Landroid/app/KeyguardManager;

.field private mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mNativeLoaded:Z

.field private mPhoneState:Ljava/lang/String;

.field private mResumed:Z

.field private mRetestRunnable:Ljava/lang/Runnable;

.field private mScreenOn:Z

.field mScreenReceiver:Landroid/content/BroadcastReceiver;

.field private mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

.field mUserPresentReceiver:Landroid/content/BroadcastReceiver;

.field private ontheroad_was_false_at:J

.field private ontheroad_was_true_at:J

.field private should_not_had_shutdown_at:J

.field private shutdownBlockedBySleepManager:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 37
    new-instance v0, Lcom/navngo/igo/javaclient/ResumeHandler;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/ResumeHandler;

    aput-object v0, v1, v2

    .line 36
    sput-object v1, Lcom/navngo/igo/javaclient/ResumeHandler;->$VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 54
    new-instance p1, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;Lcom/navngo/igo/javaclient/ResumeHandler$1;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mIsOnTheRoadRunnable:Ljava/lang/Runnable;

    .line 56
    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mExternalLogic:Lcom/navngo/igo/javaclient/IExternalResumeLogic;

    const/4 p1, 0x0

    .line 58
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mNativeLoaded:Z

    .line 59
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    const/4 p2, 0x1

    .line 60
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenOn:Z

    const-string p2, "android"

    const-string v0, "ignore_keyguard"

    .line 61
    invoke-static {p2, v0, p1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mIgnoreKeyGuard:Z

    const-string p2, ""

    .line 65
    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mPhoneState:Ljava/lang/String;

    .line 66
    sget-object p2, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    const-wide/16 v0, 0x0

    .line 69
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->ontheroad_was_true_at:J

    .line 70
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->ontheroad_was_false_at:J

    .line 168
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 288
    sget-object p2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 373
    new-instance p2, Lcom/navngo/igo/javaclient/ResumeHandler$3;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/ResumeHandler$3;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mUserPresentReceiver:Landroid/content/BroadcastReceiver;

    .line 380
    new-instance p2, Lcom/navngo/igo/javaclient/ResumeHandler$4;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/ResumeHandler$4;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenReceiver:Landroid/content/BroadcastReceiver;

    .line 458
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->shutdownBlockedBySleepManager:Z

    return-void
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 1

    .line 36
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    return-void
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 1

    .line 36
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->userPresent()V

    return-void
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/ResumeHandler;Z)V
    .registers 2

    .line 36
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->handleScreenOn(Z)V

    return-void
.end method

.method static synthetic access$502(Lcom/navngo/igo/javaclient/ResumeHandler;J)J
    .registers 3

    .line 36
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->ontheroad_was_true_at:J

    return-wide p1
.end method

.method static synthetic access$602(Lcom/navngo/igo/javaclient/ResumeHandler;J)J
    .registers 3

    .line 36
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->ontheroad_was_false_at:J

    return-wide p1
.end method

.method static synthetic access$700(Lcom/navngo/igo/javaclient/ResumeHandler;)Lcom/navngo/igo/javaclient/ResumeHandler$State;
    .registers 1

    .line 36
    iget-object p0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    return-object p0
.end method

.method static synthetic access$800(Ljava/lang/String;)V
    .registers 1

    .line 36
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized doTheJob()V
    .registers 6

    monitor-enter p0

    .line 402
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mNativeLoaded:Z

    if-nez v0, :cond_12

    const-string v0, "ResumeHandler"

    const-string v1, "doTheJob: native not loaded"

    .line 403
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_bc

    .line 405
    monitor-exit p0

    return-void

    .line 408
    :cond_12
    :try_start_12
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 409
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    if-nez v2, :cond_26

    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/Application;->createMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v2

    invoke-interface {v2}, Lcom/navngo/igo/javaclient/view/IMapView;->hasValidSurface()Z

    move-result v2

    if-eqz v2, :cond_44

    :cond_26
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenOn:Z

    if-eqz v2, :cond_44

    .line 410
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->isKeyGuardOn()Z

    move-result v2

    if-eqz v2, :cond_3a

    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: resumed  &&  screen on  &&  keyguard"

    .line 411
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND_BLOCKED_BY_KEYGUARD:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    goto :goto_96

    :cond_3a
    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: resumed  &&  screen on  && no keyguard"

    .line 414
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    goto :goto_96

    .line 417
    :cond_44
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    if-eq v2, v3, :cond_54

    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: interrupted by phone"

    .line 418
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    goto :goto_96

    .line 420
    :cond_54
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenOn:Z

    if-eqz v2, :cond_72

    .line 421
    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->shouldShutdown(J)Z

    move-result v2

    if-eqz v2, :cond_68

    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: nothing to do in the background"

    .line 422
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    goto :goto_96

    :cond_68
    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: screen on"

    .line 425
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    goto :goto_96

    .line 428
    :cond_72
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    if-eqz v2, :cond_7f

    const-string v0, "ResumeHandler"

    const-string v1, "doTheJob: resumed, this should be a transient state only"

    .line 429
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7d
    .catchall {:try_start_12 .. :try_end_7d} :catchall_bc

    .line 431
    monitor-exit p0

    return-void

    .line 432
    :cond_7f
    :try_start_7f
    sget-boolean v2, Lcom/navngo/igo/javaclient/ServerRunner;->background_navigation:Z

    if-eqz v2, :cond_8d

    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: screen off, running in background"

    .line 433
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    goto :goto_96

    :cond_8d
    const-string v2, "ResumeHandler"

    const-string v3, "doTheJob: nothing to do"

    .line 436
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 439
    :goto_96
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    if-eq v3, v2, :cond_9c

    const/4 v3, 0x1

    goto :goto_9d

    :cond_9c
    const/4 v3, 0x0

    .line 440
    :goto_9d
    iput-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 441
    sget-object v4, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    if-ne v2, v4, :cond_ac

    .line 442
    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->resetMoving(J)V

    if-eqz v3, :cond_b1

    .line 444
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->resumeApp()V

    goto :goto_b1

    :cond_ac
    if-eqz v3, :cond_b1

    .line 447
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->pauseApp()V

    .line 449
    :cond_b1
    :goto_b1
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    if-eq v2, v3, :cond_ba

    .line 450
    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->startRetestTimer(J)V
    :try_end_ba
    .catchall {:try_start_7f .. :try_end_ba} :catchall_bc

    .line 451
    :cond_ba
    monitor-exit p0

    return-void

    :catchall_bc
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private handleScreenOn(Z)V
    .registers 7

    .line 309
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mExternalLogic:Lcom/navngo/igo/javaclient/IExternalResumeLogic;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IExternalResumeLogic;->handleScreenOn()Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    .line 313
    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Screen :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "on"

    const-string v3, "off"

    if-eqz p1, :cond_1d

    move-object v4, v2

    goto :goto_1e

    :cond_1d
    move-object v4, v3

    :goto_1e
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " START. Current state: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 314
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenOn:Z

    .line 315
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_42

    goto :goto_43

    :cond_42
    move-object v2, v3

    :goto_43
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " END. Current state: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    return-void
.end method

.method private isKeyGuardOn()Z
    .registers 3

    .line 63
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-eqz v0, :cond_10

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mIgnoreKeyGuard:Z

    if-nez v1, :cond_10

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method private isMoving()Z
    .registers 6

    .line 529
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->backgroundWalkArea:Lcom/navngo/igo/javaclient/matek/GeoArea;

    if-eqz v0, :cond_11

    .line 530
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/matek/GeoArea;->metricRadius()D

    move-result-wide v0

    sget v2, Lcom/navngo/igo/javaclient/Config;->background_shutdown_distance:I

    int-to-double v2, v2

    cmpl-double v4, v0, v2

    if-lez v4, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    return v0
.end method

.method private isOnTheRoad(J)Z
    .registers 10

    .line 496
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->ontheroad_was_true_at:J

    const-wide/16 v2, 0x1388

    add-long/2addr v0, v2

    const/4 v4, 0x1

    const-string v5, "ResumeHandler"

    cmp-long v6, v0, p1

    if-lez v6, :cond_12

    const-string p1, "ontheroad cached true"

    .line 498
    invoke-static {v5, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2e

    .line 499
    :cond_12
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->ontheroad_was_false_at:J

    add-long/2addr v0, v2

    cmp-long v2, v0, p1

    if-lez v2, :cond_20

    const/4 v4, 0x0

    const-string p1, "ontheroad cached false"

    .line 501
    invoke-static {v5, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2e

    .line 503
    :cond_20
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mIsOnTheRoadRunnable:Ljava/lang/Runnable;

    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getEngineIndex()I

    move-result p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/ServerRunner;->callNNG(Ljava/lang/Runnable;I)V

    const-string p1, "ontheroad faked true, will be recached soon"

    .line 505
    invoke-static {v5, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2e
    return v4
.end method

.method private killRetestTimer()V
    .registers 3

    .line 549
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    if-eqz v0, :cond_9

    .line 550
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mRetestRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_9
    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .registers 2

    const-string v0, "ResumeHandler"

    .line 397
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private pauseApp()V
    .registers 2

    const-string v0, "pauseApp"

    .line 301
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 302
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->stopSensors()V

    .line 303
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->suspendServer()V

    return-void
.end method

.method private resetMoving(J)V
    .registers 3

    .line 534
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->should_not_had_shutdown_at:J

    const/4 p1, 0x0

    .line 535
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->backgroundWalkArea:Lcom/navngo/igo/javaclient/matek/GeoArea;

    return-void
.end method

.method private resumeApp()V
    .registers 2

    const-string v0, "resumeApp"

    .line 293
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 294
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->resumeServer()V

    .line 295
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->startSensors()V

    .line 296
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Sound;->OnResume()V

    return-void
.end method

.method private setInterruptedByPhone(Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;Z)V
    .registers 9

    .line 327
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setInterruptedByPhone: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ResumeHandler"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    .line 333
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

    iget-object v3, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x2

    if-eq v2, v3, :cond_71

    const/4 v4, 0x3

    if-eq v2, v4, :cond_3d

    .line 336
    sget-object p2, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->ordinal()I

    move-result v0

    aget p2, p2, v0

    goto :goto_71

    .line 348
    :cond_3d
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->ordinal()I

    move-result v5

    aget v2, v2, v5

    if-eq v2, v3, :cond_71

    if-eq v2, v4, :cond_71

    if-eqz p2, :cond_51

    const-string p2, "setInterruptedByPhone: NOT coming back"

    .line 352
    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_71

    :cond_51
    const/4 p2, 0x0

    const-string v2, "android"

    const-string v3, "restart_after_phone_call"

    .line 353
    invoke-static {v2, v3, p2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_71

    const-string p2, "setInterruptedByPhone: coming back"

    .line 354
    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_69

    const/16 p2, 0x7d0

    .line 356
    invoke-static {p2}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForeground(I)V

    goto :goto_71

    .line 358
    :cond_69
    new-instance p2, Lcom/navngo/igo/javaclient/ResumeHandler$2;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/ResumeHandler$2;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    invoke-virtual {v0, p2}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 370
    :cond_71
    :goto_71
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    return-void
.end method

.method private shouldShutdown(J)Z
    .registers 11

    .line 464
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->shutdownBlockedBySleepManager:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    .line 467
    :cond_6
    sget v0, Lcom/navngo/igo/javaclient/Config;->background_shutdown_timeout:I

    if-gtz v0, :cond_b

    return v1

    .line 470
    :cond_b
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/ResumeHandler;->isOnTheRoad(J)Z

    move-result v0

    const/4 v2, 0x1

    const-string v3, "ResumeHandler:shouldShutdown"

    if-nez v0, :cond_20

    .line 472
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    sget-object p2, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    if-eq p1, p2, :cond_1f

    const-string p1, "Not on the road: going to sleep"

    .line 473
    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1f
    return v2

    .line 477
    :cond_20
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->isMoving()Z

    move-result v4

    if-eqz v0, :cond_31

    if-eqz v4, :cond_31

    .line 479
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/ResumeHandler;->resetMoving(J)V

    const-string p1, "On the road and moving"

    .line 480
    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 485
    :cond_31
    iget-wide v4, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->should_not_had_shutdown_at:J

    sget v0, Lcom/navngo/igo/javaclient/Config;->background_shutdown_timeout:I

    int-to-long v6, v0

    add-long/2addr v4, v6

    cmp-long v0, v4, p1

    if-lez v0, :cond_3c

    return v1

    :cond_3c
    const-string p1, "nothing happened for a while --> iGO is forgotten --> going to sleep."

    .line 489
    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method

.method private startRetestTimer(J)V
    .registers 7

    .line 539
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->killRetestTimer()V

    .line 540
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->should_not_had_shutdown_at:J

    sget v2, Lcom/navngo/igo/javaclient/Config;->background_shutdown_timeout:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x7530

    add-long/2addr v2, p1

    .line 541
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 542
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startRetestTimer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v0, p1

    const-wide/16 p1, 0x3e8

    div-long p1, v0, p1

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " secs from now on."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ResumeHandler"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    if-eqz p1, :cond_41

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mRetestRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v2, v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result p1

    if-nez p1, :cond_41

    const-string p1, "startRetestTimer:postAtTime FAILED"

    .line 545
    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_41
    return-void
.end method

.method private userPresent()V
    .registers 3

    .line 320
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "User Present START. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 321
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    .line 322
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "User Present END. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/ResumeHandler;
    .registers 2

    .line 36
    const-class v0, Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/ResumeHandler;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/ResumeHandler;
    .registers 1

    .line 36
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->$VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/ResumeHandler;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/ResumeHandler;

    return-object v0
.end method


# virtual methods
.method public addListener(Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;)V
    .registers 3

    const-string v0, "OnResume listener added"

    .line 176
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    if-eqz v0, :cond_12

    .line 179
    invoke-interface {p1}, Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;->onResume()V

    goto :goto_15

    .line 181
    :cond_12
    invoke-interface {p1}, Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;->onPause()V

    :goto_15
    return-void
.end method

.method public declared-synchronized getState()Lcom/navngo/igo/javaclient/ResumeHandler$State;
    .registers 2

    monitor-enter p0

    .line 112
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getState_NOTSYNCHRONIZED()Lcom/navngo/igo/javaclient/ResumeHandler$State;
    .registers 2

    .line 116
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    .line 117
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    return-object v0
.end method

.method public declared-synchronized isResumed()Z
    .registers 2

    monitor-enter p0

    .line 192
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized nativeLoaded()V
    .registers 3

    monitor-enter p0

    const/4 v0, 0x1

    .line 214
    :try_start_2
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mNativeLoaded:Z

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Native Loaded: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mNativeLoaded:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ". Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 216
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 218
    new-instance v1, Lcom/navngo/igo/javaclient/ResumeHandler$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/ResumeHandler$1;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_36

    .line 223
    :cond_33
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    .line 225
    :goto_36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Native Loaded END. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V
    :try_end_4c
    .catchall {:try_start_2 .. :try_end_4c} :catchall_4e

    .line 226
    monitor-exit p0

    return-void

    :catchall_4e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onLocationChanged(Landroid/location/Location;)V
    .registers 5

    monitor-enter p0

    const/4 v0, 0x0

    if-eqz p1, :cond_13

    :try_start_4
    const-string v1, "gps"

    .line 198
    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    goto :goto_14

    :catchall_11
    move-exception p1

    goto :goto_25

    :cond_13
    move-object p1, v0

    .line 202
    :goto_14
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->backgroundWalkArea:Lcom/navngo/igo/javaclient/matek/GeoArea;

    if-eqz v0, :cond_1c

    .line 203
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/matek/GeoArea;->extend(Landroid/location/Location;)V

    goto :goto_23

    .line 205
    :cond_1c
    new-instance v0, Lcom/navngo/igo/javaclient/matek/GeoArea;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/matek/GeoArea;-><init>(Landroid/location/Location;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->backgroundWalkArea:Lcom/navngo/igo/javaclient/matek/GeoArea;
    :try_end_23
    .catchall {:try_start_4 .. :try_end_23} :catchall_11

    .line 207
    :goto_23
    monitor-exit p0

    return-void

    :goto_25
    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized pauseCalled()V
    .registers 3

    monitor-enter p0

    .line 145
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mExternalLogic:Lcom/navngo/igo/javaclient/IExternalResumeLogic;

    if-eqz v0, :cond_11

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IExternalResumeLogic;->pauseIgo()Z

    move-result v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_5b

    if-nez v0, :cond_11

    .line 147
    monitor-exit p0

    return-void

    .line 149
    :cond_11
    :try_start_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPause START. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 150
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    .line 151
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    .line 152
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_33
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_43

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;

    .line 153
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;->onPause()V

    goto :goto_33

    .line 155
    :cond_43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onPause END. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V
    :try_end_59
    .catchall {:try_start_11 .. :try_end_59} :catchall_5b

    .line 156
    monitor-exit p0

    return-void

    :catchall_5b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeListener(Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;)V
    .registers 3

    const-string v0, "OnResume listener removed"

    .line 186
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 187
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public declared-synchronized resumeCalled()V
    .registers 3

    monitor-enter p0

    .line 126
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    if-nez v0, :cond_11

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mExternalLogic:Lcom/navngo/igo/javaclient/IExternalResumeLogic;

    if-eqz v0, :cond_11

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/IExternalResumeLogic;->resumeIgo()Z

    move-result v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_5b

    if-nez v0, :cond_11

    .line 128
    monitor-exit p0

    return-void

    .line 130
    :cond_11
    :try_start_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResume START. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 131
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mResumed:Z

    .line 132
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    .line 133
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_33
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_43

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;

    .line 134
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;->onResume()V

    goto :goto_33

    .line 136
    :cond_43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onResume END. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V
    :try_end_59
    .catchall {:try_start_11 .. :try_end_59} :catchall_5b

    .line 137
    monitor-exit p0

    return-void

    :catchall_5b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public retest(J)V
    .registers 5

    .line 554
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    if-eqz v0, :cond_9

    .line 555
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mRetestRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_9
    return-void
.end method

.method public setExternalLogic(Lcom/navngo/igo/javaclient/IExternalResumeLogic;)V
    .registers 2

    .line 165
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mExternalLogic:Lcom/navngo/igo/javaclient/IExternalResumeLogic;

    return-void
.end method

.method public declared-synchronized setPhoneState(Ljava/lang/String;)V
    .registers 8

    monitor-enter p0

    .line 230
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setPhoneState START. Current state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    .line 231
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mInterruptedByPhone:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    const-string v1, "RINGING"

    .line 233
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mPhoneState:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_32

    const-string v1, "OFFHOOK"

    iget-object v4, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mPhoneState:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    goto :goto_32

    :cond_30
    const/4 v1, 0x0

    goto :goto_33

    :cond_32
    :goto_32
    const/4 v1, 0x1

    :goto_33
    const-string v4, "RINGING"

    .line 234
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_43

    const-string v4, "OFFHOOK"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    :cond_43
    const/4 v2, 0x1

    :cond_44
    if-nez v2, :cond_66

    const-string v4, "IDLE"

    .line 236
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_66

    const-string v0, "ResumeHandler"

    .line 237
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPhoneState END. Ignoring unknown phone state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_64
    .catchall {:try_start_1 .. :try_end_64} :catchall_e9

    .line 238
    monitor-exit p0

    return-void

    .line 240
    :cond_66
    :try_start_66
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setPhoneState "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mPhoneState:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V

    if-eqz v2, :cond_91

    .line 243
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v4

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/Sound;->getMutingDevice()Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    move-result-object v4

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;->OnAudioFocusLoss()V

    :cond_91
    if-eqz v1, :cond_a5

    if-eqz v2, :cond_96

    goto :goto_c9

    .line 252
    :cond_96
    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    .line 253
    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    if-eq v0, v3, :cond_a3

    .line 254
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-direct {p0, v3, v4}, Lcom/navngo/igo/javaclient/ResumeHandler;->resetMoving(J)V

    :cond_a3
    move-object v0, v1

    goto :goto_c9

    :cond_a5
    if-eqz v2, :cond_c7

    .line 259
    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    if-eq v0, v1, :cond_ac

    goto :goto_c9

    .line 262
    :cond_ac
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State:[I

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    if-eq v0, v3, :cond_c4

    const/4 v1, 0x2

    if-eq v0, v1, :cond_c4

    const/4 v1, 0x3

    if-eq v0, v1, :cond_c1

    .line 272
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    goto :goto_c9

    .line 268
    :cond_c1
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_BG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    goto :goto_c9

    .line 265
    :cond_c4
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_FG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    goto :goto_c9

    .line 277
    :cond_c7
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    .line 281
    :goto_c9
    invoke-direct {p0, v0, v2}, Lcom/navngo/igo/javaclient/ResumeHandler;->setInterruptedByPhone(Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;Z)V

    .line 283
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mPhoneState:Ljava/lang/String;

    .line 284
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V

    .line 285
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "setPhoneState END. Current state: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->log(Ljava/lang/String;)V
    :try_end_e7
    .catchall {:try_start_66 .. :try_end_e7} :catchall_e9

    .line 286
    monitor-exit p0

    return-void

    :catchall_e9
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setShutdownBlock(Z)V
    .registers 2

    .line 455
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->shutdownBlockedBySleepManager:Z

    return-void
.end method

.method public declared-synchronized start(Landroid/app/Activity;)V
    .registers 6

    monitor-enter p0

    .line 74
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 75
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    if-eqz v2, :cond_c

    .line 76
    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->close()V

    .line 77
    :cond_c
    new-instance v2, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-direct {v2, p1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;-><init>(Landroid/app/Activity;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    .line 78
    new-instance p1, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;

    const/4 v2, 0x0

    invoke-direct {p1, p0, v2}, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;Lcom/navngo/igo/javaclient/ResumeHandler$1;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mRetestRunnable:Ljava/lang/Runnable;

    .line 79
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v3, "keyguard"

    invoke-virtual {p1, v3}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/KeyguardManager;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 80
    sget-object p1, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mState:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const/4 p1, 0x0

    .line 81
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mNativeLoaded:Z

    const/4 p1, 0x1

    .line 82
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenOn:Z

    .line 83
    iput-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->backgroundWalkArea:Lcom/navngo/igo/javaclient/matek/GeoArea;

    .line 84
    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->startRetestTimer(J)V

    .line 85
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->resetMoving(J)V

    .line 88
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mUserPresentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.USER_PRESENT"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 93
    new-instance p1, Landroid/content/IntentFilter;

    const-string v0, "android.intent.action.SCREEN_OFF"

    invoke-direct {p1, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.action.SCREEN_ON"

    .line 94
    invoke-virtual {p1, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 96
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_5e
    .catchall {:try_start_1 .. :try_end_5e} :catchall_60

    .line 97
    monitor-exit p0

    return-void

    :catchall_60
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized stop()V
    .registers 3

    monitor-enter p0

    .line 101
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1f

    if-nez v0, :cond_7

    .line 102
    monitor-exit p0

    return-void

    .line 104
    :cond_7
    :try_start_7
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->killRetestTimer()V

    .line 105
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mHandler:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->close()V

    .line 106
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mScreenReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 107
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler;->mUserPresentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_1d
    .catchall {:try_start_7 .. :try_end_1d} :catchall_1f

    .line 108
    monitor-exit p0

    return-void

    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized surfaceChanged()V
    .registers 2

    monitor-enter p0

    .line 160
    :try_start_1
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->doTheJob()V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 161
    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.AnonymousClass1 (com.navngo.igo.javaclient.ResumeHandler$1)
.class Lcom/navngo/igo/javaclient/ResumeHandler$1;
.super Ljava/lang/Object;
.source "ResumeHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;->nativeLoaded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 2

    .line 218
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 219
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$200(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.AnonymousClass2 (com.navngo.igo.javaclient.ResumeHandler$2)
.class Lcom/navngo/igo/javaclient/ResumeHandler$2;
.super Ljava/lang/Object;
.source "ResumeHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;->setInterruptedByPhone(Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 2

    .line 358
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$2;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    const/16 v0, 0x7d0

    .line 359
    invoke-static {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForeground(I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.AnonymousClass3 (com.navngo.igo.javaclient.ResumeHandler$3)
.class Lcom/navngo/igo/javaclient/ResumeHandler$3;
.super Landroid/content/BroadcastReceiver;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 2

    .line 373
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$3;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    .line 376
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$3;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$300(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.AnonymousClass4 (com.navngo.igo.javaclient.ResumeHandler$4)
.class Lcom/navngo/igo/javaclient/ResumeHandler$4;
.super Landroid/content/BroadcastReceiver;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 2

    .line 380
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$4;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    .line 383
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.SCREEN_OFF"

    .line 384
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_13

    .line 385
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$4;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$400(Lcom/navngo/igo/javaclient/ResumeHandler;Z)V

    goto :goto_21

    :cond_13
    const-string p2, "android.intent.action.SCREEN_ON"

    .line 387
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    .line 388
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$4;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$400(Lcom/navngo/igo/javaclient/ResumeHandler;Z)V

    :cond_21
    :goto_21
    return-void
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.AnonymousClass5 (com.navngo.igo.javaclient.ResumeHandler$5)
.class synthetic Lcom/navngo/igo/javaclient/ResumeHandler$5;
.super Ljava/lang/Object;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

.field static final synthetic $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State:[I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 336
    invoke-static {}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->values()[Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

    const/4 v1, 0x1

    :try_start_a
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_12} :catch_12

    :catch_12
    const/4 v0, 0x2

    :try_start_13
    sget-object v2, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_BG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_1d} :catch_1d

    :catch_1d
    const/4 v2, 0x3

    :try_start_1e
    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt:[I

    sget-object v4, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_FG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->ordinal()I

    move-result v4

    aput v2, v3, v4
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_28} :catch_28

    .line 262
    :catch_28
    invoke-static {}, Lcom/navngo/igo/javaclient/ResumeHandler$State;->values()[Lcom/navngo/igo/javaclient/ResumeHandler$State;

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State:[I

    :try_start_31
    sget-object v4, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/ResumeHandler$State;->ordinal()I

    move-result v4

    aput v1, v3, v4
    :try_end_39
    .catch Ljava/lang/NoSuchFieldError; {:try_start_31 .. :try_end_39} :catch_39

    :catch_39
    :try_start_39
    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State:[I

    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND_BLOCKED_BY_KEYGUARD:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/ResumeHandler$State;->ordinal()I

    move-result v3

    aput v0, v1, v3
    :try_end_43
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_43} :catch_43

    :catch_43
    :try_start_43
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State:[I

    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$State;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_4d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_4d} :catch_4d

    :catch_4d
    :try_start_4d
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$5;->$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State:[I

    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$State;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_58
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4d .. :try_end_58} :catch_58

    :catch_58
    return-void
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.HandlerWithWalltime (com.navngo.igo.javaclient.ResumeHandler$HandlerWithWalltime)
.class final Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;
.super Ljava/lang/Object;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HandlerWithWalltime"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;
    }
.end annotation


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private mDelayBase:J

.field private final mSignal:Ljava/lang/String;

.field private final mTasks:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final mTimerRunnable:Ljava/lang/Runnable;

.field private mTimerThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 4

    .line 593
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 587
    iput-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerThread:Ljava/lang/Thread;

    .line 588
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    .line 589
    new-instance v0, Ljava/lang/String;

    const-string v1, "HandlerWithWalltime.mSignal"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    const-wide/16 v0, 0x0

    .line 590
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mDelayBase:J

    .line 648
    new-instance v0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerRunnable:Ljava/lang/Runnable;

    .line 594
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method static synthetic access$1000(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/util/Vector;
    .registers 1

    .line 576
    iget-object p0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;J)V
    .registers 3

    .line 576
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->adjustDelays(J)V

    return-void
.end method

.method static synthetic access$1200(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Landroid/app/Activity;
    .registers 1

    .line 576
    iget-object p0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;Ljava/lang/Thread;)Ljava/lang/Thread;
    .registers 2

    .line 576
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerThread:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic access$900(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/lang/String;
    .registers 1

    .line 576
    iget-object p0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    return-object p0
.end method

.method private adjustDelays(J)V
    .registers 7

    .line 636
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mDelayBase:J

    cmp-long v2, p1, v0

    if-gez v2, :cond_9

    .line 638
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mDelayBase:J

    goto :goto_2b

    :cond_9
    cmp-long v2, p1, v0

    if-lez v2, :cond_2b

    sub-long/2addr p1, v0

    .line 642
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;

    .line 643
    iget-wide v2, v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->delay:J

    sub-long/2addr v2, p1

    iput-wide v2, v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->delay:J

    goto :goto_14

    .line 644
    :cond_26
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mDelayBase:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mDelayBase:J

    :cond_2b
    :goto_2b
    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 598
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    monitor-enter v0

    .line 599
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->removeAllElements()V

    .line 600
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerThread:Ljava/lang/Thread;

    if-eqz v1, :cond_f

    .line 601
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 602
    :cond_f
    monitor-exit v0

    return-void

    :catchall_11
    move-exception v1

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v1
.end method

.method public postDelayed(Ljava/lang/Runnable;J)Z
    .registers 9

    .line 616
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    monitor-enter v0

    .line 617
    :try_start_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 618
    invoke-direct {p0, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->adjustDelays(J)V

    .line 619
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    :goto_10
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_25

    .line 621
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;

    iget-wide v3, v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->delay:J

    cmp-long v1, p2, v3

    if-ltz v1, :cond_23

    goto :goto_25

    :cond_23
    move v1, v2

    goto :goto_10

    .line 624
    :cond_25
    :goto_25
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    new-instance v3, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;

    invoke-direct {v3, p2, p3, p1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;-><init>(JLjava/lang/Runnable;)V

    const/4 p1, 0x1

    add-int/2addr v2, p1

    invoke-virtual {v1, v3, v2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 625
    iget-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerThread:Ljava/lang/Thread;

    if-nez p2, :cond_43

    .line 626
    new-instance p2, Ljava/lang/Thread;

    iget-object p3, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerRunnable:Ljava/lang/Runnable;

    const-string v1, "HandlerWithWalltime.mTimerThread"

    invoke-direct {p2, p3, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTimerThread:Ljava/lang/Thread;

    .line 628
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 630
    :cond_43
    iget-object p2, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Object;->notify()V

    .line 631
    monitor-exit v0

    return p1

    :catchall_4a
    move-exception p1

    monitor-exit v0
    :try_end_4c
    .catchall {:try_start_3 .. :try_end_4c} :catchall_4a

    throw p1
.end method

.method public removeCallbacks(Ljava/lang/Runnable;)V
    .registers 5

    .line 606
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    monitor-enter v0

    .line 607
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    :goto_9
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_20

    .line 608
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->runnable:Ljava/lang/Runnable;

    if-ne v1, p1, :cond_1e

    .line 609
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mTasks:Ljava/util/Vector;

    invoke-virtual {v1, v2}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;

    :cond_1e
    move v1, v2

    goto :goto_9

    .line 611
    :cond_20
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->mSignal:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 612
    monitor-exit v0

    return-void

    :catchall_27
    move-exception p1

    monitor-exit v0
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_27

    throw p1
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.HandlerWithWalltime.AnonymousClass1 (com.navngo.igo.javaclient.ResumeHandler$HandlerWithWalltime$1)
.class Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;
.super Ljava/lang/Object;
.source "ResumeHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)V
    .registers 2

    .line 648
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .line 651
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$900(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0

    .line 654
    :goto_7
    :try_start_7
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$1000(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-nez v1, :cond_1d

    .line 655
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$900(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    goto :goto_7

    .line 658
    :cond_1d
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$1100(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;J)V

    .line 659
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$1000(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/util/Vector;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;

    iget-wide v3, v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->delay:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_45

    .line 661
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$900(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/lang/Object;->wait(J)V

    goto :goto_7

    .line 665
    :cond_45
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$1000(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/util/Vector;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->runnable:Ljava/lang/Runnable;

    .line 666
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$1200(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_5c
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_5c} :catch_5f
    .catchall {:try_start_7 .. :try_end_5c} :catchall_5d

    goto :goto_7

    :catchall_5d
    move-exception v1

    goto :goto_67

    .line 669
    :catch_5f
    :try_start_5f
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$1;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;->access$1302(Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 670
    monitor-exit v0

    return-void

    .line 672
    :goto_67
    monitor-exit v0
    :try_end_68
    .catchall {:try_start_5f .. :try_end_68} :catchall_5d

    throw v1
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.HandlerWithWalltime.Entry (com.navngo.igo.javaclient.ResumeHandler$HandlerWithWalltime$Entry)
.class final Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;
.super Ljava/lang/Object;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field public delay:J

.field public runnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(JLjava/lang/Runnable;)V
    .registers 4

    .line 579
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 580
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->delay:J

    .line 581
    iput-object p3, p0, Lcom/navngo/igo/javaclient/ResumeHandler$HandlerWithWalltime$Entry;->runnable:Ljava/lang/Runnable;

    return-void
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.IsOnTheRoadRunnable (com.navngo.igo.javaclient.ResumeHandler$IsOnTheRoadRunnable)
.class final Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;
.super Ljava/lang/Object;
.source "ResumeHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IsOnTheRoadRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 2

    .line 511
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;Lcom/navngo/igo/javaclient/ResumeHandler$1;)V
    .registers 3

    .line 511
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 514
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    monitor-enter v0

    .line 515
    :try_start_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 516
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->isOnTheRoad()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 518
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v3, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$502(Lcom/navngo/igo/javaclient/ResumeHandler;J)J

    goto :goto_18

    .line 520
    :cond_13
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v3, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$602(Lcom/navngo/igo/javaclient/ResumeHandler;J)J

    .line 522
    :goto_18
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$IsOnTheRoadRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$200(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    .line 523
    monitor-exit v0

    return-void

    :catchall_1f
    move-exception v1

    monitor-exit v0
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v1
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.OnActivityStateChangeListener (com.navngo.igo.javaclient.ResumeHandler$OnActivityStateChangeListener)
.class public interface abstract Lcom/navngo/igo/javaclient/ResumeHandler$OnActivityStateChangeListener;
.super Ljava/lang/Object;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnActivityStateChangeListener"
.end annotation


# virtual methods
.method public abstract onPause()V
.end method

.method public abstract onResume()V
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.PhoneInterrupt (com.navngo.igo.javaclient.ResumeHandler$PhoneInterrupt)
.class final enum Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;
.super Ljava/lang/Enum;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "PhoneInterrupt"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

.field public static final enum IBP_BG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

.field public static final enum IBP_FG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

.field public static final enum IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 47
    new-instance v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    const-string v1, "IBP_NO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_NO:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    .line 48
    new-instance v1, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    const-string v3, "IBP_BG"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_BG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    .line 49
    new-instance v3, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    const-string v5, "IBP_FG"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->IBP_FG:Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 46
    sput-object v5, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->$VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;
    .registers 2

    .line 46
    const-class v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;
    .registers 1

    .line 46
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->$VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/ResumeHandler$PhoneInterrupt;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.RetestRunnable (com.navngo.igo.javaclient.ResumeHandler$RetestRunnable)
.class final Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;
.super Ljava/lang/Object;
.source "ResumeHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RetestRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ResumeHandler;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V
    .registers 2

    .line 559
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/ResumeHandler;Lcom/navngo/igo/javaclient/ResumeHandler$1;)V
    .registers 3

    .line 559
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;-><init>(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 562
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    monitor-enter v0

    .line 563
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RetestRunnable.run START. Current state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$700(Lcom/navngo/igo/javaclient/ResumeHandler;)Lcom/navngo/igo/javaclient/ResumeHandler$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$800(Ljava/lang/String;)V

    .line 564
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$200(Lcom/navngo/igo/javaclient/ResumeHandler;)V

    .line 565
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RetestRunnable.run END. Current state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ResumeHandler$RetestRunnable;->this$0:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$700(Lcom/navngo/igo/javaclient/ResumeHandler;)Lcom/navngo/igo/javaclient/ResumeHandler$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->access$800(Ljava/lang/String;)V

    .line 566
    monitor-exit v0

    return-void

    :catchall_3e
    move-exception v1

    monitor-exit v0
    :try_end_40
    .catchall {:try_start_3 .. :try_end_40} :catchall_3e

    throw v1
.end method

###### Class com.navngo.igo.javaclient.ResumeHandler.State (com.navngo.igo.javaclient.ResumeHandler$State)
.class public final enum Lcom/navngo/igo/javaclient/ResumeHandler$State;
.super Ljava/lang/Enum;
.source "ResumeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ResumeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/ResumeHandler$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler$State;

.field public static final enum BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

.field public static final enum FOREGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

.field public static final enum FOREGROUND_BLOCKED_BY_KEYGUARD:Lcom/navngo/igo/javaclient/ResumeHandler$State;

.field public static final enum FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 40
    new-instance v0, Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const-string v1, "FOREGROUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 41
    new-instance v1, Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const-string v3, "FOREGROUND_BLOCKED_BY_KEYGUARD"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/ResumeHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FOREGROUND_BLOCKED_BY_KEYGUARD:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 42
    new-instance v3, Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const-string v5, "BACKGROUND"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/ResumeHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$State;->BACKGROUND:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 43
    new-instance v5, Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const-string v7, "FULLY_PAUSED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/navngo/igo/javaclient/ResumeHandler$State;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/navngo/igo/javaclient/ResumeHandler$State;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 39
    sput-object v7, Lcom/navngo/igo/javaclient/ResumeHandler$State;->$VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 39
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/ResumeHandler$State;
    .registers 2

    .line 39
    const-class v0, Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/ResumeHandler$State;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/ResumeHandler$State;
    .registers 1

    .line 39
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler$State;->$VALUES:[Lcom/navngo/igo/javaclient/ResumeHandler$State;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/ResumeHandler$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/ResumeHandler$State;

    return-object v0
.end method
