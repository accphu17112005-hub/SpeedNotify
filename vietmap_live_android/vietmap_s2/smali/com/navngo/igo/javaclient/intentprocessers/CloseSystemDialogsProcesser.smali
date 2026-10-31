###### Class com.navngo.igo.javaclient.intentprocessers.CloseSystemDialogsProcesser (com.navngo.igo.javaclient.intentprocessers.CloseSystemDialogsProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;
.super Landroid/content/BroadcastReceiver;
.source "CloseSystemDialogsProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field private static final TAG:Ljava/lang/String; = "CloseSystemDialogsProcesser"

.field public static final instance:Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;


# instance fields
.field private mRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 22
    new-instance v0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;->instance:Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .line 26
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;->mRegistered:Z

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    .line 52
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const-string v0, "CloseSystemDialogsProcesser"

    if-eqz p1, :cond_2f

    .line 54
    sget-object p1, Lcom/navngo/igo/javaclient/IgoActivity;->EXTRA_IS_INTERNAL_EVENT:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_29

    const-string p1, "Handling android.intent.action.CLOSE_SYSTEM_DIALOGS"

    .line 55
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const/4 p2, 0x0

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "sc_longBack"

    .line 58
    invoke-virtual {p1, v1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_43

    :cond_29
    const-string p1, "Ignoring internal android.intent.action.CLOSE_SYSTEM_DIALOGS"

    .line 60
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_43

    .line 64
    :cond_2f
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unhandled intent: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_43
    return-void
.end method

.method public register()V
    .registers 3

    .line 31
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;->mRegistered:Z

    if-nez v0, :cond_1a

    const-string v0, "CloseSystemDialogsProcesser"

    const-string v1, "registering broadcast receiver"

    .line 32
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 35
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;->mRegistered:Z

    :cond_1a
    return-void
.end method

.method public unregister()V
    .registers 3

    .line 42
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;->mRegistered:Z

    if-eqz v0, :cond_13

    const-string v0, "CloseSystemDialogsProcesser"

    const-string v1, "unregistering broadcast receiver"

    .line 43
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 46
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/CloseSystemDialogsProcesser;->mRegistered:Z

    :cond_13
    return-void
.end method
