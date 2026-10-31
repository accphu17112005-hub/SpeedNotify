###### Class com.navngo.igo.javaclient.HudInitialiser (com.navngo.igo.javaclient.HudInitialiser)
.class public Lcom/navngo/igo/javaclient/HudInitialiser;
.super Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;
.source "HudInitialiser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method protected action()[Ljava/lang/String;
    .registers 2

    const-string v0, "com.vietmap.hud.HUD_INITIALIZED"

    .line 12
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bringMainActivityInForeground()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method protected dispatchIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    .line 19
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    const-string v1, "{\"type\":\"guidance_provider\", \"command\":\"get_update\"}"

    aput-object v1, p2, v0

    const-string v0, "android.on_message_received"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method
