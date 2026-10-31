###### Class com.navngo.igo.javaclient.observer.ObserverBase (com.navngo.igo.javaclient.observer.ObserverBase)
.class public abstract Lcom/navngo/igo/javaclient/observer/ObserverBase;
.super Landroid/database/ContentObserver;
.source "ObserverBase.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/observer/IObserver;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/observer/ObserverBase;->onChange(Z)V

    return-void
.end method


# virtual methods
.method public abstract getContentUri()Landroid/net/Uri;
.end method

.method public onChange(Z)V
    .registers 3

    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/observer/ObserverBase;->onChange(ZLandroid/net/Uri;)V

    return-void
.end method

.method public abstract onChange(ZLandroid/net/Uri;)V
.end method

.method public registerContentObserver(Landroid/content/ContentResolver;)V
    .registers 4

    .line 19
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/observer/ObserverBase;->getContentUri()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method public unregisterContentObserver(Landroid/content/ContentResolver;)V
    .registers 2

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method
