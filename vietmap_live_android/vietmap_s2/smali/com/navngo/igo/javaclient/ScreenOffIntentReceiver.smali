###### Class com.navngo.igo.javaclient.ScreenOffIntentReceiver (com.navngo.igo.javaclient.ScreenOffIntentReceiver)
.class public Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ScreenOffIntentReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final instance:Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;

.field private static final intentFilter:Landroid/content/IntentFilter;

.field private static isRegistered:Z = false

.field private static final logname:Ljava/lang/String; = "ScreenOffIntentReceiver"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 18
    new-instance v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->instance:Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;

    const/4 v0, 0x0

    .line 20
    sput-boolean v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->isRegistered:Z

    .line 23
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->intentFilter:Landroid/content/IntentFilter;

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

    .line 43
    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ScreenOffIntentReceiver"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "android.intent.action.SCREEN_OFF"

    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    const-string p1, "Exiting..."

    .line 46
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 47
    invoke-static {p1}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    :cond_1e
    return-void
.end method

.method public register()V
    .registers 3

    .line 27
    sget-boolean v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->isRegistered:Z

    if-nez v0, :cond_15

    const-string v0, "ScreenOffIntentReceiver"

    const-string v1, "Registering ScreenOffIntentReceiver"

    .line 28
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget-object v1, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->intentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 30
    sput-boolean v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->isRegistered:Z

    :cond_15
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 35
    sget-boolean v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->isRegistered:Z

    if-eqz v0, :cond_c

    .line 36
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 37
    sput-boolean v0, Lcom/navngo/igo/javaclient/ScreenOffIntentReceiver;->isRegistered:Z

    :cond_c
    return-void
.end method
