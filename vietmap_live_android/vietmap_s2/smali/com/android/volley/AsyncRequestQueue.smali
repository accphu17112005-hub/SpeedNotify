###### Class com.android.volley.AsyncRequestQueue (com.android.volley.AsyncRequestQueue)
.class public Lcom/android/volley/AsyncRequestQueue;
.super Lcom/android/volley/RequestQueue;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/AsyncRequestQueue$ThrowingCache;,
        Lcom/android/volley/AsyncRequestQueue$Builder;,
        Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;,
        Lcom/android/volley/AsyncRequestQueue$CachePutTask;,
        Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;,
        Lcom/android/volley/AsyncRequestQueue$NetworkTask;,
        Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;,
        Lcom/android/volley/AsyncRequestQueue$CacheParseTask;,
        Lcom/android/volley/AsyncRequestQueue$CacheTask;
    }
.end annotation


# static fields
.field private static final DEFAULT_BLOCKING_THREAD_POOL_SIZE:I = 0x4


# instance fields
.field private final mAsyncCache:Lcom/android/volley/AsyncCache;

.field private mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mCacheInitializationLock:Ljava/lang/Object;

.field private mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

.field private volatile mIsCacheInitialized:Z

.field private final mNetwork:Lcom/android/volley/AsyncNetwork;

.field private mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

.field private mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

.field private final mRequestsAwaitingCacheInitialization:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;


# direct methods
.method private constructor <init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;)V
    .registers 7

    const/4 v0, 0x0

    .line 118
    invoke-direct {p0, p1, p2, v0, p4}, Lcom/android/volley/RequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/Network;ILcom/android/volley/ResponseDelivery;)V

    .line 87
    new-instance p1, Lcom/android/volley/WaitingRequestManager;

    invoke-direct {p1, p0}, Lcom/android/volley/WaitingRequestManager;-><init>(Lcom/android/volley/RequestQueue;)V

    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    .line 95
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    .line 97
    iput-boolean v0, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    new-array p1, v0, [Ljava/lang/Object;

    .line 98
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue;->mCacheInitializationLock:Ljava/lang/Object;

    .line 119
    iput-object p3, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    .line 120
    iput-object p2, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    .line 121
    iput-object p5, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;Lcom/android/volley/AsyncRequestQueue$1;)V
    .registers 7

    .line 50
    invoke-direct/range {p0 .. p5}, Lcom/android/volley/AsyncRequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/AsyncRequestQueue;)V
    .registers 1

    .line 50
    invoke-direct {p0}, Lcom/android/volley/AsyncRequestQueue;->onCacheInitializationComplete()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;
    .registers 1

    .line 50
    iget-object p0, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 50
    iget-object p0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V
    .registers 3

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/android/volley/AsyncRequestQueue;->handleEntry(Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/WaitingRequestManager;
    .registers 1

    .line 50
    iget-object p0, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 50
    iget-object p0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static synthetic access$600(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncNetwork;
    .registers 1

    .line 50
    iget-object p0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    return-object p0
.end method

.method static synthetic access$700(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V
    .registers 4

    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/android/volley/AsyncRequestQueue;->finishRequest(Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V

    return-void
.end method

.method private finishRequest(Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/Response<",
            "*>;Z)V"
        }
    .end annotation

    if-eqz p3, :cond_7

    const-string p3, "network-cache-written"

    .line 481
    invoke-virtual {p1, p3}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 484
    :cond_7
    invoke-virtual {p1}, Lcom/android/volley/Request;->markDelivered()V

    .line 485
    invoke-virtual {p0}, Lcom/android/volley/AsyncRequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object p3

    invoke-interface {p3, p1, p2}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    .line 486
    invoke-virtual {p1, p2}, Lcom/android/volley/Request;->notifyListenerResponseReceived(Lcom/android/volley/Response;)V

    return-void
.end method

.method private static getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/PriorityBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .line 512
    new-instance v0, Ljava/util/concurrent/PriorityBlockingQueue;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$3;

    invoke-direct {v1}, Lcom/android/volley/AsyncRequestQueue$3;-><init>()V

    const/16 v2, 0xb

    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/PriorityBlockingQueue;-><init>(ILjava/util/Comparator;)V

    return-object v0
.end method

.method private handleEntry(Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Cache$Entry;",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    if-nez p1, :cond_13

    const-string p1, "cache-miss"

    .line 268
    invoke-virtual {p2, p1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 270
    iget-object p1, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {p1, p2}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result p1

    if-nez p1, :cond_12

    .line 271
    invoke-virtual {p0, p2}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    :cond_12
    return-void

    .line 280
    :cond_13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 283
    invoke-virtual {p1, v4, v5}, Lcom/android/volley/Cache$Entry;->isExpired(J)Z

    move-result v0

    if-eqz v0, :cond_31

    const-string v0, "cache-hit-expired"

    .line 284
    invoke-virtual {p2, v0}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 285
    invoke-virtual {p2, p1}, Lcom/android/volley/Request;->setCacheEntry(Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Request;

    .line 286
    iget-object p1, p0, Lcom/android/volley/AsyncRequestQueue;->mWaitingRequestManager:Lcom/android/volley/WaitingRequestManager;

    invoke-virtual {p1, p2}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result p1

    if-nez p1, :cond_30

    .line 287
    invoke-virtual {p0, p2}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    :cond_30
    return-void

    .line 293
    :cond_31
    iget-object v6, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Cache$Entry;J)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private onCacheInitializationComplete()V
    .registers 4

    .line 215
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mCacheInitializationLock:Ljava/lang/Object;

    monitor-enter v0

    .line 216
    :try_start_3
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 217
    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    const/4 v2, 0x1

    .line 218
    iput-boolean v2, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    .line 219
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_28

    .line 222
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/volley/Request;

    .line 223
    invoke-virtual {p0, v1}, Lcom/android/volley/AsyncRequestQueue;->beginRequest(Lcom/android/volley/Request;)V

    goto :goto_17

    :cond_27
    return-void

    :catchall_28
    move-exception v1

    .line 219
    :try_start_29
    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_28

    throw v1
.end method


# virtual methods
.method beginRequest(Lcom/android/volley/Request;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 192
    iget-boolean v0, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    if-nez v0, :cond_17

    .line 193
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mCacheInitializationLock:Ljava/lang/Object;

    monitor-enter v0

    .line 194
    :try_start_7
    iget-boolean v1, p0, Lcom/android/volley/AsyncRequestQueue;->mIsCacheInitialized:Z

    if-nez v1, :cond_12

    .line 195
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mRequestsAwaitingCacheInitialization:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    monitor-exit v0

    return-void

    .line 198
    :cond_12
    monitor-exit v0

    goto :goto_17

    :catchall_14
    move-exception p1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_14

    throw p1

    .line 202
    :cond_17
    :goto_17
    invoke-virtual {p1}, Lcom/android/volley/Request;->shouldCache()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 203
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    if-eqz v0, :cond_2c

    .line 204
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$CacheTask;

    invoke-direct {v1, p0, p1}, Lcom/android/volley/AsyncRequestQueue$CacheTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_3a

    .line 206
    :cond_2c
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$CacheTask;

    invoke-direct {v1, p0, p1}, Lcom/android/volley/AsyncRequestQueue$CacheTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_3a

    .line 209
    :cond_37
    invoke-virtual {p0, p1}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    :goto_3a
    return-void
.end method

.method sendRequestOverNetwork(Lcom/android/volley/Request;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    invoke-direct {v1, p0, p1}, Lcom/android/volley/AsyncRequestQueue$NetworkTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public start()V
    .registers 3

    .line 127
    invoke-virtual {p0}, Lcom/android/volley/AsyncRequestQueue;->stop()V

    .line 130
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    invoke-static {}, Lcom/android/volley/AsyncRequestQueue;->getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;->createNonBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 131
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    invoke-static {}, Lcom/android/volley/AsyncRequestQueue;->getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;->createBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 132
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    invoke-virtual {v0}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;->createNonBlockingScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 133
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncNetwork;->setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 134
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncNetwork;->setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 135
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncNetwork;->setNonBlockingScheduledExecutor(Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 138
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mAsyncCache:Lcom/android/volley/AsyncCache;

    if-eqz v0, :cond_47

    .line 139
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$1;

    invoke-direct {v1, p0}, Lcom/android/volley/AsyncRequestQueue$1;-><init>(Lcom/android/volley/AsyncRequestQueue;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_51

    .line 153
    :cond_47
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$2;

    invoke-direct {v1, p0}, Lcom/android/volley/AsyncRequestQueue$2;-><init>(Lcom/android/volley/AsyncRequestQueue;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :goto_51
    return-void
.end method

.method public stop()V
    .registers 3

    .line 173
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    .line 174
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 175
    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 177
    :cond_a
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    if-eqz v0, :cond_13

    .line 178
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 179
    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    .line 181
    :cond_13
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_1c

    .line 182
    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    .line 183
    iput-object v1, p0, Lcom/android/volley/AsyncRequestQueue;->mNonBlockingScheduledExecutor:Ljava/util/concurrent/ScheduledExecutorService;

    :cond_1c
    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.AnonymousClass1 (com.android.volley.AsyncRequestQueue$1)
.class Lcom/android/volley/AsyncRequestQueue$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;)V
    .registers 2

    .line 140
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$1;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 143
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$1;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;

    move-result-object v0

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$1$1;

    invoke-direct {v1, p0}, Lcom/android/volley/AsyncRequestQueue$1$1;-><init>(Lcom/android/volley/AsyncRequestQueue$1;)V

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncCache;->initialize(Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.AnonymousClass1.C00041 (com.android.volley.AsyncRequestQueue$1$1)
.class Lcom/android/volley/AsyncRequestQueue$1$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$1;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$1;)V
    .registers 2

    .line 144
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$1$1;->this$1:Lcom/android/volley/AsyncRequestQueue$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWriteComplete()V
    .registers 2

    .line 147
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$1$1;->this$1:Lcom/android/volley/AsyncRequestQueue$1;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$1;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$000(Lcom/android/volley/AsyncRequestQueue;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.AnonymousClass2 (com.android.volley.AsyncRequestQueue$2)
.class Lcom/android/volley/AsyncRequestQueue$2;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;)V
    .registers 2

    .line 154
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$2;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 157
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$2;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v0}, Lcom/android/volley/AsyncRequestQueue;->getCache()Lcom/android/volley/Cache;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/volley/Cache;->initialize()V

    .line 158
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$2;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$200(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$2$1;

    invoke-direct {v1, p0}, Lcom/android/volley/AsyncRequestQueue$2$1;-><init>(Lcom/android/volley/AsyncRequestQueue$2;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.AnonymousClass2.AnonymousClass1 (com.android.volley.AsyncRequestQueue$2$1)
.class Lcom/android/volley/AsyncRequestQueue$2$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$2;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$2;)V
    .registers 2

    .line 159
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$2$1;->this$1:Lcom/android/volley/AsyncRequestQueue$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 162
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$2$1;->this$1:Lcom/android/volley/AsyncRequestQueue$2;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$2;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$000(Lcom/android/volley/AsyncRequestQueue;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.AnonymousClass3 (com.android.volley.AsyncRequestQueue$3)
.class Lcom/android/volley/AsyncRequestQueue$3;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue;->getBlockingQueue()Ljava/util/concurrent/PriorityBlockingQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/lang/Runnable;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 514
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 514
    check-cast p1, Ljava/lang/Runnable;

    check-cast p2, Ljava/lang/Runnable;

    invoke-virtual {p0, p1, p2}, Lcom/android/volley/AsyncRequestQueue$3;->compare(Ljava/lang/Runnable;Ljava/lang/Runnable;)I

    move-result p1

    return p1
.end method

.method public compare(Ljava/lang/Runnable;Ljava/lang/Runnable;)I
    .registers 4

    .line 519
    instance-of v0, p1, Lcom/android/volley/RequestTask;

    if-eqz v0, :cond_13

    .line 520
    instance-of v0, p2, Lcom/android/volley/RequestTask;

    if-eqz v0, :cond_11

    .line 521
    check-cast p1, Lcom/android/volley/RequestTask;

    check-cast p2, Lcom/android/volley/RequestTask;

    invoke-virtual {p1, p2}, Lcom/android/volley/RequestTask;->compareTo(Lcom/android/volley/RequestTask;)I

    move-result p1

    return p1

    :cond_11
    const/4 p1, 0x1

    return p1

    .line 525
    :cond_13
    instance-of p1, p2, Lcom/android/volley/RequestTask;

    if-eqz p1, :cond_19

    const/4 p1, -0x1

    goto :goto_1a

    :cond_19
    const/4 p1, 0x0

    :goto_1a
    return p1
.end method

###### Class com.android.volley.AsyncRequestQueue.Builder (com.android.volley.AsyncRequestQueue$Builder)
.class public Lcom/android/volley/AsyncRequestQueue$Builder;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAsyncCache:Lcom/android/volley/AsyncCache;

.field private mCache:Lcom/android/volley/Cache;

.field private mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

.field private final mNetwork:Lcom/android/volley/AsyncNetwork;

.field private mResponseDelivery:Lcom/android/volley/ResponseDelivery;


# direct methods
.method public constructor <init>(Lcom/android/volley/AsyncNetwork;)V
    .registers 3

    .line 541
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 535
    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mAsyncCache:Lcom/android/volley/AsyncCache;

    .line 537
    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mCache:Lcom/android/volley/Cache;

    .line 538
    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    .line 539
    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    if-eqz p1, :cond_11

    .line 545
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mNetwork:Lcom/android/volley/AsyncNetwork;

    return-void

    .line 543
    :cond_11
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Network cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getDefaultExecutorFactory()Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;
    .registers 2

    .line 581
    new-instance v0, Lcom/android/volley/AsyncRequestQueue$Builder$1;

    invoke-direct {v0, p0}, Lcom/android/volley/AsyncRequestQueue$Builder$1;-><init>(Lcom/android/volley/AsyncRequestQueue$Builder;)V

    return-object v0
.end method


# virtual methods
.method public build()Lcom/android/volley/AsyncRequestQueue;
    .registers 9

    .line 633
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mCache:Lcom/android/volley/Cache;

    if-nez v0, :cond_11

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mAsyncCache:Lcom/android/volley/AsyncCache;

    if-eqz v1, :cond_9

    goto :goto_11

    .line 634
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must set one of the cache objects"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    :goto_11
    if-nez v0, :cond_1b

    .line 639
    new-instance v0, Lcom/android/volley/AsyncRequestQueue$ThrowingCache;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/volley/AsyncRequestQueue$ThrowingCache;-><init>(Lcom/android/volley/AsyncRequestQueue$1;)V

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mCache:Lcom/android/volley/Cache;

    .line 641
    :cond_1b
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    if-nez v0, :cond_2f

    .line 642
    new-instance v0, Lcom/android/volley/ExecutorDelivery;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, v1}, Lcom/android/volley/ExecutorDelivery;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    .line 644
    :cond_2f
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    if-nez v0, :cond_39

    .line 645
    invoke-direct {p0}, Lcom/android/volley/AsyncRequestQueue$Builder;->getDefaultExecutorFactory()Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    .line 647
    :cond_39
    new-instance v0, Lcom/android/volley/AsyncRequestQueue;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mCache:Lcom/android/volley/Cache;

    iget-object v3, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mNetwork:Lcom/android/volley/AsyncNetwork;

    iget-object v4, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mAsyncCache:Lcom/android/volley/AsyncCache;

    iget-object v5, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    iget-object v6, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    const/4 v7, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/android/volley/AsyncRequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/AsyncNetwork;Lcom/android/volley/AsyncCache;Lcom/android/volley/ResponseDelivery;Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;Lcom/android/volley/AsyncRequestQueue$1;)V

    return-object v0
.end method

.method public setAsyncCache(Lcom/android/volley/AsyncCache;)Lcom/android/volley/AsyncRequestQueue$Builder;
    .registers 2

    .line 569
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mAsyncCache:Lcom/android/volley/AsyncCache;

    return-object p0
.end method

.method public setCache(Lcom/android/volley/Cache;)Lcom/android/volley/AsyncRequestQueue$Builder;
    .registers 2

    .line 575
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mCache:Lcom/android/volley/Cache;

    return-object p0
.end method

.method public setExecutorFactory(Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;)Lcom/android/volley/AsyncRequestQueue$Builder;
    .registers 2

    .line 553
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mExecutorFactory:Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;

    return-object p0
.end method

.method public setResponseDelivery(Lcom/android/volley/ResponseDelivery;)Lcom/android/volley/AsyncRequestQueue$Builder;
    .registers 2

    .line 563
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    return-object p0
.end method

###### Class com.android.volley.AsyncRequestQueue.Builder.AnonymousClass1 (com.android.volley.AsyncRequestQueue$Builder$1)
.class Lcom/android/volley/AsyncRequestQueue$Builder$1;
.super Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$Builder;->getDefaultExecutorFactory()Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue$Builder;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$Builder;)V
    .registers 2

    .line 581
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder$1;->this$0:Lcom/android/volley/AsyncRequestQueue$Builder;

    invoke-direct {p0}, Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;-><init>()V

    return-void
.end method

.method private getNewThreadPoolExecutor(ILjava/lang/String;Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ThreadPoolExecutor;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;)",
            "Ljava/util/concurrent/ThreadPoolExecutor;"
        }
    .end annotation

    .line 609
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 615
    invoke-direct {p0, p2}, Lcom/android/volley/AsyncRequestQueue$Builder$1;->getThreadFactory(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v7

    const/4 v1, 0x0

    const-wide/16 v3, 0x3c

    move-object v0, v8

    move v2, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    return-object v8
.end method

.method private getThreadFactory(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;
    .registers 3

    .line 619
    new-instance v0, Lcom/android/volley/AsyncRequestQueue$Builder$1$1;

    invoke-direct {v0, p0, p1}, Lcom/android/volley/AsyncRequestQueue$Builder$1$1;-><init>(Lcom/android/volley/AsyncRequestQueue$Builder$1;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public createBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;)",
            "Ljava/util/concurrent/ExecutorService;"
        }
    .end annotation

    const/4 v0, 0x4

    const-string v1, "BlockingExecutor"

    .line 593
    invoke-direct {p0, v0, v1, p1}, Lcom/android/volley/AsyncRequestQueue$Builder$1;->getNewThreadPoolExecutor(ILjava/lang/String;Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object p1

    return-object p1
.end method

.method public createNonBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;)",
            "Ljava/util/concurrent/ExecutorService;"
        }
    .end annotation

    const/4 v0, 0x1

    const-string v1, "Non-BlockingExecutor"

    .line 585
    invoke-direct {p0, v0, v1, p1}, Lcom/android/volley/AsyncRequestQueue$Builder$1;->getNewThreadPoolExecutor(ILjava/lang/String;Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object p1

    return-object p1
.end method

.method public createNonBlockingScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;
    .registers 4

    .line 601
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const-string v1, "ScheduledExecutor"

    .line 602
    invoke-direct {p0, v1}, Lcom/android/volley/AsyncRequestQueue$Builder$1;->getThreadFactory(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    return-object v0
.end method

###### Class com.android.volley.AsyncRequestQueue.Builder.AnonymousClass1.ThreadFactoryC00051 (com.android.volley.AsyncRequestQueue$Builder$1$1)
.class Lcom/android/volley/AsyncRequestQueue$Builder$1$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$Builder$1;->getThreadFactory(Ljava/lang/String;)Ljava/util/concurrent/ThreadFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$Builder$1;

.field final synthetic val$threadNameSuffix:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$Builder$1;Ljava/lang/String;)V
    .registers 3

    .line 619
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$Builder$1$1;->this$1:Lcom/android/volley/AsyncRequestQueue$Builder$1;

    iput-object p2, p0, Lcom/android/volley/AsyncRequestQueue$Builder$1$1;->val$threadNameSuffix:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4

    .line 622
    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/concurrent/ThreadFactory;->newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p1

    .line 623
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Volley-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$Builder$1$1;->val$threadNameSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    return-object p1
.end method

###### Class com.android.volley.AsyncRequestQueue.CacheParseTask (com.android.volley.AsyncRequestQueue$CacheParseTask)
.class Lcom/android/volley/AsyncRequestQueue$CacheParseTask;
.super Lcom/android/volley/RequestTask;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CacheParseTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/RequestTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field entry:Lcom/android/volley/Cache$Entry;

.field startTimeMillis:J

.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Cache$Entry;J)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;",
            "Lcom/android/volley/Cache$Entry;",
            "J)V"
        }
    .end annotation

    .line 300
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    .line 301
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    .line 302
    iput-object p3, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->entry:Lcom/android/volley/Cache$Entry;

    .line 303
    iput-wide p4, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->startTimeMillis:J

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .line 308
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    const-string v1, "cache-hit"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 309
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    new-instance v8, Lcom/android/volley/NetworkResponse;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->entry:Lcom/android/volley/Cache$Entry;

    iget-object v3, v1, Lcom/android/volley/Cache$Entry;->data:[B

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->entry:Lcom/android/volley/Cache$Entry;

    iget-object v7, v1, Lcom/android/volley/Cache$Entry;->allResponseHeaders:Ljava/util/List;

    const/16 v2, 0xc8

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    .line 310
    invoke-virtual {v0, v8}, Lcom/android/volley/Request;->parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v0

    .line 317
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    const-string v2, "cache-hit-parsed"

    invoke-virtual {v1, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 319
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->entry:Lcom/android/volley/Cache$Entry;

    iget-wide v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->startTimeMillis:J

    invoke-virtual {v1, v2, v3}, Lcom/android/volley/Cache$Entry;->refreshNeeded(J)Z

    move-result v1

    if-nez v1, :cond_3d

    .line 321
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v1}, Lcom/android/volley/AsyncRequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-interface {v1, v2, v0}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    goto :goto_78

    .line 326
    :cond_3d
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    const-string v2, "cache-hit-refresh-needed"

    invoke-virtual {v1, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 327
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->entry:Lcom/android/volley/Cache$Entry;

    invoke-virtual {v1, v2}, Lcom/android/volley/Request;->setCacheEntry(Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Request;

    const/4 v1, 0x1

    .line 329
    iput-boolean v1, v0, Lcom/android/volley/Response;->intermediate:Z

    .line 331
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v1}, Lcom/android/volley/AsyncRequestQueue;->access$400(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/WaitingRequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v1, v2}, Lcom/android/volley/WaitingRequestManager;->maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z

    move-result v1

    if-nez v1, :cond_6d

    .line 334
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v1}, Lcom/android/volley/AsyncRequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    new-instance v3, Lcom/android/volley/AsyncRequestQueue$CacheParseTask$1;

    invoke-direct {v3, p0}, Lcom/android/volley/AsyncRequestQueue$CacheParseTask$1;-><init>(Lcom/android/volley/AsyncRequestQueue$CacheParseTask;)V

    .line 335
    invoke-interface {v1, v2, v0, v3}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;Ljava/lang/Runnable;)V

    goto :goto_78

    .line 348
    :cond_6d
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v1}, Lcom/android/volley/AsyncRequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-interface {v1, v2, v0}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    :goto_78
    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.CacheParseTask.AnonymousClass1 (com.android.volley.AsyncRequestQueue$CacheParseTask$1)
.class Lcom/android/volley/AsyncRequestQueue$CacheParseTask$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$CacheParseTask;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$CacheParseTask;)V
    .registers 2

    .line 338
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CacheParseTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 341
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CacheParseTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheParseTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CacheParseTask;

    iget-object v1, v1, Lcom/android/volley/AsyncRequestQueue$CacheParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0, v1}, Lcom/android/volley/AsyncRequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.CachePutTask (com.android.volley.AsyncRequestQueue$CachePutTask)
.class Lcom/android/volley/AsyncRequestQueue$CachePutTask;
.super Lcom/android/volley/RequestTask;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CachePutTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/RequestTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field response:Lcom/android/volley/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response<",
            "*>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;",
            "Lcom/android/volley/Response<",
            "*>;)V"
        }
    .end annotation

    .line 454
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    .line 455
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    .line 456
    iput-object p3, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->response:Lcom/android/volley/Response;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 461
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;

    move-result-object v0

    if-eqz v0, :cond_21

    .line 462
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;

    move-result-object v0

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->mRequest:Lcom/android/volley/Request;

    .line 463
    invoke-virtual {v1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->response:Lcom/android/volley/Response;

    iget-object v2, v2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    new-instance v3, Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;

    invoke-direct {v3, p0}, Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;-><init>(Lcom/android/volley/AsyncRequestQueue$CachePutTask;)V

    .line 462
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/volley/AsyncCache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V

    goto :goto_3e

    .line 472
    :cond_21
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v0}, Lcom/android/volley/AsyncRequestQueue;->getCache()Lcom/android/volley/Cache;

    move-result-object v0

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->response:Lcom/android/volley/Response;

    iget-object v2, v2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    invoke-interface {v0, v1, v2}, Lcom/android/volley/Cache;->put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V

    .line 473
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->mRequest:Lcom/android/volley/Request;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->response:Lcom/android/volley/Response;

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/android/volley/AsyncRequestQueue;->access$700(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V

    :goto_3e
    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.CachePutTask.AnonymousClass1 (com.android.volley.AsyncRequestQueue$CachePutTask$1)
.class Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$CachePutTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$CachePutTask;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$CachePutTask;)V
    .registers 2

    .line 465
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CachePutTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWriteComplete()V
    .registers 5

    .line 468
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CachePutTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CachePutTask;

    iget-object v1, v1, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->mRequest:Lcom/android/volley/Request;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CachePutTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CachePutTask;

    iget-object v2, v2, Lcom/android/volley/AsyncRequestQueue$CachePutTask;->response:Lcom/android/volley/Response;

    const/4 v3, 0x1

    invoke-static {v0, v1, v2, v3}, Lcom/android/volley/AsyncRequestQueue;->access$700(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.CacheTask (com.android.volley.AsyncRequestQueue$CacheTask)
.class Lcom/android/volley/AsyncRequestQueue$CacheTask;
.super Lcom/android/volley/RequestTask;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CacheTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/RequestTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 234
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    .line 235
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 241
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 242
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    const-string v1, "cache-discard-canceled"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    return-void

    .line 246
    :cond_10
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    const-string v1, "cache-queue-take"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 249
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;

    move-result-object v0

    if-eqz v0, :cond_34

    .line 250
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;

    move-result-object v0

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    .line 251
    invoke-virtual {v1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/android/volley/AsyncRequestQueue$CacheTask$1;

    invoke-direct {v2, p0}, Lcom/android/volley/AsyncRequestQueue$CacheTask$1;-><init>(Lcom/android/volley/AsyncRequestQueue$CacheTask;)V

    .line 250
    invoke-virtual {v0, v1, v2}, Lcom/android/volley/AsyncCache;->get(Ljava/lang/String;Lcom/android/volley/AsyncCache$OnGetCompleteCallback;)V

    goto :goto_4b

    .line 259
    :cond_34
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v0}, Lcom/android/volley/AsyncRequestQueue;->getCache()Lcom/android/volley/Cache;

    move-result-object v0

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/volley/Cache;->get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 260
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    invoke-static {v1, v0, v2}, Lcom/android/volley/AsyncRequestQueue;->access$300(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V

    :goto_4b
    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.CacheTask.AnonymousClass1 (com.android.volley.AsyncRequestQueue$CacheTask$1)
.class Lcom/android/volley/AsyncRequestQueue$CacheTask$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Lcom/android/volley/AsyncCache$OnGetCompleteCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$CacheTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$CacheTask;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$CacheTask;)V
    .registers 2

    .line 252
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CacheTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetComplete(Lcom/android/volley/Cache$Entry;)V
    .registers 4

    .line 255
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CacheTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$CacheTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$CacheTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$CacheTask;

    iget-object v1, v1, Lcom/android/volley/AsyncRequestQueue$CacheTask;->mRequest:Lcom/android/volley/Request;

    invoke-static {v0, p1, v1}, Lcom/android/volley/AsyncRequestQueue;->access$300(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Cache$Entry;Lcom/android/volley/Request;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.ExecutorFactory (com.android.volley.AsyncRequestQueue$ExecutorFactory)
.class public abstract Lcom/android/volley/AsyncRequestQueue$ExecutorFactory;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ExecutorFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 501
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract createBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;)",
            "Ljava/util/concurrent/ExecutorService;"
        }
    .end annotation
.end method

.method public abstract createNonBlockingExecutor(Ljava/util/concurrent/BlockingQueue;)Ljava/util/concurrent/ExecutorService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;)",
            "Ljava/util/concurrent/ExecutorService;"
        }
    .end annotation
.end method

.method public abstract createNonBlockingScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;
.end method

###### Class com.android.volley.AsyncRequestQueue.NetworkParseTask (com.android.volley.AsyncRequestQueue$NetworkParseTask)
.class Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;
.super Lcom/android/volley/RequestTask;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkParseTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/RequestTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field networkResponse:Lcom/android/volley/NetworkResponse;

.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/NetworkResponse;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;",
            "Lcom/android/volley/NetworkResponse;",
            ")V"
        }
    .end annotation

    .line 426
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    .line 427
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    .line 428
    iput-object p3, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->networkResponse:Lcom/android/volley/NetworkResponse;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 433
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->mRequest:Lcom/android/volley/Request;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->networkResponse:Lcom/android/volley/NetworkResponse;

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v0

    .line 434
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->mRequest:Lcom/android/volley/Request;

    const-string v2, "network-parse-complete"

    invoke-virtual {v1, v2}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 439
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v1}, Lcom/android/volley/Request;->shouldCache()Z

    move-result v1

    if-eqz v1, :cond_49

    iget-object v1, v0, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    if-eqz v1, :cond_49

    .line 440
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v1}, Lcom/android/volley/AsyncRequestQueue;->access$100(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncCache;

    move-result-object v1

    if-eqz v1, :cond_36

    .line 441
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v1}, Lcom/android/volley/AsyncRequestQueue;->access$200(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/android/volley/AsyncRequestQueue$CachePutTask;

    iget-object v3, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v4, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-direct {v2, v3, v4, v0}, Lcom/android/volley/AsyncRequestQueue$CachePutTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_51

    .line 443
    :cond_36
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v1}, Lcom/android/volley/AsyncRequestQueue;->access$500(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/android/volley/AsyncRequestQueue$CachePutTask;

    iget-object v3, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v4, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->mRequest:Lcom/android/volley/Request;

    invoke-direct {v2, v3, v4, v0}, Lcom/android/volley/AsyncRequestQueue$CachePutTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_51

    .line 446
    :cond_49
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;->mRequest:Lcom/android/volley/Request;

    const/4 v3, 0x0

    invoke-static {v1, v2, v0, v3}, Lcom/android/volley/AsyncRequestQueue;->access$700(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/Response;Z)V

    :goto_51
    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.NetworkTask (com.android.volley.AsyncRequestQueue$NetworkTask)
.class Lcom/android/volley/AsyncRequestQueue$NetworkTask;
.super Lcom/android/volley/RequestTask;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/RequestTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    .line 372
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    .line 373
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 379
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->isCanceled()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 380
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    const-string v1, "network-discard-cancelled"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 381
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->notifyListenerResponseNotUsable()V

    return-void

    .line 385
    :cond_15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 386
    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    const-string v3, "network-queue-take"

    invoke-virtual {v2, v3}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 392
    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v2}, Lcom/android/volley/AsyncRequestQueue;->access$600(Lcom/android/volley/AsyncRequestQueue;)Lcom/android/volley/AsyncNetwork;

    move-result-object v2

    iget-object v3, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    new-instance v4, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;

    invoke-direct {v4, p0, v0, v1}, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;-><init>(Lcom/android/volley/AsyncRequestQueue$NetworkTask;J)V

    invoke-virtual {v2, v3, v4}, Lcom/android/volley/AsyncNetwork;->performRequest(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.NetworkTask.AnonymousClass1 (com.android.volley.AsyncRequestQueue$NetworkTask$1)
.class Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Lcom/android/volley/AsyncNetwork$OnRequestComplete;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/AsyncRequestQueue$NetworkTask;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

.field final synthetic val$startTimeMs:J


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue$NetworkTask;J)V
    .registers 4

    .line 394
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iput-wide p2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->val$startTimeMs:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/android/volley/VolleyError;)V
    .registers 6

    .line 415
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->val$startTimeMs:J

    sub-long/2addr v0, v2

    .line 414
    invoke-virtual {p1, v0, v1}, Lcom/android/volley/VolleyError;->setNetworkTimeMs(J)V

    .line 416
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$500(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v2, v2, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v3, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v3, v3, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    invoke-direct {v1, v2, v3, p1}, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onSuccess(Lcom/android/volley/NetworkResponse;)V
    .registers 6

    .line 397
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    const-string v1, "network-http-complete"

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 401
    iget-boolean v0, p1, Lcom/android/volley/NetworkResponse;->notModified:Z

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->hasHadResponseDelivered()Z

    move-result v0

    if-eqz v0, :cond_28

    .line 402
    iget-object p1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object p1, p1, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    const-string v0, "not-modified"

    invoke-virtual {p1, v0}, Lcom/android/volley/Request;->finish(Ljava/lang/String;)V

    .line 403
    iget-object p1, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object p1, p1, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {p1}, Lcom/android/volley/Request;->notifyListenerResponseNotUsable()V

    return-void

    .line 408
    :cond_28
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v0, v0, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-static {v0}, Lcom/android/volley/AsyncRequestQueue;->access$500(Lcom/android/volley/AsyncRequestQueue;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v2, v2, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    iget-object v3, p0, Lcom/android/volley/AsyncRequestQueue$NetworkTask$1;->this$1:Lcom/android/volley/AsyncRequestQueue$NetworkTask;

    iget-object v3, v3, Lcom/android/volley/AsyncRequestQueue$NetworkTask;->mRequest:Lcom/android/volley/Request;

    invoke-direct {v1, v2, v3, p1}, Lcom/android/volley/AsyncRequestQueue$NetworkParseTask;-><init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/NetworkResponse;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.ParseErrorTask (com.android.volley.AsyncRequestQueue$ParseErrorTask)
.class Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;
.super Lcom/android/volley/RequestTask;
.source "AsyncRequestQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParseErrorTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/RequestTask<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/AsyncRequestQueue;

.field volleyError:Lcom/android/volley/VolleyError;


# direct methods
.method constructor <init>(Lcom/android/volley/AsyncRequestQueue;Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;",
            "Lcom/android/volley/VolleyError;",
            ")V"
        }
    .end annotation

    .line 357
    iput-object p1, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    .line 358
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    .line 359
    iput-object p3, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->volleyError:Lcom/android/volley/VolleyError;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 364
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->mRequest:Lcom/android/volley/Request;

    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->volleyError:Lcom/android/volley/VolleyError;

    invoke-virtual {v0, v1}, Lcom/android/volley/Request;->parseNetworkError(Lcom/android/volley/VolleyError;)Lcom/android/volley/VolleyError;

    move-result-object v0

    .line 365
    iget-object v1, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->this$0:Lcom/android/volley/AsyncRequestQueue;

    invoke-virtual {v1}, Lcom/android/volley/AsyncRequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object v1

    iget-object v2, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->mRequest:Lcom/android/volley/Request;

    invoke-interface {v1, v2, v0}, Lcom/android/volley/ResponseDelivery;->postError(Lcom/android/volley/Request;Lcom/android/volley/VolleyError;)V

    .line 366
    iget-object v0, p0, Lcom/android/volley/AsyncRequestQueue$ParseErrorTask;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->notifyListenerResponseNotUsable()V

    return-void
.end method

###### Class com.android.volley.AsyncRequestQueue.ThrowingCache (com.android.volley.AsyncRequestQueue$ThrowingCache)
.class Lcom/android/volley/AsyncRequestQueue$ThrowingCache;
.super Ljava/lang/Object;
.source "AsyncRequestQueue.java"

# interfaces
.implements Lcom/android/volley/Cache;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncRequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ThrowingCache"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 653
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/AsyncRequestQueue$1;)V
    .registers 2

    .line 653
    invoke-direct {p0}, Lcom/android/volley/AsyncRequestQueue$ThrowingCache;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .line 681
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public get(Ljava/lang/String;)Lcom/android/volley/Cache$Entry;
    .registers 2

    .line 656
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public initialize()V
    .registers 2

    .line 666
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public invalidate(Ljava/lang/String;Z)V
    .registers 3

    .line 671
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    .registers 3

    .line 661
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public remove(Ljava/lang/String;)V
    .registers 2

    .line 676
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method
