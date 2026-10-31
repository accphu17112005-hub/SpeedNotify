###### Class com.google.android.gms.common.api.internal.BasePendingResult (com.google.android.gms.common.api.internal.BasePendingResult)
.class public abstract Lcom/google/android/gms/common/api/internal/BasePendingResult;
.super Lcom/google/android/gms/common/api/PendingResult;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;,
        Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        ">",
        "Lcom/google/android/gms/common/api/PendingResult<",
        "TR;>;"
    }
.end annotation


# static fields
.field static final zadm:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mResultGuardian:Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;"
        }
    .end annotation
.end field

.field private mStatus:Lcom/google/android/gms/common/api/Status;

.field private zaci:Lcom/google/android/gms/common/api/Result;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field private final zadn:Ljava/lang/Object;

.field private final zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler<",
            "TR;>;"
        }
    .end annotation
.end field

.field private final zadp:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;"
        }
    .end annotation
.end field

.field private final zadq:Ljava/util/concurrent/CountDownLatch;

.field private final zadr:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/api/PendingResult$StatusListener;",
            ">;"
        }
    .end annotation
.end field

.field private zads:Lcom/google/android/gms/common/api/ResultCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/ResultCallback<",
            "-TR;>;"
        }
    .end annotation
.end field

.field private final zadt:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/google/android/gms/common/api/internal/zacs;",
            ">;"
        }
    .end annotation
.end field

.field private volatile zadu:Z

.field private zadv:Z

.field private zadw:Z

.field private zadx:Lcom/google/android/gms/common/internal/ICancelToken;

.field private volatile zady:Lcom/google/android/gms/common/api/internal/zacm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/zacm<",
            "TR;>;"
        }
    .end annotation
.end field

.field private zadz:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 183
    new-instance v0, Lcom/google/android/gms/common/api/internal/zap;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/internal/zap;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadm:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>()V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/api/PendingResult;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    .line 3
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    .line 5
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadt:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    .line 7
    new-instance v0, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadp:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Looper;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 20
    invoke-direct {p0}, Lcom/google/android/gms/common/api/PendingResult;-><init>()V

    .line 21
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    .line 22
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadt:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    .line 26
    new-instance v0, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    .line 27
    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadp:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method protected constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .registers 4

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/common/api/PendingResult;-><init>()V

    .line 11
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    .line 12
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    .line 14
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadt:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    if-eqz p1, :cond_2a

    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/GoogleApiClient;->getLooper()Landroid/os/Looper;

    move-result-object v0

    goto :goto_2e

    :cond_2a
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    .line 17
    :goto_2e
    new-instance v1, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    invoke-direct {v1, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    .line 18
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadp:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method protected constructor <init>(Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler<",
            "TR;>;)V"
        }
    .end annotation

    .line 29
    invoke-direct {p0}, Lcom/google/android/gms/common/api/PendingResult;-><init>()V

    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    .line 31
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadt:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    const-string v0, "CallbackHandler must not be null"

    .line 35
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    .line 36
    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadp:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private final get()Lcom/google/android/gms/common/api/Result;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 147
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    const/4 v2, 0x1

    if-nez v1, :cond_a

    const/4 v1, 0x1

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    const-string v3, "Result has already been consumed."

    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 148
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    const-string v3, "Result is not ready."

    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 149
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    const/4 v3, 0x0

    .line 150
    iput-object v3, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    .line 151
    iput-object v3, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    .line 152
    iput-boolean v2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    .line 153
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_31

    .line 155
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadt:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zacs;

    if-eqz v0, :cond_30

    .line 157
    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/internal/zacs;->zac(Lcom/google/android/gms/common/api/internal/BasePendingResult;)V

    :cond_30
    return-object v1

    :catchall_31
    move-exception v1

    .line 153
    :try_start_32
    monitor-exit v0
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    throw v1
.end method

.method static synthetic zaa(Lcom/google/android/gms/common/api/internal/BasePendingResult;)Lcom/google/android/gms/common/api/Result;
    .registers 1

    .line 182
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    return-object p0
.end method

.method private final zaa(Lcom/google/android/gms/common/api/Result;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 159
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    const/4 p1, 0x0

    .line 160
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadx:Lcom/google/android/gms/common/internal/ICancelToken;

    .line 161
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 162
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Result;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    .line 163
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadv:Z

    if-eqz v0, :cond_19

    .line 164
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    goto :goto_3c

    .line 165
    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    if-nez v0, :cond_2b

    .line 166
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    instance-of v0, v0, Lcom/google/android/gms/common/api/Releasable;

    if-eqz v0, :cond_3c

    .line 167
    new-instance v0, Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;-><init>(Lcom/google/android/gms/common/api/internal/BasePendingResult;Lcom/google/android/gms/common/api/internal/zap;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->mResultGuardian:Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;

    goto :goto_3c

    .line 168
    :cond_2b
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    const/4 v0, 0x2

    .line 169
    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->removeMessages(I)V

    .line 170
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->zaa(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V

    .line 171
    :cond_3c
    :goto_3c
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    move-object v0, p1

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_46
    if-ge v1, v0, :cond_56

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lcom/google/android/gms/common/api/PendingResult$StatusListener;

    .line 172
    iget-object v3, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    invoke-interface {v2, v3}, Lcom/google/android/gms/common/api/PendingResult$StatusListener;->onComplete(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_46

    .line 174
    :cond_56
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public static zab(Lcom/google/android/gms/common/api/Result;)V
    .registers 4

    .line 176
    instance-of v0, p0, Lcom/google/android/gms/common/api/Releasable;

    if-eqz v0, :cond_30

    .line 177
    :try_start_4
    move-object v0, p0

    check-cast v0, Lcom/google/android/gms/common/api/Releasable;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/Releasable;->release()V
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_a} :catch_b

    return-void

    :catch_b
    move-exception v0

    .line 180
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x12

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Unable to release "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "BasePendingResult"

    invoke-static {v1, p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_30
    return-void
.end method


# virtual methods
.method public final addStatusListener(Lcom/google/android/gms/common/api/PendingResult$StatusListener;)V
    .registers 4

    if-eqz p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    const-string v1, "Callback cannot be null."

    .line 86
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 87
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 88
    :try_start_d
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 89
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    invoke-interface {p1, v1}, Lcom/google/android/gms/common/api/PendingResult$StatusListener;->onComplete(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_1e

    .line 90
    :cond_19
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadr:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    :goto_1e
    monitor-exit v0

    return-void

    :catchall_20
    move-exception p1

    monitor-exit v0
    :try_end_22
    .catchall {:try_start_d .. :try_end_22} :catchall_20

    throw p1
.end method

.method public final await()Lcom/google/android/gms/common/api/Result;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    const-string v0, "await must not be called on the UI thread"

    .line 39
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotMainThread(Ljava/lang/String;)V

    .line 40
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Result has already been consumed"

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 41
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    if-nez v0, :cond_13

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    :goto_14
    const-string v0, "Cannot await if then() has been called."

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 42
    :try_start_19
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_19 .. :try_end_1e} :catch_1f

    goto :goto_24

    .line 45
    :catch_1f
    sget-object v0, Lcom/google/android/gms/common/api/Status;->RESULT_INTERRUPTED:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Status;)V

    .line 46
    :goto_24
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v0

    const-string v1, "Result is not ready."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 47
    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    return-object v0
.end method

.method public final await(JLjava/util/concurrent/TimeUnit;)Lcom/google/android/gms/common/api/Result;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TR;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_b

    const-string v0, "await must not be called on the UI thread when time is greater than zero."

    .line 49
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotMainThread(Ljava/lang/String;)V

    .line 50
    :cond_b
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Result has already been consumed."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 51
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    if-nez v0, :cond_19

    goto :goto_1a

    :cond_19
    const/4 v1, 0x0

    :goto_1a
    const-string v0, "Cannot await if then() has been called."

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 52
    :try_start_1f
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1

    if-nez p1, :cond_32

    .line 54
    sget-object p1, Lcom/google/android/gms/common/api/Status;->RESULT_TIMEOUT:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Status;)V
    :try_end_2c
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_2c} :catch_2d

    goto :goto_32

    .line 57
    :catch_2d
    sget-object p1, Lcom/google/android/gms/common/api/Status;->RESULT_INTERRUPTED:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Status;)V

    .line 58
    :cond_32
    :goto_32
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result p1

    const-string p2, "Result is not ready."

    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 59
    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object p1

    return-object p1
.end method

.method public cancel()V
    .registers 3

    .line 92
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 93
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadv:Z

    if-nez v1, :cond_26

    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    if-eqz v1, :cond_c

    goto :goto_26

    .line 95
    :cond_c
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadx:Lcom/google/android/gms/common/internal/ICancelToken;
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_28

    if-eqz v1, :cond_13

    .line 96
    :try_start_10
    invoke-interface {v1}, Lcom/google/android/gms/common/internal/ICancelToken;->cancel()V
    :try_end_13
    .catch Landroid/os/RemoteException; {:try_start_10 .. :try_end_13} :catch_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_28

    .line 99
    :catch_13
    :cond_13
    :try_start_13
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaci:Lcom/google/android/gms/common/api/Result;

    invoke-static {v1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Result;)V

    const/4 v1, 0x1

    .line 100
    iput-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadv:Z

    .line 101
    sget-object v1, Lcom/google/android/gms/common/api/Status;->RESULT_CANCELED:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaa(Lcom/google/android/gms/common/api/Result;)V

    .line 102
    monitor-exit v0

    return-void

    .line 94
    :cond_26
    :goto_26
    monitor-exit v0

    return-void

    :catchall_28
    move-exception v1

    .line 102
    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_13 .. :try_end_2a} :catchall_28

    throw v1
.end method

.method protected abstract createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Status;",
            ")TR;"
        }
    .end annotation
.end method

.method public isCanceled()Z
    .registers 3

    .line 109
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 110
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadv:Z

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    .line 111
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public final isReady()Z
    .registers 6

    .line 38
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadq:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_e

    const/4 v0, 0x1

    return v0

    :cond_e
    const/4 v0, 0x0

    return v0
.end method

.method protected final setCancelToken(Lcom/google/android/gms/common/internal/ICancelToken;)V
    .registers 3

    .line 141
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 142
    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadx:Lcom/google/android/gms/common/internal/ICancelToken;

    .line 143
    monitor-exit v0

    return-void

    :catchall_7
    move-exception p1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw p1
.end method

.method public final setResult(Lcom/google/android/gms/common/api/Result;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 126
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadw:Z

    if-nez v1, :cond_2e

    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadv:Z

    if-nez v1, :cond_2e

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    .line 129
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_18

    const/4 v1, 0x1

    goto :goto_19

    :cond_18
    const/4 v1, 0x0

    :goto_19
    const-string v4, "Results have already been set"

    invoke-static {v1, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 130
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    if-nez v1, :cond_23

    goto :goto_24

    :cond_23
    const/4 v2, 0x0

    :goto_24
    const-string v1, "Result has already been consumed"

    invoke-static {v2, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 131
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaa(Lcom/google/android/gms/common/api/Result;)V

    .line 132
    monitor-exit v0

    return-void

    .line 127
    :cond_2e
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Result;)V

    .line 128
    monitor-exit v0

    return-void

    :catchall_33
    move-exception p1

    .line 132
    monitor-exit v0
    :try_end_35
    .catchall {:try_start_3 .. :try_end_35} :catchall_33

    throw p1
.end method

.method public final setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/ResultCallback<",
            "-TR;>;)V"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    if-nez p1, :cond_a

    const/4 p1, 0x0

    .line 62
    :try_start_6
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    .line 63
    monitor-exit v0

    return-void

    .line 64
    :cond_a
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    :goto_13
    const-string v4, "Result has already been consumed."

    invoke-static {v1, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 65
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    if-nez v1, :cond_1d

    goto :goto_1e

    :cond_1d
    const/4 v2, 0x0

    :goto_1e
    const-string v1, "Cannot set callbacks if then() has been called."

    invoke-static {v2, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 66
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/PendingResult;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 67
    monitor-exit v0

    return-void

    .line 68
    :cond_2b
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 69
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->zaa(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V

    goto :goto_3d

    .line 70
    :cond_3b
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    .line 71
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

.method public final setResultCallback(Lcom/google/android/gms/common/api/ResultCallback;JLjava/util/concurrent/TimeUnit;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/ResultCallback<",
            "-TR;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    if-nez p1, :cond_a

    const/4 p1, 0x0

    .line 74
    :try_start_6
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    .line 75
    monitor-exit v0

    return-void

    .line 76
    :cond_a
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    :goto_13
    const-string v4, "Result has already been consumed."

    invoke-static {v1, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 77
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    if-nez v1, :cond_1d

    goto :goto_1e

    :cond_1d
    const/4 v2, 0x0

    :goto_1e
    const-string v1, "Cannot set callbacks if then() has been called."

    invoke-static {v2, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 78
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/PendingResult;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 79
    monitor-exit v0

    return-void

    .line 80
    :cond_2b
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 81
    iget-object p2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object p3

    invoke-virtual {p2, p1, p3}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->zaa(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V

    goto :goto_4b

    .line 82
    :cond_3b
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    .line 83
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    invoke-virtual {p4, p2, p3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p2

    const/4 p4, 0x2

    .line 84
    invoke-virtual {p1, p4, p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p4

    invoke-virtual {p1, p4, p2, p3}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 85
    :goto_4b
    monitor-exit v0

    return-void

    :catchall_4d
    move-exception p1

    monitor-exit v0
    :try_end_4f
    .catchall {:try_start_6 .. :try_end_4f} :catchall_4d

    throw p1
.end method

.method public then(Lcom/google/android/gms/common/api/ResultTransform;)Lcom/google/android/gms/common/api/TransformedResult;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S::",
            "Lcom/google/android/gms/common/api/Result;",
            ">(",
            "Lcom/google/android/gms/common/api/ResultTransform<",
            "-TR;+TS;>;)",
            "Lcom/google/android/gms/common/api/TransformedResult<",
            "TS;>;"
        }
    .end annotation

    .line 112
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadu:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Result has already been consumed."

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 113
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 114
    :try_start_c
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    const/4 v3, 0x0

    if-nez v2, :cond_13

    const/4 v2, 0x1

    goto :goto_14

    :cond_13
    const/4 v2, 0x0

    :goto_14
    const-string v4, "Cannot call then() twice."

    invoke-static {v2, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 115
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    if-nez v2, :cond_1f

    const/4 v2, 0x1

    goto :goto_20

    :cond_1f
    const/4 v2, 0x0

    :goto_20
    const-string v4, "Cannot call then() if callbacks are set."

    invoke-static {v2, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 116
    iget-boolean v2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadv:Z

    if-nez v2, :cond_2a

    const/4 v3, 0x1

    :cond_2a
    const-string v2, "Cannot call then() if result was canceled."

    invoke-static {v3, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 117
    iput-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    .line 118
    new-instance v1, Lcom/google/android/gms/common/api/internal/zacm;

    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadp:Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/api/internal/zacm;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    .line 119
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/common/api/TransformedResult;->then(Lcom/google/android/gms/common/api/ResultTransform;)Lcom/google/android/gms/common/api/TransformedResult;

    move-result-object p1

    .line 120
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    if-eqz v1, :cond_52

    .line 121
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zado:Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;

    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->get()Lcom/google/android/gms/common/api/Result;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->zaa(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V

    goto :goto_56

    .line 122
    :cond_52
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zady:Lcom/google/android/gms/common/api/internal/zacm;

    iput-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zads:Lcom/google/android/gms/common/api/ResultCallback;

    .line 123
    :goto_56
    monitor-exit v0

    return-object p1

    :catchall_58
    move-exception p1

    .line 124
    monitor-exit v0
    :try_end_5a
    .catchall {:try_start_c .. :try_end_5a} :catchall_58

    throw p1
.end method

.method public final zaa(Lcom/google/android/gms/common/api/internal/zacs;)V
    .registers 3

    .line 138
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadt:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public final zab(Lcom/google/android/gms/common/api/Status;)V
    .registers 4

    .line 133
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 134
    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->isReady()Z

    move-result v1

    if-nez v1, :cond_13

    .line 135
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->setResult(Lcom/google/android/gms/common/api/Result;)V

    const/4 p1, 0x1

    .line 136
    iput-boolean p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadw:Z

    .line 137
    :cond_13
    monitor-exit v0

    return-void

    :catchall_15
    move-exception p1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw p1
.end method

.method public final zam()Ljava/lang/Integer;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public final zat()Z
    .registers 3

    .line 103
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadn:Ljava/lang/Object;

    monitor-enter v0

    .line 104
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadp:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v1, :cond_11

    .line 105
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    if-nez v1, :cond_14

    .line 106
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/PendingResult;->cancel()V

    .line 107
    :cond_14
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/PendingResult;->isCanceled()Z

    move-result v1

    monitor-exit v0

    return v1

    :catchall_1a
    move-exception v1

    .line 108
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_1a

    throw v1
.end method

.method public final zau()V
    .registers 2

    .line 144
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    if-nez v0, :cond_15

    sget-object v0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadm:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_13

    goto :goto_15

    :cond_13
    const/4 v0, 0x0

    goto :goto_16

    :cond_15
    :goto_15
    const/4 v0, 0x1

    :goto_16
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zadz:Z

    return-void
.end method

###### Class com.google.android.gms.common.api.internal.BasePendingResult.CallbackHandler (com.google.android.gms.common.api.internal.BasePendingResult$CallbackHandler)
.class public Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;
.super Lcom/google/android/gms/internal/base/zal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/internal/BasePendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CallbackHandler"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        ">",
        "Lcom/google/android/gms/internal/base/zal;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .registers 2

    .line 3
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/base/zal;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4

    .line 7
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_32

    const/4 v1, 0x2

    if-eq v0, v1, :cond_28

    .line 18
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x2d

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Don\'t know how to handle message: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    const-string v1, "BasePendingResult"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    .line 15
    :cond_28
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/api/internal/BasePendingResult;

    .line 16
    sget-object v0, Lcom/google/android/gms/common/api/Status;->RESULT_TIMEOUT:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Status;)V

    return-void

    .line 8
    :cond_32
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/util/Pair;

    .line 9
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/common/api/ResultCallback;

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/api/Result;

    .line 10
    :try_start_3e
    invoke-interface {v0, p1}, Lcom/google/android/gms/common/api/ResultCallback;->onResult(Lcom/google/android/gms/common/api/Result;)V
    :try_end_41
    .catch Ljava/lang/RuntimeException; {:try_start_3e .. :try_end_41} :catch_42

    return-void

    :catch_42
    move-exception v0

    .line 13
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Result;)V

    .line 14
    throw v0
.end method

.method public final zaa(Lcom/google/android/gms/common/api/ResultCallback;Lcom/google/android/gms/common/api/Result;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/ResultCallback<",
            "-TR;>;TR;)V"
        }
    .end annotation

    .line 5
    new-instance v0, Landroid/util/Pair;

    invoke-direct {v0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult$CallbackHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

###### Class com.google.android.gms.common.api.internal.BasePendingResult.zaa (com.google.android.gms.common.api.internal.BasePendingResult$zaa)
.class final Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/internal/BasePendingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "zaa"
.end annotation


# instance fields
.field private final synthetic zaea:Lcom/google/android/gms/common/api/internal/BasePendingResult;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/internal/BasePendingResult;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;->zaea:Lcom/google/android/gms/common/api/internal/BasePendingResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/api/internal/BasePendingResult;Lcom/google/android/gms/common/api/internal/zap;)V
    .registers 3

    .line 5
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;-><init>(Lcom/google/android/gms/common/api/internal/BasePendingResult;)V

    return-void
.end method


# virtual methods
.method protected final finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/BasePendingResult$zaa;->zaea:Lcom/google/android/gms/common/api/internal/BasePendingResult;

    invoke-static {v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zaa(Lcom/google/android/gms/common/api/internal/BasePendingResult;)Lcom/google/android/gms/common/api/Result;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->zab(Lcom/google/android/gms/common/api/Result;)V

    .line 3
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method
