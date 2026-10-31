###### Class com.navngo.igo.javaclient.intentprocessers.BackgroundStartProcesser (com.navngo.igo.javaclient.intentprocessers.BackgroundStartProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/BackgroundStartProcesser;
.super Ljava/lang/Object;
.source "BackgroundStartProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# static fields
.field private static final logname:Ljava/lang/String; = "BackgroundStartProcesser"


# instance fields
.field private mHandled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/BackgroundStartProcesser;->mHandled:Z

    return-void
.end method


# virtual methods
.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 4

    const-string v0, "isBootOnBackground"

    const/4 v1, 0x0

    .line 17
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 3

    .line 23
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/BackgroundStartProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_17

    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/intentprocessers/BackgroundStartProcesser;->mHandled:Z

    if-nez p1, :cond_17

    .line 25
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    if-eqz p1, :cond_17

    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->moveTaskToBack(Z)Z

    .line 28
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/intentprocessers/BackgroundStartProcesser;->mHandled:Z

    return v0

    :cond_17
    const/4 p1, 0x0

    return p1
.end method
