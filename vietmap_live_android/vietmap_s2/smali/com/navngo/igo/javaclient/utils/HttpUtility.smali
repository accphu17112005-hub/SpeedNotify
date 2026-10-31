###### Class com.navngo.igo.javaclient.utils.HttpUtility (com.navngo.igo.javaclient.utils.HttpUtility)
.class public final Lcom/navngo/igo/javaclient/utils/HttpUtility;
.super Ljava/lang/Object;
.source "HttpUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "HttpUtility"


# instance fields
.field private failCount:I

.field private final httpLock:Ljava/lang/String;

.field private httpRequestThread:Ljava/lang/Thread;

.field private final requestQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private stopRequestThread:Z

.field private successCount:I


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpRequestThread:Ljava/lang/Thread;

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->stopRequestThread:Z

    .line 28
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->requestQueue:Ljava/util/Queue;

    .line 29
    new-instance v1, Ljava/lang/String;

    const-string v2, "httpLock"

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpLock:Ljava/lang/String;

    .line 30
    iput v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->successCount:I

    iput v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->failCount:I

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Z
    .registers 1

    .line 22
    iget-boolean p0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->stopRequestThread:Z

    return p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Ljava/lang/String;
    .registers 1

    .line 22
    iget-object p0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpLock:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Ljava/util/Queue;
    .registers 1

    .line 22
    iget-object p0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->requestQueue:Ljava/util/Queue;

    return-object p0
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I
    .registers 1

    .line 22
    iget p0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->successCount:I

    return p0
.end method

.method static synthetic access$308(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I
    .registers 3

    .line 22
    iget v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->successCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->successCount:I

    return v0
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I
    .registers 1

    .line 22
    iget p0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->failCount:I

    return p0
.end method

.method static synthetic access$408(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I
    .registers 3

    .line 22
    iget v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->failCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->failCount:I

    return v0
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpLock:Ljava/lang/String;

    monitor-enter v0

    const/4 v1, 0x1

    .line 71
    :try_start_4
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->stopRequestThread:Z

    .line 72
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpRequestThread:Ljava/lang/Thread;

    if-eqz v1, :cond_d

    .line 73
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 74
    :cond_d
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpLock:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 75
    monitor-exit v0

    return-void

    :catchall_14
    move-exception v1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_4 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public getHttpRequest(Ljava/lang/String;[BLjava/lang/String;I)V
    .registers 14

    .line 39
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpLock:Ljava/lang/String;

    monitor-enter v0

    .line 40
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->requestQueue:Ljava/util/Queue;

    new-instance v8, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;

    move-object v2, v8

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;-><init>(Lcom/navngo/igo/javaclient/utils/HttpUtility;Ljava/lang/String;[BLjava/lang/String;I)V

    invoke-interface {v1, v8}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpRequestThread:Ljava/lang/Thread;

    if-nez p1, :cond_23

    .line 42
    new-instance p1, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;

    const-string p2, "httpRequestThread"

    invoke-direct {p1, p0, p2}, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;-><init>(Lcom/navngo/igo/javaclient/utils/HttpUtility;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpRequestThread:Ljava/lang/Thread;

    .line 63
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 65
    :cond_23
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility;->httpLock:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 66
    monitor-exit v0

    return-void

    :catchall_2a
    move-exception p1

    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_2a

    throw p1
.end method

###### Class com.navngo.igo.javaclient.utils.HttpUtility.AnonymousClass1 (com.navngo.igo.javaclient.utils.HttpUtility$1)
.class Lcom/navngo/igo/javaclient/utils/HttpUtility$1;
.super Ljava/lang/Thread;
.source "HttpUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/utils/HttpUtility;->getHttpRequest(Ljava/lang/String;[BLjava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/utils/HttpUtility;Ljava/lang/String;)V
    .registers 3

    .line 42
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 46
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$000(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$100(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0

    .line 49
    :try_start_f
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$200(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Ljava/util/Queue;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;
    :try_end_1b
    .catchall {:try_start_f .. :try_end_1b} :catchall_2d

    if-nez v1, :cond_26

    .line 52
    :try_start_1d
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$1;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$100(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_26
    .catch Ljava/lang/InterruptedException; {:try_start_1d .. :try_end_26} :catch_26
    .catchall {:try_start_1d .. :try_end_26} :catchall_2d

    .line 56
    :catch_26
    :cond_26
    :try_start_26
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_2d

    if-eqz v1, :cond_0

    .line 58
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :catchall_2d
    move-exception v1

    .line 56
    :try_start_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2d

    throw v1

    :cond_30
    return-void
.end method

###### Class com.navngo.igo.javaclient.utils.HttpUtility.HttpRequestRunnable (com.navngo.igo.javaclient.utils.HttpUtility$HttpRequestRunnable)
.class final Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;
.super Ljava/lang/Object;
.source "HttpUtility.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/HttpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "HttpRequestRunnable"
.end annotation


# instance fields
.field private final contentType:Ljava/lang/String;

.field private final engineIndex:I

.field private is:Ljava/io/InputStream;

.field private final postData:[B

.field private final requestHandle:I

.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

.field private final url:Ljava/lang/String;

.field private urlConnection:Ljava/net/URLConnection;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/utils/HttpUtility;Ljava/lang/String;[BLjava/lang/String;I)V
    .registers 6

    .line 89
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 85
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    .line 86
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->is:Ljava/io/InputStream;

    .line 87
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getEngineIndex()I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->engineIndex:I

    .line 90
    iput p5, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    .line 91
    iput-object p2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->url:Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->postData:[B

    .line 93
    iput-object p4, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->contentType:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$500(Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;)I
    .registers 1

    .line 78
    iget p0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    return p0
.end method

.method private disconnect()V
    .registers 4

    .line 172
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->is:Ljava/io/InputStream;

    if-eqz v0, :cond_2d

    .line 173
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_2d

    :catch_8
    move-exception v0

    .line 176
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]: disconnect: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HttpUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2d
    :goto_2d
    return-void
.end method

.method private reportRequest(I[B)V
    .registers 5

    if-lez p1, :cond_8

    .line 150
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$308(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I

    goto :goto_d

    .line 153
    :cond_8
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$408(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I

    .line 155
    :goto_d
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$100(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Ljava/lang/String;

    move-result-object v0

    monitor-enter v0

    .line 156
    :try_start_14
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$000(Lcom/navngo/igo/javaclient/utils/HttpUtility;)Z

    move-result v1

    if-eqz v1, :cond_3b

    const-string p1, "HttpUtility"

    .line 157
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]: dropping result, closing"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    monitor-exit v0

    return-void

    .line 160
    :cond_3b
    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_14 .. :try_end_3c} :catchall_93

    .line 161
    new-instance v0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;

    invoke-direct {v0, p0, p2, p1}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;-><init>(Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;[BI)V

    iget p2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->engineIndex:I

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/ServerRunner;->callNNG(Ljava/lang/Runnable;I)V

    const-string p2, "HttpUtility"

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]: NNG.putHttpBuffer: dataLength = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "HttpUtility"

    .line 167
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$300(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " HTTP requests succeeded of "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$300(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I

    move-result v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->this$0:Lcom/navngo/igo/javaclient/utils/HttpUtility;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/HttpUtility;->access$400(Lcom/navngo/igo/javaclient/utils/HttpUtility;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_93
    move-exception p1

    .line 160
    :try_start_94
    monitor-exit v0
    :try_end_95
    .catchall {:try_start_94 .. :try_end_95} :catchall_93

    throw p1
.end method

.method private tryconnect()Z
    .registers 8

    const-string v0, "UTF-8"

    const-string v1, "HttpUtility"

    .line 99
    :try_start_4
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->url:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    iput-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    .line 100
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->postData:[B

    const/4 v3, 0x1

    if-eqz v2, :cond_7e

    array-length v4, v2

    if-lez v4, :cond_7e

    .line 102
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v2, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 103
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    invoke-virtual {v2, v3}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 104
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    const-string v5, "METHOD"

    const-string v6, "POST"

    invoke-virtual {v2, v5, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    const-string v5, "Content-Type"

    iget-object v6, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->contentType:Ljava/lang/String;

    invoke-virtual {v2, v5, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    const-string v5, "Content-Length"

    invoke-virtual {v4, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v5, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    new-instance v0, Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    invoke-virtual {v2}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 109
    invoke-virtual {v0, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 110
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "HTTP/POST "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->url:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " type= "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->contentType:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " POST:\'"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->flush()V

    .line 113
    :cond_7e
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->urlConnection:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->is:Ljava/io/InputStream;
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_86} :catch_87

    return v3

    :catch_87
    move-exception v0

    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]: tryconnect: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "url:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->url:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " postData.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->postData:[B

    if-nez v3, :cond_c4

    const/4 v3, -0x1

    goto :goto_c5

    :cond_c4
    array-length v3, v3

    :goto_c5
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 119
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 120
    invoke-virtual {v0, v3}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 121
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->disconnect()V

    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Start HTTP ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HttpUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->tryconnect()Z

    move-result v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_63

    .line 134
    :try_start_2a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->is:Ljava/io/InputStream;

    const/16 v4, 0x1000

    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readInputStream(Ljava/io/InputStream;I)[B

    move-result-object v3
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_32} :catch_38
    .catchall {:try_start_2a .. :try_end_32} :catchall_36

    .line 139
    :goto_32
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->disconnect()V

    goto :goto_63

    :catchall_36
    move-exception v0

    goto :goto_5f

    :catch_38
    move-exception v0

    .line 136
    :try_start_39
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->requestHandle:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "]: on reading:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    invoke-direct {p0, v2, v3}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->reportRequest(I[B)V
    :try_end_5e
    .catchall {:try_start_39 .. :try_end_5e} :catchall_36

    goto :goto_32

    .line 139
    :goto_5f
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->disconnect()V

    .line 140
    throw v0

    :cond_63
    :goto_63
    if-nez v3, :cond_66

    goto :goto_67

    .line 143
    :cond_66
    array-length v2, v3

    .line 145
    :goto_67
    invoke-direct {p0, v2, v3}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->reportRequest(I[B)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.utils.HttpUtility.HttpRequestRunnable.AnonymousClass1 (com.navngo.igo.javaclient.utils.HttpUtility$HttpRequestRunnable$1)
.class Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;
.super Ljava/lang/Object;
.source "HttpUtility.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->reportRequest(I[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;

.field final synthetic val$content:[B

.field final synthetic val$dataLength:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;[BI)V
    .registers 4

    .line 161
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;->this$1:Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;->val$content:[B

    iput p3, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;->val$dataLength:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 163
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;->this$1:Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;->access$500(Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable;)I

    move-result v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;->val$content:[B

    iget v2, p0, Lcom/navngo/igo/javaclient/utils/HttpUtility$HttpRequestRunnable$1;->val$dataLength:I

    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/NNG;->putHttpBuffer(I[BI)V

    return-void
.end method
