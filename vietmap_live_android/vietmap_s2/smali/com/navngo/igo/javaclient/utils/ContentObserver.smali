###### Class com.navngo.igo.javaclient.utils.ContentObserver (com.navngo.igo.javaclient.utils.ContentObserver)
.class public abstract Lcom/navngo/igo/javaclient/utils/ContentObserver;
.super Landroid/database/ContentObserver;
.source "ContentObserver.java"


# instance fields
.field private content_resolver:Landroid/content/ContentResolver;

.field private content_uri:Landroid/net/Uri;

.field private registered:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;)V
    .registers 4

    .line 16
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->content_resolver:Landroid/content/ContentResolver;

    .line 18
    iput-object p3, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->content_uri:Landroid/net/Uri;

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->registered:Z

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public onChange(Z)V
    .registers 3

    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/utils/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    return-void
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .registers 3

    return-void
.end method

.method public declared-synchronized register()V
    .registers 4

    monitor-enter p0

    .line 23
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->registered:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_14

    if-eqz v0, :cond_7

    .line 24
    monitor-exit p0

    return-void

    .line 25
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->content_resolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->content_uri:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->registered:Z
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_14

    .line 27
    monitor-exit p0

    return-void

    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unregister()V
    .registers 2

    monitor-enter p0

    .line 30
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->registered:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_11

    if-nez v0, :cond_7

    .line 31
    monitor-exit p0

    return-void

    .line 32
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->content_resolver:Landroid/content/ContentResolver;

    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/ContentObserver;->registered:Z
    :try_end_f
    .catchall {:try_start_7 .. :try_end_f} :catchall_11

    .line 34
    monitor-exit p0

    return-void

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method
