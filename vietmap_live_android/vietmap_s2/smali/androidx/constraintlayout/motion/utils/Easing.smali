###### Class androidx.constraintlayout.motion.utils.Easing (androidx.constraintlayout.motion.utils.Easing)
.class public Landroidx/constraintlayout/motion/utils/Easing;
.super Ljava/lang/Object;
.source "Easing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;
    }
.end annotation


# static fields
.field private static final ACCELERATE:Ljava/lang/String; = "cubic(0.4, 0.05, 0.8, 0.7)"

.field private static final ACCELERATE_NAME:Ljava/lang/String; = "accelerate"

.field private static final DECELERATE:Ljava/lang/String; = "cubic(0.0, 0.0, 0.2, 0.95)"

.field private static final DECELERATE_NAME:Ljava/lang/String; = "decelerate"

.field private static final LINEAR:Ljava/lang/String; = "cubic(1, 1, 0, 0)"

.field private static final LINEAR_NAME:Ljava/lang/String; = "linear"

.field public static NAMED_EASING:[Ljava/lang/String; = null

.field private static final STANDARD:Ljava/lang/String; = "cubic(0.4, 0.0, 0.2, 1)"

.field private static final STANDARD_NAME:Ljava/lang/String; = "standard"

.field static sDefault:Landroidx/constraintlayout/motion/utils/Easing;


# instance fields
.field str:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 29
    new-instance v0, Landroidx/constraintlayout/motion/utils/Easing;

    invoke-direct {v0}, Landroidx/constraintlayout/motion/utils/Easing;-><init>()V

    sput-object v0, Landroidx/constraintlayout/motion/utils/Easing;->sDefault:Landroidx/constraintlayout/motion/utils/Easing;

    const-string v0, "standard"

    const-string v1, "accelerate"

    const-string v2, "decelerate"

    const-string v3, "linear"

    .line 40
    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/constraintlayout/motion/utils/Easing;->NAMED_EASING:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "identity"

    .line 30
    iput-object v0, p0, Landroidx/constraintlayout/motion/utils/Easing;->str:Ljava/lang/String;

    return-void
.end method

.method public static getInterpolator(Ljava/lang/String;)Landroidx/constraintlayout/motion/utils/Easing;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const-string v0, "cubic"

    .line 46
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 47
    new-instance v0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 49
    :cond_12
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_8c

    goto :goto_49

    :sswitch_1e
    const-string v1, "standard"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto :goto_49

    :cond_27
    const/4 v0, 0x3

    goto :goto_49

    :sswitch_29
    const-string v1, "linear"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    goto :goto_49

    :cond_32
    const/4 v0, 0x2

    goto :goto_49

    :sswitch_34
    const-string v1, "decelerate"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3d

    goto :goto_49

    :cond_3d
    const/4 v0, 0x1

    goto :goto_49

    :sswitch_3f
    const-string v1, "accelerate"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    goto :goto_49

    :cond_48
    const/4 v0, 0x0

    :goto_49
    packed-switch v0, :pswitch_data_9e

    .line 59
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "transitionEasing syntax error syntax:transitionEasing=\"cubic(1.0,0.5,0.0,0.6)\" or "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Landroidx/constraintlayout/motion/utils/Easing;->NAMED_EASING:[Ljava/lang/String;

    .line 61
    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ConstraintSet"

    .line 59
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    sget-object p0, Landroidx/constraintlayout/motion/utils/Easing;->sDefault:Landroidx/constraintlayout/motion/utils/Easing;

    return-object p0

    .line 51
    :pswitch_6b
    new-instance p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;

    const-string v0, "cubic(0.4, 0.0, 0.2, 1)"

    invoke-direct {p0, v0}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;-><init>(Ljava/lang/String;)V

    return-object p0

    .line 57
    :pswitch_73
    new-instance p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;

    const-string v0, "cubic(1, 1, 0, 0)"

    invoke-direct {p0, v0}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;-><init>(Ljava/lang/String;)V

    return-object p0

    .line 55
    :pswitch_7b
    new-instance p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;

    const-string v0, "cubic(0.0, 0.0, 0.2, 0.95)"

    invoke-direct {p0, v0}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;-><init>(Ljava/lang/String;)V

    return-object p0

    .line 53
    :pswitch_83
    new-instance p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;

    const-string v0, "cubic(0.4, 0.05, 0.8, 0.7)"

    invoke-direct {p0, v0}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;-><init>(Ljava/lang/String;)V

    return-object p0

    nop

    :sswitch_data_8c
    .sparse-switch
        -0x50bb8523 -> :sswitch_3f
        -0x4b5653c4 -> :sswitch_34
        -0x41b970db -> :sswitch_29
        0x4e3d1ebd -> :sswitch_1e
    .end sparse-switch

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_83
        :pswitch_7b
        :pswitch_73
        :pswitch_6b
    .end packed-switch
.end method


# virtual methods
.method public get(D)D
    .registers 3

    return-wide p1
.end method

.method public getDiff(D)D
    .registers 3

    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    return-wide p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 73
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/Easing;->str:Ljava/lang/String;

    return-object v0
.end method

###### Class androidx.constraintlayout.motion.utils.Easing.CubicEasing (androidx.constraintlayout.motion.utils.Easing$CubicEasing)
.class Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;
.super Landroidx/constraintlayout/motion/utils/Easing;
.source "Easing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/utils/Easing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CubicEasing"
.end annotation


# static fields
.field private static d_error:D = 1.0E-4

.field private static error:D = 0.01


# instance fields
.field x1:D

.field x2:D

.field y1:D

.field y2:D


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(DDDD)V
    .registers 9

    .line 100
    invoke-direct {p0}, Landroidx/constraintlayout/motion/utils/Easing;-><init>()V

    .line 101
    invoke-virtual/range {p0 .. p8}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->setup(DDDD)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 7

    .line 86
    invoke-direct {p0}, Landroidx/constraintlayout/motion/utils/Easing;-><init>()V

    .line 88
    iput-object p1, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->str:Ljava/lang/String;

    const/16 v0, 0x28

    .line 89
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v1, 0x2c

    .line 90
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    add-int/lit8 v0, v0, 0x1

    .line 91
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    iput-wide v3, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x1:D

    add-int/lit8 v2, v2, 0x1

    .line 92
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 93
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y1:D

    add-int/lit8 v0, v0, 0x1

    .line 94
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 95
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x2:D

    add-int/lit8 v1, v1, 0x1

    const/16 v0, 0x29

    .line 96
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 97
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y2:D

    return-void
.end method

.method private getDiffX(D)D
    .registers 15

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double v2, v0, p1

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    mul-double v6, v2, v4

    mul-double v6, v6, v2

    .line 131
    iget-wide v8, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x1:D

    mul-double v6, v6, v8

    const-wide/high16 v10, 0x4018000000000000L    # 6.0

    mul-double v2, v2, v10

    mul-double v2, v2, p1

    iget-wide v10, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x2:D

    sub-double v8, v10, v8

    mul-double v2, v2, v8

    add-double/2addr v6, v2

    mul-double v4, v4, p1

    mul-double v4, v4, p1

    sub-double/2addr v0, v10

    mul-double v4, v4, v0

    add-double/2addr v6, v4

    return-wide v6
.end method

.method private getDiffY(D)D
    .registers 15

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double v2, v0, p1

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    mul-double v6, v2, v4

    mul-double v6, v6, v2

    .line 136
    iget-wide v8, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y1:D

    mul-double v6, v6, v8

    const-wide/high16 v10, 0x4018000000000000L    # 6.0

    mul-double v2, v2, v10

    mul-double v2, v2, p1

    iget-wide v10, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y2:D

    sub-double v8, v10, v8

    mul-double v2, v2, v8

    add-double/2addr v6, v2

    mul-double v4, v4, p1

    mul-double v4, v4, p1

    sub-double/2addr v0, v10

    mul-double v4, v4, v0

    add-double/2addr v6, v4

    return-wide v6
.end method

.method private getX(D)D
    .registers 9

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p1

    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    mul-double v2, v2, v0

    mul-double v0, v0, v2

    mul-double v0, v0, p1

    mul-double v2, v2, p1

    mul-double v2, v2, p1

    mul-double v4, p1, p1

    mul-double v4, v4, p1

    .line 117
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x1:D

    mul-double p1, p1, v0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x2:D

    mul-double v0, v0, v2

    add-double/2addr p1, v0

    add-double/2addr p1, v4

    return-wide p1
.end method

.method private getY(D)D
    .registers 9

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p1

    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    mul-double v2, v2, v0

    mul-double v0, v0, v2

    mul-double v0, v0, p1

    mul-double v2, v2, p1

    mul-double v2, v2, p1

    mul-double v4, p1, p1

    mul-double v4, v4, p1

    .line 126
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y1:D

    mul-double p1, p1, v0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y2:D

    mul-double v0, v0, v2

    add-double/2addr p1, v0

    add-double/2addr p1, v4

    return-wide p1
.end method


# virtual methods
.method public get(D)D
    .registers 12

    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_7

    return-wide v0

    :cond_7
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-ltz v2, :cond_e

    return-wide v0

    :cond_e
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    move-wide v2, v0

    move-wide v4, v2

    .line 177
    :goto_12
    sget-wide v6, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->error:D

    cmpl-double v8, v2, v6

    if-lez v8, :cond_26

    .line 178
    invoke-direct {p0, v4, v5}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v6

    mul-double v2, v2, v0

    cmpg-double v8, v6, p1

    if-gez v8, :cond_24

    add-double/2addr v4, v2

    goto :goto_12

    :cond_24
    sub-double/2addr v4, v2

    goto :goto_12

    :cond_26
    sub-double v0, v4, v2

    .line 187
    invoke-direct {p0, v0, v1}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v6

    add-double/2addr v4, v2

    .line 188
    invoke-direct {p0, v4, v5}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v2

    .line 189
    invoke-direct {p0, v0, v1}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v0

    .line 190
    invoke-direct {p0, v4, v5}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v4

    sub-double/2addr v4, v0

    sub-double/2addr p1, v6

    mul-double v4, v4, p1

    sub-double/2addr v2, v6

    div-double/2addr v4, v2

    add-double/2addr v4, v0

    return-wide v4
.end method

.method public getDiff(D)D
    .registers 12

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    move-wide v2, v0

    move-wide v4, v2

    .line 146
    :goto_4
    sget-wide v6, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->d_error:D

    cmpl-double v8, v2, v6

    if-lez v8, :cond_18

    .line 147
    invoke-direct {p0, v4, v5}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v6

    mul-double v2, v2, v0

    cmpg-double v8, v6, p1

    if-gez v8, :cond_16

    add-double/2addr v4, v2

    goto :goto_4

    :cond_16
    sub-double/2addr v4, v2

    goto :goto_4

    :cond_18
    sub-double p1, v4, v2

    .line 156
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v0

    add-double/2addr v4, v2

    .line 157
    invoke-direct {p0, v4, v5}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getX(D)D

    move-result-wide v2

    .line 158
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide p1

    .line 159
    invoke-direct {p0, v4, v5}, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->getY(D)D

    move-result-wide v4

    sub-double/2addr v4, p1

    sub-double/2addr v2, v0

    div-double/2addr v4, v2

    return-wide v4
.end method

.method setup(DDDD)V
    .registers 9

    .line 105
    iput-wide p1, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x1:D

    .line 106
    iput-wide p3, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y1:D

    .line 107
    iput-wide p5, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->x2:D

    .line 108
    iput-wide p7, p0, Landroidx/constraintlayout/motion/utils/Easing$CubicEasing;->y2:D

    return-void
.end method
