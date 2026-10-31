###### Class androidx.constraintlayout.motion.utils.ArcCurveFit (androidx.constraintlayout.motion.utils.ArcCurveFit)
.class Landroidx/constraintlayout/motion/utils/ArcCurveFit;
.super Landroidx/constraintlayout/motion/utils/CurveFit;
.source "ArcCurveFit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;
    }
.end annotation


# static fields
.field public static final ARC_START_FLIP:I = 0x3

.field public static final ARC_START_HORIZONTAL:I = 0x2

.field public static final ARC_START_LINEAR:I = 0x0

.field public static final ARC_START_VERTICAL:I = 0x1

.field private static final START_HORIZONTAL:I = 0x2

.field private static final START_LINEAR:I = 0x3

.field private static final START_VERTICAL:I = 0x1


# instance fields
.field mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

.field private final mTime:[D


# direct methods
.method public constructor <init>([I[D[[D)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    .line 168
    invoke-direct/range {p0 .. p0}, Landroidx/constraintlayout/motion/utils/CurveFit;-><init>()V

    .line 169
    iput-object v1, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mTime:[D

    .line 170
    array-length v2, v1

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    new-array v2, v2, [Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    iput-object v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    .line 173
    :goto_14
    iget-object v7, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v8, v7

    if-ge v4, v8, :cond_57

    .line 174
    aget v8, p1, v4

    const/4 v9, 0x3

    const/4 v10, 0x2

    if-eqz v8, :cond_33

    if-eq v8, v3, :cond_30

    if-eq v8, v10, :cond_2d

    if-eq v8, v9, :cond_26

    goto :goto_34

    :cond_26
    if-ne v5, v3, :cond_2a

    const/4 v5, 0x2

    goto :goto_2b

    :cond_2a
    const/4 v5, 0x1

    :goto_2b
    move v6, v5

    goto :goto_34

    :cond_2d
    const/4 v5, 0x2

    const/4 v6, 0x2

    goto :goto_34

    :cond_30
    const/4 v5, 0x1

    const/4 v6, 0x1

    goto :goto_34

    :cond_33
    const/4 v6, 0x3

    .line 188
    :goto_34
    new-instance v22, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-wide v10, v1, v4

    add-int/lit8 v23, v4, 0x1

    aget-wide v12, v1, v23

    aget-object v8, p3, v4

    aget-wide v14, v8, v2

    aget-object v8, p3, v4

    aget-wide v16, v8, v3

    aget-object v8, p3, v23

    aget-wide v18, v8, v2

    aget-object v8, p3, v23

    aget-wide v20, v8, v3

    move-object/from16 v8, v22

    move v9, v6

    invoke-direct/range {v8 .. v21}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;-><init>(IDDDDDD)V

    aput-object v22, v7, v4

    move/from16 v4, v23

    goto :goto_14

    :cond_57
    return-void
.end method


# virtual methods
.method public getPos(DI)D
    .registers 8

    .line 110
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    cmpg-double v0, p1, v2

    if-gez v0, :cond_12

    .line 111
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    goto :goto_28

    .line 112
    :cond_12
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v0, v2

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpl-double v0, p1, v2

    if-lez v0, :cond_28

    .line 113
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length p2, p1

    add-int/lit8 p2, p2, -0x1

    aget-object p1, p1, p2

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    .line 116
    :cond_28
    :goto_28
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v2, v0

    if-ge v1, v2, :cond_6f

    .line 117
    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpg-double v0, p1, v2

    if-gtz v0, :cond_6c

    .line 119
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v0, v0, v1

    iget-boolean v0, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-eqz v0, :cond_51

    if-nez p3, :cond_48

    .line 121
    iget-object p3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p3, p3, v1

    invoke-virtual {p3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearX(D)D

    move-result-wide p1

    return-wide p1

    .line 123
    :cond_48
    iget-object p3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p3, p3, v1

    invoke-virtual {p3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearY(D)D

    move-result-wide p1

    return-wide p1

    .line 125
    :cond_51
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v0, v0, v1

    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->setPoint(D)V

    if-nez p3, :cond_63

    .line 128
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getX()D

    move-result-wide p1

    return-wide p1

    .line 130
    :cond_63
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getY()D

    move-result-wide p1

    return-wide p1

    :cond_6c
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    :cond_6f
    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1
.end method

.method public getPos(D[D)V
    .registers 10

    .line 40
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    cmpg-double v0, p1, v2

    if-gez v0, :cond_11

    .line 41
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    .line 43
    :cond_11
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v2, v0

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    aget-object v0, v0, v2

    iget-wide v4, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpl-double v0, p1, v4

    if-lez v0, :cond_26

    .line 44
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length p2, p1

    sub-int/2addr p2, v3

    aget-object p1, p1, p2

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    :cond_26
    const/4 v0, 0x0

    .line 47
    :goto_27
    iget-object v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v4, v2

    if-ge v0, v4, :cond_70

    .line 48
    aget-object v2, v2, v0

    iget-wide v4, v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpg-double v2, p1, v4

    if-gtz v2, :cond_6d

    .line 49
    iget-object v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-eqz v2, :cond_51

    .line 50
    iget-object v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearX(D)D

    move-result-wide v4

    aput-wide v4, p3, v1

    .line 51
    iget-object v1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v0, v1, v0

    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearY(D)D

    move-result-wide p1

    aput-wide p1, p3, v3

    return-void

    .line 54
    :cond_51
    iget-object v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->setPoint(D)V

    .line 55
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getX()D

    move-result-wide p1

    aput-wide p1, p3, v1

    .line 56
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getY()D

    move-result-wide p1

    aput-wide p1, p3, v3

    return-void

    :cond_6d
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    :cond_70
    return-void
.end method

.method public getPos(D[F)V
    .registers 10

    .line 64
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    const/4 v0, 0x1

    cmpg-double v4, p1, v2

    if-gez v4, :cond_13

    .line 65
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    goto :goto_27

    .line 66
    :cond_13
    iget-object v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v3, v2

    sub-int/2addr v3, v0

    aget-object v2, v2, v3

    iget-wide v2, v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpl-double v4, p1, v2

    if-lez v4, :cond_27

    .line 67
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length p2, p1

    sub-int/2addr p2, v0

    aget-object p1, p1, p2

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    :cond_27
    :goto_27
    const/4 v2, 0x0

    .line 70
    :goto_28
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v4, v3

    if-ge v2, v4, :cond_75

    .line 71
    aget-object v3, v3, v2

    iget-wide v3, v3, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpg-double v5, p1, v3

    if-gtz v5, :cond_72

    .line 72
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v3, v3, v2

    iget-boolean v3, v3, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-eqz v3, :cond_54

    .line 73
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearX(D)D

    move-result-wide v3

    double-to-float v3, v3

    aput v3, p3, v1

    .line 74
    iget-object v1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v1, v1, v2

    invoke-virtual {v1, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearY(D)D

    move-result-wide p1

    double-to-float p1, p1

    aput p1, p3, v0

    return-void

    .line 77
    :cond_54
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->setPoint(D)V

    .line 78
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v2

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getX()D

    move-result-wide p1

    double-to-float p1, p1

    aput p1, p3, v1

    .line 79
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v2

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getY()D

    move-result-wide p1

    double-to-float p1, p1

    aput p1, p3, v0

    return-void

    :cond_72
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    :cond_75
    return-void
.end method

.method public getSlope(DI)D
    .registers 8

    .line 138
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    cmpg-double v0, p1, v2

    if-gez v0, :cond_11

    .line 139
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    .line 141
    :cond_11
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v0, v0, v2

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpl-double v0, p1, v2

    if-lez v0, :cond_27

    .line 142
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length p2, p1

    add-int/lit8 p2, p2, -0x1

    aget-object p1, p1, p2

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    .line 145
    :cond_27
    :goto_27
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v2, v0

    if-ge v1, v2, :cond_6e

    .line 146
    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpg-double v0, p1, v2

    if-gtz v0, :cond_6b

    .line 147
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v0, v0, v1

    iget-boolean v0, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-eqz v0, :cond_50

    if-nez p3, :cond_47

    .line 149
    iget-object p3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p3, p3, v1

    invoke-virtual {p3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearDX(D)D

    move-result-wide p1

    return-wide p1

    .line 151
    :cond_47
    iget-object p3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p3, p3, v1

    invoke-virtual {p3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearDY(D)D

    move-result-wide p1

    return-wide p1

    .line 153
    :cond_50
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v0, v0, v1

    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->setPoint(D)V

    if-nez p3, :cond_62

    .line 155
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getDX()D

    move-result-wide p1

    return-wide p1

    .line 157
    :cond_62
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getDY()D

    move-result-wide p1

    return-wide p1

    :cond_6b
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    :cond_6e
    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    return-wide p1
.end method

.method public getSlope(D[D)V
    .registers 10

    .line 87
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-wide v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    const/4 v0, 0x1

    cmpg-double v4, p1, v2

    if-gez v4, :cond_13

    .line 88
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v1

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    goto :goto_27

    .line 89
    :cond_13
    iget-object v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v3, v2

    sub-int/2addr v3, v0

    aget-object v2, v2, v3

    iget-wide v2, v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpl-double v4, p1, v2

    if-lez v4, :cond_27

    .line 90
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length p2, p1

    sub-int/2addr p2, v0

    aget-object p1, p1, p2

    iget-wide p1, p1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    :cond_27
    :goto_27
    const/4 v2, 0x0

    .line 93
    :goto_28
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    array-length v4, v3

    if-ge v2, v4, :cond_71

    .line 94
    aget-object v3, v3, v2

    iget-wide v3, v3, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    cmpg-double v5, p1, v3

    if-gtz v5, :cond_6e

    .line 95
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v3, v3, v2

    iget-boolean v3, v3, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-eqz v3, :cond_52

    .line 96
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearDX(D)D

    move-result-wide v3

    aput-wide v3, p3, v1

    .line 97
    iget-object v1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v1, v1, v2

    invoke-virtual {v1, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getLinearDY(D)D

    move-result-wide p1

    aput-wide p1, p3, v0

    return-void

    .line 100
    :cond_52
    iget-object v3, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1, p2}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->setPoint(D)V

    .line 101
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v2

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getDX()D

    move-result-wide p1

    aput-wide p1, p3, v1

    .line 102
    iget-object p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mArcs:[Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;

    aget-object p1, p1, v2

    invoke-virtual {p1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->getDY()D

    move-result-wide p1

    aput-wide p1, p3, v0

    return-void

    :cond_6e
    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    :cond_71
    return-void
.end method

.method public getTimePoints()[D
    .registers 2

    .line 165
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit;->mTime:[D

    return-object v0
.end method

###### Class androidx.constraintlayout.motion.utils.ArcCurveFit.Arc (androidx.constraintlayout.motion.utils.ArcCurveFit$Arc)
.class Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;
.super Ljava/lang/Object;
.source "ArcCurveFit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/motion/utils/ArcCurveFit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Arc"
.end annotation


# static fields
.field private static final EPSILON:D = 0.001

.field private static final TAG:Ljava/lang/String; = "Arc"

.field private static ourPercent:[D


# instance fields
.field linear:Z

.field mArcDistance:D

.field mArcVelocity:D

.field mEllipseA:D

.field mEllipseB:D

.field mEllipseCenterX:D

.field mEllipseCenterY:D

.field mLut:[D

.field mOneOverDeltaTime:D

.field mTime1:D

.field mTime2:D

.field mTmpCosAngle:D

.field mTmpSinAngle:D

.field mVertical:Z

.field mX1:D

.field mX2:D

.field mY1:D

.field mY2:D


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x5b

    new-array v0, v0, [D

    .line 194
    sput-object v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    return-void
.end method

.method constructor <init>(IDDDDDD)V
    .registers 34

    move-object/from16 v9, p0

    move/from16 v0, p1

    move-wide/from16 v1, p2

    move-wide/from16 v3, p4

    move-wide/from16 v5, p6

    move-wide/from16 v7, p8

    move-wide/from16 v10, p10

    move-wide/from16 v12, p12

    .line 212
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const/4 v14, 0x0

    .line 209
    iput-boolean v14, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    const/4 v15, 0x1

    if-ne v0, v15, :cond_1a

    const/4 v14, 0x1

    .line 213
    :cond_1a
    iput-boolean v14, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    .line 214
    iput-wide v1, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    .line 215
    iput-wide v3, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    sub-double v1, v3, v1

    div-double v1, v16, v1

    .line 216
    iput-wide v1, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    const/4 v1, 0x3

    if-ne v1, v0, :cond_2d

    .line 218
    iput-boolean v15, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    :cond_2d
    sub-double v0, v10, v5

    sub-double v2, v12, v7

    .line 222
    iget-boolean v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    if-nez v4, :cond_8b

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    const-wide v18, 0x3f50624dd2f1a9fcL    # 0.001

    cmpg-double v4, v16, v18

    if-ltz v4, :cond_8b

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    cmpg-double v4, v16, v18

    if-gez v4, :cond_4b

    goto :goto_8b

    :cond_4b
    const/16 v4, 0x65

    new-array v4, v4, [D

    .line 234
    iput-object v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    .line 235
    iget-boolean v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v4, :cond_57

    const/4 v14, -0x1

    goto :goto_58

    :cond_57
    const/4 v14, 0x1

    :goto_58
    int-to-double v12, v14

    mul-double v0, v0, v12

    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    if-eqz v4, :cond_60

    goto :goto_61

    :cond_60
    const/4 v15, -0x1

    :goto_61
    int-to-double v0, v15

    mul-double v2, v2, v0

    .line 236
    iput-wide v2, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    if-eqz v4, :cond_6a

    move-wide v0, v10

    goto :goto_6b

    :cond_6a
    move-wide v0, v5

    .line 237
    :goto_6b
    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    if-eqz v4, :cond_71

    move-wide v0, v7

    goto :goto_73

    :cond_71
    move-wide/from16 v0, p12

    .line 238
    :goto_73
    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    move-object/from16 v0, p0

    move-wide/from16 v1, p6

    move-wide/from16 v3, p8

    move-wide/from16 v5, p10

    move-wide/from16 v7, p12

    .line 239
    invoke-direct/range {v0 .. v8}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->buildTable(DDDD)V

    .line 240
    iget-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    iget-wide v2, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, v2

    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    return-void

    .line 223
    :cond_8b
    :goto_8b
    iput-boolean v15, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->linear:Z

    .line 224
    iput-wide v5, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX1:D

    .line 225
    iput-wide v10, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX2:D

    .line 226
    iput-wide v7, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY1:D

    move-wide/from16 v4, p12

    .line 227
    iput-wide v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY2:D

    .line 228
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    iput-wide v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    .line 229
    iget-wide v6, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v4, v4, v6

    iput-wide v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    .line 230
    iget-wide v4, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    iget-wide v6, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v10, v4, v6

    div-double/2addr v0, v10

    iput-wide v0, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    sub-double/2addr v4, v6

    div-double/2addr v2, v4

    .line 231
    iput-wide v2, v9, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    return-void
.end method

.method private buildTable(DDDD)V
    .registers 29

    move-object/from16 v0, p0

    sub-double v1, p5, p1

    sub-double v3, p3, p7

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    .line 311
    :goto_d
    sget-object v15, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v5, v15

    if-ge v8, v5, :cond_4f

    const-wide v16, 0x4056800000000000L    # 90.0

    int-to-double v6, v8

    mul-double v6, v6, v16

    .line 312
    array-length v5, v15

    add-int/lit8 v5, v5, -0x1

    move-wide/from16 p4, v9

    int-to-double v9, v5

    div-double/2addr v6, v9

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    .line 313
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    .line 314
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    mul-double v9, v9, v1

    mul-double v5, v5, v3

    if-lez v8, :cond_43

    sub-double v11, v9, v11

    sub-double v13, v5, v13

    .line 318
    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v11

    move-wide/from16 v13, p4

    add-double/2addr v11, v13

    .line 319
    sget-object v7, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    aput-wide v11, v7, v8

    goto :goto_46

    :cond_43
    move-wide/from16 v13, p4

    move-wide v11, v13

    :goto_46
    add-int/lit8 v8, v8, 0x1

    move-wide v13, v5

    move-wide/from16 v18, v9

    move-wide v9, v11

    move-wide/from16 v11, v18

    goto :goto_d

    :cond_4f
    move-wide v13, v9

    .line 325
    iput-wide v13, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcDistance:D

    const/4 v1, 0x0

    .line 327
    :goto_53
    sget-object v2, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v3, v2

    if-ge v1, v3, :cond_60

    .line 328
    aget-wide v3, v2, v1

    div-double/2addr v3, v13

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_53

    :cond_60
    const/4 v5, 0x0

    .line 330
    :goto_61
    iget-object v1, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    array-length v2, v1

    if-ge v5, v2, :cond_ac

    int-to-double v2, v5

    .line 331
    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    int-to-double v6, v1

    div-double/2addr v2, v6

    .line 332
    sget-object v1, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    invoke-static {v1, v2, v3}, Ljava/util/Arrays;->binarySearch([DD)I

    move-result v1

    if-ltz v1, :cond_82

    .line 334
    iget-object v2, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    sget-object v3, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    array-length v3, v3

    add-int/lit8 v3, v3, -0x1

    div-int/2addr v1, v3

    int-to-double v3, v1

    aput-wide v3, v2, v5

    const-wide/16 v6, 0x0

    goto :goto_a9

    :cond_82
    const/4 v4, -0x1

    if-ne v1, v4, :cond_8c

    .line 336
    iget-object v1, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    const-wide/16 v6, 0x0

    aput-wide v6, v1, v5

    goto :goto_a9

    :cond_8c
    const-wide/16 v6, 0x0

    neg-int v1, v1

    add-int/lit8 v4, v1, -0x2

    add-int/lit8 v1, v1, -0x1

    int-to-double v8, v4

    .line 341
    sget-object v10, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->ourPercent:[D

    aget-wide v11, v10, v4

    sub-double/2addr v2, v11

    aget-wide v11, v10, v1

    aget-wide v13, v10, v4

    sub-double/2addr v11, v13

    div-double/2addr v2, v11

    add-double/2addr v8, v2

    array-length v1, v10

    add-int/lit8 v1, v1, -0x1

    int-to-double v1, v1

    div-double/2addr v8, v1

    .line 343
    iget-object v1, v0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    aput-wide v8, v1, v5

    :goto_a9
    add-int/lit8 v5, v5, 0x1

    goto :goto_61

    :cond_ac
    return-void
.end method


# virtual methods
.method getDX()D
    .registers 7

    .line 260
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v0, v0, v2

    .line 261
    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    neg-double v2, v2

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    .line 262
    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    div-double/2addr v4, v2

    .line 263
    iget-boolean v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v2, :cond_19

    neg-double v0, v0

    :cond_19
    mul-double v0, v0, v4

    return-wide v0
.end method

.method getDY()D
    .registers 7

    .line 267
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v0, v0, v2

    .line 268
    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    neg-double v2, v2

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    .line 269
    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mArcVelocity:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    div-double/2addr v4, v0

    .line 270
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_1c

    neg-double v0, v2

    mul-double v0, v0, v4

    goto :goto_1e

    :cond_1c
    mul-double v0, v2, v4

    :goto_1e
    return-wide v0
.end method

.method public getLinearDX(D)D
    .registers 3

    .line 284
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    return-wide p1
.end method

.method public getLinearDY(D)D
    .registers 3

    .line 288
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    return-wide p1
.end method

.method public getLinearX(D)D
    .registers 7

    .line 274
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double/2addr p1, v0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double p1, p1, v0

    .line 275
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX1:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mX2:D

    sub-double/2addr v2, v0

    mul-double p1, p1, v2

    add-double/2addr v0, p1

    return-wide v0
.end method

.method public getLinearY(D)D
    .registers 7

    .line 279
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double/2addr p1, v0

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double p1, p1, v0

    .line 280
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY1:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mY2:D

    sub-double/2addr v2, v0

    mul-double p1, p1, v2

    add-double/2addr v0, p1

    return-wide v0
.end method

.method getX()D
    .registers 7

    .line 252
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterX:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseA:D

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method getY()D
    .registers 7

    .line 256
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseCenterY:D

    iget-wide v2, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mEllipseB:D

    iget-wide v4, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    mul-double v2, v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method lookup(D)D
    .registers 11

    const-wide/16 v0, 0x0

    cmpg-double v2, p1, v0

    if-gtz v2, :cond_7

    return-wide v0

    :cond_7
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-ltz v2, :cond_e

    return-wide v0

    .line 298
    :cond_e
    iget-object v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mLut:[D

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    int-to-double v1, v1

    mul-double p1, p1, v1

    double-to-int v1, p1

    int-to-double v2, v1

    sub-double/2addr p1, v2

    .line 303
    aget-wide v2, v0, v1

    add-int/lit8 v4, v1, 0x1

    aget-wide v4, v0, v4

    aget-wide v6, v0, v1

    sub-double/2addr v4, v6

    mul-double p1, p1, v4

    add-double/2addr v2, p1

    return-wide v2
.end method

.method setPoint(D)V
    .registers 5

    .line 244
    iget-boolean v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mVertical:Z

    if-eqz v0, :cond_8

    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime2:D

    sub-double/2addr v0, p1

    goto :goto_c

    :cond_8
    iget-wide v0, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTime1:D

    sub-double v0, p1, v0

    :goto_c
    iget-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mOneOverDeltaTime:D

    mul-double v0, v0, p1

    const-wide p1, 0x3ff921fb54442d18L    # 1.5707963267948966

    .line 245
    invoke-virtual {p0, v0, v1}, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->lookup(D)D

    move-result-wide v0

    mul-double v0, v0, p1

    .line 247
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    iput-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpSinAngle:D

    .line 248
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    iput-wide p1, p0, Landroidx/constraintlayout/motion/utils/ArcCurveFit$Arc;->mTmpCosAngle:D

    return-void
.end method
