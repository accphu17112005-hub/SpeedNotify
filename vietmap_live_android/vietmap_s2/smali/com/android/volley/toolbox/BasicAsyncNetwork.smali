###### Class com.android.volley.toolbox.BasicAsyncNetwork (com.android.volley.toolbox.BasicAsyncNetwork)
.class public Lcom/android/volley/toolbox/BasicAsyncNetwork;
.super Lcom/android/volley/AsyncNetwork;
.source "BasicAsyncNetwork.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;,
        Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;,
        Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;
    }
.end annotation


# instance fields
.field private final mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

.field private final mPool:Lcom/android/volley/toolbox/ByteArrayPool;


# direct methods
.method private constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V
    .registers 3

    .line 55
    invoke-direct {p0}, Lcom/android/volley/AsyncNetwork;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    .line 57
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/BasicAsyncNetwork$1;)V
    .registers 4

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/android/volley/toolbox/BasicAsyncNetwork;-><init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .registers 6

    .line 46
    invoke-direct/range {p0 .. p5}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onRequestSucceeded(Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V
    .registers 8

    .line 46
    invoke-direct/range {p0 .. p7}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onRequestFailed(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/volley/toolbox/BasicAsyncNetwork;)Lcom/android/volley/toolbox/ByteArrayPool;
    .registers 1

    .line 46
    iget-object p0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/volley/toolbox/BasicAsyncNetwork;JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V
    .registers 9

    .line 46
    invoke-direct/range {p0 .. p8}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onResponseRead(JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V

    return-void
.end method

.method private onRequestFailed(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            "Ljava/io/IOException;",
            "J",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "[B)V"
        }
    .end annotation

    move-object v0, p1

    move-object v1, p3

    move-wide v2, p4

    move-object v4, p6

    move-object v5, p7

    .line 136
    :try_start_5
    invoke-static/range {v0 .. v5}, Lcom/android/volley/toolbox/NetworkUtility;->shouldRetryException(Lcom/android/volley/Request;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    move-result-object p3

    .line 139
    invoke-virtual {p0}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object p4

    new-instance p5, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;

    invoke-direct {p5, p0, p1, p3, p2}, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;-><init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    .line 140
    invoke-interface {p4, p5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_15
    .catch Lcom/android/volley/VolleyError; {:try_start_5 .. :try_end_15} :catch_16

    goto :goto_1a

    :catch_16
    move-exception p1

    .line 142
    invoke-interface {p2, p1}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onError(Lcom/android/volley/VolleyError;)V

    :goto_1a
    return-void
.end method

.method private onRequestSucceeded(Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;J",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            ")V"
        }
    .end annotation

    .line 80
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getStatusCode()I

    move-result v9

    .line 81
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v8

    const/16 v0, 0x130

    if-ne v9, v0, :cond_1c

    .line 84
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long/2addr v0, p2

    move-object v5, p1

    .line 86
    invoke-static {p1, v0, v1, v8}, Lcom/android/volley/toolbox/NetworkUtility;->getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;

    move-result-object v0

    move-object/from16 v6, p5

    .line 85
    invoke-interface {v6, v0}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onSuccess(Lcom/android/volley/NetworkResponse;)V

    return-void

    :cond_1c
    move-object v5, p1

    move-object/from16 v6, p5

    .line 91
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getContentBytes()[B

    move-result-object v0

    if-nez v0, :cond_2e

    .line 92
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v1

    if-nez v1, :cond_2e

    const/4 v0, 0x0

    new-array v0, v0, [B

    :cond_2e
    move-object v10, v0

    if-eqz v10, :cond_3f

    move-object v0, p0

    move-wide v1, p2

    move v3, v9

    move-object/from16 v4, p4

    move-object v5, p1

    move-object/from16 v6, p5

    move-object v7, v8

    move-object v8, v10

    .line 99
    invoke-direct/range {v0 .. v8}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onResponseRead(JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V

    return-void

    .line 113
    :cond_3f
    invoke-virtual/range {p4 .. p4}, Lcom/android/volley/toolbox/HttpResponse;->getContent()Ljava/io/InputStream;

    move-result-object v2

    .line 114
    invoke-virtual {p0}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v10

    new-instance v11, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;

    move-object v0, v11

    move-object v1, p0

    move-object/from16 v3, p4

    move-object v4, p1

    move-object/from16 v5, p5

    move-wide v6, p2

    invoke-direct/range {v0 .. v9}, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;-><init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Ljava/io/InputStream;Lcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;JLjava/util/List;I)V

    .line 115
    invoke-interface {v10, v11}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private onResponseRead(JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;[B)V"
        }
    .end annotation

    move v1, p3

    .line 217
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    move-object v4, p5

    move-object/from16 v7, p8

    .line 218
    invoke-static {v2, v3, p5, v7, p3}, Lcom/android/volley/toolbox/NetworkUtility;->logSlowRequests(JLcom/android/volley/Request;[BI)V

    const/16 v0, 0xc8

    if-lt v1, v0, :cond_2b

    const/16 v0, 0x12b

    if-le v1, v0, :cond_15

    goto :goto_2b

    .line 231
    :cond_15
    new-instance v8, Lcom/android/volley/NetworkResponse;

    const/4 v3, 0x0

    .line 236
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, p1

    move-object v0, v8

    move v1, p3

    move-object/from16 v2, p8

    move-object/from16 v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    move-object v2, p6

    .line 231
    invoke-interface {p6, v8}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onSuccess(Lcom/android/volley/NetworkResponse;)V

    return-void

    :cond_2b
    :goto_2b
    move-object v2, p6

    .line 221
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    move-object v0, p0

    move-object v1, p5

    move-object v2, p6

    move-wide v4, p1

    move-object v6, p4

    move-object/from16 v7, p8

    invoke-direct/range {v0 .. v7}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->onRequestFailed(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V

    return-void
.end method


# virtual methods
.method public performRequest(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            ")V"
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->getBlockingExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    if-eqz v0, :cond_21

    .line 176
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 179
    invoke-virtual {p1}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object v0

    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->getCacheHeaders(Lcom/android/volley/Cache$Entry;)Ljava/util/Map;

    move-result-object v0

    .line 180
    iget-object v7, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    new-instance v8, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;-><init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;JLcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    invoke-virtual {v7, p1, v0, v8}, Lcom/android/volley/toolbox/AsyncHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V

    return-void

    .line 173
    :cond_21
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "mBlockingExecuter must be set before making a request"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .registers 3

    .line 63
    invoke-super {p0, p1}, Lcom/android/volley/AsyncNetwork;->setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 64
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    invoke-virtual {v0, p1}, Lcom/android/volley/toolbox/AsyncHttpStack;->setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method public setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .registers 3

    .line 70
    invoke-super {p0, p1}, Lcom/android/volley/AsyncNetwork;->setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 71
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    invoke-virtual {v0, p1}, Lcom/android/volley/toolbox/AsyncHttpStack;->setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

###### Class com.android.volley.toolbox.BasicAsyncNetwork.AnonymousClass1 (com.android.volley.toolbox.BasicAsyncNetwork$1)
.class Lcom/android/volley/toolbox/BasicAsyncNetwork$1;
.super Ljava/lang/Object;
.source "BasicAsyncNetwork.java"

# interfaces
.implements Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/BasicAsyncNetwork;->performRequest(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

.field final synthetic val$callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

.field final synthetic val$request:Lcom/android/volley/Request;

.field final synthetic val$requestStartMs:J


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;JLcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .registers 6

    .line 183
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iput-object p2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$request:Lcom/android/volley/Request;

    iput-wide p3, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$requestStartMs:J

    iput-object p5, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthError(Lcom/android/volley/AuthFailureError;)V
    .registers 3

    .line 191
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    invoke-interface {v0, p1}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onError(Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method public onError(Ljava/io/IOException;)V
    .registers 10

    .line 196
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$request:Lcom/android/volley/Request;

    iget-object v2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    iget-wide v4, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$requestStartMs:J

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p1

    invoke-static/range {v0 .. v7}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->access$100(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V

    return-void
.end method

.method public onSuccess(Lcom/android/volley/toolbox/HttpResponse;)V
    .registers 8

    .line 186
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$request:Lcom/android/volley/Request;

    iget-wide v2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$requestStartMs:J

    iget-object v5, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$1;->val$callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    move-object v4, p1

    invoke-static/range {v0 .. v5}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->access$000(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;JLcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V

    return-void
.end method

###### Class com.android.volley.toolbox.BasicAsyncNetwork.Builder (com.android.volley.toolbox.BasicAsyncNetwork$Builder)
.class public Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;
.super Ljava/lang/Object;
.source "BasicAsyncNetwork.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/BasicAsyncNetwork;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final DEFAULT_POOL_SIZE:I = 0x1000


# instance fields
.field private mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

.field private mPool:Lcom/android/volley/toolbox/ByteArrayPool;


# direct methods
.method public constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;)V
    .registers 2

    .line 298
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 299
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    const/4 p1, 0x0

    .line 300
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-void
.end method


# virtual methods
.method public build()Lcom/android/volley/toolbox/BasicAsyncNetwork;
    .registers 5

    .line 314
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    if-nez v0, :cond_d

    .line 315
    new-instance v0, Lcom/android/volley/toolbox/ByteArrayPool;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/ByteArrayPool;-><init>(I)V

    iput-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    .line 317
    :cond_d
    new-instance v0, Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mAsyncStack:Lcom/android/volley/toolbox/AsyncHttpStack;

    iget-object v2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/android/volley/toolbox/BasicAsyncNetwork;-><init>(Lcom/android/volley/toolbox/AsyncHttpStack;Lcom/android/volley/toolbox/ByteArrayPool;Lcom/android/volley/toolbox/BasicAsyncNetwork$1;)V

    return-object v0
.end method

.method public setPool(Lcom/android/volley/toolbox/ByteArrayPool;)Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;
    .registers 2

    .line 308
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$Builder;->mPool:Lcom/android/volley/toolbox/ByteArrayPool;

    return-object p0
.end method

###### Class com.android.volley.toolbox.BasicAsyncNetwork.InvokeRetryPolicyTask (com.android.volley.toolbox.BasicAsyncNetwork$InvokeRetryPolicyTask)
.class Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;
.super Lcom/android/volley/RequestTask;
.source "BasicAsyncNetwork.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/BasicAsyncNetwork;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InvokeRetryPolicyTask"
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
.field final callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

.field final request:Lcom/android/volley/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Request<",
            "TT;>;"
        }
    .end annotation
.end field

.field final retryInfo:Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

.field final synthetic this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "TT;>;",
            "Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            ")V"
        }
    .end annotation

    .line 151
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    .line 152
    invoke-direct {p0, p2}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    .line 153
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->request:Lcom/android/volley/Request;

    .line 154
    iput-object p3, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->retryInfo:Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    .line 155
    iput-object p4, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 161
    :try_start_0
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->request:Lcom/android/volley/Request;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->retryInfo:Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    invoke-static {v0, v1}, Lcom/android/volley/toolbox/NetworkUtility;->attemptRetryOnException(Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)V

    .line 163
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->request:Lcom/android/volley/Request;

    iget-object v2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    invoke-virtual {v0, v1, v2}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->performRequest(Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;)V
    :try_end_10
    .catch Lcom/android/volley/VolleyError; {:try_start_0 .. :try_end_10} :catch_11

    goto :goto_17

    :catch_11
    move-exception v0

    .line 165
    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$InvokeRetryPolicyTask;->callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    invoke-interface {v1, v0}, Lcom/android/volley/AsyncNetwork$OnRequestComplete;->onError(Lcom/android/volley/VolleyError;)V

    :goto_17
    return-void
.end method

###### Class com.android.volley.toolbox.BasicAsyncNetwork.ResponseParsingTask (com.android.volley.toolbox.BasicAsyncNetwork$ResponseParsingTask)
.class Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;
.super Lcom/android/volley/RequestTask;
.source "BasicAsyncNetwork.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/BasicAsyncNetwork;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResponseParsingTask"
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
.field callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

.field httpResponse:Lcom/android/volley/toolbox/HttpResponse;

.field inputStream:Ljava/io/InputStream;

.field request:Lcom/android/volley/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Request<",
            "TT;>;"
        }
    .end annotation
.end field

.field requestStartMs:J

.field responseHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;"
        }
    .end annotation
.end field

.field statusCode:I

.field final synthetic this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/BasicAsyncNetwork;Ljava/io/InputStream;Lcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;JLjava/util/List;I)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "Lcom/android/volley/Request<",
            "TT;>;",
            "Lcom/android/volley/AsyncNetwork$OnRequestComplete;",
            "J",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;I)V"
        }
    .end annotation

    .line 256
    iput-object p1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    .line 257
    invoke-direct {p0, p4}, Lcom/android/volley/RequestTask;-><init>(Lcom/android/volley/Request;)V

    .line 258
    iput-object p2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->inputStream:Ljava/io/InputStream;

    .line 259
    iput-object p3, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    .line 260
    iput-object p4, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->request:Lcom/android/volley/Request;

    .line 261
    iput-object p5, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    .line 262
    iput-wide p6, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->requestStartMs:J

    .line 263
    iput-object p8, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->responseHeaders:Ljava/util/List;

    .line 264
    iput p9, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->statusCode:I

    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .line 271
    :try_start_0
    iget-object v0, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->inputStream:Ljava/io/InputStream;

    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    .line 273
    invoke-virtual {v1}, Lcom/android/volley/toolbox/HttpResponse;->getContentLength()I

    move-result v1

    iget-object v2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    invoke-static {v2}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->access$200(Lcom/android/volley/toolbox/BasicAsyncNetwork;)Lcom/android/volley/toolbox/ByteArrayPool;

    move-result-object v2

    .line 272
    invoke-static {v0, v1, v2}, Lcom/android/volley/toolbox/NetworkUtility;->inputStreamToBytes(Ljava/io/InputStream;ILcom/android/volley/toolbox/ByteArrayPool;)[B

    move-result-object v11
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_12} :catch_24

    .line 278
    iget-object v3, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iget-wide v4, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->requestStartMs:J

    iget v6, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->statusCode:I

    iget-object v7, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    iget-object v8, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->request:Lcom/android/volley/Request;

    iget-object v9, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    iget-object v10, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->responseHeaders:Ljava/util/List;

    invoke-static/range {v3 .. v11}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->access$300(Lcom/android/volley/toolbox/BasicAsyncNetwork;JILcom/android/volley/toolbox/HttpResponse;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/util/List;[B)V

    return-void

    :catch_24
    move-exception v0

    move-object v4, v0

    .line 275
    iget-object v1, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->this$0:Lcom/android/volley/toolbox/BasicAsyncNetwork;

    iget-object v2, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->request:Lcom/android/volley/Request;

    iget-object v3, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->callback:Lcom/android/volley/AsyncNetwork$OnRequestComplete;

    iget-wide v5, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->requestStartMs:J

    iget-object v7, p0, Lcom/android/volley/toolbox/BasicAsyncNetwork$ResponseParsingTask;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    const/4 v8, 0x0

    invoke-static/range {v1 .. v8}, Lcom/android/volley/toolbox/BasicAsyncNetwork;->access$100(Lcom/android/volley/toolbox/BasicAsyncNetwork;Lcom/android/volley/Request;Lcom/android/volley/AsyncNetwork$OnRequestComplete;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)V

    return-void
.end method
