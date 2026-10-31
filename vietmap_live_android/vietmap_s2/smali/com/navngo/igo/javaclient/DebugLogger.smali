###### Class com.navngo.igo.javaclient.DebugLogger (com.navngo.igo.javaclient.DebugLogger)
.class public Lcom/navngo/igo/javaclient/DebugLogger;
.super Ljava/lang/Object;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
    }
.end annotation


# static fields
.field private static preEngigeLogging:Z = true


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    .line 147
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->DISABLED:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    if-eq p0, v0, :cond_7

    .line 148
    invoke-virtual {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->writeUsingLevels(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    return-void
.end method

.method public static D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 25
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D1:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    invoke-static {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static D2(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 29
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D2:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 33
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D2:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    invoke-static {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static D3(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 37
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D3:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static D4(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 41
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D4:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static D5(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 45
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D5:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    const/4 v1, 0x0

    invoke-static {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D(Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static DebugLoggerMsg(ILjava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 52
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v2, "{HH:mm:ss.SSS} "

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 53
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 p0, 0x1

    aput-object p1, v2, p0

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x2

    aput-object p0, v2, p1

    const-string p0, "other.android_utils.debug_logger_msg"

    const/4 p1, 0x0

    invoke-virtual {v1, p0, p1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$300()Z
    .registers 1

    .line 20
    sget-boolean v0, Lcom/navngo/igo/javaclient/DebugLogger;->preEngigeLogging:Z

    return v0
.end method

.method static synthetic access$302(Z)Z
    .registers 1

    .line 20
    sput-boolean p0, Lcom/navngo/igo/javaclient/DebugLogger;->preEngigeLogging:Z

    return p0
.end method

.method public static init()V
    .registers 4

    .line 153
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    sget-object v1, Lcom/navngo/program/ProgramPhases$Phase;->STARTUP:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v2, Lcom/navngo/igo/javaclient/DebugLogger$1;

    invoke-direct {v2}, Lcom/navngo/igo/javaclient/DebugLogger$1;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    .line 161
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    sget-object v1, Lcom/navngo/program/ProgramPhases$Phase;->NO_MORE_INPUT:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v2, Lcom/navngo/igo/javaclient/DebugLogger$2;

    invoke-direct {v2}, Lcom/navngo/igo/javaclient/DebugLogger$2;-><init>()V

    invoke-virtual {v0, v1, v3, v2}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.AnonymousClass1 (com.navngo.igo.javaclient.DebugLogger$1)
.class Lcom/navngo/igo/javaclient/DebugLogger$1;
.super Ljava/lang/Object;
.source "DebugLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/DebugLogger;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    const-string v0, "navngo"

    const-string v1, "Java DebugLogger preEngigeLogging done, switching to engine debuglogger"

    .line 156
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 157
    invoke-static {v0}, Lcom/navngo/igo/javaclient/DebugLogger;->access$302(Z)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.AnonymousClass2 (com.navngo.igo.javaclient.DebugLogger$2)
.class Lcom/navngo/igo/javaclient/DebugLogger$2;
.super Ljava/lang/Object;
.source "DebugLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/DebugLogger;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    const-string v0, "navngo"

    const-string v1, "Engine stopped, switching back to preEngineLogging"

    .line 164
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    .line 165
    invoke-static {v0}, Lcom/navngo/igo/javaclient/DebugLogger;->access$302(Z)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel (com.navngo.igo.javaclient.DebugLogger$DebugLevel)
.class abstract enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.super Ljava/lang/Enum;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x440a
    name = "DebugLevel"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$StaticHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field public static final enum D1:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field public static final enum D2:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field public static final enum D3:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field public static final enum D4:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field public static final enum D5:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field public static final enum DISABLED:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;


# instance fields
.field private final fallback:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

.field private final logcatLevel:I


# direct methods
.method static constructor <clinit>()V
    .registers 22

    .line 57
    new-instance v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$1;

    const-string v1, "DISABLED"

    const/4 v2, 0x0

    const/16 v3, 0x44

    invoke-direct {v0, v1, v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$1;-><init>(Ljava/lang/String;IC)V

    sput-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->DISABLED:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    .line 61
    new-instance v1, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$2;

    const-string v3, "D1"

    const/4 v10, 0x1

    const/16 v4, 0x45

    invoke-direct {v1, v3, v10, v4, v10}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$2;-><init>(Ljava/lang/String;ICI)V

    sput-object v1, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D1:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    .line 66
    new-instance v3, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$3;

    const-string v5, "D2"

    const/4 v6, 0x2

    const/16 v7, 0x45

    const/4 v8, 0x2

    move-object v4, v3

    move-object v9, v1

    invoke-direct/range {v4 .. v9}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$3;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V

    sput-object v3, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D2:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    .line 71
    new-instance v4, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$4;

    const-string v12, "D3"

    const/4 v13, 0x3

    const/16 v14, 0x57

    const/4 v15, 0x3

    move-object v11, v4

    move-object/from16 v16, v3

    invoke-direct/range {v11 .. v16}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$4;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V

    sput-object v4, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D3:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    .line 76
    new-instance v5, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$5;

    const-string v12, "D4"

    const/4 v13, 0x4

    const/16 v14, 0x49

    const/4 v15, 0x4

    move-object v11, v5

    move-object/from16 v16, v4

    invoke-direct/range {v11 .. v16}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$5;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V

    sput-object v5, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D4:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    .line 81
    new-instance v6, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$6;

    const-string v17, "D5"

    const/16 v18, 0x5

    const/16 v19, 0x44

    const/16 v20, 0x5

    move-object/from16 v16, v6

    move-object/from16 v21, v5

    invoke-direct/range {v16 .. v21}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$6;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V

    sput-object v6, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->D5:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    const/4 v7, 0x6

    new-array v7, v7, [Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    aput-object v0, v7, v2

    aput-object v1, v7, v10

    const/4 v0, 0x2

    aput-object v3, v7, v0

    const/4 v0, 0x3

    aput-object v4, v7, v0

    const/4 v0, 0x4

    aput-object v5, v7, v0

    const/4 v0, 0x5

    aput-object v6, v7, v0

    .line 56
    sput-object v7, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->$VALUES:[Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IC)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 95
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICI)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ICI)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(CI)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 99
    invoke-direct/range {v0 .. v5}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$1;)V
    .registers 6

    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICI)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(CI",
            "Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;",
            ")V"
        }
    .end annotation

    .line 102
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 103
    iput p4, p0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->logcatLevel:I

    .line 104
    iput-object p5, p0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->fallback:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    .line 105
    sget-object p1, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$StaticHolder;->levelMapping:Landroid/util/SparseArray;

    invoke-virtual {p1, p4, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Lcom/navngo/igo/javaclient/DebugLogger$1;)V
    .registers 7

    .line 56
    invoke-direct/range {p0 .. p5}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ICLcom/navngo/igo/javaclient/DebugLogger$1;)V
    .registers 5

    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;IC)V

    return-void
.end method

.method static decorateMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 136
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 137
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v0

    add-int/lit8 v2, v2, 0xa

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 138
    sget-boolean v2, Lcom/navngo/igo/javaclient/Config;->logcat_thread:Z

    if-eqz v2, :cond_25

    const-string v2, "(th="

    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/NNGThread;->getCurrentThreadId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_25
    if-lez v0, :cond_2f

    .line 141
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x3a

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 142
    :cond_2f
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
    .registers 2

    .line 56
    const-class v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
    .registers 1

    .line 56
    sget-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->$VALUES:[Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    return-object v0
.end method


# virtual methods
.method write(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6

    .line 120
    invoke-static {}, Lcom/navngo/igo/javaclient/DebugLogger;->access$300()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 121
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->decorateMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p3}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3a

    :cond_e
    if-eqz p3, :cond_35

    .line 126
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 127
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 128
    invoke-virtual {p3, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 129
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\n"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 131
    :cond_35
    iget p3, p0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->logcatLevel:I

    invoke-static {p3, p1, p2}, Lcom/navngo/igo/javaclient/NNG;->log(ILjava/lang/String;Ljava/lang/String;)V

    :goto_3a
    return-void
.end method

.method abstract writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method writeUsingLevels(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 7

    .line 111
    sget v0, Lcom/navngo/igo/javaclient/Config;->logcat_level:I

    iget v1, p0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->logcatLevel:I

    if-ge v0, v1, :cond_7

    return-void

    :cond_7
    move-object v0, p0

    .line 114
    :goto_8
    sget v1, Lcom/navngo/igo/javaclient/Config;->logcat_oslevel:I

    iget v2, v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->logcatLevel:I

    if-ge v1, v2, :cond_14

    iget-object v1, v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->fallback:Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;

    if-eqz v1, :cond_14

    move-object v0, v1

    goto :goto_8

    .line 116
    :cond_14
    invoke-virtual {v0, p1, p2, p3}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;->write(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.AnonymousClass1 (com.navngo.igo.javaclient.DebugLogger$DebugLevel$1)
.class final enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$1;
.super Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;IC)V
    .registers 5

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICLcom/navngo/igo/javaclient/DebugLogger$1;)V

    return-void
.end method


# virtual methods
.method writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.AnonymousClass2 (com.navngo.igo.javaclient.DebugLogger$DebugLevel$2)
.class final enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$2;
.super Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ICI)V
    .registers 11

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 61
    invoke-direct/range {v0 .. v5}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$1;)V

    return-void
.end method


# virtual methods
.method writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 63
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.AnonymousClass3 (com.navngo.igo.javaclient.DebugLogger$DebugLevel$3)
.class final enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$3;
.super Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 66
    invoke-direct/range {v0 .. v6}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Lcom/navngo/igo/javaclient/DebugLogger$1;)V

    return-void
.end method


# virtual methods
.method writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 68
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.AnonymousClass4 (com.navngo.igo.javaclient.DebugLogger$DebugLevel$4)
.class final enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$4;
.super Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 71
    invoke-direct/range {v0 .. v6}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Lcom/navngo/igo/javaclient/DebugLogger$1;)V

    return-void
.end method


# virtual methods
.method writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 73
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.AnonymousClass5 (com.navngo.igo.javaclient.DebugLogger$DebugLevel$5)
.class final enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$5;
.super Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 76
    invoke-direct/range {v0 .. v6}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Lcom/navngo/igo/javaclient/DebugLogger$1;)V

    return-void
.end method


# virtual methods
.method writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 78
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.AnonymousClass6 (com.navngo.igo.javaclient.DebugLogger$DebugLevel$6)
.class final enum Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$6;
.super Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;)V
    .registers 13

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 81
    invoke-direct/range {v0 .. v6}, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;-><init>(Ljava/lang/String;ICILcom/navngo/igo/javaclient/DebugLogger$DebugLevel;Lcom/navngo/igo/javaclient/DebugLogger$1;)V

    return-void
.end method


# virtual methods
.method writeLogcat(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 83
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->logcat_tag:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

###### Class com.navngo.igo.javaclient.DebugLogger.DebugLevel.StaticHolder (com.navngo.igo.javaclient.DebugLogger$DebugLevel$StaticHolder)
.class Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$StaticHolder;
.super Ljava/lang/Object;
.source "DebugLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StaticHolder"
.end annotation


# static fields
.field static levelMapping:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 91
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/DebugLogger$DebugLevel$StaticHolder;->levelMapping:Landroid/util/SparseArray;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
