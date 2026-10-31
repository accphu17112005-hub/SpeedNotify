###### Class com.android.volley.WaitingRequestManager (com.android.volley.WaitingRequestManager)
.class Lcom/android/volley/WaitingRequestManager;
.super Ljava/lang/Object;
.source "WaitingRequestManager.java"

# interfaces
.implements Lcom/android/volley/Request$NetworkRequestCompleteListener;


# instance fields
.field private final mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

.field private final mNetworkQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final mRequestQueue:Lcom/android/volley/RequestQueue;

.field private final mResponseDelivery:Lcom/android/volley/ResponseDelivery;

.field private final mWaitingRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/volley/Request<",
            "*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/android/volley/CacheDispatcher;Ljava/util/concurrent/BlockingQueue;Lcom/android/volley/ResponseDelivery;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/CacheDispatcher;",
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/android/volley/Request<",
            "*>;>;",
            "Lcom/android/volley/ResponseDelivery;",
            ")V"
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    const/4 v0, 0x0

    .line 76
    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 77
    iput-object p3, p0, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    .line 78
    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    .line 79
    iput-object p2, p0, Lcom/android/volley/WaitingRequestManager;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    return-void
.end method

.method constructor <init>(Lcom/android/volley/RequestQueue;)V
    .registers 3

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    .line 66
    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    .line 67
    invoke-virtual {p1}, Lcom/android/volley/RequestQueue;->getResponseDelivery()Lcom/android/volley/ResponseDelivery;

    move-result-object p1

    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    .line 69
    iput-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;

    return-void
.end method


# virtual methods
.method declared-synchronized maybeAddToWaitingRequests(Lcom/android/volley/Request;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)Z"
        }
    .end annotation

    monitor-enter p0

    .line 149
    :try_start_1
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object v0

    .line 152
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_3a

    .line 154
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_1e

    .line 156
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_1e
    const-string v4, "waiting-for-response"

    .line 158
    invoke-virtual {p1, v4}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 159
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    iget-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-boolean p1, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz p1, :cond_38

    const-string p1, "Request for cacheKey=%s is in flight, putting on hold."

    new-array v1, v2, [Ljava/lang/Object;

    aput-object v0, v1, v3

    .line 162
    invoke-static {p1, v1}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_38
    .catchall {:try_start_1 .. :try_end_38} :catchall_52

    .line 164
    :cond_38
    monitor-exit p0

    return v2

    .line 168
    :cond_3a
    :try_start_3a
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    const/4 v4, 0x0

    invoke-interface {v1, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    invoke-virtual {p1, p0}, Lcom/android/volley/Request;->setNetworkRequestCompleteListener(Lcom/android/volley/Request$NetworkRequestCompleteListener;)V

    .line 170
    sget-boolean p1, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz p1, :cond_50

    const-string p1, "new request, sending to network %s"

    new-array v1, v2, [Ljava/lang/Object;

    aput-object v0, v1, v3

    .line 171
    invoke-static {p1, v1}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_50
    .catchall {:try_start_3a .. :try_end_50} :catchall_52

    .line 173
    :cond_50
    monitor-exit p0

    return v3

    :catchall_52
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onNoUsableResponseReceived(Lcom/android/volley/Request;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    monitor-enter p0

    .line 110
    :try_start_1
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object p1

    .line 111
    iget-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_6b

    .line 112
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6b

    .line 113
    sget-boolean v1, Lcom/android/volley/VolleyLog;->DEBUG:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2f

    const-string v1, "%d waiting requests for cacheKey=%s; resend to network"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    .line 116
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    aput-object p1, v4, v2

    .line 114
    invoke-static {v1, v4}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 118
    :cond_2f
    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/volley/Request;

    .line 119
    iget-object v4, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v4, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {v1, p0}, Lcom/android/volley/Request;->setNetworkRequestCompleteListener(Lcom/android/volley/Request$NetworkRequestCompleteListener;)V

    .line 122
    iget-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    if-eqz p1, :cond_45

    .line 124
    invoke-virtual {p1, v1}, Lcom/android/volley/RequestQueue;->sendRequestOverNetwork(Lcom/android/volley/Request;)V

    goto :goto_6b

    .line 125
    :cond_45
    iget-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    if-eqz p1, :cond_6b

    iget-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mNetworkQueue:Ljava/util/concurrent/BlockingQueue;
    :try_end_4b
    .catchall {:try_start_1 .. :try_end_4b} :catchall_6d

    if-eqz p1, :cond_6b

    .line 128
    :try_start_4d
    invoke-interface {p1, v1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_50
    .catch Ljava/lang/InterruptedException; {:try_start_4d .. :try_end_50} :catch_51
    .catchall {:try_start_4d .. :try_end_50} :catchall_6d

    goto :goto_6b

    :catch_51
    move-exception p1

    :try_start_52
    const-string v0, "Couldn\'t add request to queue. %s"

    new-array v1, v2, [Ljava/lang/Object;

    .line 130
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v3

    invoke-static {v0, v1}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 132
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 134
    iget-object p1, p0, Lcom/android/volley/WaitingRequestManager;->mCacheDispatcher:Lcom/android/volley/CacheDispatcher;

    invoke-virtual {p1}, Lcom/android/volley/CacheDispatcher;->quit()V
    :try_end_6b
    .catchall {:try_start_52 .. :try_end_6b} :catchall_6d

    .line 138
    :cond_6b
    :goto_6b
    monitor-exit p0

    return-void

    :catchall_6d
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onResponseReceived(Lcom/android/volley/Request;Lcom/android/volley/Response;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/Response<",
            "*>;)V"
        }
    .end annotation

    .line 85
    iget-object v0, p2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    if-eqz v0, :cond_51

    iget-object v0, p2, Lcom/android/volley/Response;->cacheEntry:Lcom/android/volley/Cache$Entry;

    invoke-virtual {v0}, Lcom/android/volley/Cache$Entry;->isExpired()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_51

    .line 89
    :cond_d
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;

    move-result-object p1

    .line 91
    monitor-enter p0

    .line 92
    :try_start_12
    iget-object v0, p0, Lcom/android/volley/WaitingRequestManager;->mWaitingRequests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 93
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_12 .. :try_end_1b} :catchall_4e

    if-eqz v0, :cond_4d

    .line 95
    sget-boolean v1, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-eqz v1, :cond_37

    const-string v1, "Releasing %d waiting requests for cacheKey=%s."

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 98
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    .line 96
    invoke-static {v1, v2}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    :cond_37
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/volley/Request;

    .line 102
    iget-object v1, p0, Lcom/android/volley/WaitingRequestManager;->mResponseDelivery:Lcom/android/volley/ResponseDelivery;

    invoke-interface {v1, v0, p2}, Lcom/android/volley/ResponseDelivery;->postResponse(Lcom/android/volley/Request;Lcom/android/volley/Response;)V

    goto :goto_3b

    :cond_4d
    return-void

    :catchall_4e
    move-exception p1

    .line 93
    :try_start_4f
    monitor-exit p0
    :try_end_50
    .catchall {:try_start_4f .. :try_end_50} :catchall_4e

    throw p1

    .line 86
    :cond_51
    :goto_51
    invoke-virtual {p0, p1}, Lcom/android/volley/WaitingRequestManager;->onNoUsableResponseReceived(Lcom/android/volley/Request;)V

    return-void
.end method
