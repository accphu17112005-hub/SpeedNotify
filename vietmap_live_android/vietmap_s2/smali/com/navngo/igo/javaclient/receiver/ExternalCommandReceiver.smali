###### Class com.navngo.igo.javaclient.receiver.ExternalCommandReceiver (com.navngo.igo.javaclient.receiver.ExternalCommandReceiver)
.class public Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;
.super Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;
.source "ExternalCommandReceiver.java"


# static fields
.field private static final logname:Ljava/lang/String; = "ExternalCommandReceiver"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method protected action()[Ljava/lang/String;
    .registers 2

    const-string v0, "com.nng.igo.EXTERNAL_COMMAND"

    .line 17
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
    .registers 6

    const-string p1, "command"

    .line 23
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_20

    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-nez p2, :cond_f

    goto :goto_20

    .line 27
    :cond_f
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "android.on_message_received"

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_27

    :cond_20
    :goto_20
    const-string p1, "ExternalCommandReceiver"

    const-string p2, "Command ignored due to insufficient extra"

    .line 25
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_27
    return-void
.end method
