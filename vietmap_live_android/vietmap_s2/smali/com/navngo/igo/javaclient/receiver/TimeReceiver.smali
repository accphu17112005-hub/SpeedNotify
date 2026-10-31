###### Class com.navngo.igo.javaclient.receiver.TimeReceiver (com.navngo.igo.javaclient.receiver.TimeReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/TimeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "TimeReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final instance:Lcom/navngo/igo/javaclient/receiver/TimeReceiver;

.field private static final intentfilter:Landroid/content/IntentFilter;

.field private static final logname:Ljava/lang/String; = "TimeReceiver"

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 18
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/TimeReceiver;

    .line 21
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.TIME_SET"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->intentfilter:Landroid/content/IntentFilter;

    const/4 v0, 0x0

    .line 23
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->registered:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 41
    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "TimeReceiver"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.TIME_SET"

    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_18

    .line 44
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->requestTimeChange()V

    :cond_18
    return-void
.end method

.method public declared-synchronized register()V
    .registers 3

    monitor-enter p0

    .line 26
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->registered:Z

    if-nez v0, :cond_f

    .line 27
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget-object v1, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->intentfilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 28
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->registered:Z
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 30
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

    .line 33
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->registered:Z

    if-eqz v0, :cond_d

    .line 34
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 35
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/TimeReceiver;->registered:Z
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 37
    :cond_d
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method
