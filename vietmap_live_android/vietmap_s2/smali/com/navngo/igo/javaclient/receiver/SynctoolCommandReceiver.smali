###### Class com.navngo.igo.javaclient.receiver.SynctoolCommandReceiver (com.navngo.igo.javaclient.receiver.SynctoolCommandReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SynctoolCommandReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final BROADCAST_INTENT_ACTION:Ljava/lang/String; = "com.navngo.igo.synctoolcommand"

.field public static final BROADCAST_INTENT_CATEGORY:Ljava/lang/String; = "android.intent.category.DEFAULT"

.field public static final BROADCAST_INTENT_COMMAND:Ljava/lang/String; = "command"

.field public static final BROADCAST_INTENT_COMMAND_EXIT_IGO:I = 0x0

.field public static final BROADCAST_INTENT_COMMAND_INVALID:I = -0x1

.field public static final RESULT_HANDLED:I = 0x2

.field public static final instance:Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;

.field private static final intentfilter:Landroid/content/IntentFilter;

.field private static final logname:Ljava/lang/String; = "SynctoolCommandReceiver"

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 29
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;

    .line 33
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->intentfilter:Landroid/content/IntentFilter;

    const-string v1, "com.navngo.igo.synctoolcommand"

    .line 34
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    .line 35
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 37
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->registered:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private exitfromIgo()V
    .registers 5

    const-string v0, "SynctoolCommandReceiver"

    const-string v1, "Shutdown command from synctool. Exiting..."

    .line 69
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "sc_DoExit"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    .line 56
    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SynctoolCommandReceiver"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "command"

    const/4 v1, -0x1

    .line 58
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-nez p1, :cond_1f

    const/4 p1, 0x2

    .line 60
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->setResultCode(I)V

    .line 61
    sget-object p1, Lcom/navngo/igo/javaclient/Config;->packageName:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->setResultData(Ljava/lang/String;)V

    .line 62
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->exitfromIgo()V

    goto :goto_24

    :cond_1f
    const-string p1, "Unknown command from synctool. Command discarded."

    .line 64
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_24
    return-void
.end method

.method public declared-synchronized register()V
    .registers 3

    monitor-enter p0

    .line 40
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->registered:Z

    if-nez v0, :cond_f

    .line 41
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget-object v1, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->intentfilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 42
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->registered:Z
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 44
    :cond_f
    monitor-exit p0

    return-void

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregister()V
    .registers 2

    monitor-enter p0

    .line 47
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->registered:Z

    if-eqz v0, :cond_d

    .line 48
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 49
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/SynctoolCommandReceiver;->registered:Z
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 51
    :cond_d
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method
