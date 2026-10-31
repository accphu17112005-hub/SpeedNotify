###### Class com.navngo.igo.javaclient.receiver.MediaReceiver (com.navngo.igo.javaclient.receiver.MediaReceiver)
.class public final Lcom/navngo/igo/javaclient/receiver/MediaReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MediaReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final instance:Lcom/navngo/igo/javaclient/receiver/MediaReceiver;

.field private static final logname:Ljava/lang/String; = "MediaReceiver"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 24
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/MediaReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/MediaReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/MediaReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/MediaReceiver;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10

    .line 50
    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MediaReceiver"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 52
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object p2

    .line 53
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/navngo/igo/javaclient/Application;->setApplicationContext(Landroid/content/Context;)V

    if-eqz p2, :cond_67

    .line 55
    sget-object p1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    if-eqz p1, :cond_67

    .line 56
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    :try_start_30
    invoke-virtual {v2}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_67

    .line 60
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Irrelevant media, intent discarded. Received path=\'"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\' own path=\'"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\'."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_61} :catch_62

    return-void

    :catch_62
    const-string p1, "IOException caught while checking intent."

    .line 64
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_67
    const-string p1, "android.intent.action.MEDIA_EJECT"

    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 p2, 0x1

    if-nez p1, :cond_f6

    const-string p1, "android.intent.action.MEDIA_BAD_REMOVAL"

    .line 68
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7a

    goto/16 :goto_f6

    :cond_7a
    const-string p1, "android.intent.action.MEDIA_MOUNTED"

    .line 71
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v2, 0x0

    if-eqz p1, :cond_de

    .line 72
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->Initialize()V

    const/4 p1, 0x4

    .line 73
    invoke-static {p1}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    .line 74
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    move-result p1

    if-eqz p1, :cond_fe

    .line 75
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getBootTime()J

    move-result-wide v3

    const-wide/16 v5, -0x1

    const-string p1, "android"

    cmp-long v0, v3, v5

    if-eqz v0, :cond_c7

    const/16 v0, 0x7530

    const-string v5, "wait_for_sdcard_on_boot"

    .line 76
    invoke-static {p1, v5, v0}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    int-to-long v5, v0

    add-long/2addr v3, v5

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-lez v0, :cond_c7

    const-string v0, "start_on_boot"

    .line 78
    invoke-static {p1, v0, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_c1

    const-string p1, "starting in background"

    .line 79
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    invoke-static {p2}, Lcom/navngo/igo/javaclient/ServerRunner;->startServerAfterMediaScan(Z)V

    goto :goto_fe

    :cond_c1
    const-string p1, "start_on_boot is disabled"

    .line 83
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_fe

    :cond_c7
    const-string v0, "start_on_insert_sdcard"

    .line 86
    invoke-static {p1, v0, p2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_d8

    const-string p1, "starting in foreground"

    .line 88
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-static {v2}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForeground(I)V

    goto :goto_fe

    :cond_d8
    const-string p1, "start_on_insert_sdcard is disabled"

    .line 91
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_fe

    :cond_de
    const-string p1, "android.intent.action.MEDIA_SCANNER_STARTED"

    .line 95
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_ea

    .line 96
    invoke-static {p2}, Lcom/navngo/igo/javaclient/Application;->setMediaScanning(Z)V

    goto :goto_fe

    :cond_ea
    const-string p1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    .line 97
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_fe

    .line 98
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->setMediaScanning(Z)V

    goto :goto_fe

    :cond_f6
    :goto_f6
    const-string p1, "SD card was removed. Exiting."

    .line 69
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    invoke-static {p2}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    :cond_fe
    :goto_fe
    return-void
.end method

.method public register()V
    .registers 3

    .line 28
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.MEDIA_BAD_REMOVAL"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.MEDIA_EJECT"

    .line 31
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    .line 32
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 41
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public unregister()V
    .registers 2

    .line 45
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method
