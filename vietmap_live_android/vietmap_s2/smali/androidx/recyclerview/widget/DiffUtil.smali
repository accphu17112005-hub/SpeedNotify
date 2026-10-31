###### Class androidx.recyclerview.widget.DiffUtil (androidx.recyclerview.widget.DiffUtil)
.class public Landroidx/recyclerview/widget/DiffUtil;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;,
        Landroidx/recyclerview/widget/DiffUtil$DiffResult;,
        Landroidx/recyclerview/widget/DiffUtil$Range;,
        Landroidx/recyclerview/widget/DiffUtil$Snake;,
        Landroidx/recyclerview/widget/DiffUtil$ItemCallback;,
        Landroidx/recyclerview/widget/DiffUtil$Callback;
    }
.end annotation


# static fields
.field private static final SNAKE_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroidx/recyclerview/widget/DiffUtil$Snake;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 84
    new-instance v0, Landroidx/recyclerview/widget/DiffUtil$1;

    invoke-direct {v0}, Landroidx/recyclerview/widget/DiffUtil$1;-><init>()V

    sput-object v0, Landroidx/recyclerview/widget/DiffUtil;->SNAKE_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calculateDiff(Landroidx/recyclerview/widget/DiffUtil$Callback;)Landroidx/recyclerview/widget/DiffUtil$DiffResult;
    .registers 2

    const/4 v0, 0x1

    .line 105
    invoke-static {p0, v0}, Landroidx/recyclerview/widget/DiffUtil;->calculateDiff(Landroidx/recyclerview/widget/DiffUtil$Callback;Z)Landroidx/recyclerview/widget/DiffUtil$DiffResult;

    move-result-object p0

    return-object p0
.end method

.method public static calculateDiff(Landroidx/recyclerview/widget/DiffUtil$Callback;Z)Landroidx/recyclerview/widget/DiffUtil$DiffResult;
    .registers 17

    .line 123
    invoke-virtual {p0}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getOldListSize()I

    move-result v0

    .line 124
    invoke-virtual {p0}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getNewListSize()I

    move-result v1

    .line 126
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 130
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 132
    new-instance v3, Landroidx/recyclerview/widget/DiffUtil$Range;

    const/4 v5, 0x0

    invoke-direct {v3, v5, v0, v5, v1}, Landroidx/recyclerview/widget/DiffUtil$Range;-><init>(IIII)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int v3, v0, v1

    sub-int/2addr v0, v1

    .line 134
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    add-int/2addr v3, v0

    mul-int/lit8 v0, v3, 0x2

    .line 138
    new-array v1, v0, [I

    .line 139
    new-array v0, v0, [I

    .line 142
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 143
    :goto_2e
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f3

    .line 144
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v2, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Landroidx/recyclerview/widget/DiffUtil$Range;

    .line 145
    iget v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    iget v7, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListEnd:I

    iget v8, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    iget v9, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListEnd:I

    move-object v5, p0

    move-object v10, v1

    move-object v11, v0

    move v12, v3

    invoke-static/range {v5 .. v12}, Landroidx/recyclerview/widget/DiffUtil;->diffPartial(Landroidx/recyclerview/widget/DiffUtil$Callback;IIII[I[II)Landroidx/recyclerview/widget/DiffUtil$Snake;

    move-result-object v5

    if-eqz v5, :cond_ee

    .line 148
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    if-lez v6, :cond_5a

    .line 149
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    :cond_5a
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v7, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    add-int/2addr v6, v7

    iput v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 153
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v7, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    add-int/2addr v6, v7

    iput v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    .line 156
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_74

    new-instance v6, Landroidx/recyclerview/widget/DiffUtil$Range;

    invoke-direct {v6}, Landroidx/recyclerview/widget/DiffUtil$Range;-><init>()V

    goto :goto_80

    .line 157
    :cond_74
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    .line 156
    invoke-interface {v13, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/DiffUtil$Range;

    .line 158
    :goto_80
    iget v7, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    .line 159
    iget v7, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    .line 160
    iget-boolean v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->reverse:Z

    if-eqz v7, :cond_95

    .line 161
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListEnd:I

    .line 162
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->newListEnd:I

    goto :goto_ae

    .line 164
    :cond_95
    iget-boolean v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->removal:Z

    if-eqz v7, :cond_a4

    .line 165
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListEnd:I

    .line 166
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->newListEnd:I

    goto :goto_ae

    .line 168
    :cond_a4
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListEnd:I

    .line 169
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v6, Landroidx/recyclerview/widget/DiffUtil$Range;->newListEnd:I

    .line 172
    :goto_ae
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    iget-boolean v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->reverse:Z

    if-eqz v6, :cond_db

    .line 178
    iget-boolean v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->removal:Z

    if-eqz v6, :cond_ca

    .line 179
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x1

    iput v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    .line 180
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v5, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v5

    iput v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    goto :goto_e9

    .line 182
    :cond_ca
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v7

    iput v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    .line 183
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v5, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v5

    add-int/lit8 v6, v6, 0x1

    iput v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    goto :goto_e9

    .line 186
    :cond_db
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v7

    iput v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    .line 187
    iget v6, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v5, v5, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v5

    iput v6, v14, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    .line 189
    :goto_e9
    invoke-interface {v2, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2e

    .line 191
    :cond_ee
    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2e

    .line 196
    :cond_f3
    sget-object v2, Landroidx/recyclerview/widget/DiffUtil;->SNAKE_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v4, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 198
    new-instance v8, Landroidx/recyclerview/widget/DiffUtil$DiffResult;

    move-object v2, v8

    move-object v3, p0

    move-object v5, v1

    move-object v6, v0

    move/from16 v7, p1

    invoke-direct/range {v2 .. v7}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;-><init>(Landroidx/recyclerview/widget/DiffUtil$Callback;Ljava/util/List;[I[IZ)V

    return-object v8
.end method

.method private static diffPartial(Landroidx/recyclerview/widget/DiffUtil$Callback;IIII[I[II)Landroidx/recyclerview/widget/DiffUtil$Snake;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    sub-int v3, p2, p1

    sub-int v4, p4, p3

    const/4 v5, 0x1

    if-lt v3, v5, :cond_133

    if-ge v4, v5, :cond_11

    goto/16 :goto_133

    :cond_11
    sub-int v6, v3, v4

    add-int v7, v3, v4

    add-int/2addr v7, v5

    .line 212
    div-int/lit8 v7, v7, 0x2

    sub-int v8, p7, v7

    sub-int/2addr v8, v5

    add-int v9, p7, v7

    add-int/2addr v9, v5

    const/4 v10, 0x0

    .line 213
    invoke-static {v1, v8, v9, v10}, Ljava/util/Arrays;->fill([IIII)V

    add-int/2addr v8, v6

    add-int/2addr v9, v6

    .line 214
    invoke-static {v2, v8, v9, v3}, Ljava/util/Arrays;->fill([IIII)V

    .line 215
    rem-int/lit8 v8, v6, 0x2

    if-eqz v8, :cond_2d

    const/4 v8, 0x1

    goto :goto_2e

    :cond_2d
    const/4 v8, 0x0

    :goto_2e
    const/4 v9, 0x0

    :goto_2f
    if-gt v9, v7, :cond_12b

    neg-int v11, v9

    move v12, v11

    :goto_33
    if-gt v12, v9, :cond_a2

    if-eq v12, v11, :cond_4d

    if-eq v12, v9, :cond_45

    add-int v13, p7, v12

    add-int/lit8 v14, v13, -0x1

    .line 222
    aget v14, v1, v14

    add-int/2addr v13, v5

    aget v13, v1, v13

    if-ge v14, v13, :cond_45

    goto :goto_4d

    :cond_45
    add-int v13, p7, v12

    sub-int/2addr v13, v5

    .line 226
    aget v13, v1, v13

    add-int/2addr v13, v5

    const/4 v14, 0x1

    goto :goto_53

    :cond_4d
    :goto_4d
    add-int v13, p7, v12

    add-int/2addr v13, v5

    .line 223
    aget v13, v1, v13

    const/4 v14, 0x0

    :goto_53
    sub-int v15, v13, v12

    :goto_55
    if-ge v13, v3, :cond_6a

    if-ge v15, v4, :cond_6a

    add-int v10, p1, v13

    add-int v5, p3, v15

    .line 233
    invoke-virtual {v0, v10, v5}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areItemsTheSame(II)Z

    move-result v5

    if-eqz v5, :cond_6a

    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v15, v15, 0x1

    const/4 v5, 0x1

    const/4 v10, 0x0

    goto :goto_55

    :cond_6a
    add-int v5, p7, v12

    .line 237
    aput v13, v1, v5

    if-eqz v8, :cond_9c

    sub-int v10, v6, v9

    const/4 v13, 0x1

    add-int/2addr v10, v13

    if-lt v12, v10, :cond_9c

    add-int v10, v6, v9

    sub-int/2addr v10, v13

    if-gt v12, v10, :cond_9c

    .line 239
    aget v10, v1, v5

    aget v13, v2, v5

    if-lt v10, v13, :cond_9c

    .line 240
    new-instance v0, Landroidx/recyclerview/widget/DiffUtil$Snake;

    invoke-direct {v0}, Landroidx/recyclerview/widget/DiffUtil$Snake;-><init>()V

    .line 241
    aget v3, v2, v5

    iput v3, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 242
    iget v3, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    sub-int/2addr v3, v12

    iput v3, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    .line 243
    aget v1, v1, v5

    aget v2, v2, v5

    sub-int/2addr v1, v2

    iput v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    .line 244
    iput-boolean v14, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->removal:Z

    const/4 v13, 0x0

    .line 245
    iput-boolean v13, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->reverse:Z

    return-object v0

    :cond_9c
    const/4 v13, 0x0

    add-int/lit8 v12, v12, 0x2

    const/4 v5, 0x1

    const/4 v10, 0x0

    goto :goto_33

    :cond_a2
    const/4 v13, 0x0

    move v5, v11

    :goto_a4
    if-gt v5, v9, :cond_120

    add-int v10, v5, v6

    add-int v12, v9, v6

    if-eq v10, v12, :cond_c6

    add-int v12, v11, v6

    if-eq v10, v12, :cond_bd

    add-int v12, p7, v10

    add-int/lit8 v14, v12, -0x1

    .line 255
    aget v14, v2, v14

    const/4 v15, 0x1

    add-int/2addr v12, v15

    aget v12, v2, v12

    if-ge v14, v12, :cond_be

    goto :goto_c7

    :cond_bd
    const/4 v15, 0x1

    :cond_be
    add-int v12, p7, v10

    add-int/2addr v12, v15

    .line 260
    aget v12, v2, v12

    sub-int/2addr v12, v15

    const/4 v14, 0x1

    goto :goto_cd

    :cond_c6
    const/4 v15, 0x1

    :goto_c7
    add-int v12, p7, v10

    sub-int/2addr v12, v15

    .line 257
    aget v12, v2, v12

    const/4 v14, 0x0

    :goto_cd
    sub-int v16, v12, v10

    :goto_cf
    if-lez v12, :cond_ec

    if-lez v16, :cond_ec

    add-int v17, p1, v12

    add-int/lit8 v13, v17, -0x1

    add-int v17, p3, v16

    move/from16 v18, v3

    add-int/lit8 v3, v17, -0x1

    .line 268
    invoke-virtual {v0, v13, v3}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areItemsTheSame(II)Z

    move-result v3

    if-eqz v3, :cond_ee

    add-int/lit8 v12, v12, -0x1

    add-int/lit8 v16, v16, -0x1

    move/from16 v3, v18

    const/4 v13, 0x0

    const/4 v15, 0x1

    goto :goto_cf

    :cond_ec
    move/from16 v18, v3

    :cond_ee
    add-int v3, p7, v10

    .line 272
    aput v12, v2, v3

    if-nez v8, :cond_119

    if-lt v10, v11, :cond_119

    if-gt v10, v9, :cond_119

    .line 274
    aget v12, v1, v3

    aget v13, v2, v3

    if-lt v12, v13, :cond_119

    .line 275
    new-instance v0, Landroidx/recyclerview/widget/DiffUtil$Snake;

    invoke-direct {v0}, Landroidx/recyclerview/widget/DiffUtil$Snake;-><init>()V

    .line 276
    aget v4, v2, v3

    iput v4, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 277
    iget v4, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    sub-int/2addr v4, v10

    iput v4, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    .line 278
    aget v1, v1, v3

    aget v2, v2, v3

    sub-int/2addr v1, v2

    iput v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    .line 280
    iput-boolean v14, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->removal:Z

    const/4 v3, 0x1

    .line 281
    iput-boolean v3, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->reverse:Z

    return-object v0

    :cond_119
    const/4 v3, 0x1

    add-int/lit8 v5, v5, 0x2

    move/from16 v3, v18

    const/4 v13, 0x0

    goto :goto_a4

    :cond_120
    move/from16 v18, v3

    const/4 v3, 0x1

    add-int/lit8 v9, v9, 0x1

    move/from16 v3, v18

    const/4 v5, 0x1

    const/4 v10, 0x0

    goto/16 :goto_2f

    .line 287
    :cond_12b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "DiffUtil hit an unexpected case while trying to calculate the optimal path. Please make sure your data is not changing during the diff calculation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_133
    :goto_133
    const/4 v0, 0x0

    return-object v0
.end method

###### Class androidx.recyclerview.widget.DiffUtil.AnonymousClass1 (androidx.recyclerview.widget.DiffUtil$1)
.class final Landroidx/recyclerview/widget/DiffUtil$1;
.super Ljava/lang/Object;
.source "DiffUtil.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroidx/recyclerview/widget/DiffUtil$Snake;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroidx/recyclerview/widget/DiffUtil$Snake;Landroidx/recyclerview/widget/DiffUtil$Snake;)I
    .registers 5

    .line 87
    iget v0, p1, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v1, p2, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    sub-int/2addr v0, v1

    if-nez v0, :cond_d

    .line 88
    iget p1, p1, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget p2, p2, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    sub-int v0, p1, p2

    :cond_d
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 84
    check-cast p1, Landroidx/recyclerview/widget/DiffUtil$Snake;

    check-cast p2, Landroidx/recyclerview/widget/DiffUtil$Snake;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/DiffUtil$1;->compare(Landroidx/recyclerview/widget/DiffUtil$Snake;Landroidx/recyclerview/widget/DiffUtil$Snake;)I

    move-result p1

    return p1
.end method

###### Class androidx.recyclerview.widget.DiffUtil.Callback (androidx.recyclerview.widget.DiffUtil$Callback)
.class public abstract Landroidx/recyclerview/widget/DiffUtil$Callback;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Callback"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract areContentsTheSame(II)Z
.end method

.method public abstract areItemsTheSame(II)Z
.end method

.method public getChangePayload(II)Ljava/lang/Object;
    .registers 3

    const/4 p1, 0x0

    return-object p1
.end method

.method public abstract getNewListSize()I
.end method

.method public abstract getOldListSize()I
.end method

###### Class androidx.recyclerview.widget.DiffUtil.DiffResult (androidx.recyclerview.widget.DiffUtil$DiffResult)
.class public Landroidx/recyclerview/widget/DiffUtil$DiffResult;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DiffResult"
.end annotation


# static fields
.field private static final FLAG_CHANGED:I = 0x2

.field private static final FLAG_IGNORE:I = 0x10

.field private static final FLAG_MASK:I = 0x1f

.field private static final FLAG_MOVED_CHANGED:I = 0x4

.field private static final FLAG_MOVED_NOT_CHANGED:I = 0x8

.field private static final FLAG_NOT_CHANGED:I = 0x1

.field private static final FLAG_OFFSET:I = 0x5

.field public static final NO_POSITION:I = -0x1


# instance fields
.field private final mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

.field private final mDetectMoves:Z

.field private final mNewItemStatuses:[I

.field private final mNewListSize:I

.field private final mOldItemStatuses:[I

.field private final mOldListSize:I

.field private final mSnakes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/DiffUtil$Snake;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/recyclerview/widget/DiffUtil$Callback;Ljava/util/List;[I[IZ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/DiffUtil$Callback;",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/DiffUtil$Snake;",
            ">;[I[IZ)V"
        }
    .end annotation

    .line 567
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 568
    iput-object p2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    .line 569
    iput-object p3, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    .line 570
    iput-object p4, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    const/4 p2, 0x0

    .line 571
    invoke-static {p3, p2}, Ljava/util/Arrays;->fill([II)V

    .line 572
    invoke-static {p4, p2}, Ljava/util/Arrays;->fill([II)V

    .line 573
    iput-object p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    .line 574
    invoke-virtual {p1}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getOldListSize()I

    move-result p2

    iput p2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldListSize:I

    .line 575
    invoke-virtual {p1}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getNewListSize()I

    move-result p1

    iput p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewListSize:I

    .line 576
    iput-boolean p5, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mDetectMoves:Z

    .line 577
    invoke-direct {p0}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->addRootSnake()V

    .line 578
    invoke-direct {p0}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->findMatchingItems()V

    return-void
.end method

.method private addRootSnake()V
    .registers 4

    .line 586
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    goto :goto_13

    :cond_b
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/DiffUtil$Snake;

    :goto_13
    if-eqz v0, :cond_1d

    .line 587
    iget v2, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    if-nez v2, :cond_1d

    iget v0, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    if-eqz v0, :cond_31

    .line 588
    :cond_1d
    new-instance v0, Landroidx/recyclerview/widget/DiffUtil$Snake;

    invoke-direct {v0}, Landroidx/recyclerview/widget/DiffUtil$Snake;-><init>()V

    .line 589
    iput v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 590
    iput v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    .line 591
    iput-boolean v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->removal:Z

    .line 592
    iput v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    .line 593
    iput-boolean v1, v0, Landroidx/recyclerview/widget/DiffUtil$Snake;->reverse:Z

    .line 594
    iget-object v2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v2, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_31
    return-void
.end method

.method private dispatchAdditions(Ljava/util/List;Landroidx/recyclerview/widget/ListUpdateCallback;III)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;",
            ">;",
            "Landroidx/recyclerview/widget/ListUpdateCallback;",
            "III)V"
        }
    .end annotation

    .line 873
    iget-boolean v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mDetectMoves:Z

    if-nez v0, :cond_8

    .line 874
    invoke-interface {p2, p3, p4}, Landroidx/recyclerview/widget/ListUpdateCallback;->onInserted(II)V

    return-void

    :cond_8
    const/4 v0, 0x1

    sub-int/2addr p4, v0

    :goto_a
    if-ltz p4, :cond_84

    .line 878
    iget-object v1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    add-int v2, p5, p4

    aget v3, v1, v2

    and-int/lit8 v3, v3, 0x1f

    if-eqz v3, :cond_68

    const/4 v4, 0x4

    if-eq v3, v4, :cond_4f

    const/16 v5, 0x8

    if-eq v3, v5, :cond_4f

    const/16 v1, 0x10

    if-ne v3, v1, :cond_2b

    .line 901
    new-instance v1, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p3, v3}, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;-><init>(IIZ)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_81

    .line 904
    :cond_2b
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "unknown flag for pos "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    int-to-long p3, v3

    .line 906
    invoke-static {p3, p4}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 888
    :cond_4f
    aget v1, v1, v2

    shr-int/lit8 v1, v1, 0x5

    .line 889
    invoke-static {p1, v1, v0}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->removePostponedUpdate(Ljava/util/List;IZ)Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    move-result-object v5

    .line 893
    iget v5, v5, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    invoke-interface {p2, v5, p3}, Landroidx/recyclerview/widget/ListUpdateCallback;->onMoved(II)V

    if-ne v3, v4, :cond_81

    .line 896
    iget-object v3, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    .line 897
    invoke-virtual {v3, v1, v2}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getChangePayload(II)Ljava/lang/Object;

    move-result-object v1

    .line 896
    invoke-interface {p2, p3, v0, v1}, Landroidx/recyclerview/widget/ListUpdateCallback;->onChanged(IILjava/lang/Object;)V

    goto :goto_81

    .line 881
    :cond_68
    invoke-interface {p2, p3, v0}, Landroidx/recyclerview/widget/ListUpdateCallback;->onInserted(II)V

    .line 882
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_81

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    .line 883
    iget v3, v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    add-int/2addr v3, v0

    iput v3, v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    goto :goto_6f

    :cond_81
    :goto_81
    add-int/lit8 p4, p4, -0x1

    goto :goto_a

    :cond_84
    return-void
.end method

.method private dispatchRemovals(Ljava/util/List;Landroidx/recyclerview/widget/ListUpdateCallback;III)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;",
            ">;",
            "Landroidx/recyclerview/widget/ListUpdateCallback;",
            "III)V"
        }
    .end annotation

    .line 913
    iget-boolean v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mDetectMoves:Z

    if-nez v0, :cond_8

    .line 914
    invoke-interface {p2, p3, p4}, Landroidx/recyclerview/widget/ListUpdateCallback;->onRemoved(II)V

    return-void

    :cond_8
    const/4 v0, 0x1

    sub-int/2addr p4, v0

    :goto_a
    if-ltz p4, :cond_8f

    .line 918
    iget-object v1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    add-int v2, p5, p4

    aget v3, v1, v2

    and-int/lit8 v3, v3, 0x1f

    if-eqz v3, :cond_70

    const/4 v4, 0x4

    if-eq v3, v4, :cond_50

    const/16 v5, 0x8

    if-eq v3, v5, :cond_50

    const/16 v1, 0x10

    if-ne v3, v1, :cond_2c

    .line 942
    new-instance v1, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    add-int v3, p3, p4

    invoke-direct {v1, v2, v3, v0}, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;-><init>(IIZ)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8b

    .line 945
    :cond_2c
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "unknown flag for pos "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    int-to-long p3, v3

    .line 947
    invoke-static {p3, p4}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 928
    :cond_50
    aget v1, v1, v2

    shr-int/lit8 v1, v1, 0x5

    const/4 v5, 0x0

    .line 929
    invoke-static {p1, v1, v5}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->removePostponedUpdate(Ljava/util/List;IZ)Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    move-result-object v5

    add-int v6, p3, p4

    .line 934
    iget v7, v5, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    sub-int/2addr v7, v0

    invoke-interface {p2, v6, v7}, Landroidx/recyclerview/widget/ListUpdateCallback;->onMoved(II)V

    if-ne v3, v4, :cond_8b

    .line 937
    iget v3, v5, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    sub-int/2addr v3, v0

    iget-object v4, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    .line 938
    invoke-virtual {v4, v2, v1}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getChangePayload(II)Ljava/lang/Object;

    move-result-object v1

    .line 937
    invoke-interface {p2, v3, v0, v1}, Landroidx/recyclerview/widget/ListUpdateCallback;->onChanged(IILjava/lang/Object;)V

    goto :goto_8b

    :cond_70
    add-int v1, p3, p4

    .line 921
    invoke-interface {p2, v1, v0}, Landroidx/recyclerview/widget/ListUpdateCallback;->onRemoved(II)V

    .line 922
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_79
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    .line 923
    iget v3, v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    sub-int/2addr v3, v0

    iput v3, v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    goto :goto_79

    :cond_8b
    :goto_8b
    add-int/lit8 p4, p4, -0x1

    goto/16 :goto_a

    :cond_8f
    return-void
.end method

.method private findAddition(III)V
    .registers 6

    .line 646
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    add-int/lit8 v1, p1, -0x1

    aget v0, v0, v1

    if-eqz v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x0

    .line 649
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->findMatchingItem(IIIZ)Z

    return-void
.end method

.method private findMatchingItem(IIIZ)Z
    .registers 13

    if-eqz p4, :cond_7

    add-int/lit8 p2, p2, -0x1

    move v1, p1

    move v0, p2

    goto :goto_a

    :cond_7
    add-int/lit8 v0, p1, -0x1

    move v1, v0

    :goto_a
    if-ltz p3, :cond_7c

    .line 733
    iget-object v2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/DiffUtil$Snake;

    .line 734
    iget v3, v2, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v4, v2, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v3, v4

    .line 735
    iget v4, v2, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v5, v2, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v4, v5

    const/16 v5, 0x8

    const/4 v6, 0x4

    const/4 v7, 0x1

    if-eqz p4, :cond_4c

    sub-int/2addr v1, v7

    :goto_25
    if-lt v1, v3, :cond_75

    .line 739
    iget-object p2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    invoke-virtual {p2, v1, v0}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areItemsTheSame(II)Z

    move-result p2

    if-eqz p2, :cond_49

    .line 741
    iget-object p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    invoke-virtual {p1, v1, v0}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areContentsTheSame(II)Z

    move-result p1

    if-eqz p1, :cond_38

    goto :goto_39

    :cond_38
    const/4 v5, 0x4

    .line 744
    :goto_39
    iget-object p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    shl-int/lit8 p2, v1, 0x5

    or-int/lit8 p2, p2, 0x10

    aput p2, p1, v0

    .line 745
    iget-object p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    shl-int/lit8 p2, v0, 0x5

    or-int/2addr p2, v5

    aput p2, p1, v1

    return v7

    :cond_49
    add-int/lit8 v1, v1, -0x1

    goto :goto_25

    :cond_4c
    sub-int/2addr p2, v7

    :goto_4d
    if-lt p2, v4, :cond_75

    .line 752
    iget-object v1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    invoke-virtual {v1, v0, p2}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areItemsTheSame(II)Z

    move-result v1

    if-eqz v1, :cond_72

    .line 754
    iget-object p3, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    invoke-virtual {p3, v0, p2}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areContentsTheSame(II)Z

    move-result p3

    if-eqz p3, :cond_60

    goto :goto_61

    :cond_60
    const/4 v5, 0x4

    .line 757
    :goto_61
    iget-object p3, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    sub-int/2addr p1, v7

    shl-int/lit8 p4, p2, 0x5

    or-int/lit8 p4, p4, 0x10

    aput p4, p3, p1

    .line 758
    iget-object p3, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    shl-int/lit8 p1, p1, 0x5

    or-int/2addr p1, v5

    aput p1, p3, p2

    return v7

    :cond_72
    add-int/lit8 p2, p2, -0x1

    goto :goto_4d

    .line 763
    :cond_75
    iget v1, v2, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 764
    iget p2, v2, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int/lit8 p3, p3, -0x1

    goto :goto_a

    :cond_7c
    const/4 p1, 0x0

    return p1
.end method

.method private findMatchingItems()V
    .registers 10

    .line 610
    iget v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldListSize:I

    .line 611
    iget v1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewListSize:I

    .line 613
    iget-object v2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_c
    if-ltz v2, :cond_62

    .line 614
    iget-object v4, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/DiffUtil$Snake;

    .line 615
    iget v5, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    iget v6, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v5, v6

    .line 616
    iget v6, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    iget v7, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    add-int/2addr v6, v7

    .line 617
    iget-boolean v7, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mDetectMoves:Z

    if-eqz v7, :cond_34

    :goto_24
    if-le v0, v5, :cond_2c

    .line 620
    invoke-direct {p0, v0, v1, v2}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->findAddition(III)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_24

    :cond_2c
    :goto_2c
    if-le v1, v6, :cond_34

    .line 626
    invoke-direct {p0, v0, v1, v2}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->findRemoval(III)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_2c

    :cond_34
    const/4 v0, 0x0

    .line 630
    :goto_35
    iget v1, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    if-ge v0, v1, :cond_5b

    .line 632
    iget v1, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    add-int/2addr v1, v0

    .line 633
    iget v5, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int/2addr v5, v0

    .line 634
    iget-object v6, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    .line 635
    invoke-virtual {v6, v1, v5}, Landroidx/recyclerview/widget/DiffUtil$Callback;->areContentsTheSame(II)Z

    move-result v6

    if-eqz v6, :cond_49

    const/4 v6, 0x1

    goto :goto_4a

    :cond_49
    const/4 v6, 0x2

    .line 637
    :goto_4a
    iget-object v7, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    shl-int/lit8 v8, v5, 0x5

    or-int/2addr v8, v6

    aput v8, v7, v1

    .line 638
    iget-object v7, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    shl-int/lit8 v1, v1, 0x5

    or-int/2addr v1, v6

    aput v1, v7, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_35

    .line 640
    :cond_5b
    iget v0, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 641
    iget v1, v4, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int/lit8 v2, v2, -0x1

    goto :goto_c

    :cond_62
    return-void
.end method

.method private findRemoval(III)V
    .registers 6

    .line 653
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-eqz v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x1

    .line 656
    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->findMatchingItem(IIIZ)Z

    return-void
.end method

.method private static removePostponedUpdate(Ljava/util/List;IZ)Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;",
            ">;IZ)",
            "Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;"
        }
    .end annotation

    .line 857
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_6
    if-ltz v0, :cond_36

    .line 858
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    .line 859
    iget v3, v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->posInOwnerList:I

    if-ne v3, p1, :cond_33

    iget-boolean v3, v2, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->removal:Z

    if-ne v3, p2, :cond_33

    .line 860
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 861
    :goto_19
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-ge v0, p1, :cond_32

    .line 863
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;

    iget v3, p1, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    if-eqz p2, :cond_2b

    const/4 v4, 0x1

    goto :goto_2c

    :cond_2b
    const/4 v4, -0x1

    :goto_2c
    add-int/2addr v3, v4

    iput v3, p1, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    :cond_32
    return-object v2

    :cond_33
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_36
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public convertNewPositionToOld(I)I
    .registers 5

    if-ltz p1, :cond_13

    .line 695
    iget v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewListSize:I

    if-ge p1, v0, :cond_13

    .line 699
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewItemStatuses:[I

    aget p1, v0, p1

    and-int/lit8 v0, p1, 0x1f

    if-nez v0, :cond_10

    const/4 p1, -0x1

    return p1

    :cond_10
    shr-int/lit8 p1, p1, 0x5

    return p1

    .line 696
    :cond_13
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index out of bounds - passed position = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", new list size = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewListSize:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public convertOldPositionToNew(I)I
    .registers 5

    if-ltz p1, :cond_13

    .line 671
    iget v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldListSize:I

    if-ge p1, v0, :cond_13

    .line 675
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    aget p1, v0, p1

    and-int/lit8 v0, p1, 0x1f

    if-nez v0, :cond_10

    const/4 p1, -0x1

    return p1

    :cond_10
    shr-int/lit8 p1, p1, 0x5

    return p1

    .line 672
    :cond_13
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Index out of bounds - passed position = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", old list size = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldListSize:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public dispatchUpdatesTo(Landroidx/recyclerview/widget/ListUpdateCallback;)V
    .registers 16

    .line 816
    instance-of v0, p1, Landroidx/recyclerview/widget/BatchingListUpdateCallback;

    if-eqz v0, :cond_7

    .line 817
    check-cast p1, Landroidx/recyclerview/widget/BatchingListUpdateCallback;

    goto :goto_d

    .line 819
    :cond_7
    new-instance v0, Landroidx/recyclerview/widget/BatchingListUpdateCallback;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/BatchingListUpdateCallback;-><init>(Landroidx/recyclerview/widget/ListUpdateCallback;)V

    move-object p1, v0

    .line 827
    :goto_d
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 828
    iget v1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldListSize:I

    .line 829
    iget v2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mNewListSize:I

    .line 830
    iget-object v3, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v7, 0x1

    sub-int/2addr v3, v7

    move v8, v2

    move v9, v3

    :goto_20
    if-ltz v9, :cond_79

    .line 831
    iget-object v2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Landroidx/recyclerview/widget/DiffUtil$Snake;

    .line 832
    iget v11, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->size:I

    .line 833
    iget v2, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    add-int v12, v2, v11

    .line 834
    iget v2, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int v13, v2, v11

    if-ge v12, v1, :cond_41

    sub-int v5, v1, v12

    move-object v1, p0

    move-object v2, v0

    move-object v3, p1

    move v4, v12

    move v6, v12

    .line 836
    invoke-direct/range {v1 .. v6}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->dispatchRemovals(Ljava/util/List;Landroidx/recyclerview/widget/ListUpdateCallback;III)V

    :cond_41
    if-ge v13, v8, :cond_4d

    sub-int v5, v8, v13

    move-object v1, p0

    move-object v2, v0

    move-object v3, p1

    move v4, v12

    move v6, v13

    .line 840
    invoke-direct/range {v1 .. v6}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->dispatchAdditions(Ljava/util/List;Landroidx/recyclerview/widget/ListUpdateCallback;III)V

    :cond_4d
    add-int/lit8 v11, v11, -0x1

    :goto_4f
    if-ltz v11, :cond_72

    .line 844
    iget-object v1, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mOldItemStatuses:[I

    iget v2, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    add-int/2addr v2, v11

    aget v1, v1, v2

    and-int/lit8 v1, v1, 0x1f

    const/4 v2, 0x2

    if-ne v1, v2, :cond_6f

    .line 845
    iget v1, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    add-int/2addr v1, v11

    iget-object v2, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mCallback:Landroidx/recyclerview/widget/DiffUtil$Callback;

    iget v3, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    add-int/2addr v3, v11

    iget v4, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int/2addr v4, v11

    .line 846
    invoke-virtual {v2, v3, v4}, Landroidx/recyclerview/widget/DiffUtil$Callback;->getChangePayload(II)Ljava/lang/Object;

    move-result-object v2

    .line 845
    invoke-virtual {p1, v1, v7, v2}, Landroidx/recyclerview/widget/BatchingListUpdateCallback;->onChanged(IILjava/lang/Object;)V

    :cond_6f
    add-int/lit8 v11, v11, -0x1

    goto :goto_4f

    .line 849
    :cond_72
    iget v1, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->x:I

    .line 850
    iget v8, v10, Landroidx/recyclerview/widget/DiffUtil$Snake;->y:I

    add-int/lit8 v9, v9, -0x1

    goto :goto_20

    .line 852
    :cond_79
    invoke-virtual {p1}, Landroidx/recyclerview/widget/BatchingListUpdateCallback;->dispatchLastEvent()V

    return-void
.end method

.method public dispatchUpdatesTo(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .registers 3

    .line 802
    new-instance v0, Landroidx/recyclerview/widget/AdapterListUpdateCallback;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/AdapterListUpdateCallback;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->dispatchUpdatesTo(Landroidx/recyclerview/widget/ListUpdateCallback;)V

    return-void
.end method

.method getSnakes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/recyclerview/widget/DiffUtil$Snake;",
            ">;"
        }
    .end annotation

    .line 954
    iget-object v0, p0, Landroidx/recyclerview/widget/DiffUtil$DiffResult;->mSnakes:Ljava/util/List;

    return-object v0
.end method

###### Class androidx.recyclerview.widget.DiffUtil.ItemCallback (androidx.recyclerview.widget.DiffUtil$ItemCallback)
.class public abstract Landroidx/recyclerview/widget/DiffUtil$ItemCallback;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ItemCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 373
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation
.end method

.method public abstract areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation
.end method

.method public getChangePayload(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

###### Class androidx.recyclerview.widget.DiffUtil.PostponedUpdate (androidx.recyclerview.widget.DiffUtil$PostponedUpdate)
.class Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PostponedUpdate"
.end annotation


# instance fields
.field currentPos:I

.field posInOwnerList:I

.field removal:Z


# direct methods
.method public constructor <init>(IIZ)V
    .registers 4

    .line 973
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 974
    iput p1, p0, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->posInOwnerList:I

    .line 975
    iput p2, p0, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->currentPos:I

    .line 976
    iput-boolean p3, p0, Landroidx/recyclerview/widget/DiffUtil$PostponedUpdate;->removal:Z

    return-void
.end method

###### Class androidx.recyclerview.widget.DiffUtil.Range (androidx.recyclerview.widget.DiffUtil$Range)
.class Landroidx/recyclerview/widget/DiffUtil$Range;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Range"
.end annotation


# instance fields
.field newListEnd:I

.field newListStart:I

.field oldListEnd:I

.field oldListStart:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 482
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 5

    .line 485
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 486
    iput p1, p0, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListStart:I

    .line 487
    iput p2, p0, Landroidx/recyclerview/widget/DiffUtil$Range;->oldListEnd:I

    .line 488
    iput p3, p0, Landroidx/recyclerview/widget/DiffUtil$Range;->newListStart:I

    .line 489
    iput p4, p0, Landroidx/recyclerview/widget/DiffUtil$Range;->newListEnd:I

    return-void
.end method

###### Class androidx.recyclerview.widget.DiffUtil.Snake (androidx.recyclerview.widget.DiffUtil$Snake)
.class Landroidx/recyclerview/widget/DiffUtil$Snake;
.super Ljava/lang/Object;
.source "DiffUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/DiffUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Snake"
.end annotation


# instance fields
.field removal:Z

.field reverse:Z

.field size:I

.field x:I

.field y:I


# direct methods
.method constructor <init>()V
    .registers 1

    .line 442
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
