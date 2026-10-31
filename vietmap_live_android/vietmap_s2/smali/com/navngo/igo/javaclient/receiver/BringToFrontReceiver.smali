###### Class com.navngo.igo.javaclient.receiver.BringToFrontReceiver (com.navngo.igo.javaclient.receiver.BringToFrontReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BringToFrontReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final BROADCAST_INTENT_ACTION:Ljava/lang/String; = "com.nng.BRING_TO_FRONT"

.field public static final BROADCAST_INTENT_CATEGORY:Ljava/lang/String; = "android.intent.category.DEFAULT"

.field public static final RESULT_HANDLED:I = 0x1

.field public static final RESULT_NOT_HANDLED:I

.field private static final mIntentfilter:Landroid/content/IntentFilter;


# instance fields
.field private mRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 28
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mIntentfilter:Landroid/content/IntentFilter;

    const-string v1, "com.nng.BRING_TO_FRONT"

    .line 29
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.category.DEFAULT"

    .line 30
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 18
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 v0, 0x0

    .line 76
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mRegistered:Z

    return-void
.end method

.method private getIntentFilter()Landroid/content/IntentFilter;
    .registers 2

    .line 34
    sget-object v0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mIntentfilter:Landroid/content/IntentFilter;

    return-object v0
.end method

.method private isRunning()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    .line 44
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object p1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/IntentFilter;->matchAction(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_f

    return-void

    .line 47
    :cond_f
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->isRunning()Z

    move-result p1

    if-nez p1, :cond_16

    return-void

    .line 50
    :cond_16
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->isOrderedBroadcast()Z

    move-result p1

    if-eqz p1, :cond_20

    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->setResultCode(I)V

    .line 54
    :cond_20
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->startMainActivityInForeground()V

    return-void
.end method

.method public register()V
    .registers 3

    .line 60
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mRegistered:Z

    if-nez v0, :cond_10

    .line 62
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->getIntentFilter()Landroid/content/IntentFilter;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mRegistered:Z

    :cond_10
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 70
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mRegistered:Z

    if-eqz v0, :cond_c

    .line 72
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 73
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/BringToFrontReceiver;->mRegistered:Z

    :cond_c
    return-void
.end method
