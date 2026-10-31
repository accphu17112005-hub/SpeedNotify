###### Class com.navngo.program.ProgramPhases (com.navngo.program.ProgramPhases)
.class public Lcom/navngo/program/ProgramPhases;
.super Ljava/lang/Object;
.source "ProgramPhases.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/program/ProgramPhases$NNGInterface;,
        Lcom/navngo/program/ProgramPhases$Task;,
        Lcom/navngo/program/ProgramPhases$Phase;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/navngo/program/ProgramPhases;


# instance fields
.field private mInterface:Lcom/navngo/program/ProgramPhases$NNGInterface;

.field private mPhase:Lcom/navngo/program/ProgramPhases$Phase;

.field private mTasks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/navngo/program/ProgramPhases$Phase;",
            "Ljava/util/List<",
            "Lcom/navngo/program/ProgramPhases$Task;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 7

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    sget-object v0, Lcom/navngo/program/ProgramPhases$Phase;->NOT_STARTED:Lcom/navngo/program/ProgramPhases$Phase;

    iput-object v0, p0, Lcom/navngo/program/ProgramPhases;->mPhase:Lcom/navngo/program/ProgramPhases$Phase;

    .line 149
    new-instance v0, Lcom/navngo/program/ProgramPhases$NNGInterface;

    invoke-direct {v0, p0}, Lcom/navngo/program/ProgramPhases$NNGInterface;-><init>(Lcom/navngo/program/ProgramPhases;)V

    iput-object v0, p0, Lcom/navngo/program/ProgramPhases;->mInterface:Lcom/navngo/program/ProgramPhases$NNGInterface;

    .line 150
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    .line 151
    invoke-static {}, Lcom/navngo/program/ProgramPhases$Phase;->values()[Lcom/navngo/program/ProgramPhases$Phase;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1b
    if-ge v2, v1, :cond_2c

    aget-object v3, v0, v2

    .line 152
    iget-object v4, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_2c
    return-void
.end method

.method static synthetic access$002(Lcom/navngo/program/ProgramPhases;)Lcom/navngo/program/ProgramPhases;
    .registers 1

    .line 19
    sput-object p0, Lcom/navngo/program/ProgramPhases;->sInstance:Lcom/navngo/program/ProgramPhases;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/program/ProgramPhases;Lcom/navngo/program/ProgramPhases$Phase;)V
    .registers 2

    .line 19
    invoke-direct {p0, p1}, Lcom/navngo/program/ProgramPhases;->syncPhase(Lcom/navngo/program/ProgramPhases$Phase;)V

    return-void
.end method

.method private addTask(Lcom/navngo/program/ProgramPhases$Phase;Ljava/lang/Runnable;IZ)V
    .registers 7

    .line 126
    iget-object v0, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    monitor-enter v0

    .line 127
    :try_start_3
    iget-object v1, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    new-instance v1, Lcom/navngo/program/ProgramPhases$Task;

    invoke-direct {v1, p2, p3, p4}, Lcom/navngo/program/ProgramPhases$Task;-><init>(Ljava/lang/Runnable;IZ)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    monitor-exit v0

    return-void

    :catchall_15
    move-exception p1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw p1
.end method

.method public static declared-synchronized getInstance()Lcom/navngo/program/ProgramPhases;
    .registers 2

    const-class v0, Lcom/navngo/program/ProgramPhases;

    monitor-enter v0

    .line 54
    :try_start_3
    sget-object v1, Lcom/navngo/program/ProgramPhases;->sInstance:Lcom/navngo/program/ProgramPhases;

    if-nez v1, :cond_16

    .line 55
    new-instance v1, Lcom/navngo/program/ProgramPhases;

    invoke-direct {v1}, Lcom/navngo/program/ProgramPhases;-><init>()V

    sput-object v1, Lcom/navngo/program/ProgramPhases;->sInstance:Lcom/navngo/program/ProgramPhases;

    .line 59
    new-instance v1, Lcom/navngo/program/ProgramPhases$1;

    invoke-direct {v1}, Lcom/navngo/program/ProgramPhases$1;-><init>()V

    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->addEngineStoppedCallback(Ljava/lang/Runnable;)V

    .line 66
    :cond_16
    sget-object v1, Lcom/navngo/program/ProgramPhases;->sInstance:Lcom/navngo/program/ProgramPhases;
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_1a

    monitor-exit v0

    return-object v1

    :catchall_1a
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private runTasks(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/navngo/program/ProgramPhases$Task;",
            ">;)V"
        }
    .end annotation

    .line 189
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/program/ProgramPhases$Task;

    .line 190
    iget-object v0, v0, Lcom/navngo/program/ProgramPhases$Task;->task:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_4

    :cond_16
    return-void
.end method

.method private syncPhase(Lcom/navngo/program/ProgramPhases$Phase;)V
    .registers 6

    const-string v0, "ProgramPhases"

    .line 162
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Program phase reached: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/navngo/program/ProgramPhases$Phase;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    monitor-enter p0

    .line 166
    :try_start_1b
    iput-object p1, p0, Lcom/navngo/program/ProgramPhases;->mPhase:Lcom/navngo/program/ProgramPhases$Phase;

    .line 167
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_56

    const/4 v0, 0x0

    .line 169
    iget-object v1, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    monitor-enter v1

    .line 171
    :try_start_22
    iget-object v2, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_49

    .line 173
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 176
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_37
    if-ltz v2, :cond_49

    .line 177
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/navngo/program/ProgramPhases$Task;

    iget-boolean v3, v3, Lcom/navngo/program/ProgramPhases$Task;->callAlways:Z

    if-nez v3, :cond_46

    invoke-interface {p1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_46
    add-int/lit8 v2, v2, -0x1

    goto :goto_37

    .line 180
    :cond_49
    monitor-exit v1
    :try_end_4a
    .catchall {:try_start_22 .. :try_end_4a} :catchall_53

    if-eqz v0, :cond_52

    .line 183
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 184
    invoke-direct {p0, v0}, Lcom/navngo/program/ProgramPhases;->runTasks(Ljava/util/List;)V

    :cond_52
    return-void

    :catchall_53
    move-exception p1

    .line 180
    :try_start_54
    monitor-exit v1
    :try_end_55
    .catchall {:try_start_54 .. :try_end_55} :catchall_53

    throw p1

    :catchall_56
    move-exception p1

    .line 167
    :try_start_57
    monitor-exit p0
    :try_end_58
    .catchall {:try_start_57 .. :try_end_58} :catchall_56

    throw p1
.end method


# virtual methods
.method public declared-synchronized getPhase()Lcom/navngo/program/ProgramPhases$Phase;
    .registers 2

    monitor-enter p0

    .line 69
    :try_start_1
    iget-object v0, p0, Lcom/navngo/program/ProgramPhases;->mPhase:Lcom/navngo/program/ProgramPhases$Phase;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeTask(Lcom/navngo/program/ProgramPhases$Phase;Ljava/lang/Runnable;)V
    .registers 8

    .line 99
    iget-object v0, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    monitor-enter v0

    if-eqz p1, :cond_2a

    .line 101
    :try_start_5
    iget-object v1, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 102
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/program/ProgramPhases$Task;

    .line 103
    iget-object v3, v2, Lcom/navngo/program/ProgramPhases$Task;->task:Ljava/lang/Runnable;

    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 105
    invoke-interface {p1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 106
    monitor-exit v0

    return-void

    .line 111
    :cond_2a
    iget-object p1, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_34
    :goto_34
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_64

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/program/ProgramPhases$Phase;

    .line 112
    iget-object v2, p0, Lcom/navngo/program/ProgramPhases;->mTasks:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 113
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/navngo/program/ProgramPhases$Task;

    .line 114
    iget-object v4, v3, Lcom/navngo/program/ProgramPhases$Task;->task:Ljava/lang/Runnable;

    invoke-virtual {v4, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 116
    invoke-interface {v1, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_34

    .line 122
    :cond_64
    monitor-exit v0

    return-void

    :catchall_66
    move-exception p1

    monitor-exit v0
    :try_end_68
    .catchall {:try_start_5 .. :try_end_68} :catchall_66

    throw p1
.end method

.method public removeTask(Ljava/lang/Runnable;)V
    .registers 3

    const/4 v0, 0x0

    .line 95
    invoke-virtual {p0, v0, p1}, Lcom/navngo/program/ProgramPhases;->removeTask(Lcom/navngo/program/ProgramPhases$Phase;Ljava/lang/Runnable;)V

    return-void
.end method

.method public waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZILjava/lang/Runnable;)V
    .registers 7

    .line 82
    monitor-enter p0

    .line 83
    :try_start_1
    iget-object v0, p0, Lcom/navngo/program/ProgramPhases;->mPhase:Lcom/navngo/program/ProgramPhases$Phase;

    invoke-virtual {v0}, Lcom/navngo/program/ProgramPhases$Phase;->getCode()I

    move-result v0

    invoke-virtual {p1}, Lcom/navngo/program/ProgramPhases$Phase;->getCode()I

    move-result v1

    if-lt v0, v1, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    .line 84
    :goto_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_20

    if-eqz v0, :cond_1c

    if-eqz p2, :cond_18

    .line 87
    invoke-direct {p0, p1, p4, p3, p2}, Lcom/navngo/program/ProgramPhases;->addTask(Lcom/navngo/program/ProgramPhases$Phase;Ljava/lang/Runnable;IZ)V

    .line 88
    :cond_18
    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    goto :goto_1f

    .line 90
    :cond_1c
    invoke-direct {p0, p1, p4, p3, p2}, Lcom/navngo/program/ProgramPhases;->addTask(Lcom/navngo/program/ProgramPhases$Phase;Ljava/lang/Runnable;IZ)V

    :goto_1f
    return-void

    :catchall_20
    move-exception p1

    .line 84
    :try_start_21
    monitor-exit p0
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw p1
.end method

.method public waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V
    .registers 5

    const/16 v0, 0x64

    .line 72
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZILjava/lang/Runnable;)V

    return-void
.end method

###### Class com.navngo.program.ProgramPhases.AnonymousClass1 (com.navngo.program.ProgramPhases$1)
.class Lcom/navngo/program/ProgramPhases$1;
.super Ljava/lang/Object;
.source "ProgramPhases.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    const/4 v0, 0x0

    .line 62
    invoke-static {v0}, Lcom/navngo/program/ProgramPhases;->access$002(Lcom/navngo/program/ProgramPhases;)Lcom/navngo/program/ProgramPhases;

    return-void
.end method

###### Class com.navngo.program.ProgramPhases.NNGInterface (com.navngo.program.ProgramPhases$NNGInterface)
.class Lcom/navngo/program/ProgramPhases$NNGInterface;
.super Ljava/lang/Object;
.source "ProgramPhases.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/program/ProgramPhases;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NNGInterface"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/program/ProgramPhases;


# direct methods
.method public constructor <init>(Lcom/navngo/program/ProgramPhases;)V
    .registers 4

    .line 195
    iput-object p1, p0, Lcom/navngo/program/ProgramPhases$NNGInterface;->this$0:Lcom/navngo/program/ProgramPhases;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const-string v0, "android.program_phases.sync"

    const-string v1, "syncPhase"

    invoke-virtual {p1, v0, p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public syncPhase(I)V
    .registers 4

    .line 202
    :try_start_0
    iget-object v0, p0, Lcom/navngo/program/ProgramPhases$NNGInterface;->this$0:Lcom/navngo/program/ProgramPhases;

    invoke-static {p1}, Lcom/navngo/program/ProgramPhases$Phase;->fromCode(I)Lcom/navngo/program/ProgramPhases$Phase;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/program/ProgramPhases;->access$100(Lcom/navngo/program/ProgramPhases;Lcom/navngo/program/ProgramPhases$Phase;)V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_9} :catch_a

    goto :goto_12

    :catch_a
    move-exception p1

    const-string v0, "ProgramPhases"

    const-string v1, "Exception while synchr5onizing phase."

    .line 204
    invoke-static {v0, v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_12
    return-void
.end method

###### Class com.navngo.program.ProgramPhases.Phase (com.navngo.program.ProgramPhases$Phase)
.class public final enum Lcom/navngo/program/ProgramPhases$Phase;
.super Ljava/lang/Enum;
.source "ProgramPhases.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/program/ProgramPhases;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Phase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/program/ProgramPhases$Phase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum CLOSE_SIGNAL:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum CONFIG_READY:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum CONTENT_READY:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum FILESYSINIT:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum INTROSCREEN:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum LANGUAGE_READY:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum NOT_STARTED:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum NO_MORE_INPUT:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum PREINIT:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum PREPARE_FOR_UI:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum RUNNING:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum STARTUP:Lcom/navngo/program/ProgramPhases$Phase;

.field public static final enum UI_READY:Lcom/navngo/program/ProgramPhases$Phase;


# instance fields
.field private final mCode:I


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .line 22
    new-instance v0, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v1, "NOT_STARTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/navngo/program/ProgramPhases$Phase;->NOT_STARTED:Lcom/navngo/program/ProgramPhases$Phase;

    .line 23
    new-instance v1, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v3, "PREINIT"

    const/4 v4, 0x1

    const/16 v5, 0xa

    invoke-direct {v1, v3, v4, v5}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/navngo/program/ProgramPhases$Phase;->PREINIT:Lcom/navngo/program/ProgramPhases$Phase;

    .line 24
    new-instance v3, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v6, "FILESYSINIT"

    const/4 v7, 0x2

    const/16 v8, 0x14

    invoke-direct {v3, v6, v7, v8}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/navngo/program/ProgramPhases$Phase;->FILESYSINIT:Lcom/navngo/program/ProgramPhases$Phase;

    .line 25
    new-instance v6, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v8, "CONFIG_READY"

    const/4 v9, 0x3

    const/16 v10, 0x1e

    invoke-direct {v6, v8, v9, v10}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/navngo/program/ProgramPhases$Phase;->CONFIG_READY:Lcom/navngo/program/ProgramPhases$Phase;

    .line 26
    new-instance v8, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v10, "INTROSCREEN"

    const/4 v11, 0x4

    const/16 v12, 0x23

    invoke-direct {v8, v10, v11, v12}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/navngo/program/ProgramPhases$Phase;->INTROSCREEN:Lcom/navngo/program/ProgramPhases$Phase;

    .line 27
    new-instance v10, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v12, "STARTUP"

    const/4 v13, 0x5

    const/16 v14, 0x28

    invoke-direct {v10, v12, v13, v14}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/navngo/program/ProgramPhases$Phase;->STARTUP:Lcom/navngo/program/ProgramPhases$Phase;

    .line 28
    new-instance v12, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v14, "LANGUAGE_READY"

    const/4 v15, 0x6

    const/16 v13, 0x32

    invoke-direct {v12, v14, v15, v13}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/navngo/program/ProgramPhases$Phase;->LANGUAGE_READY:Lcom/navngo/program/ProgramPhases$Phase;

    .line 29
    new-instance v13, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v14, "CONTENT_READY"

    const/4 v15, 0x7

    const/16 v11, 0x3c

    invoke-direct {v13, v14, v15, v11}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lcom/navngo/program/ProgramPhases$Phase;->CONTENT_READY:Lcom/navngo/program/ProgramPhases$Phase;

    .line 30
    new-instance v11, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v14, "PREPARE_FOR_UI"

    const/16 v15, 0x8

    const/16 v9, 0x46

    invoke-direct {v11, v14, v15, v9}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/navngo/program/ProgramPhases$Phase;->PREPARE_FOR_UI:Lcom/navngo/program/ProgramPhases$Phase;

    .line 31
    new-instance v9, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v14, "UI_READY"

    const/16 v15, 0x9

    const/16 v7, 0x50

    invoke-direct {v9, v14, v15, v7}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/navngo/program/ProgramPhases$Phase;->UI_READY:Lcom/navngo/program/ProgramPhases$Phase;

    .line 32
    new-instance v7, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v14, "RUNNING"

    const/16 v15, 0x5a

    invoke-direct {v7, v14, v5, v15}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/navngo/program/ProgramPhases$Phase;->RUNNING:Lcom/navngo/program/ProgramPhases$Phase;

    .line 33
    new-instance v14, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v15, "CLOSE_SIGNAL"

    const/16 v5, 0xb

    const/16 v4, 0x64

    invoke-direct {v14, v15, v5, v4}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lcom/navngo/program/ProgramPhases$Phase;->CLOSE_SIGNAL:Lcom/navngo/program/ProgramPhases$Phase;

    .line 34
    new-instance v4, Lcom/navngo/program/ProgramPhases$Phase;

    const-string v15, "NO_MORE_INPUT"

    const/16 v5, 0xc

    const/16 v2, 0x6e

    invoke-direct {v4, v15, v5, v2}, Lcom/navngo/program/ProgramPhases$Phase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/navngo/program/ProgramPhases$Phase;->NO_MORE_INPUT:Lcom/navngo/program/ProgramPhases$Phase;

    const/16 v2, 0xd

    new-array v2, v2, [Lcom/navngo/program/ProgramPhases$Phase;

    const/4 v15, 0x0

    aput-object v0, v2, v15

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    aput-object v3, v2, v0

    const/4 v0, 0x3

    aput-object v6, v2, v0

    const/4 v0, 0x4

    aput-object v8, v2, v0

    const/4 v0, 0x5

    aput-object v10, v2, v0

    const/4 v0, 0x6

    aput-object v12, v2, v0

    const/4 v0, 0x7

    aput-object v13, v2, v0

    const/16 v0, 0x8

    aput-object v11, v2, v0

    const/16 v0, 0x9

    aput-object v9, v2, v0

    const/16 v0, 0xa

    aput-object v7, v2, v0

    const/16 v0, 0xb

    aput-object v14, v2, v0

    aput-object v4, v2, v5

    .line 21
    sput-object v2, Lcom/navngo/program/ProgramPhases$Phase;->$VALUES:[Lcom/navngo/program/ProgramPhases$Phase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 38
    iput p3, p0, Lcom/navngo/program/ProgramPhases$Phase;->mCode:I

    return-void
.end method

.method public static fromCode(I)Lcom/navngo/program/ProgramPhases$Phase;
    .registers 7

    .line 44
    invoke-static {}, Lcom/navngo/program/ProgramPhases$Phase;->values()[Lcom/navngo/program/ProgramPhases$Phase;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_7
    if-ge v3, v1, :cond_13

    aget-object v4, v0, v3

    .line 45
    iget v5, v4, Lcom/navngo/program/ProgramPhases$Phase;->mCode:I

    if-ne v5, p0, :cond_10

    return-object v4

    :cond_10
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 48
    :cond_13
    new-instance v0, Ljava/lang/RuntimeException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v2

    const-string p0, "No phase exists for code: %d"

    invoke-static {p0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/program/ProgramPhases$Phase;
    .registers 2

    .line 21
    const-class v0, Lcom/navngo/program/ProgramPhases$Phase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/program/ProgramPhases$Phase;

    return-object p0
.end method

.method public static values()[Lcom/navngo/program/ProgramPhases$Phase;
    .registers 1

    .line 21
    sget-object v0, Lcom/navngo/program/ProgramPhases$Phase;->$VALUES:[Lcom/navngo/program/ProgramPhases$Phase;

    invoke-virtual {v0}, [Lcom/navngo/program/ProgramPhases$Phase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/program/ProgramPhases$Phase;

    return-object v0
.end method


# virtual methods
.method public getCode()I
    .registers 2

    .line 41
    iget v0, p0, Lcom/navngo/program/ProgramPhases$Phase;->mCode:I

    return v0
.end method

###### Class com.navngo.program.ProgramPhases.Task (com.navngo.program.ProgramPhases$Task)
.class Lcom/navngo/program/ProgramPhases$Task;
.super Ljava/lang/Object;
.source "ProgramPhases.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/program/ProgramPhases;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Task"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/navngo/program/ProgramPhases$Task;",
        ">;"
    }
.end annotation


# instance fields
.field public final callAlways:Z

.field public order:I

.field public task:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;IZ)V
    .registers 4

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iput-object p1, p0, Lcom/navngo/program/ProgramPhases$Task;->task:Ljava/lang/Runnable;

    .line 138
    iput p2, p0, Lcom/navngo/program/ProgramPhases$Task;->order:I

    .line 139
    iput-boolean p3, p0, Lcom/navngo/program/ProgramPhases$Task;->callAlways:Z

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/navngo/program/ProgramPhases$Task;)I
    .registers 3

    .line 144
    iget v0, p0, Lcom/navngo/program/ProgramPhases$Task;->order:I

    iget p1, p1, Lcom/navngo/program/ProgramPhases$Task;->order:I

    sub-int/2addr v0, p1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 131
    check-cast p1, Lcom/navngo/program/ProgramPhases$Task;

    invoke-virtual {p0, p1}, Lcom/navngo/program/ProgramPhases$Task;->compareTo(Lcom/navngo/program/ProgramPhases$Task;)I

    move-result p1

    return p1
.end method
