###### Class com.navngo.igo.javaclient.BatteryStatusReceiver (com.navngo.igo.javaclient.BatteryStatusReceiver)
.class public Lcom/navngo/igo/javaclient/BatteryStatusReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BatteryStatusReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final INSTANCE:Lcom/navngo/igo/javaclient/BatteryStatusReceiver;

.field private static final logname:Ljava/lang/String; = "PowerConnectionReceiver"

.field private static registered:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 44
    new-instance v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->INSTANCE:Lcom/navngo/igo/javaclient/BatteryStatusReceiver;

    const/4 v0, 0x0

    .line 45
    sput-boolean v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->registered:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 11

    .line 25
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "PowerConnectionReceiver"

    .line 26
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "status"

    const/4 v0, 0x1

    .line 28
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq p1, v1, :cond_1a

    const/4 v3, 0x5

    if-ne p1, v3, :cond_18

    goto :goto_1a

    :cond_18
    const/4 p1, 0x0

    goto :goto_1b

    :cond_1a
    :goto_1a
    const/4 p1, 0x1

    :goto_1b
    const-string v3, "plugged"

    const/4 v4, -0x1

    .line 31
    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_26

    const/4 v5, 0x1

    goto :goto_27

    :cond_26
    const/4 v5, 0x0

    :goto_27
    if-ne v3, v0, :cond_2b

    const/4 v3, 0x1

    goto :goto_2c

    :cond_2b
    const/4 v3, 0x0

    :goto_2c
    const-string v6, "level"

    .line 35
    invoke-virtual {p2, v6, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "scale"

    .line 36
    invoke-virtual {p2, v7, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    mul-int/lit8 v6, v6, 0x64

    .line 38
    div-int/2addr v6, p2

    .line 40
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p2

    const/4 v4, 0x0

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    .line 41
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v7, v2

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v7, v0

    if-nez v5, :cond_55

    if-eqz v3, :cond_54

    goto :goto_55

    :cond_54
    const/4 v0, 0x0

    :cond_55
    :goto_55
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v7, v1

    const-string p1, "android.battery_status_changed"

    invoke-virtual {p2, p1, v4, v7}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public register()V
    .registers 4

    .line 49
    sget-boolean v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->registered:Z

    if-nez v0, :cond_13

    .line 51
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 52
    sput-boolean v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->registered:Z

    :cond_13
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 58
    sget-boolean v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->registered:Z

    if-eqz v0, :cond_c

    .line 60
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 61
    sput-boolean v0, Lcom/navngo/igo/javaclient/BatteryStatusReceiver;->registered:Z

    :cond_c
    return-void
.end method
