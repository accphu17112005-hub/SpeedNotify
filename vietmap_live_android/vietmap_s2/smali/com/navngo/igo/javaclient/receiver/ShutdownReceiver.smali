###### Class com.navngo.igo.javaclient.receiver.ShutdownReceiver (com.navngo.igo.javaclient.receiver.ShutdownReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ShutdownReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final SelfInitiatedShutdown:Ljava/lang/String; = "com.navngo.igo.javaclient.receiver.ShutdownReceiver.SELF_INITIATED_SHUTDOWN"

.field private static final mAction:Ljava/lang/String; = "android.intent.action.ACTION_SHUTDOWN"

.field private static mRegistered:Z = false


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 19
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.ACTION_SHUTDOWN"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.navngo.igo.javaclient.receiver.ShutdownReceiver.SELF_INITIATED_SHUTDOWN"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    return-void

    :cond_19
    const/4 p1, 0x1

    .line 21
    invoke-static {p1}, Lcom/navngo/igo/javaclient/Application;->blockWhileExit(Z)V

    return-void
.end method

.method public register()V
    .registers 3

    .line 27
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;->mRegistered:Z

    if-nez v0, :cond_18

    .line 29
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.ACTION_SHUTDOWN"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "com.navngo.igo.javaclient.receiver.ShutdownReceiver.SELF_INITIATED_SHUTDOWN"

    .line 30
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 31
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 32
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;->mRegistered:Z

    :cond_18
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 39
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;->mRegistered:Z

    if-eqz v0, :cond_c

    .line 41
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 42
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;->mRegistered:Z

    :cond_c
    return-void
.end method
