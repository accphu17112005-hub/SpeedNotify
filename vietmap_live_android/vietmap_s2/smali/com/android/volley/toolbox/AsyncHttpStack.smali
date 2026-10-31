###### Class com.android.volley.toolbox.AsyncHttpStack (com.android.volley.toolbox.AsyncHttpStack)
.class public abstract Lcom/android/volley/toolbox/AsyncHttpStack;
.super Lcom/android/volley/toolbox/BaseHttpStack;
.source "AsyncHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/AsyncHttpStack$Response;,
        Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;
    }
.end annotation


# instance fields
.field private mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

.field private mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Lcom/android/volley/toolbox/BaseHttpStack;-><init>()V

    return-void
.end method


# virtual methods
.method public final executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/android/volley/toolbox/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 105
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 106
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 107
    new-instance v2, Lcom/android/volley/toolbox/AsyncHttpStack$1;

    invoke-direct {v2, p0, v1, v0}, Lcom/android/volley/toolbox/AsyncHttpStack$1;-><init>(Lcom/android/volley/toolbox/AsyncHttpStack;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {p0, p1, p2, v2}, Lcom/android/volley/toolbox/AsyncHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V

    .line 145
    :try_start_13
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_16} :catch_2d

    .line 151
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    .line 152
    iget-object p2, p1, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    if-eqz p2, :cond_23

    .line 153
    iget-object p1, p1, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    return-object p1

    .line 154
    :cond_23
    iget-object p2, p1, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->ioException:Ljava/io/IOException;

    if-eqz p2, :cond_2a

    .line 155
    iget-object p1, p1, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->ioException:Ljava/io/IOException;

    throw p1

    .line 157
    :cond_2a
    iget-object p1, p1, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->authFailureError:Lcom/android/volley/AuthFailureError;

    throw p1

    :catch_2d
    move-exception p1

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Object;

    const-string v0, "while waiting for CountDownLatch"

    .line 147
    invoke-static {p1, v0, p2}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 148
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->interrupt()V

    .line 149
    new-instance p2, Ljava/io/InterruptedIOException;

    invoke-virtual {p1}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public abstract executeRequest(Lcom/android/volley/Request;Ljava/util/Map;Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;",
            ")V"
        }
    .end annotation
.end method

.method protected getBlockingExecutor()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .line 83
    iget-object v0, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method protected getNonBlockingExecutor()Ljava/util/concurrent/ExecutorService;
    .registers 2

    .line 88
    iget-object v0, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method public setBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .registers 2

    .line 78
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public setNonBlockingExecutor(Ljava/util/concurrent/ExecutorService;)V
    .registers 2

    .line 69
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack;->mNonBlockingExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

###### Class com.android.volley.toolbox.AsyncHttpStack.AnonymousClass1 (com.android.volley.toolbox.AsyncHttpStack$1)
.class Lcom/android/volley/toolbox/AsyncHttpStack$1;
.super Ljava/lang/Object;
.source "AsyncHttpStack.java"

# interfaces
.implements Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/AsyncHttpStack;->executeRequest(Lcom/android/volley/Request;Ljava/util/Map;)Lcom/android/volley/toolbox/HttpResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/toolbox/AsyncHttpStack;

.field final synthetic val$entry:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/AsyncHttpStack;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V
    .registers 4

    .line 110
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->this$0:Lcom/android/volley/toolbox/AsyncHttpStack;

    iput-object p2, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAuthError(Lcom/android/volley/AuthFailureError;)V
    .registers 4

    .line 124
    new-instance v0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, p1, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V

    .line 129
    iget-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 130
    iget-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

.method public onError(Ljava/io/IOException;)V
    .registers 4

    .line 135
    new-instance v0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, v1, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V

    .line 140
    iget-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 141
    iget-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

.method public onSuccess(Lcom/android/volley/toolbox/HttpResponse;)V
    .registers 4

    .line 113
    new-instance v0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, v1, v1}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V

    .line 118
    iget-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$entry:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 119
    iget-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method

###### Class com.android.volley.toolbox.AsyncHttpStack.OnRequestComplete (com.android.volley.toolbox.AsyncHttpStack$OnRequestComplete)
.class public interface abstract Lcom/android/volley/toolbox/AsyncHttpStack$OnRequestComplete;
.super Ljava/lang/Object;
.source "AsyncHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/AsyncHttpStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnRequestComplete"
.end annotation


# virtual methods
.method public abstract onAuthError(Lcom/android/volley/AuthFailureError;)V
.end method

.method public abstract onError(Ljava/io/IOException;)V
.end method

.method public abstract onSuccess(Lcom/android/volley/toolbox/HttpResponse;)V
.end method

###### Class com.android.volley.toolbox.AsyncHttpStack.Response (com.android.volley.toolbox.AsyncHttpStack$Response)
.class Lcom/android/volley/toolbox/AsyncHttpStack$Response;
.super Ljava/lang/Object;
.source "AsyncHttpStack.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/AsyncHttpStack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Response"
.end annotation


# instance fields
.field authFailureError:Lcom/android/volley/AuthFailureError;

.field httpResponse:Lcom/android/volley/toolbox/HttpResponse;

.field ioException:Ljava/io/IOException;


# direct methods
.method private constructor <init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;)V
    .registers 4

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iput-object p1, p0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->httpResponse:Lcom/android/volley/toolbox/HttpResponse;

    .line 171
    iput-object p2, p0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->ioException:Ljava/io/IOException;

    .line 172
    iput-object p3, p0, Lcom/android/volley/toolbox/AsyncHttpStack$Response;->authFailureError:Lcom/android/volley/AuthFailureError;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;Lcom/android/volley/toolbox/AsyncHttpStack$1;)V
    .registers 5

    .line 161
    invoke-direct {p0, p1, p2, p3}, Lcom/android/volley/toolbox/AsyncHttpStack$Response;-><init>(Lcom/android/volley/toolbox/HttpResponse;Ljava/io/IOException;Lcom/android/volley/AuthFailureError;)V

    return-void
.end method
