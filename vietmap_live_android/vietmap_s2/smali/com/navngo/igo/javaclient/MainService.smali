###### Class com.navngo.igo.javaclient.MainService (com.navngo.igo.javaclient.MainService)
.class public Lcom/navngo/igo/javaclient/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# static fields
.field private static final logname:Ljava/lang/String; = "MainService"

.field public static final showNotificationKey:Ljava/lang/String; = "startForeground"


# instance fields
.field private mIsRunningForeground:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 14
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/MainService;->mIsRunningForeground:Z

    return-void
.end method

.method private showNotification(Z)V
    .registers 3

    .line 57
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/MainService;->mIsRunningForeground:Z

    if-eq v0, p1, :cond_22

    .line 58
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/MainService;->mIsRunningForeground:Z

    if-eqz p1, :cond_17

    .line 62
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    .line 63
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 62
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object p1

    const/4 v0, 0x2

    .line 65
    invoke-virtual {p0, v0, p1}, Lcom/navngo/igo/javaclient/MainService;->startForeground(ILandroid/app/Notification;)V

    goto :goto_22

    :cond_17
    const-string p1, "MainService"

    const-string v0, "stopForeground"

    .line 67
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 68
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/MainService;->stopForeground(Z)V

    :cond_22
    :goto_22
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3

    const-string p1, "MainService"

    const-string v0, "onBind"

    .line 21
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .registers 3

    const-string v0, "MainService"

    const-string v1, "onCreate"

    .line 27
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 29
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->setApplicationContext(Landroid/content/Context;)V

    .line 30
    invoke-static {p0}, Lcom/navngo/igo/javaclient/Application;->setMainService(Lcom/navngo/igo/javaclient/MainService;)V

    return-void
.end method

.method public onDestroy()V
    .registers 3

    const/4 v0, 0x0

    .line 35
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->setMainService(Lcom/navngo/igo/javaclient/MainService;)V

    const-string v0, "MainService"

    const-string v1, "onDestroy"

    .line 36
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 5

    const-string p2, "MainService"

    if-nez p1, :cond_1e

    .line 45
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onStartCommand(null, "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2d

    :cond_1e
    const-string p3, "onStartCommand"

    .line 47
    invoke-static {p2, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p2, 0x0

    const-string p3, "startForeground"

    .line 48
    invoke-virtual {p1, p3, p2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    .line 49
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/MainService;->showNotification(Z)V

    :goto_2d
    const/4 p1, 0x1

    return p1
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .registers 4

    const-string v0, "MainService"

    const-string v1, "Killed from recent apps"

    .line 79
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 80
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->blockWhileExit(Z)V

    .line 81
    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    return-void
.end method

.method public registerInterfaces()V
    .registers 1

    return-void
.end method
