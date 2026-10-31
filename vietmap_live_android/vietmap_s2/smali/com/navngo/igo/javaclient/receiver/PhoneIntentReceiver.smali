###### Class com.navngo.igo.javaclient.receiver.PhoneIntentReceiver (com.navngo.igo.javaclient.receiver.PhoneIntentReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PhoneIntentReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final instance:Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;

.field private static final intentfilter:Landroid/content/IntentFilter;

.field private static final logname:Ljava/lang/String; = "PhoneIntentReceiver"

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 88
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PHONE_STATE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->intentfilter:Landroid/content/IntentFilter;

    .line 89
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->instance:Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;

    const/4 v0, 0x0

    .line 90
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->registered:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static getState()Ljava/lang/String;
    .registers 4

    .line 62
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v1, "IDLE"

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_15

    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    const-string v2, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    return-object v1

    .line 67
    :cond_15
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "phone"

    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_2a

    const/4 v0, 0x0

    const-string v2, "PhoneIntentReceiver"

    const-string v3, "There is no TelephonyManager"

    .line 69
    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3a

    .line 72
    :cond_2a
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_38

    const/4 v2, 0x2

    if-eq v0, v2, :cond_35

    goto :goto_3a

    :cond_35
    const-string v1, "OFFHOOK"

    goto :goto_3a

    :cond_38
    const-string v1, "RINGING"

    :goto_3a
    return-object v1
.end method

.method private getState(Landroid/content/Intent;)Ljava/lang/String;
    .registers 3

    .line 54
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_8

    const/4 p1, 0x0

    goto :goto_12

    :cond_8
    const-string v0, "state"

    .line 56
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_12

    const-string p1, "null"

    :cond_12
    :goto_12
    return-object p1
.end method

.method public static processState(Ljava/lang/String;)V
    .registers 2

    .line 48
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->setPhoneState(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onReceive: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "PhoneIntentReceiver"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->getState(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_20

    .line 43
    invoke-static {}, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->getState()Ljava/lang/String;

    move-result-object p1

    .line 44
    :cond_20
    invoke-static {p1}, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->processState(Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized register()V
    .registers 3

    monitor-enter p0

    .line 93
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->registered:Z

    if-nez v0, :cond_f

    .line 94
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget-object v1, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->intentfilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 95
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->registered:Z
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 97
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

    .line 100
    :try_start_1
    sget-boolean v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->registered:Z

    if-eqz v0, :cond_d

    .line 101
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 102
    sput-boolean v0, Lcom/navngo/igo/javaclient/receiver/PhoneIntentReceiver;->registered:Z
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 104
    :cond_d
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method
