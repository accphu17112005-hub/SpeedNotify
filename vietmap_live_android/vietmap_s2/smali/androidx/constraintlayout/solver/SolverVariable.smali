###### Class androidx.constraintlayout.solver.SolverVariable (androidx.constraintlayout.solver.SolverVariable)
.class public Landroidx/constraintlayout/solver/SolverVariable;
.super Ljava/lang/Object;
.source "SolverVariable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/SolverVariable$Type;
    }
.end annotation


# static fields
.field private static final INTERNAL_DEBUG:Z = false

.field static final MAX_STRENGTH:I = 0x9

.field public static final STRENGTH_BARRIER:I = 0x6

.field public static final STRENGTH_CENTERING:I = 0x7

.field public static final STRENGTH_EQUALITY:I = 0x5

.field public static final STRENGTH_FIXED:I = 0x8

.field public static final STRENGTH_HIGH:I = 0x3

.field public static final STRENGTH_HIGHEST:I = 0x4

.field public static final STRENGTH_LOW:I = 0x1

.field public static final STRENGTH_MEDIUM:I = 0x2

.field public static final STRENGTH_NONE:I = 0x0

.field private static final VAR_USE_HASH:Z = false

.field private static uniqueConstantId:I = 0x1

.field private static uniqueErrorId:I = 0x1

.field private static uniqueId:I = 0x1

.field private static uniqueSlackId:I = 0x1

.field private static uniqueUnrestrictedId:I = 0x1


# instance fields
.field public computedValue:F

.field definitionId:I

.field goalStrengthVector:[F

.field public id:I

.field public inGoal:Z

.field inRows:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroidx/constraintlayout/solver/ArrayRow;",
            ">;"
        }
    .end annotation
.end field

.field public isFinalValue:Z

.field isSynonym:Z

.field mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

.field mClientEquationsCount:I

.field private mName:Ljava/lang/String;

.field mType:Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public strength:I

.field strengthVector:[F

.field synonym:I

.field synonymDelta:F

.field public usageInRowCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V
    .registers 6

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, -0x1

    .line 53
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 54
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v0, 0x0

    .line 55
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    .line 57
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->isFinalValue:Z

    const/16 v1, 0x9

    new-array v2, v1, [F

    .line 60
    iput-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    new-array v1, v1, [F

    .line 61
    iput-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    const/16 v1, 0x10

    new-array v1, v1, [Landroidx/constraintlayout/solver/ArrayRow;

    .line 65
    iput-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 66
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 67
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 68
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->isSynonym:Z

    .line 69
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonym:I

    const/4 p2, 0x0

    .line 70
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonymDelta:F

    const/4 p2, 0x0

    .line 172
    iput-object p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->inRows:Ljava/util/HashSet;

    .line 130
    iput-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mType:Landroidx/constraintlayout/solver/SolverVariable$Type;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroidx/constraintlayout/solver/SolverVariable$Type;)V
    .registers 7

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 53
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 54
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v1, 0x0

    .line 55
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    .line 57
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->isFinalValue:Z

    const/16 v2, 0x9

    new-array v3, v2, [F

    .line 60
    iput-object v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    new-array v2, v2, [F

    .line 61
    iput-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    const/16 v2, 0x10

    new-array v2, v2, [Landroidx/constraintlayout/solver/ArrayRow;

    .line 65
    iput-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 66
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 67
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 68
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->isSynonym:Z

    .line 69
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonym:I

    const/4 v0, 0x0

    .line 70
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonymDelta:F

    const/4 v0, 0x0

    .line 172
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->inRows:Ljava/util/HashSet;

    .line 125
    iput-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mName:Ljava/lang/String;

    .line 126
    iput-object p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mType:Landroidx/constraintlayout/solver/SolverVariable$Type;

    return-void
.end method

.method private static getUniqueName(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    if-eqz p1, :cond_14

    .line 104
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 106
    :cond_14
    sget-object p1, Landroidx/constraintlayout/solver/SolverVariable$1;->$SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I

    invoke-virtual {p0}, Landroidx/constraintlayout/solver/SolverVariable$Type;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_91

    const/4 v1, 0x2

    if-eq p1, v1, :cond_7a

    const/4 v1, 0x3

    if-eq p1, v1, :cond_63

    const/4 v1, 0x4

    if-eq p1, v1, :cond_4c

    const/4 v1, 0x5

    if-ne p1, v1, :cond_42

    .line 114
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "V"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueId:I

    add-int/2addr p1, v0

    sput p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 116
    :cond_42
    new-instance p1, Ljava/lang/AssertionError;

    invoke-virtual {p0}, Landroidx/constraintlayout/solver/SolverVariable$Type;->name()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 111
    :cond_4c
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "e"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    add-int/2addr p1, v0

    sput p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 109
    :cond_63
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "S"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueSlackId:I

    add-int/2addr p1, v0

    sput p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueSlackId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 108
    :cond_7a
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "C"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueConstantId:I

    add-int/2addr p1, v0

    sput p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueConstantId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 107
    :cond_91
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "U"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueUnrestrictedId:I

    add-int/2addr p1, v0

    sput p1, Landroidx/constraintlayout/solver/SolverVariable;->uniqueUnrestrictedId:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static increaseErrorId()V
    .registers 1

    .line 99
    sget v0, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Landroidx/constraintlayout/solver/SolverVariable;->uniqueErrorId:I

    return-void
.end method


# virtual methods
.method public final addToRow(Landroidx/constraintlayout/solver/ArrayRow;)V
    .registers 5

    const/4 v0, 0x0

    .line 178
    :goto_1
    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    if-ge v0, v1, :cond_f

    .line 179
    iget-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_c

    return-void

    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 183
    :cond_f
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    array-length v2, v0

    if-lt v1, v2, :cond_1f

    .line 184
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/ArrayRow;

    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    .line 186
    :cond_1f
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    aput-object p1, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 187
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void
.end method

.method clearStrengths()V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x9

    if-ge v0, v1, :cond_d

    .line 138
    iget-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    const/4 v2, 0x0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_d
    return-void
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 287
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public final removeFromRow(Landroidx/constraintlayout/solver/ArrayRow;)V
    .registers 6

    .line 195
    iget v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v0, :cond_23

    .line 197
    iget-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v2, v2, v1

    if-ne v2, p1, :cond_20

    :goto_b
    add-int/lit8 p1, v0, -0x1

    if-ge v1, p1, :cond_19

    .line 199
    iget-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    add-int/lit8 v2, v1, 0x1

    aget-object v3, p1, v2

    aput-object v3, p1, v1

    move v1, v2

    goto :goto_b

    .line 201
    :cond_19
    iget p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void

    :cond_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_23
    return-void
.end method

.method public reset()V
    .registers 7

    const/4 v0, 0x0

    .line 257
    iput-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mName:Ljava/lang/String;

    .line 258
    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNKNOWN:Landroidx/constraintlayout/solver/SolverVariable$Type;

    iput-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mType:Landroidx/constraintlayout/solver/SolverVariable$Type;

    const/4 v1, 0x0

    .line 259
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->strength:I

    const/4 v2, -0x1

    .line 260
    iput v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    .line 261
    iput v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v3, 0x0

    .line 262
    iput v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->computedValue:F

    .line 263
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->isFinalValue:Z

    .line 264
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->isSynonym:Z

    .line 265
    iput v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonym:I

    .line 266
    iput v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonymDelta:F

    .line 270
    iget v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    const/4 v4, 0x0

    :goto_1d
    if-ge v4, v2, :cond_26

    .line 272
    iget-object v5, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aput-object v0, v5, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1d

    .line 274
    :cond_26
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 276
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->usageInRowCount:I

    .line 277
    iput-boolean v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->inGoal:Z

    .line 278
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->goalStrengthVector:[F

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([FF)V

    return-void
.end method

.method public setFinalValue(Landroidx/constraintlayout/solver/LinearSystem;F)V
    .registers 6

    .line 227
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->computedValue:F

    const/4 p2, 0x1

    .line 228
    iput-boolean p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->isFinalValue:Z

    const/4 p2, 0x0

    .line 229
    iput-boolean p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->isSynonym:Z

    const/4 v0, -0x1

    .line 230
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonym:I

    const/4 v1, 0x0

    .line 231
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonymDelta:F

    .line 232
    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 233
    iput v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 v0, 0x0

    :goto_13
    if-ge v0, v1, :cond_1f

    .line 235
    iget-object v2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1, p0, p2}, Landroidx/constraintlayout/solver/ArrayRow;->updateFromFinalVariable(Landroidx/constraintlayout/solver/LinearSystem;Landroidx/constraintlayout/solver/SolverVariable;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 237
    :cond_1f
    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2

    .line 290
    iput-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mName:Ljava/lang/String;

    return-void
.end method

.method public setSynonym(Landroidx/constraintlayout/solver/LinearSystem;Landroidx/constraintlayout/solver/SolverVariable;F)V
    .registers 6

    const/4 v0, 0x1

    .line 244
    iput-boolean v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->isSynonym:Z

    .line 245
    iget p2, p2, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    iput p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonym:I

    .line 246
    iput p3, p0, Landroidx/constraintlayout/solver/SolverVariable;->synonymDelta:F

    .line 247
    iget p2, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    const/4 p3, -0x1

    .line 248
    iput p3, p0, Landroidx/constraintlayout/solver/SolverVariable;->definitionId:I

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_10
    if-ge v0, p2, :cond_1c

    .line 250
    iget-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p0, p3}, Landroidx/constraintlayout/solver/ArrayRow;->updateFromSynonymVariable(Landroidx/constraintlayout/solver/LinearSystem;Landroidx/constraintlayout/solver/SolverVariable;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 252
    :cond_1c
    iput p3, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    .line 253
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/LinearSystem;->displayReadableRows()V

    return-void
.end method

.method public setType(Landroidx/constraintlayout/solver/SolverVariable$Type;Ljava/lang/String;)V
    .registers 3

    .line 292
    iput-object p1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mType:Landroidx/constraintlayout/solver/SolverVariable$Type;

    return-void
.end method

.method strengthsToString()Ljava/lang/String;
    .registers 10

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 146
    :goto_16
    iget-object v6, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    array-length v6, v6

    if-ge v3, v6, :cond_71

    .line 147
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    aget v0, v0, v3

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 148
    iget-object v6, p0, Landroidx/constraintlayout/solver/SolverVariable;->strengthVector:[F

    aget v7, v6, v3

    const/4 v8, 0x0

    cmpl-float v7, v7, v8

    if-lez v7, :cond_39

    const/4 v4, 0x0

    goto :goto_40

    .line 150
    :cond_39
    aget v7, v6, v3

    cmpg-float v7, v7, v8

    if-gez v7, :cond_40

    const/4 v4, 0x1

    .line 153
    :cond_40
    :goto_40
    aget v7, v6, v3

    cmpl-float v7, v7, v8

    if-eqz v7, :cond_47

    const/4 v5, 0x0

    .line 156
    :cond_47
    array-length v6, v6

    sub-int/2addr v6, v1

    if-ge v3, v6, :cond_5d

    .line 157
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6e

    .line 159
    :cond_5d
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_71
    if-eqz v4, :cond_84

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (-)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_84
    if-eqz v5, :cond_97

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (*)"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_97
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 313
    iget-object v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mName:Ljava/lang/String;

    const-string v1, ""

    if-eqz v0, :cond_18

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_29

    .line 316
    :cond_18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_29
    return-object v0
.end method

.method public final updateReferencesWithNewDefinition(Landroidx/constraintlayout/solver/LinearSystem;Landroidx/constraintlayout/solver/ArrayRow;)V
    .registers 7

    .line 215
    iget v0, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v0, :cond_10

    .line 217
    iget-object v3, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquations:[Landroidx/constraintlayout/solver/ArrayRow;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1, p2, v1}, Landroidx/constraintlayout/solver/ArrayRow;->updateFromRow(Landroidx/constraintlayout/solver/LinearSystem;Landroidx/constraintlayout/solver/ArrayRow;Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 219
    :cond_10
    iput v1, p0, Landroidx/constraintlayout/solver/SolverVariable;->mClientEquationsCount:I

    return-void
.end method

###### Class androidx.constraintlayout.solver.SolverVariable.AnonymousClass1 (androidx.constraintlayout.solver.SolverVariable$1)
.class synthetic Landroidx/constraintlayout/solver/SolverVariable$1;
.super Ljava/lang/Object;
.source "SolverVariable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/SolverVariable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 106
    invoke-static {}, Landroidx/constraintlayout/solver/SolverVariable$Type;->values()[Landroidx/constraintlayout/solver/SolverVariable$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Landroidx/constraintlayout/solver/SolverVariable$1;->$SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I

    :try_start_9
    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/SolverVariable$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$1;->$SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I

    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->CONSTANT:Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/SolverVariable$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    :try_start_1d
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$1;->$SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I

    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->SLACK:Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/SolverVariable$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_28} :catch_28

    :catch_28
    :try_start_28
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$1;->$SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I

    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->ERROR:Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/SolverVariable$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_33

    :catch_33
    :try_start_33
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$1;->$SwitchMap$androidx$constraintlayout$solver$SolverVariable$Type:[I

    sget-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNKNOWN:Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/SolverVariable$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3e

    :catch_3e
    return-void
.end method

###### Class androidx.constraintlayout.solver.SolverVariable.Type (androidx.constraintlayout.solver.SolverVariable$Type)
.class public final enum Landroidx/constraintlayout/solver/SolverVariable$Type;
.super Ljava/lang/Enum;
.source "SolverVariable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/SolverVariable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/solver/SolverVariable$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public static final enum CONSTANT:Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public static final enum ERROR:Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public static final enum SLACK:Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public static final enum UNKNOWN:Landroidx/constraintlayout/solver/SolverVariable$Type;

.field public static final enum UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 79
    new-instance v0, Landroidx/constraintlayout/solver/SolverVariable$Type;

    const-string v1, "UNRESTRICTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/solver/SolverVariable$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNRESTRICTED:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 83
    new-instance v1, Landroidx/constraintlayout/solver/SolverVariable$Type;

    const-string v3, "CONSTANT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroidx/constraintlayout/solver/SolverVariable$Type;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroidx/constraintlayout/solver/SolverVariable$Type;->CONSTANT:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 87
    new-instance v3, Landroidx/constraintlayout/solver/SolverVariable$Type;

    const-string v5, "SLACK"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroidx/constraintlayout/solver/SolverVariable$Type;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroidx/constraintlayout/solver/SolverVariable$Type;->SLACK:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 91
    new-instance v5, Landroidx/constraintlayout/solver/SolverVariable$Type;

    const-string v7, "ERROR"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroidx/constraintlayout/solver/SolverVariable$Type;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroidx/constraintlayout/solver/SolverVariable$Type;->ERROR:Landroidx/constraintlayout/solver/SolverVariable$Type;

    .line 95
    new-instance v7, Landroidx/constraintlayout/solver/SolverVariable$Type;

    const-string v9, "UNKNOWN"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroidx/constraintlayout/solver/SolverVariable$Type;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroidx/constraintlayout/solver/SolverVariable$Type;->UNKNOWN:Landroidx/constraintlayout/solver/SolverVariable$Type;

    const/4 v9, 0x5

    new-array v9, v9, [Landroidx/constraintlayout/solver/SolverVariable$Type;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 75
    sput-object v9, Landroidx/constraintlayout/solver/SolverVariable$Type;->$VALUES:[Landroidx/constraintlayout/solver/SolverVariable$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 75
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/solver/SolverVariable$Type;
    .registers 2

    .line 75
    const-class v0, Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/solver/SolverVariable$Type;

    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/solver/SolverVariable$Type;
    .registers 1

    .line 75
    sget-object v0, Landroidx/constraintlayout/solver/SolverVariable$Type;->$VALUES:[Landroidx/constraintlayout/solver/SolverVariable$Type;

    invoke-virtual {v0}, [Landroidx/constraintlayout/solver/SolverVariable$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/SolverVariable$Type;

    return-object v0
.end method
