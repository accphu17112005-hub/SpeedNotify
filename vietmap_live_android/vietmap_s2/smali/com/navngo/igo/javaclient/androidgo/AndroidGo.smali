###### Class com.navngo.igo.javaclient.androidgo.AndroidGo (com.navngo.igo.javaclient.androidgo.AndroidGo)
.class public Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.super Ljava/lang/Object;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;,
        Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "com.navngo.igo.javaclient.androidgo.AndroidGo"

.field private static sInstance:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;


# instance fields
.field private mActions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

.field private mFunctors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;",
            ">;"
        }
    .end annotation
.end field

.field private mIgoMainThreadTasks:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .line 404
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 587
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mIgoMainThreadTasks:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 405
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mActions:Ljava/util/List;

    .line 406
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mFunctors:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;[Ljava/lang/Object;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->buildArgsBuffer([Ljava/lang/Object;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .registers 1

    .line 43
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->logname:Ljava/lang/String;

    return-object v0
.end method

.method private addTaskToCurrentBatch()V
    .registers 2

    .line 436
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    if-eqz v0, :cond_7

    .line 437
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/Batch;->startTask()V

    :cond_7
    return-void
.end method

.method private varargs buildArgsBuffer([Ljava/lang/Object;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 459
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x4

    add-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>(I)V

    .line 462
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 464
    array-length v2, p1

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeShort(I)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 468
    :goto_15
    array-length v4, p1

    if-ge v3, v4, :cond_1e

    .line 469
    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeShort(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 472
    :cond_1e
    :goto_1e
    array-length v3, p1

    if-ge v2, v3, :cond_49

    .line 473
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v3

    iget-object v3, v3, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    mul-int/lit8 v4, v2, 0x2

    add-int/lit8 v4, v4, 0x2

    .line 476
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->size()I

    move-result v5

    shr-int/lit8 v5, v5, 0x8

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    .line 477
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->size()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 480
    aget-object v3, p1, v2

    invoke-virtual {v1, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeSupportedObject(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    .line 483
    :cond_49
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->flush()V

    .line 485
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->close()V

    .line 487
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object p1

    return-object p1
.end method

.method public static destroy()V
    .registers 2

    .line 72
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->sInstance:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    if-eqz v0, :cond_19

    .line 74
    monitor-enter v0

    .line 75
    :try_start_5
    iget-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mActions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 76
    iget-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mFunctors:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    const/4 v1, 0x0

    .line 77
    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    .line 78
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_16

    .line 79
    sput-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->sInstance:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    goto :goto_19

    :catchall_16
    move-exception v1

    .line 78
    :try_start_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v1

    :cond_19
    :goto_19
    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
    .registers 1

    .line 64
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->sInstance:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    if-nez v0, :cond_b

    .line 65
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->sInstance:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    .line 68
    :cond_b
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->sInstance:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    return-object v0
.end method

.method private static onIgoMainThreadLogic()V
    .registers 1

    .line 592
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->onLogic()V

    return-void
.end method

.method private onLogic()V
    .registers 3

    .line 597
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 598
    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mIgoMainThreadTasks:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->drainTo(Ljava/util/Collection;)I

    move-result v1

    if-nez v1, :cond_e

    return-void

    .line 601
    :cond_e
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 602
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_12

    :cond_22
    return-void
.end method


# virtual methods
.method addAction(Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;)V
    .registers 3

    .line 425
    monitor-enter p0

    .line 426
    :try_start_1
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->addTaskToCurrentBatch()V

    .line 427
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mActions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 428
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_e

    .line 429
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->notifyStatusThread()V

    return-void

    :catchall_e
    move-exception p1

    .line 428
    :try_start_f
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_f .. :try_end_10} :catchall_e

    throw p1
.end method

.method public callFunctor(Ljava/lang/String;Ljava/io/InputStream;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 230
    iget-object v0, v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mFunctors:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v0, :cond_21

    .line 233
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->logname:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v2, v5, v4

    const-string v2, "WARNING: functor %s doesn\'t exist !"

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 238
    :cond_21
    :try_start_21
    new-instance v6, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;

    move-object/from16 v7, p2

    invoke-direct {v6, v7}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;-><init>(Ljava/io/InputStream;)V

    .line 240
    invoke-virtual {v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readShort()S

    move-result v7

    .line 244
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    .line 246
    array-length v9, v8

    if-lez v9, :cond_38

    array-length v9, v8

    sub-int/2addr v9, v5

    aget-object v9, v8, v9

    goto :goto_3a

    :cond_38
    const-class v9, Ljava/lang/Object;

    .line 250
    :goto_3a
    new-array v10, v7, [Ljava/lang/Object;

    .line 252
    array-length v11, v8

    sub-int/2addr v11, v5

    .line 253
    invoke-virtual {v9}, Ljava/lang/Class;->isArray()Z

    move-result v12

    if-eqz v12, :cond_5a

    .line 255
    array-length v10, v8

    new-array v10, v10, [Ljava/lang/Object;

    .line 259
    invoke-virtual {v9}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v12

    .line 260
    array-length v13, v8

    if-lt v7, v13, :cond_53

    array-length v13, v8

    sub-int v13, v7, v13

    add-int/2addr v13, v5

    goto :goto_54

    :cond_53
    const/4 v13, 0x0

    .line 259
    :goto_54
    invoke-static {v12, v13}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v12

    aput-object v12, v10, v11

    :cond_5a
    const/4 v12, 0x0

    :goto_5b
    if-ge v12, v7, :cond_ea

    .line 265
    invoke-virtual {v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readSupportedObject()Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;

    move-result-object v13

    .line 267
    array-length v14, v8

    if-ge v12, v14, :cond_c8

    .line 272
    iget-object v14, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    sget-object v15, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    if-ne v14, v15, :cond_88

    .line 274
    aget-object v14, v8, v12

    const-class v15, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-virtual {v14, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c8

    .line 276
    sget-object v14, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    iput-object v14, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 277
    new-instance v14, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    iget-object v15, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    check-cast v15, Ljava/lang/Long;

    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-direct {v14, v3, v4}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>(J)V

    iput-object v14, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_c8

    .line 280
    :cond_88
    iget-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    sget-object v4, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    if-ne v3, v4, :cond_c8

    .line 282
    aget-object v3, v8, v12

    const-class v4, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ac

    .line 283
    sget-object v3, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    iput-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 284
    new-instance v3, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    iget-object v4, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {v3, v4}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;-><init>(I)V

    iput-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_c8

    .line 286
    :cond_ac
    aget-object v3, v8, v12

    const-class v4, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 287
    sget-object v3, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    iput-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 288
    iget-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->createFromIgoInt(I)Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    move-result-object v3

    iput-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    .line 296
    :cond_c8
    :goto_c8
    iget-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    sget-object v4, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    if-eq v3, v4, :cond_e0

    .line 297
    invoke-virtual {v9}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_e0

    if-lt v12, v11, :cond_e0

    .line 300
    aget-object v3, v10, v11

    sub-int v4, v12, v11

    iget-object v13, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    invoke-static {v3, v4, v13}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    goto :goto_e4

    .line 302
    :cond_e0
    iget-object v3, v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    aput-object v3, v10, v12

    :goto_e4
    add-int/lit8 v12, v12, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    goto/16 :goto_5b

    .line 307
    :cond_ea
    invoke-virtual {v0, v10}, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 311
    instance-of v3, v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    if-eqz v3, :cond_fd

    .line 312
    check-cast v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    .line 313
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;->getValues()[Ljava/lang/Object;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->buildArgsBuffer([Ljava/lang/Object;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v3

    goto :goto_10a

    :cond_fd
    if-eqz v0, :cond_109

    new-array v3, v5, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    .line 315
    invoke-direct {v1, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->buildArgsBuffer([Ljava/lang/Object;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v3
    :try_end_108
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_108} :catch_10b

    goto :goto_10a

    :cond_109
    const/4 v3, 0x0

    :goto_10a
    return-object v3

    :catch_10b
    move-exception v0

    .line 320
    sget-object v3, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->logname:Ljava/lang/String;

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v2, "callFunctor: \'%s\'. exception catched:"

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v2, 0x0

    return-object v2
.end method

.method public varargs callFunctor(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 213
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mFunctors:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;

    if-eqz v0, :cond_f

    .line 215
    invoke-virtual {v0, p2}, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 217
    :cond_f
    sget-object p2, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->logname:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "WARNING: functor %s doesn\'t exist !"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public varargs callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V
    .registers 12

    .line 93
    new-instance v7, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    const/4 v5, 0x0

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;-><init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;Lcom/navngo/igo/javaclient/androidgo/Batch;Z[Ljava/lang/Object;)V

    invoke-virtual {p0, v7}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->addAction(Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;)V

    return-void
.end method

.method public varargs callIgoSync(Ljava/lang/String;[Ljava/lang/Object;)Z
    .registers 11

    .line 107
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->isEngineCallable()Z

    move-result v0

    if-nez v0, :cond_1e

    .line 108
    sget-object p2, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->logname:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cannot call callIgoSync now: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    .line 113
    :cond_1e
    new-instance v7, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    const/4 v5, 0x1

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;-><init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;Lcom/navngo/igo/javaclient/androidgo/Batch;Z[Ljava/lang/Object;)V

    .line 114
    invoke-virtual {v7}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->doAction()V

    .line 116
    invoke-virtual {v7}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->getSuccess()Z

    move-result p1

    return p1
.end method

.method public varargs callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V
    .registers 11

    .line 120
    new-instance v6, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;-><init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;Lcom/navngo/igo/javaclient/androidgo/Batch;[Ljava/lang/Object;)V

    invoke-virtual {p0, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->addAction(Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;)V

    return-void
.end method

.method public endBatch()V
    .registers 2

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    if-eqz v0, :cond_a

    .line 139
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/Batch;->end()V

    const/4 v0, 0x0

    .line 140
    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    :cond_a
    return-void
.end method

.method getCurrentBatch()Lcom/navngo/igo/javaclient/androidgo/Batch;
    .registers 2

    .line 340
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    return-object v0
.end method

.method public getSysConfig()Lcom/navngo/igo/javaclient/androidgo/SysConfig;
    .registers 2

    .line 151
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->getInstance()Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized hasActionsToProcess()Z
    .registers 2

    monitor-enter p0

    .line 181
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mActions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_e

    if-lez v0, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    monitor-exit p0

    return v0

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized process()V
    .registers 3

    monitor-enter p0

    .line 169
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mActions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;

    .line 170
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;->doAction()V

    goto :goto_7

    .line 173
    :cond_17
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mActions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1e

    .line 174
    monitor-exit p0

    return-void

    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    .line 197
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;

    invoke-direct {v0, p1, p2, p3}, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 198
    iget-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mFunctors:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_1e

    .line 199
    sget-object p2, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->logname:Ljava/lang/String;

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, p3, v1

    const-string v1, "WARNING: functor %s is already registered !"

    invoke-static {v1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    :cond_1e
    iget-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mFunctors:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public runOnIgoMainThread(Ljava/lang/Runnable;)V
    .registers 3

    .line 158
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mIgoMainThreadTasks:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public startBatch(Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;)V
    .registers 3

    .line 129
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/Batch;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/androidgo/Batch;-><init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->mCurrentBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    return-void
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.AnonymousClass1 (com.navngo.igo.javaclient.androidgo.AndroidGo$1)
.class synthetic Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;
.super Ljava/lang/Object;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 778
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->values()[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    :try_start_9
    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    :try_start_1d
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_28} :catch_28

    :catch_28
    :try_start_28
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DOUBLE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_33

    :catch_33
    :try_start_33
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3e

    :catch_3e
    :try_start_3e
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_49
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_49} :catch_49

    :catch_49
    :try_start_49
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_54
    .catch Ljava/lang/NoSuchFieldError; {:try_start_49 .. :try_end_54} :catch_54

    :catch_54
    :try_start_54
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_60
    .catch Ljava/lang/NoSuchFieldError; {:try_start_54 .. :try_end_60} :catch_60

    :catch_60
    :try_start_60
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_6c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_60 .. :try_end_6c} :catch_6c

    :catch_6c
    :try_start_6c
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_78
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6c .. :try_end_78} :catch_78

    :catch_78
    :try_start_78
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_84
    .catch Ljava/lang/NoSuchFieldError; {:try_start_78 .. :try_end_84} :catch_84

    :catch_84
    return-void
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.AndroidGoInputStream (com.navngo.igo.javaclient.androidgo.AndroidGo$AndroidGoInputStream)
.class Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;
.super Ljava/io/DataInputStream;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AndroidGoInputStream"
.end annotation


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2

    .line 732
    invoke-direct {p0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method public readCString()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 760
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readShort()S

    move-result v0

    .line 762
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 763
    invoke-virtual {p0, v1, v2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readFully([BII)V

    .line 766
    :try_start_a
    new-instance v3, Ljava/lang/String;

    const-string v4, "US-ASCII"

    invoke-direct {v3, v1, v2, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_11} :catch_12

    goto :goto_21

    .line 768
    :catch_12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "readCString, cant decode string to US-ASCII"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, ""

    :goto_21
    return-object v3
.end method

.method public readSupportedObject()Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 774
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;-><init>()V

    .line 775
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readByte()B

    move-result v1

    .line 776
    invoke-static {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->getTypeByCode(I)Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    move-result-object v2

    iput-object v2, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 778
    sget-object v2, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$1;->$SwitchMap$com$navngo$igo$javaclient$androidgo$AndroidGo$ArgumentTypes:[I

    iget-object v3, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_d0

    .line 840
    new-instance v1, Ljava/io/IOException;

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v4

    const-string v0, "WARNING: Type (%s) is left out of enum !!!!"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 837
    :pswitch_34
    new-instance v0, Ljava/io/IOException;

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v4

    const-string v1, "WARNING: Type (%d) is not mapped !!!!"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 819
    :pswitch_48
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readInt()I

    move-result v1

    .line 820
    new-array v2, v1, [B

    if-lez v1, :cond_67

    :cond_50
    sub-int v3, v1, v4

    .line 826
    invoke-virtual {p0, v2, v4, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->read([BII)I

    move-result v3

    add-int/2addr v4, v3

    const/4 v5, -0x1

    if-eq v4, v1, :cond_5c

    if-ne v3, v5, :cond_50

    :cond_5c
    if-eq v3, v5, :cond_5f

    goto :goto_67

    .line 830
    :cond_5f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Error while reading BUFFER type. End of stream reached prematurely."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 833
    :cond_67
    :goto_67
    iput-object v2, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 812
    :pswitch_6a
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readShort()S

    move-result v1

    .line 813
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readByte()B

    move-result v2

    .line 814
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readByte()B

    move-result v3

    .line 815
    new-instance v4, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    invoke-direct {v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;-><init>(III)V

    iput-object v4, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 808
    :pswitch_7e
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readInt()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;-><init>(I)V

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 804
    :pswitch_8a
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>(Ljava/io/DataInputStream;)V

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 800
    :pswitch_92
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readCString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 796
    :pswitch_99
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readUtf8()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 792
    :pswitch_a0
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readLong()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 788
    :pswitch_af
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readLong()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 784
    :pswitch_ba
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    goto :goto_cf

    .line 780
    :pswitch_c5
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readBoolean()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    :goto_cf
    return-object v0

    :pswitch_data_d0
    .packed-switch 0x1
        :pswitch_c5
        :pswitch_ba
        :pswitch_af
        :pswitch_a0
        :pswitch_99
        :pswitch_92
        :pswitch_8a
        :pswitch_7e
        :pswitch_6a
        :pswitch_48
        :pswitch_34
    .end packed-switch
.end method

.method public readUtf8()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 741
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readShort()S

    move-result v0

    .line 743
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 744
    invoke-virtual {p0, v1, v2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readFully([BII)V

    .line 747
    :try_start_a
    new-instance v3, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-direct {v3, v1, v2, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_11} :catch_12

    goto :goto_21

    .line 749
    :catch_12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "readUtf8, cant decode string to UTF-8"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, ""

    :goto_21
    return-object v3
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.AndroidGoObject (com.navngo.igo.javaclient.androidgo.AndroidGo$AndroidGoObject)
.class Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;
.super Ljava/lang/Object;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AndroidGoObject"
.end annotation


# instance fields
.field public type:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public value:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 724
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.AndroidGoOutputStream (com.navngo.igo.javaclient.androidgo.AndroidGo$AndroidGoOutputStream)
.class public Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;
.super Ljava/io/DataOutputStream;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AndroidGoOutputStream"
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "com.navngo.igo.javaclient.androidgo.AndroidGo$AndroidGoOutputStream"


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2

    .line 611
    invoke-direct {p0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public writeCString(Lcom/navngo/igo/javaclient/androidgo/types/CString;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 620
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeShort(I)V

    const/4 v0, 0x0

    .line 621
    :goto_8
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;->length()I

    move-result v1

    if-ge v0, v1, :cond_1a

    .line 622
    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/androidgo/types/CString;->charAt(I)C

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_1a
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 632
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeShort(I)V

    const/4 v0, 0x0

    .line 633
    :goto_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1a

    .line 634
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_1a
    return-void
.end method

.method public writeSupportedObject(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 656
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_18

    .line 657
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 658
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeInt(I)V

    goto/16 :goto_135

    .line 659
    :cond_18
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_30

    .line 660
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 661
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeBoolean(Z)V

    goto/16 :goto_135

    .line 662
    :cond_30
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_44

    .line 663
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 664
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    goto/16 :goto_135

    .line 665
    :cond_44
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    if-eqz v0, :cond_58

    .line 666
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 667
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeCString(Lcom/navngo/igo/javaclient/androidgo/types/CString;)V

    goto/16 :goto_135

    .line 668
    :cond_58
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_70

    .line 669
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 670
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeLong(J)V

    goto/16 :goto_135

    .line 671
    :cond_70
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    if-eqz v0, :cond_84

    .line 672
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 673
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-virtual {p1, p0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->writeOut(Ljava/io/DataOutputStream;)V

    goto/16 :goto_135

    .line 674
    :cond_84
    instance-of v0, p1, [B

    if-eqz v0, :cond_9c

    .line 675
    check-cast p1, [B

    .line 676
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 677
    array-length v0, p1

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeInt(I)V

    .line 678
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->write([B)V

    goto/16 :goto_135

    .line 679
    :cond_9c
    instance-of v0, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    if-eqz v0, :cond_ba

    .line 680
    check-cast p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    .line 681
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 682
    iget v0, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeInt(I)V

    .line 683
    iget-object v0, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    const/4 v1, 0x0

    iget p1, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->write([BII)V

    goto/16 :goto_135

    .line 684
    :cond_ba
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    if-eqz v0, :cond_d1

    .line 685
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 686
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->getMillisecFromMidnight()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeInt(I)V

    goto :goto_135

    .line 687
    :cond_d1
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    if-eqz v0, :cond_f6

    .line 688
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 689
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    .line 691
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getYear()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeShort(I)V

    .line 692
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getMonth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 693
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getDay()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    goto :goto_135

    .line 694
    :cond_f6
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_10d

    .line 695
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DOUBLE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    .line 696
    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeDouble(D)V

    goto :goto_135

    :cond_10d
    if-nez p1, :cond_117

    .line 698
    sget-object p1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->logname:Ljava/lang/String;

    const-string v0, "Can\'t write out null argument"

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_135

    .line 700
    :cond_117
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported argument type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_135
    return-void
.end method

.method public writeSupportedObjectType(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 705
    invoke-static {p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->getSupportedObjectType(Ljava/lang/Object;)Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    move-result-object v0

    .line 707
    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    if-eq v0, v1, :cond_10

    .line 708
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeByte(I)V

    goto :goto_2e

    .line 710
    :cond_10
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported argument type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2e
    return-void
.end method

.method public writeUtf8(Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 644
    invoke-static {p1, p0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->writeUtf8(Ljava/lang/String;Ljava/io/DataOutputStream;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.ArgumentTypes (com.navngo.igo.javaclient.androidgo.AndroidGo$ArgumentTypes)
.class final enum Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;
.super Ljava/lang/Enum;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ArgumentTypes"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_DATETIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_DOUBLE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_TIMESPAN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

.field public static final enum TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .line 345
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v1, "TYP_INT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 346
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v3, "TYP_BOOL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 347
    new-instance v3, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v5, "TYP_DOUBLE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DOUBLE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 348
    new-instance v5, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v7, "TYP_CSTRING"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 349
    new-instance v7, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v9, "TYP_WSTRING"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 350
    new-instance v9, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v11, "TYP_QWORD"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 351
    new-instance v11, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v13, "TYP_GCOOR"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 352
    new-instance v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v15, "TYP_TIMETYPE"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 353
    new-instance v15, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v14, "TYP_DATETYPE"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 354
    new-instance v14, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v12, "TYP_DATETIMETYPE"

    const/16 v10, 0x9

    invoke-direct {v14, v12, v10}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 355
    new-instance v12, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v10, "TYP_TIMESPAN"

    const/16 v8, 0xa

    invoke-direct {v12, v10, v8}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMESPAN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 356
    new-instance v10, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v8, "TYP_BUFFER"

    const/16 v6, 0xb

    invoke-direct {v10, v8, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 358
    new-instance v8, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v6, "TYP_UNKNOWN"

    const/16 v4, 0xc

    invoke-direct {v8, v6, v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const/16 v6, 0xd

    new-array v6, v6, [Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    aput-object v0, v6, v2

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v3, v6, v0

    const/4 v0, 0x3

    aput-object v5, v6, v0

    const/4 v0, 0x4

    aput-object v7, v6, v0

    const/4 v0, 0x5

    aput-object v9, v6, v0

    const/4 v0, 0x6

    aput-object v11, v6, v0

    const/4 v0, 0x7

    aput-object v13, v6, v0

    const/16 v0, 0x8

    aput-object v15, v6, v0

    const/16 v0, 0x9

    aput-object v14, v6, v0

    const/16 v0, 0xa

    aput-object v12, v6, v0

    const/16 v0, 0xb

    aput-object v10, v6, v0

    aput-object v8, v6, v4

    .line 344
    sput-object v6, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->$VALUES:[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 344
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static final getSupportedObjectType(Ljava/lang/Object;)Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;
    .registers 3

    .line 380
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    .line 382
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_9

    .line 383
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 384
    :cond_9
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_10

    .line 385
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 386
    :cond_10
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_17

    .line 387
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 388
    :cond_17
    instance-of v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    if-eqz v1, :cond_1e

    .line 389
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 390
    :cond_1e
    instance-of v1, p0, Ljava/lang/Long;

    if-eqz v1, :cond_25

    .line 391
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 392
    :cond_25
    instance-of v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    if-eqz v1, :cond_2c

    .line 393
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 394
    :cond_2c
    instance-of v1, p0, [B

    if-eqz v1, :cond_33

    .line 395
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    goto :goto_39

    .line 396
    :cond_33
    instance-of p0, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    if-eqz p0, :cond_39

    .line 397
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    :cond_39
    :goto_39
    return-object v0
.end method

.method static final getTypeByCode(I)Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;
    .registers 2

    if-ltz p0, :cond_10

    .line 366
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->values()[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    move-result-object v0

    array-length v0, v0

    if-ge p0, v0, :cond_10

    .line 367
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->values()[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    move-result-object v0

    aget-object p0, v0, p0

    return-object p0

    .line 369
    :cond_10
    sget-object p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;
    .registers 2

    .line 344
    const-class v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;
    .registers 1

    .line 344
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->$VALUES:[Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.IAction (com.navngo.igo.javaclient.androidgo.AndroidGo$IAction)
.class interface abstract Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;
.super Ljava/lang/Object;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "IAction"
.end annotation


# virtual methods
.method public abstract doAction()V
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.IActionSucceeded (com.navngo.igo.javaclient.androidgo.AndroidGo$IActionSucceeded)
.class public interface abstract Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;
.super Ljava/lang/Object;
.source "AndroidGo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IActionSucceeded"
.end annotation


# virtual methods
.method public abstract actionSucceeded(Ljava/lang/String;Z)V
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.IgoCallAction (com.navngo.igo.javaclient.androidgo.AndroidGo$IgoCallAction)
.class Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;
.super Ljava/lang/Object;
.source "AndroidGo.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IgoCallAction"
.end annotation


# instance fields
.field private mArgs:[Ljava/lang/Object;

.field private mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

.field private mFuncName:Ljava/lang/String;

.field private mSuccess:Z

.field private mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

.field private mSynchronous:Z

.field final synthetic this$0:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;


# direct methods
.method public varargs constructor <init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;Lcom/navngo/igo/javaclient/androidgo/Batch;Z[Ljava/lang/Object;)V
    .registers 7

    .line 495
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->this$0:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 535
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccess:Z

    .line 496
    iput-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mFuncName:Ljava/lang/String;

    .line 497
    iput-object p3, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    .line 498
    iput-object p6, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mArgs:[Ljava/lang/Object;

    .line 499
    iput-object p4, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    .line 500
    iput-boolean p5, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSynchronous:Z

    return-void
.end method


# virtual methods
.method public doAction()V
    .registers 9

    .line 505
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->this$0:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mArgs:[Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->access$000(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;[Ljava/lang/Object;)Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    .line 507
    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mFuncName:Ljava/lang/String;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    iget-object v3, v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    iget v4, v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    iget-object v5, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    const/4 v6, 0x0

    iget-boolean v7, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSynchronous:Z

    invoke-static/range {v1 .. v7}, Lcom/navngo/igo/javaclient/NNG;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[BILcom/navngo/igo/javaclient/androidgo/Batch;ZZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccess:Z
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    goto :goto_39

    :catch_1c
    move-exception v0

    .line 512
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IgoCallAction: Exception while doing iGoCall: "

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 514
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    const/4 v1, 0x0

    if-eqz v0, :cond_30

    .line 515
    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mFuncName:Ljava/lang/String;

    invoke-interface {v0, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;->actionSucceeded(Ljava/lang/String;Z)V

    .line 518
    :cond_30
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    if-eqz v0, :cond_37

    .line 519
    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/Batch;->taskCompleted(Z)V

    .line 522
    :cond_37
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccess:Z

    :goto_39
    return-void
.end method

.method public getSuccess()Z
    .registers 2

    .line 527
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IgoCallAction;->mSuccess:Z

    return v0
.end method

###### Class com.navngo.igo.javaclient.androidgo.AndroidGo.UiCallAction (com.navngo.igo.javaclient.androidgo.AndroidGo$UiCallAction)
.class Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;
.super Ljava/lang/Object;
.source "AndroidGo.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/AndroidGo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UiCallAction"
.end annotation


# instance fields
.field private mArgs:[Ljava/lang/Object;

.field private mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

.field private mScriptName:Ljava/lang/String;

.field private mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;


# direct methods
.method public varargs constructor <init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;Lcom/navngo/igo/javaclient/androidgo/Batch;[Ljava/lang/Object;)V
    .registers 6

    .line 540
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->this$0:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 541
    iput-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mScriptName:Ljava/lang/String;

    .line 542
    iput-object p3, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    .line 543
    iput-object p4, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    .line 544
    iput-object p5, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mArgs:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public doAction()V
    .registers 11

    .line 548
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>()V

    .line 549
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v2, 0x0

    .line 552
    :try_start_b
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AndroidGo UICall "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mScriptName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    iget-object v3, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mArgs:[Ljava/lang/Object;

    array-length v3, v3

    invoke-virtual {v1, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeShort(I)V

    .line 555
    iget-object v3, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mArgs:[Ljava/lang/Object;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_2f
    if-ge v5, v4, :cond_39

    aget-object v6, v3, v5

    .line 556
    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeSupportedObject(Ljava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 559
    :cond_39
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->flush()V

    .line 561
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    .line 562
    iget-object v3, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mScriptName:Ljava/lang/String;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    iget-object v5, v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    iget v6, v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    iget-object v7, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-static/range {v3 .. v9}, Lcom/navngo/igo/javaclient/NNG;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[BILcom/navngo/igo/javaclient/androidgo/Batch;ZZ)Z
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_4f} :catch_50

    goto :goto_6a

    :catch_50
    move-exception v0

    .line 566
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v3, "UiCallAction: Problem while performing Ui call"

    invoke-static {v1, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 568
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mBatch:Lcom/navngo/igo/javaclient/androidgo/Batch;

    if-eqz v0, :cond_61

    .line 569
    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/androidgo/Batch;->taskCompleted(Z)V

    .line 571
    :cond_61
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mScriptName:Ljava/lang/String;

    if-eqz v0, :cond_6a

    .line 572
    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$UiCallAction;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    invoke-interface {v1, v0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;->actionSucceeded(Ljava/lang/String;Z)V

    :cond_6a
    :goto_6a
    return-void
.end method
