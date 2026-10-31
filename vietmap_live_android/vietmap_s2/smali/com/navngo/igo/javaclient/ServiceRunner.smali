###### Class com.navngo.igo.javaclient.ServiceRunner (com.navngo.igo.javaclient.ServiceRunner)
.class public final Lcom/navngo/igo/javaclient/ServiceRunner;
.super Ljava/lang/Object;
.source "ServiceRunner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "ServiceRunner"


# instance fields
.field private mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

.field private mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

.field private serviceintent1:Landroid/content/Intent;

.field private serviceintent2:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 51
    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    .line 52
    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent2:Landroid/content/Intent;

    .line 43
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.navngo.igo.javaclient.MAINSERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    .line 44
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 45
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.navngo.igo.javaclient.SLAPI_SERVER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent2:Landroid/content/Intent;

    .line 46
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    .line 48
    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    return-void
.end method


# virtual methods
.method public declared-synchronized getMainServiceState()Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    .registers 2

    monitor-enter p0

    .line 27
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSlapiServiceState()Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    .registers 2

    monitor-enter p0

    .line 31
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isMainServiceRunningOrStarting()Z
    .registers 3

    monitor-enter p0

    .line 35
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    sget-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->RUNNING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    if-eq v0, v1, :cond_10

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    sget-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STARTING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_13

    if-ne v0, v1, :cond_e

    goto :goto_10

    :cond_e
    const/4 v0, 0x0

    goto :goto_11

    :cond_10
    :goto_10
    const/4 v0, 0x1

    :goto_11
    monitor-exit p0

    return v0

    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSlapiServiceRunningOrStarting()Z
    .registers 3

    monitor-enter p0

    .line 39
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    sget-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->RUNNING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    if-eq v0, v1, :cond_10

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    sget-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STARTING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_13

    if-ne v0, v1, :cond_e

    goto :goto_10

    :cond_e
    const/4 v0, 0x0

    goto :goto_11

    :cond_10
    :goto_10
    const/4 v0, 0x1

    :goto_11
    monitor-exit p0

    return v0

    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized setMainServiceState(Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;)V
    .registers 2

    monitor-enter p0

    .line 23
    :try_start_1
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 24
    monitor-exit p0

    return-void

    :catchall_5
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public showBGNotification(Z)V
    .registers 4

    .line 97
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const-string v1, "startForeground"

    .line 98
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 100
    :try_start_c
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_15
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_15} :catch_16

    goto :goto_2c

    .line 103
    :catch_16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showBGNotification: prevented startService crash, show="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ServiceRunner"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2c
    return-void
.end method

.method public declared-synchronized startMainService(Z)V
    .registers 4

    monitor-enter p0

    .line 55
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    if-eqz v0, :cond_2d

    .line 57
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_21

    if-eqz p1, :cond_21

    .line 58
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    const-string v0, "startForeground"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 59
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_34

    .line 62
    :cond_21
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_34

    :cond_2d
    const-string p1, "ServiceRunner"

    const-string v0, "Could not start MAINSERVICE"

    .line 65
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    :goto_34
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    if-ne p1, v0, :cond_3e

    .line 68
    sget-object p1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STARTING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_3e
    .catchall {:try_start_1 .. :try_end_3e} :catchall_40

    .line 70
    :cond_3e
    monitor-exit p0

    return-void

    :catchall_40
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized startServices(Z)V
    .registers 2

    monitor-enter p0

    .line 84
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/ServiceRunner;->startMainService(Z)V

    .line 85
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ServiceRunner;->startSlapiService()V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 86
    monitor-exit p0

    return-void

    :catchall_9
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized startSlapiService()V
    .registers 3

    monitor-enter p0

    .line 73
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent2:Landroid/content/Intent;

    if-eqz v0, :cond_11

    .line 75
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent2:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_18

    :cond_11
    const-string v0, "ServiceRunner"

    const-string v1, "Could not start SLAPI_SERVER"

    .line 77
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    :goto_18
    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->RUNNING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1e

    .line 80
    monitor-exit p0

    return-void

    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopServices()V
    .registers 3

    monitor-enter p0

    .line 90
    :try_start_1
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent1:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 91
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->serviceintent2:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 92
    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mMainServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    .line 93
    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServiceRunner;->mSlapiServiceState:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    .line 94
    monitor-exit p0

    return-void

    :catchall_21
    move-exception v0

    monitor-exit p0

    throw v0
.end method

###### Class com.navngo.igo.javaclient.ServiceRunner.ServiceState (com.navngo.igo.javaclient.ServiceRunner$ServiceState)
.class public final enum Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
.super Ljava/lang/Enum;
.source "ServiceRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServiceRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ServiceState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

.field public static final enum RUNNING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

.field public static final enum STARTING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

.field public static final enum STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

.field public static final enum STOPPING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 14
    new-instance v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    const-string v1, "STARTING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STARTING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    .line 15
    new-instance v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    const-string v3, "RUNNING"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->RUNNING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    .line 16
    new-instance v3, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    const-string v5, "STOPPING"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPING:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    .line 17
    new-instance v5, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    const-string v7, "STOPPED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->STOPPED:Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 13
    sput-object v7, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->$VALUES:[Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 13
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    .registers 2

    .line 13
    const-class v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;
    .registers 1

    .line 13
    sget-object v0, Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->$VALUES:[Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/ServiceRunner$ServiceState;

    return-object v0
.end method
