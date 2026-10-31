###### Class com.navngo.igo.javaclient.ebp.IntentMutingDevice (com.navngo.igo.javaclient.ebp.IntentMutingDevice)
.class public Lcom/navngo/igo/javaclient/ebp/IntentMutingDevice;
.super Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;
.source "IntentMutingDevice.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/ebp/IMutingDevice;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 67
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;-><init>()V

    .line 68
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.on_exit_pressed"

    const-string v2, "onExitPressed"

    .line 69
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method private static SendIntent(Ljava/lang/String;)V
    .registers 3

    .line 41
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 42
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 44
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->IMD_category:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_1a

    .line 46
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->IMD_category:Ljava/lang/String;

    invoke-virtual {v1, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    :cond_1a
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->IMD_component:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_2c

    .line 51
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->IMD_component:Ljava/lang/String;

    invoke-static {p0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    goto :goto_2f

    .line 56
    :cond_2c
    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :goto_2f
    return-void
.end method

.method public static onExitPressed()V
    .registers 2

    const-string v0, "IntentMutingDevice"

    const-string v1, "onExitPressed"

    .line 62
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_exit_action:Ljava/lang/String;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ebp/IntentMutingDevice;->SendIntent(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public Mute(III)V
    .registers 4

    .line 74
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Mute Intent: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Lcom/navngo/igo/javaclient/Config;->IMD_start_action:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "IntentMutingDevice"

    invoke-static {p3, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    sget-object p2, Lcom/navngo/igo/javaclient/Config;->IMD_start_action:Ljava/lang/String;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/ebp/IntentMutingDevice;->SendIntent(Ljava/lang/String;)V

    .line 76
    sget-boolean p2, Lcom/navngo/igo/javaclient/Config;->IMD_app_mute:Z

    if-eqz p2, :cond_25

    const/4 p2, 0x0

    .line 77
    invoke-virtual {p0, p2, p1}, Lcom/navngo/igo/javaclient/ebp/IntentMutingDevice;->AudiofocusChanged(II)V

    :cond_25
    return-void
.end method

.method public Unmute()V
    .registers 3

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unmute Intent: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->IMD_stop_action:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IntentMutingDevice"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->IMD_stop_action:Ljava/lang/String;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ebp/IntentMutingDevice;->SendIntent(Ljava/lang/String;)V

    .line 84
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->IMD_app_mute:Z

    if-eqz v0, :cond_26

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 85
    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/ebp/IntentMutingDevice;->AudiofocusChanged(II)V

    :cond_26
    return-void
.end method
