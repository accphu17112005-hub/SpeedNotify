###### Class com.navngo.igo.javaclient.receiver.CustomIntentReceiver (com.navngo.igo.javaclient.receiver.CustomIntentReceiver)
.class public abstract Lcom/navngo/igo/javaclient/receiver/CustomIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "CustomIntentReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract bringMainActivityInForeground()Z
.end method

.method protected abstract dispatchIntent(Landroid/content/Context;Landroid/content/Intent;)V
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 13
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/receiver/CustomIntentReceiver;->bringMainActivityInForeground()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 14
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->startMainActivityInForeground()V

    .line 17
    :cond_b
    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/receiver/CustomIntentReceiver;->dispatchIntent(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
