###### Class com.navngo.igo.javaclient.receiver.BootReceiver (com.navngo.igo.javaclient.receiver.BootReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# static fields
.field private static final logname:Ljava/lang/String; = "BootReceiver"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    const-string p2, "BootReceiver"

    const-string v0, "onReceive"

    .line 25
    invoke-static {p2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/Application;->setApplicationContext(Landroid/content/Context;)V

    .line 27
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/Application;->setBootTime(J)V

    const-string p1, "android"

    const-string v0, "start_on_boot"

    const/4 v1, 0x0

    .line 28
    invoke-static {p1, v0, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_30

    .line 29
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->Initialize()V

    .line 31
    new-instance p1, Lcom/navngo/igo/javaclient/receiver/BootReceiver$1;

    invoke-direct {p1, p0, p2}, Lcom/navngo/igo/javaclient/receiver/BootReceiver$1;-><init>(Lcom/navngo/igo/javaclient/receiver/BootReceiver;Ljava/lang/String;)V

    .line 52
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/receiver/BootReceiver$1;->start()V

    goto :goto_35

    :cond_30
    const-string p1, "start_on_boot is disabled in sys.txt"

    .line 54
    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_35
    const-string p1, "onReceive completed"

    .line 56
    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.receiver.BootReceiver.AnonymousClass1 (com.navngo.igo.javaclient.receiver.BootReceiver$1)
.class Lcom/navngo/igo/javaclient/receiver/BootReceiver$1;
.super Ljava/lang/Thread;
.source "BootReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/receiver/BootReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/receiver/BootReceiver;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/receiver/BootReceiver;Ljava/lang/String;)V
    .registers 3

    .line 31
    iput-object p1, p0, Lcom/navngo/igo/javaclient/receiver/BootReceiver$1;->this$0:Lcom/navngo/igo/javaclient/receiver/BootReceiver;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    const/4 v0, 0x2

    .line 35
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    const/4 v0, 0x0

    .line 37
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    move-result v1

    if-nez v1, :cond_1b

    :try_start_b
    const-string v1, "android"

    const-string v2, "wait_for_sdcard_on_boot"

    const/16 v3, 0x7530

    .line 39
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_19
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_19} :catch_1a

    goto :goto_1b

    :catch_1a
    nop

    .line 44
    :cond_1b
    :goto_1b
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->reInit()V

    .line 45
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    move-result v0

    if-nez v0, :cond_25

    return-void

    .line 47
    :cond_25
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/ServiceRunner;->startServices(Z)V

    .line 48
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->def_background_navigation:Z

    const-string v2, "gps"

    const-string v3, "background_navigation"

    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    xor-int/2addr v0, v1

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->startServerAfterMediaScan(Z)V

    return-void
.end method
