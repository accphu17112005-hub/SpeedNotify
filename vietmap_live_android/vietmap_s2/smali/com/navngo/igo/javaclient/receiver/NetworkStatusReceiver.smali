###### Class com.navngo.igo.javaclient.receiver.NetworkStatusReceiver (com.navngo.igo.javaclient.receiver.NetworkStatusReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NetworkStatusReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;
    }
.end annotation


# static fields
.field public static final instance:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;

.field private static final logname:Ljava/lang/String; = "NetworkStatusReceiver"

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 30
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;

    const/4 v0, 0x0

    .line 32
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->registered:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private getCurrentStatusImpl(Landroid/content/Context;)I
    .registers 5

    const-string v0, "connectivity"

    .line 70
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    .line 71
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p1

    const-string v0, "NetworkStatusReceiver"

    if-nez p1, :cond_1c

    const-string p1, "getCurrentStatus: No active network"

    .line 73
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    sget-object p1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_NONE:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->ordinal()I

    move-result p1

    return p1

    .line 76
    :cond_1c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getCurrentStatus, status="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v0

    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-eq v0, v1, :cond_4f

    .line 79
    sget-object p1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_NONE:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->ordinal()I

    move-result p1

    return p1

    .line 81
    :cond_4f
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result p1

    if-eqz p1, :cond_77

    const/4 v0, 0x1

    if-eq p1, v0, :cond_70

    const/4 v0, 0x6

    if-eq p1, v0, :cond_70

    const/4 v0, 0x7

    if-eq p1, v0, :cond_69

    const/16 v0, 0x9

    if-eq p1, v0, :cond_70

    .line 91
    sget-object p1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_NONE:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->ordinal()I

    move-result p1

    return p1

    .line 85
    :cond_69
    sget-object p1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_BLUETOOTH:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->ordinal()I

    move-result p1

    return p1

    .line 89
    :cond_70
    sget-object p1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_WIFI:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->ordinal()I

    move-result p1

    return p1

    .line 83
    :cond_77
    sget-object p1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_CARRIER:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->ordinal()I

    move-result p1

    return p1
.end method


# virtual methods
.method public getCurrentStatus()I
    .registers 2

    .line 60
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->getCurrentStatusImpl(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    .line 54
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->getCurrentStatusImpl(Landroid/content/Context;)I

    move-result p1

    .line 55
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "network staus changed: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "NetworkStatusReceiver"

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "android.network.set_status"

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public declared-synchronized register()V
    .registers 4

    monitor-enter p0

    .line 35
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->registered:Z

    if-nez v0, :cond_29

    .line 36
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 37
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->registered:Z

    .line 38
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->requestCurrentStatus()V

    .line 39
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.network.requestCurrentStatus"

    const-string v2, "requestCurrentStatus"

    .line 40
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.network.getCurrentStatus"

    const-string v2, "getCurrentStatus"

    .line 41
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_2b

    .line 43
    :cond_29
    monitor-exit p0

    return-void

    :catchall_2b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public requestCurrentStatus()V
    .registers 5

    const-string v0, "NetworkStatusReceiver"

    const-string v1, "requestCurrentStatus"

    .line 64
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->getCurrentStatus()I

    move-result v0

    .line 66
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const-string v0, "android.network.set_status"

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public declared-synchronized unregister()V
    .registers 2

    monitor-enter p0

    .line 46
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->registered:Z

    if-eqz v0, :cond_d

    .line 47
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 48
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;->registered:Z
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 50
    :cond_d
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

###### Class com.navngo.igo.javaclient.receiver.NetworkStatusReceiver.CONNECTION_TYPE (com.navngo.igo.javaclient.receiver.NetworkStatusReceiver$CONNECTION_TYPE)
.class final enum Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;
.super Ljava/lang/Enum;
.source "NetworkStatusReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "CONNECTION_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

.field public static final enum CONNECTION_TYPE_BLUETOOTH:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

.field public static final enum CONNECTION_TYPE_CARRIER:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

.field public static final enum CONNECTION_TYPE_NONE:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

.field public static final enum CONNECTION_TYPE_WIFI:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 25
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    const-string v1, "CONNECTION_TYPE_NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_NONE:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    .line 26
    new-instance v1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    const-string v3, "CONNECTION_TYPE_BLUETOOTH"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_BLUETOOTH:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    .line 27
    new-instance v3, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    const-string v5, "CONNECTION_TYPE_CARRIER"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_CARRIER:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    .line 28
    new-instance v5, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    const-string v7, "CONNECTION_TYPE_WIFI"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->CONNECTION_TYPE_WIFI:Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 24
    sput-object v7, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->$VALUES:[Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;
    .registers 2

    .line 24
    const-class v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;
    .registers 1

    .line 24
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->$VALUES:[Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/receiver/NetworkStatusReceiver$CONNECTION_TYPE;

    return-object v0
.end method
