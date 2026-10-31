###### Class com.navngo.igo.javaclient.LayeredConfig (com.navngo.igo.javaclient.LayeredConfig)
.class public Lcom/navngo/igo/javaclient/LayeredConfig;
.super Ljava/lang/Object;
.source "LayeredConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/LayeredConfig$Value;,
        Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;
    }
.end annotation


# static fields
.field public static final PRIO_DEVICE_CONFIG:I = 0x442

.field public static final PRIO_SYSTXT:I = 0xa

.field private static final logname:Ljava/lang/String; = "LayeredConfig"


# instance fields
.field private mGroups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/navngo/igo/javaclient/LayeredConfig$Value;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/LayeredConfig;->mGroups:Ljava/util/Map;

    return-void
.end method

.method private getValue(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$Value;
    .registers 4

    .line 82
    iget-object v0, p0, Lcom/navngo/igo/javaclient/LayeredConfig;->mGroups:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-nez p1, :cond_c

    const/4 p1, 0x0

    return-object p1

    .line 86
    :cond_c
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    return-object p1
.end method


# virtual methods
.method public declared-synchronized add(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    monitor-enter p0

    .line 64
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/LayeredConfig;->mGroups:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_15

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 67
    iget-object v1, p0, Lcom/navngo/igo/javaclient/LayeredConfig;->mGroups:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    :cond_15
    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    if-eqz v1, :cond_21

    .line 70
    iget v1, v1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->prio:I

    if-lt v1, p1, :cond_29

    .line 71
    :cond_21
    new-instance v1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    invoke-direct {v1, p0, p1, p4}, Lcom/navngo/igo/javaclient/LayeredConfig$Value;-><init>(Lcom/navngo/igo/javaclient/LayeredConfig;ILjava/lang/String;)V

    .line 72
    invoke-interface {v0, p3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :cond_29
    sget-boolean p1, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    if-nez p1, :cond_5b

    const-string p1, "LayeredConfig"

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p5, ": group = ("

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ") key = ("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ") value = ("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5b
    .catchall {:try_start_1 .. :try_end_5b} :catchall_5d

    .line 78
    :cond_5b
    monitor-exit p0

    return-void

    :catchall_5d
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getBool(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 6

    .line 95
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getValue(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    move-result-object p1

    if-eqz p1, :cond_19

    .line 96
    iget-object p2, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    sget-object v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    if-eq p2, v0, :cond_d

    goto :goto_19

    .line 99
    :cond_d
    iget-wide p1, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->lVle:J

    const-wide/16 v0, 0x0

    cmp-long p3, p1, v0

    if-eqz p3, :cond_17

    const/4 p1, 0x1

    goto :goto_18

    :cond_17
    const/4 p1, 0x0

    :goto_18
    return p1

    :cond_19
    :goto_19
    return p3
.end method

.method public getDouble(Ljava/lang/String;Ljava/lang/String;D)D
    .registers 6

    .line 119
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getValue(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    move-result-object p1

    if-eqz p1, :cond_1a

    .line 120
    iget-object p2, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    sget-object v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->STRING:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    if-ne p2, v0, :cond_d

    goto :goto_1a

    .line 123
    :cond_d
    iget-object p2, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    sget-object p3, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    if-ne p2, p3, :cond_17

    iget-wide p1, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->lVle:J

    long-to-double p1, p1

    goto :goto_19

    :cond_17
    iget-wide p1, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->dVle:D

    :goto_19
    return-wide p1

    :cond_1a
    :goto_1a
    return-wide p3
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 5

    .line 103
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getValue(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 104
    iget-object p2, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    sget-object v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    if-eq p2, v0, :cond_d

    goto :goto_11

    .line 107
    :cond_d
    iget-wide p1, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->lVle:J

    long-to-int p2, p1

    return p2

    :cond_11
    :goto_11
    return p3
.end method

.method public getLong(Ljava/lang/String;Ljava/lang/String;J)J
    .registers 6

    .line 111
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getValue(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    move-result-object p1

    if-eqz p1, :cond_10

    .line 112
    iget-object p2, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    sget-object v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    if-eq p2, v0, :cond_d

    goto :goto_10

    .line 115
    :cond_d
    iget-wide p1, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->lVle:J

    return-wide p1

    :cond_10
    :goto_10
    return-wide p3
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 90
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/LayeredConfig;->getValue(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$Value;

    move-result-object p1

    if-nez p1, :cond_7

    goto :goto_9

    .line 91
    :cond_7
    iget-object p3, p1, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->sVle:Ljava/lang/String;

    :goto_9
    return-object p3
.end method

###### Class com.navngo.igo.javaclient.LayeredConfig.VAL_TYPE (com.navngo.igo.javaclient.LayeredConfig$VAL_TYPE)
.class final enum Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;
.super Ljava/lang/Enum;
.source "LayeredConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/LayeredConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "VAL_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

.field public static final enum FLOAT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

.field public static final enum INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

.field public static final enum STRING:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 26
    new-instance v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    const-string v1, "STRING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->STRING:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    .line 27
    new-instance v1, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    const-string v3, "INT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    .line 28
    new-instance v3, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    const-string v5, "FLOAT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->FLOAT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 25
    sput-object v5, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->$VALUES:[Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;
    .registers 2

    .line 25
    const-class v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;
    .registers 1

    .line 25
    sget-object v0, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->$VALUES:[Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.LayeredConfig.Value (com.navngo.igo.javaclient.LayeredConfig$Value)
.class Lcom/navngo/igo/javaclient/LayeredConfig$Value;
.super Ljava/lang/Object;
.source "LayeredConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/LayeredConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Value"
.end annotation


# instance fields
.field public dVle:D

.field public lVle:J

.field public prio:I

.field public sVle:Ljava/lang/String;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/LayeredConfig;

.field public type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/LayeredConfig;ILjava/lang/String;)V
    .registers 4

    .line 39
    iput-object p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->this$0:Lcom/navngo/igo/javaclient/LayeredConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p2, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->prio:I

    .line 41
    iput-object p3, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->sVle:Ljava/lang/String;

    .line 42
    sget-object p1, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->STRING:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    .line 44
    :try_start_d
    iget-object p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->sVle:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->lVle:J

    .line 45
    sget-object p1, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->INT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;
    :try_end_19
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_19} :catch_1a

    goto :goto_26

    .line 48
    :catch_1a
    :try_start_1a
    iget-object p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->sVle:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->dVle:D

    .line 49
    sget-object p1, Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;->FLOAT:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/LayeredConfig$Value;->type:Lcom/navngo/igo/javaclient/LayeredConfig$VAL_TYPE;
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_1a .. :try_end_26} :catch_26

    :catch_26
    :goto_26
    return-void
.end method
