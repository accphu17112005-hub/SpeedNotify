###### Class com.android.volley.toolbox.NetworkUtility (com.android.volley.toolbox.NetworkUtility)
.class final Lcom/android/volley/toolbox/NetworkUtility;
.super Ljava/lang/Object;
.source "NetworkUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    }
.end annotation


# static fields
.field private static final SLOW_REQUEST_THRESHOLD_MS:I = 0xbb8


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static attemptRetryOnException(Lcom/android/volley/Request;Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 125
    invoke-virtual {p0}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object v0

    .line 126
    invoke-virtual {p0}, Lcom/android/volley/Request;->getTimeoutMs()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    .line 128
    :try_start_b
    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->access$000(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Lcom/android/volley/VolleyError;

    move-result-object v5

    invoke-interface {v0, v5}, Lcom/android/volley/RetryPolicy;->retry(Lcom/android/volley/VolleyError;)V
    :try_end_12
    .catch Lcom/android/volley/VolleyError; {:try_start_b .. :try_end_12} :catch_2a

    new-array v0, v4, [Ljava/lang/Object;

    .line 135
    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->access$100(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v2

    const-string p1, "%s-retry [timeout=%s]"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    return-void

    :catch_2a
    move-exception v0

    new-array v4, v4, [Ljava/lang/Object;

    .line 132
    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->access$100(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v2

    const-string p1, "%s-timeout-giveup [timeout=%s]"

    .line 131
    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 130
    invoke-virtual {p0, p1}, Lcom/android/volley/Request;->addMarker(Ljava/lang/String;)V

    .line 133
    throw v0
.end method

.method static getNotModifiedNetworkResponse(Lcom/android/volley/Request;JLjava/util/List;)Lcom/android/volley/NetworkResponse;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;J",
            "Ljava/util/List<",
            "Lcom/android/volley/Header;",
            ">;)",
            "Lcom/android/volley/NetworkResponse;"
        }
    .end annotation

    .line 67
    invoke-virtual {p0}, Lcom/android/volley/Request;->getCacheEntry()Lcom/android/volley/Cache$Entry;

    move-result-object p0

    if-nez p0, :cond_13

    .line 69
    new-instance p0, Lcom/android/volley/NetworkResponse;

    const/16 v1, 0x130

    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object v0, p0

    move-wide v4, p1

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object p0

    .line 77
    :cond_13
    invoke-static {p3, p0}, Lcom/android/volley/toolbox/HttpHeaderParser;->combineHeaders(Ljava/util/List;Lcom/android/volley/Cache$Entry;)Ljava/util/List;

    move-result-object v10

    .line 78
    new-instance p3, Lcom/android/volley/NetworkResponse;

    const/16 v5, 0x130

    iget-object v6, p0, Lcom/android/volley/Cache$Entry;->data:[B

    const/4 v7, 0x1

    move-object v4, p3

    move-wide v8, p1

    invoke-direct/range {v4 .. v10}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    return-object p3
.end method

.method static inputStreamToBytes(Ljava/io/InputStream;ILcom/android/volley/toolbox/ByteArrayPool;)[B
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Error occurred when closing InputStream"

    .line 89
    new-instance v1, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;

    invoke-direct {v1, p2, p1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;-><init>(Lcom/android/volley/toolbox/ByteArrayPool;I)V

    const/16 p1, 0x400

    const/4 v2, 0x0

    .line 92
    :try_start_a
    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/ByteArrayPool;->getBuf(I)[B

    move-result-object p1
    :try_end_e
    .catchall {:try_start_a .. :try_end_e} :catchall_31

    .line 94
    :goto_e
    :try_start_e
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_19

    .line 95
    invoke-virtual {v1, p1, v2, v3}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->write([BII)V

    goto :goto_e

    .line 97
    :cond_19
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_1d
    .catchall {:try_start_e .. :try_end_1d} :catchall_2f

    if-eqz p0, :cond_28

    .line 102
    :try_start_1f
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_22} :catch_23

    goto :goto_28

    :catch_23
    new-array p0, v2, [Ljava/lang/Object;

    .line 107
    invoke-static {v0, p0}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 109
    :cond_28
    :goto_28
    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 110
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    return-object v3

    :catchall_2f
    move-exception v3

    goto :goto_33

    :catchall_31
    move-exception v3

    const/4 p1, 0x0

    :goto_33
    if-eqz p0, :cond_3e

    .line 102
    :try_start_35
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_39

    goto :goto_3e

    :catch_39
    new-array p0, v2, [Ljava/lang/Object;

    .line 107
    invoke-static {v0, p0}, Lcom/android/volley/VolleyLog;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 109
    :cond_3e
    :goto_3e
    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/ByteArrayPool;->returnBuf([B)V

    .line 110
    invoke-virtual {v1}, Lcom/android/volley/toolbox/PoolingByteArrayOutputStream;->close()V

    throw v3
.end method

.method static logSlowRequests(JLcom/android/volley/Request;[BI)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/android/volley/Request<",
            "*>;[BI)V"
        }
    .end annotation

    .line 53
    sget-boolean v0, Lcom/android/volley/VolleyLog;->DEBUG:Z

    if-nez v0, :cond_a

    const-wide/16 v0, 0xbb8

    cmp-long v2, p0, v0

    if-lez v2, :cond_3f

    :cond_a
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const/4 v1, 0x1

    .line 58
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    aput-object p0, v0, v1

    const/4 p0, 0x2

    if-eqz p3, :cond_20

    .line 59
    array-length p1, p3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_22

    :cond_20
    const-string p1, "null"

    :goto_22
    aput-object p1, v0, p0

    const/4 p0, 0x3

    .line 60
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p0

    const/4 p0, 0x4

    .line 61
    invoke-virtual {p2}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/volley/RetryPolicy;->getCurrentRetryCount()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, p0

    const-string p0, "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]"

    .line 54
    invoke-static {p0, v0}, Lcom/android/volley/VolleyLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3f
    return-void
.end method

.method static shouldRetryException(Lcom/android/volley/Request;Ljava/io/IOException;JLcom/android/volley/toolbox/HttpResponse;[B)Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;",
            "Ljava/io/IOException;",
            "J",
            "Lcom/android/volley/toolbox/HttpResponse;",
            "[B)",
            "Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/VolleyError;
        }
    .end annotation

    .line 161
    instance-of v0, p1, Ljava/net/SocketTimeoutException;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    .line 162
    new-instance p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance p1, Lcom/android/volley/TimeoutError;

    invoke-direct {p1}, Lcom/android/volley/TimeoutError;-><init>()V

    const-string p2, "socket"

    invoke-direct {p0, p2, p1, v1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object p0

    .line 163
    :cond_12
    instance-of v0, p1, Ljava/net/MalformedURLException;

    if-nez v0, :cond_b3

    if-eqz p4, :cond_9a

    .line 168
    invoke-virtual {p4}, Lcom/android/volley/toolbox/HttpResponse;->getStatusCode()I

    move-result p1

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 175
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    const-string v2, "Unexpected response code %d for %s"

    invoke-static {v2, v0}, Lcom/android/volley/VolleyLog;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p5, :cond_8d

    .line 179
    invoke-virtual {p4}, Lcom/android/volley/toolbox/HttpResponse;->getHeaders()Ljava/util/List;

    move-result-object v8

    .line 180
    new-instance p4, Lcom/android/volley/NetworkResponse;

    const/4 v5, 0x0

    .line 185
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long v6, v2, p2

    move-object v2, p4

    move v3, p1

    move-object v4, p5

    invoke-direct/range {v2 .. v8}, Lcom/android/volley/NetworkResponse;-><init>(I[BZJLjava/util/List;)V

    const/16 p2, 0x191

    if-eq p1, p2, :cond_80

    const/16 p2, 0x193

    if-ne p1, p2, :cond_50

    goto :goto_80

    :cond_50
    const/16 p2, 0x190

    if-lt p1, p2, :cond_5f

    const/16 p2, 0x1f3

    if-le p1, p2, :cond_59

    goto :goto_5f

    .line 193
    :cond_59
    new-instance p0, Lcom/android/volley/ClientError;

    invoke-direct {p0, p4}, Lcom/android/volley/ClientError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw p0

    :cond_5f
    :goto_5f
    const/16 p2, 0x1f4

    if-lt p1, p2, :cond_7a

    const/16 p2, 0x257

    if-gt p1, p2, :cond_7a

    .line 196
    invoke-virtual {p0}, Lcom/android/volley/Request;->shouldRetryServerErrors()Z

    move-result p0

    if-eqz p0, :cond_7a

    .line 197
    new-instance p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance p1, Lcom/android/volley/ServerError;

    invoke-direct {p1, p4}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    const-string p2, "server"

    invoke-direct {p0, p2, p1, v1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object p0

    .line 201
    :cond_7a
    new-instance p0, Lcom/android/volley/ServerError;

    invoke-direct {p0, p4}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    throw p0

    .line 189
    :cond_80
    :goto_80
    new-instance p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance p1, Lcom/android/volley/AuthFailureError;

    invoke-direct {p1, p4}, Lcom/android/volley/AuthFailureError;-><init>(Lcom/android/volley/NetworkResponse;)V

    const-string p2, "auth"

    invoke-direct {p0, p2, p1, v1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object p0

    .line 203
    :cond_8d
    new-instance p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance p1, Lcom/android/volley/NetworkError;

    invoke-direct {p1}, Lcom/android/volley/NetworkError;-><init>()V

    const-string p2, "network"

    invoke-direct {p0, p2, p1, v1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object p0

    .line 170
    :cond_9a
    invoke-virtual {p0}, Lcom/android/volley/Request;->shouldRetryConnectionErrors()Z

    move-result p0

    if-eqz p0, :cond_ad

    .line 171
    new-instance p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;

    new-instance p1, Lcom/android/volley/NoConnectionError;

    invoke-direct {p1}, Lcom/android/volley/NoConnectionError;-><init>()V

    const-string p2, "connection"

    invoke-direct {p0, p2, p1, v1}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V

    return-object p0

    .line 173
    :cond_ad
    new-instance p0, Lcom/android/volley/NoConnectionError;

    invoke-direct {p0, p1}, Lcom/android/volley/NoConnectionError;-><init>(Ljava/lang/Throwable;)V

    throw p0

    .line 164
    :cond_b3
    new-instance p2, Ljava/lang/RuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Bad URL "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

###### Class com.android.volley.toolbox.NetworkUtility.AnonymousClass1 (com.android.volley.toolbox.NetworkUtility$1)
.class synthetic Lcom/android/volley/toolbox/NetworkUtility$1;
.super Ljava/lang/Object;
.source "NetworkUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/NetworkUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation

###### Class com.android.volley.toolbox.NetworkUtility.RetryInfo (com.android.volley.toolbox.NetworkUtility$RetryInfo)
.class Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;
.super Ljava/lang/Object;
.source "NetworkUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/toolbox/NetworkUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RetryInfo"
.end annotation


# instance fields
.field private final errorToRetry:Lcom/android/volley/VolleyError;

.field private final logPrefix:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .registers 3

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->logPrefix:Ljava/lang/String;

    .line 144
    iput-object p2, p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->errorToRetry:Lcom/android/volley/VolleyError;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/android/volley/VolleyError;Lcom/android/volley/toolbox/NetworkUtility$1;)V
    .registers 4

    .line 138
    invoke-direct {p0, p1, p2}, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;-><init>(Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Lcom/android/volley/VolleyError;
    .registers 1

    .line 138
    iget-object p0, p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->errorToRetry:Lcom/android/volley/VolleyError;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;)Ljava/lang/String;
    .registers 1

    .line 138
    iget-object p0, p0, Lcom/android/volley/toolbox/NetworkUtility$RetryInfo;->logPrefix:Ljava/lang/String;

    return-object p0
.end method
