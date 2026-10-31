###### Class com.navngo.igo.javaclient.receiver.DynamicIntentReceiver (com.navngo.igo.javaclient.receiver.DynamicIntentReceiver)
.class public abstract Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;
.super Lcom/navngo/igo/javaclient/receiver/CustomIntentReceiver;
.source "DynamicIntentReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# instance fields
.field private registered:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 8
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/CustomIntentReceiver;-><init>()V

    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;->registered:Z

    return-void
.end method


# virtual methods
.method protected abstract action()[Ljava/lang/String;
.end method

.method public register()V
    .registers 6

    .line 13
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;->registered:Z

    if-nez v0, :cond_21

    .line 14
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 15
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;->action()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v2, :cond_19

    aget-object v4, v1, v3

    .line 16
    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 18
    :cond_19
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;->registered:Z

    :cond_21
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 25
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;->registered:Z

    if-eqz v0, :cond_c

    .line 26
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;->registered:Z

    :cond_c
    return-void
.end method
