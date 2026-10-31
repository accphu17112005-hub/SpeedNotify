###### Class com.navngo.igo.javaclient.receiver.PetzaCommandReceiver (com.navngo.igo.javaclient.receiver.PetzaCommandReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PetzaCommandReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final ACTION_PETZA_COMMAND:Ljava/lang/String; = "com.navngo.igo.javaclient.PETZA_COMMANDER"

.field public static final EXTRA_COMMAND:Ljava/lang/String; = "com.navngo.igo.javaclient.COMMAND"

.field public static final PETZA_SAVE:Ljava/lang/String; = "save"

.field public static final PETZA_START:Ljava/lang/String; = "start"

.field public static final PETZA_STOP:Ljava/lang/String; = "stop"

.field public static final PETZA_STOP_SAVE:Ljava/lang/String; = "stop-save"

.field private static final logname:Ljava/lang/String; = "PetzaCommandReceiver"

.field private static final mInstance:Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;

.field private static mIsRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mInstance:Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;

    const/4 v0, 0x0

    .line 28
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mIsRegistered:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;
    .registers 1

    .line 31
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mInstance:Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8

    const-string p1, "PetzaCommandReceiver"

    const-string v0, "PetzaCommandReceiver.onReceive()"

    .line 52
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.navngo.igo.javaclient.COMMAND"

    .line 53
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_85

    .line 54
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "start"

    .line 55
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_2e

    const-string p2, "PetzaCommandReceiver.onReceive() : calling start_petzalog()"

    .line 56
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    const-string v0, "other.igo_primo.start_petzalog"

    invoke-virtual {p1, v0, v2, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_85

    :cond_2e
    const-string v0, "stop"

    .line 58
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "other.igo_primo.stop_petzalog"

    if-eqz v0, :cond_47

    const-string p2, "PetzaCommandReceiver.onReceive() : calling stop_petzalog()"

    .line 59
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v3, v2, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_85

    :cond_47
    const-string v0, "save"

    .line 61
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v4, "other.igo_primo.save_petzalog"

    if-eqz v0, :cond_60

    const-string p2, "PetzaCommandReceiver.onReceive() : calling save_petzalog()"

    .line 62
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v4, v2, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_85

    :cond_60
    const-string v0, "stop-save"

    .line 64
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_80

    const-string p2, "PetzaCommandReceiver.onReceive() : calling stop_petzalog() and save_petzalog()"

    .line 65
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v3, v2, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    .line 67
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    invoke-virtual {p1, v4, v2, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_85

    :cond_80
    const-string p2, "PetzaCommandReceiver.onReceive() : Undefined action!"

    .line 69
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_85
    :goto_85
    return-void
.end method

.method public register()V
    .registers 4

    .line 36
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mIsRegistered:Z

    if-nez v0, :cond_13

    .line 37
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.navngo.igo.javaclient.PETZA_COMMANDER"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 38
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mIsRegistered:Z

    :cond_13
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 44
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mIsRegistered:Z

    if-eqz v0, :cond_c

    .line 45
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 46
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/PetzaCommandReceiver;->mIsRegistered:Z

    :cond_c
    return-void
.end method
