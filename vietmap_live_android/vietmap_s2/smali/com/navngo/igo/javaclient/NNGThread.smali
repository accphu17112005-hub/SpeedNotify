###### Class com.navngo.igo.javaclient.NNGThread (com.navngo.igo.javaclient.NNGThread)
.class public final Lcom/navngo/igo/javaclient/NNGThread;
.super Ljava/lang/Object;
.source "NNGThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field static framePointers:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final logname:Ljava/lang/String; = "NNGThread"


# instance fields
.field private mCallback:J

.field private mName:Ljava/lang/String;

.field private mPriority:I

.field private mRunningCallback:Z

.field private mStackSize:J

.field private mThread:Ljava/lang/Thread;

.field private mTid:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 113
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/NNGThread;->framePointers:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(J)V
    .registers 5

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 21
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mCallback:J

    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mTid:I

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mPriority:I

    .line 24
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mRunningCallback:Z

    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    const-string v0, "iGO daemon"

    .line 28
    iput-object v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mName:Ljava/lang/String;

    .line 32
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mStackSize:J

    return-void
.end method

.method public static GetFramePointers()[J
    .registers 13

    .line 125
    sget-object v0, Lcom/navngo/igo/javaclient/NNGThread;->framePointers:Ljava/util/Map;

    monitor-enter v0

    .line 127
    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->activeCount()I

    move-result v1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    :cond_9
    const/4 v3, 0x2

    mul-int/lit8 v1, v1, 0x2

    .line 132
    new-array v4, v1, [Ljava/lang/Thread;

    .line 133
    invoke-static {v4}, Ljava/lang/Thread;->enumerate([Ljava/lang/Thread;)I

    move-result v5

    if-ge v5, v1, :cond_9

    .line 136
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1, v5}, Ljava/util/HashSet;-><init>(I)V

    move v6, v5

    :goto_1a
    add-int/lit8 v7, v6, -0x1

    if-lez v6, :cond_2d

    .line 138
    aget-object v6, v4, v7

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move v6, v7

    goto :goto_1a

    .line 140
    :cond_2d
    new-instance v4, Ljava/util/Vector;

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v4, v5}, Ljava/util/Vector;-><init>(I)V

    .line 141
    sget-object v5, Lcom/navngo/igo/javaclient/NNGThread;->framePointers:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3e
    :goto_3e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    .line 142
    sget-object v7, Lcom/navngo/igo/javaclient/NNGThread;->framePointers:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 143
    invoke-interface {v1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    if-nez v8, :cond_79

    if-eqz v7, :cond_3e

    const-string v8, "NNGThread"

    .line 145
    move-object v11, v10

    check-cast v11, Ljava/util/Locale;

    const-string v11, "Saved fp = 0x%08x  for nonexistent thread %d"

    new-array v12, v3, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v12, v9

    aput-object v6, v12, v2

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3e

    :cond_79
    if-nez v7, :cond_7c

    goto :goto_3e

    .line 150
    :cond_7c
    invoke-virtual {v4, v6}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    int-to-long v11, v7

    .line 151
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    const-string v8, "NNGThread"

    .line 152
    move-object v11, v10

    check-cast v11, Ljava/util/Locale;

    const-string v11, "GetFramePointers: threadid = %d fp = 0x%08x"

    new-array v12, v3, [Ljava/lang/Object;

    aput-object v6, v12, v9

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v12, v2

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3e

    .line 155
    :cond_a0
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v2, v1, [J

    :goto_a6
    add-int/lit8 v3, v1, -0x1

    if-lez v1, :cond_b8

    .line 157
    invoke-virtual {v4, v3}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    aput-wide v5, v2, v3

    move v1, v3

    goto :goto_a6

    .line 159
    :cond_b8
    monitor-exit v0

    return-object v2

    :catchall_ba
    move-exception v1

    .line 160
    monitor-exit v0
    :try_end_bc
    .catchall {:try_start_3 .. :try_end_bc} :catchall_ba

    throw v1
.end method

.method public static SaveFramePointer(I)V
    .registers 5

    .line 117
    sget-object v0, Lcom/navngo/igo/javaclient/NNGThread;->framePointers:Ljava/util/Map;

    monitor-enter v0

    .line 118
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/NNGThread;->framePointers:Ljava/util/Map;

    invoke-static {}, Lcom/navngo/igo/javaclient/NNGThread;->getCurrentThreadId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v1, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    monitor-exit v0

    return-void

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw p0
.end method

.method public static getCurrentThreadId()J
    .registers 2

    .line 110
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public join()V
    .registers 4

    .line 86
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_e

    :catch_6
    move-exception v0

    const-string v1, "NNGThread"

    const-string v2, "Exception in NNGThread.join: "

    .line 88
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_e
    return-void
.end method

.method public join(J)V
    .registers 4

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0, p1, p2}, Ljava/lang/Thread;->join(J)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_e

    :catch_6
    move-exception p1

    const-string p2, "NNGThread"

    const-string v0, "Exception in NNGThread.join: "

    .line 97
    invoke-static {p2, v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_e
    return-void
.end method

.method public run()V
    .registers 6

    .line 57
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mCallback:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1e

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1e

    const/4 v0, 0x1

    .line 58
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mRunningCallback:Z

    .line 59
    iget v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mPriority:I

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/NNGThread;->setThreadPriority(I)V

    .line 60
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mCallback:J

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/NNG;->callFunctor(J)V

    const/4 v0, 0x0

    .line 61
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mRunningCallback:Z

    :cond_1e
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3

    .line 103
    iput-object p1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mName:Ljava/lang/String;

    .line 104
    iget-object v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_9

    .line 105
    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method public setThreadPriority(I)V
    .registers 7

    const-string v0, "NNGThread"

    .line 69
    :try_start_2
    iput p1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mPriority:I

    .line 70
    iget-object v1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    if-nez v1, :cond_c

    iget v1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mTid:I

    int-to-long v1, v1

    goto :goto_10

    :cond_c
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v1

    .line 71
    :goto_10
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setThreadPriority: th="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " pri="

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/NNGThread;->mRunningCallback:Z

    if-eqz v2, :cond_36

    .line 73
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget v1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mTid:I

    invoke-static {v1, p1}, Landroid/os/Process;->setThreadPriority(II)V

    goto :goto_51

    .line 76
    :cond_36
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " delayed"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4a} :catch_4b

    goto :goto_51

    :catch_4b
    move-exception p1

    const-string v1, "Exception in NNGThread.setThreadPriority: "

    .line 79
    invoke-static {v0, v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_51
    return-void
.end method

.method public declared-synchronized start(J)V
    .registers 10

    monitor-enter p0

    .line 39
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_14

    const-string p1, "NNGThread"

    const-string p2, "Error: someone was trying to start a thread that is already running."

    .line 40
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_35

    .line 41
    monitor-exit p0

    return-void

    .line 44
    :cond_14
    :try_start_14
    new-instance v6, Ljava/lang/Thread;

    const/4 v1, 0x0

    iget-object v3, p0, Lcom/navngo/igo/javaclient/NNGThread;->mName:Ljava/lang/String;

    iget-wide v4, p0, Lcom/navngo/igo/javaclient/NNGThread;->mStackSize:J

    move-object v0, v6

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;J)V

    iput-object v6, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    const/4 v0, 0x1

    .line 45
    invoke-virtual {v6, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 48
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mCallback:J

    .line 49
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mTid:I

    .line 50
    iget-object p1, p0, Lcom/navngo/igo/javaclient/NNGThread;->mThread:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V
    :try_end_33
    .catchall {:try_start_14 .. :try_end_33} :catchall_35

    .line 52
    monitor-exit p0

    return-void

    :catchall_35
    move-exception p1

    monitor-exit p0

    throw p1
.end method
