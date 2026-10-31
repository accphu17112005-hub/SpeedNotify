###### Class com.navngo.igo.javaclient.androidgo.types.GCoor (com.navngo.igo.javaclient.androidgo.types.GCoor)
.class public Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
.super Ljava/lang/Object;
.source "GCoor.java"


# static fields
.field private static final FIX_POINT_PRECISION:I = 0x17

.field public static final INVALID:D = 250.0


# instance fields
.field public latitude:D

.field public longitude:D


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, 0x406f400000000000L    # 250.0

    .line 30
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 31
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    return-void
.end method

.method public constructor <init>(DD)V
    .registers 5

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 36
    iput-wide p3, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    return-void
.end method

.method public constructor <init>(J)V
    .registers 7

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x20

    shr-long v0, p1, v0

    long-to-double v0, v0

    const-wide/high16 v2, 0x4160000000000000L    # 8388608.0

    div-double/2addr v0, v2

    .line 60
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    const-wide/16 v0, -0x1

    and-long/2addr p1, v0

    long-to-int p2, p1

    int-to-double p1, p2

    div-double/2addr p1, v2

    .line 63
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;)V
    .registers 8

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    :try_start_3
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    int-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 42
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result p1

    int-to-double v0, p1

    .line 44
    iget-wide v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    const-wide/high16 v4, 0x4160000000000000L    # 8388608.0

    div-double/2addr v2, v4

    iput-wide v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    div-double/2addr v0, v4

    .line 45
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_19} :catch_1a

    goto :goto_2b

    :catch_1a
    move-exception p1

    const-string v0, "Gcoor"

    const-string v1, "load from inputstream failure"

    .line 48
    invoke-static {v0, v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-wide v0, 0x406f400000000000L    # 250.0

    .line 49
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 50
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    :goto_2b
    return-void
.end method

.method public static createFromString(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 5

    .line 74
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>()V

    .line 76
    :try_start_5
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 77
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    iput-wide p0, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D
    :try_end_11
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_11} :catch_12

    goto :goto_1b

    :catch_12
    const-wide p0, 0x406f400000000000L    # 250.0

    .line 80
    iput-wide p0, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 81
    iput-wide p0, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    :goto_1b
    return-object v0
.end method


# virtual methods
.method public isValid()Z
    .registers 6

    .line 98
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    const-wide v2, 0x406f400000000000L    # 250.0

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_13

    iget-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    return v0
.end method

.method public isZero()Z
    .registers 6

    .line 102
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-nez v4, :cond_10

    iget-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    cmpl-double v4, v0, v2

    if-nez v4, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    .line 107
    move-object v1, v0

    check-cast v1, Ljava/util/Locale;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "lat: %f, lon: %f"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeOut(Ljava/io/DataOutputStream;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    const-wide/high16 v2, 0x4160000000000000L    # 8388608.0

    mul-double v0, v0, v2

    double-to-int v0, v0

    .line 89
    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 90
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    mul-double v0, v0, v2

    double-to-int v0, v0

    .line 91
    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    return-void
.end method
