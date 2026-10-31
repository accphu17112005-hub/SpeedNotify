###### Class com.google.android.gms.common.internal.GmsClientEventManager (com.google.android.gms.common.internal.GmsClientEventManager)
.class public final Lcom/google/android/gms/common/internal/GmsClientEventManager;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;
    }
.end annotation


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private final mLock:Ljava/lang/Object;

.field private final zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

.field private final zaol:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private final zaom:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private final zaon:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile zaoo:Z

.field private final zaop:Ljava/util/concurrent/atomic/AtomicInteger;

.field private zaoq:Z


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaom:Ljava/util/ArrayList;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    .line 6
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    .line 8
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    .line 9
    iput-object p2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

    .line 10
    new-instance p2, Lcom/google/android/gms/internal/base/zal;

    invoke-direct {p2, p1, p0}, Lcom/google/android/gms/internal/base/zal;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final areCallbacksEnabled()Z
    .registers 2

    .line 116
    iget-boolean v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    return v0
.end method

.method public final disableCallbacks()V
    .registers 2

    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    return-void
.end method

.method public final enableCallbacks()V
    .registers 2

    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .registers 5

    .line 104
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2e

    .line 105
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .line 106
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 107
    :try_start_c
    iget-boolean v2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    if-eqz v2, :cond_29

    iget-object v2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

    .line 108
    invoke-interface {v2}, Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_29

    iget-object v2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    .line 109
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 110
    iget-object v2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

    invoke-interface {v2}, Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;->getConnectionHint()Landroid/os/Bundle;

    move-result-object v2

    .line 111
    invoke-interface {p1, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;->onConnected(Landroid/os/Bundle;)V

    .line 112
    :cond_29
    monitor-exit v0

    return v1

    :catchall_2b
    move-exception p1

    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_c .. :try_end_2d} :catchall_2b

    throw p1

    :cond_2e
    const-string v0, "GmsClientEvents"

    .line 114
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x2d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Don\'t know how to handle message: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    invoke-static {v0, p1, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return p1
.end method

.method public final isConnectionCallbacksRegistered(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)Z
    .registers 4

    .line 76
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 78
    :try_start_6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_e
    move-exception p1

    .line 79
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_e

    throw p1
.end method

.method public final isConnectionFailedListenerRegistered(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Z
    .registers 4

    .line 94
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 96
    :try_start_6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_e
    move-exception p1

    .line 97
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_6 .. :try_end_10} :catchall_e

    throw p1
.end method

.method public final onConnectionFailure(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 9

    .line 54
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    const-string v1, "onConnectionFailure must only be called on the Handler thread"

    .line 55
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 56
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 57
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 58
    :try_start_1e
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 59
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    .line 60
    move-object v4, v1

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    :cond_32
    :goto_32
    if-ge v2, v4, :cond_57

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v2, v2, 0x1

    check-cast v5, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    .line 61
    iget-boolean v6, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    if-eqz v6, :cond_55

    iget-object v6, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v6

    if-eq v6, v3, :cond_49

    goto :goto_55

    .line 63
    :cond_49
    iget-object v6, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 64
    invoke-interface {v5, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_32

    .line 62
    :cond_55
    :goto_55
    monitor-exit v0

    return-void

    .line 66
    :cond_57
    monitor-exit v0

    return-void

    :catchall_59
    move-exception p1

    monitor-exit v0
    :try_end_5b
    .catchall {:try_start_1e .. :try_end_5b} :catchall_59

    throw p1
.end method

.method protected final onConnectionSuccess()V
    .registers 3

    .line 17
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 18
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

    invoke-interface {v1}, Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;->getConnectionHint()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/internal/GmsClientEventManager;->onConnectionSuccess(Landroid/os/Bundle;)V

    .line 19
    monitor-exit v0

    return-void

    :catchall_e
    move-exception v1

    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v1
.end method

.method public final onConnectionSuccess(Landroid/os/Bundle;)V
    .registers 10

    .line 20
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    const-string v1, "onConnectionSuccess must only be called on the Handler thread"

    .line 21
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 23
    :try_start_19
    iget-boolean v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    if-nez v1, :cond_1f

    const/4 v1, 0x1

    goto :goto_20

    :cond_1f
    const/4 v1, 0x0

    :goto_20
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(Z)V

    .line 24
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 25
    iput-boolean v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    .line 26
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaom:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_33

    goto :goto_34

    :cond_33
    const/4 v3, 0x0

    :goto_34
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(Z)V

    .line 27
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 28
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    .line 29
    move-object v4, v1

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_4c
    :goto_4c
    if-ge v5, v4, :cond_76

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .line 30
    iget-boolean v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    if-eqz v7, :cond_76

    iget-object v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

    .line 31
    invoke-interface {v7}, Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;->isConnected()Z

    move-result v7

    if-eqz v7, :cond_76

    iget-object v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 32
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v7

    if-ne v7, v3, :cond_76

    .line 33
    iget-object v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaom:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4c

    .line 34
    invoke-interface {v6, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;->onConnected(Landroid/os/Bundle;)V

    goto :goto_4c

    .line 36
    :cond_76
    iget-object p1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaom:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 37
    iput-boolean v2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    .line 38
    monitor-exit v0

    return-void

    :catchall_7f
    move-exception p1

    monitor-exit v0
    :try_end_81
    .catchall {:try_start_19 .. :try_end_81} :catchall_7f

    throw p1
.end method

.method public final onUnintentionalDisconnection(I)V
    .registers 10

    .line 39
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    const-string v1, "onUnintentionalDisconnection must only be called on the Handler thread"

    .line 40
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 41
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 42
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 43
    :try_start_1e
    iput-boolean v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    .line 44
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 45
    iget-object v3, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    .line 46
    move-object v4, v1

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_35
    :goto_35
    if-ge v5, v4, :cond_57

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    .line 47
    iget-boolean v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoo:Z

    if-eqz v7, :cond_57

    iget-object v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaop:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v7

    if-ne v7, v3, :cond_57

    .line 48
    iget-object v7, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_35

    .line 49
    invoke-interface {v6, p1}, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;->onConnectionSuspended(I)V

    goto :goto_35

    .line 51
    :cond_57
    iget-object p1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaom:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 52
    iput-boolean v2, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    .line 53
    monitor-exit v0

    return-void

    :catchall_60
    move-exception p1

    monitor-exit v0
    :try_end_62
    .catchall {:try_start_1e .. :try_end_62} :catchall_60

    throw p1
.end method

.method public final registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .registers 7

    .line 67
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 69
    :try_start_6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    const-string v1, "GmsClientEvents"

    .line 70
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x3e

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "registerConnectionCallbacks(): listener "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " is already registered"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3d

    .line 71
    :cond_38
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    :goto_3d
    monitor-exit v0
    :try_end_3e
    .catchall {:try_start_6 .. :try_end_3e} :catchall_51

    .line 73
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaok:Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;

    invoke-interface {v0}, Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_50

    .line 74
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_50
    return-void

    :catchall_51
    move-exception p1

    .line 72
    :try_start_52
    monitor-exit v0
    :try_end_53
    .catchall {:try_start_52 .. :try_end_53} :catchall_51

    throw p1
.end method

.method public final registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 6

    .line 88
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 90
    :try_start_6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    const-string v1, "GmsClientEvents"

    .line 91
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x43

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "registerConnectionFailedListener(): listener "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is already registered"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3d

    .line 92
    :cond_38
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    :goto_3d
    monitor-exit v0

    return-void

    :catchall_3f
    move-exception p1

    monitor-exit v0
    :try_end_41
    .catchall {:try_start_6 .. :try_end_41} :catchall_3f

    throw p1
.end method

.method public final unregisterConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V
    .registers 6

    .line 80
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 82
    :try_start_6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaol:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    const-string v1, "GmsClientEvents"

    .line 84
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x34

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "unregisterConnectionCallbacks(): listener "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_41

    .line 85
    :cond_38
    iget-boolean v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaoq:Z

    if-eqz v1, :cond_41

    .line 86
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaom:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_41
    :goto_41
    monitor-exit v0

    return-void

    :catchall_43
    move-exception p1

    monitor-exit v0
    :try_end_45
    .catchall {:try_start_6 .. :try_end_45} :catchall_43

    throw p1
.end method

.method public final unregisterConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 6

    .line 98
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 100
    :try_start_6
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientEventManager;->zaon:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_37

    const-string v1, "GmsClientEvents"

    .line 102
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x39

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "unregisterConnectionFailedListener(): listener "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :cond_37
    monitor-exit v0

    return-void

    :catchall_39
    move-exception p1

    monitor-exit v0
    :try_end_3b
    .catchall {:try_start_6 .. :try_end_3b} :catchall_39

    throw p1
.end method

###### Class com.google.android.gms.common.internal.GmsClientEventManager.GmsClientEventState (com.google.android.gms.common.internal.GmsClientEventManager$GmsClientEventState)
.class public interface abstract Lcom/google/android/gms/common/internal/GmsClientEventManager$GmsClientEventState;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/GmsClientEventManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GmsClientEventState"
.end annotation


# virtual methods
.method public abstract getConnectionHint()Landroid/os/Bundle;
.end method

.method public abstract isConnected()Z
.end method
