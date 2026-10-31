###### Class androidx.constraintlayout.solver.state.State (androidx.constraintlayout.solver.state.State)
.class public Landroidx/constraintlayout/solver/state/State;
.super Ljava/lang/Object;
.source "State.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/solver/state/State$Chain;,
        Landroidx/constraintlayout/solver/state/State$Helper;,
        Landroidx/constraintlayout/solver/state/State$Direction;,
        Landroidx/constraintlayout/solver/state/State$Constraint;
    }
.end annotation


# static fields
.field static final CONSTRAINT_RATIO:I = 0x2

.field static final CONSTRAINT_SPREAD:I = 0x0

.field static final CONSTRAINT_WRAP:I = 0x1

.field public static final PARENT:Ljava/lang/Integer;

.field static final UNKNOWN:I = -0x1


# instance fields
.field protected mHelperReferences:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Object;",
            "Landroidx/constraintlayout/solver/state/HelperReference;",
            ">;"
        }
    .end annotation
.end field

.field public final mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

.field protected mReferences:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Object;",
            "Landroidx/constraintlayout/solver/state/Reference;",
            ">;"
        }
    .end annotation
.end field

.field private numHelpers:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    .line 48
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Landroidx/constraintlayout/solver/state/State;->PARENT:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    .line 50
    new-instance v0, Landroidx/constraintlayout/solver/state/ConstraintReference;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/solver/state/ConstraintReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    iput-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

    const/4 v1, 0x0

    .line 166
    iput v1, p0, Landroidx/constraintlayout/solver/state/State;->numHelpers:I

    .line 96
    iget-object v1, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    sget-object v2, Landroidx/constraintlayout/solver/state/State;->PARENT:Ljava/lang/Integer;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private createHelperKey()Ljava/lang/String;
    .registers 4

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "__HELPER_KEY_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/constraintlayout/solver/state/State;->numHelpers:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroidx/constraintlayout/solver/state/State;->numHelpers:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "__"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public apply(Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;)V
    .registers 6

    .line 265
    invoke-virtual {p1}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->removeAllChildren()V

    .line 266
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/state/ConstraintReference;->getWidth()Landroidx/constraintlayout/solver/state/Dimension;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Landroidx/constraintlayout/solver/state/Dimension;->apply(Landroidx/constraintlayout/solver/state/State;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 267
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

    invoke-virtual {v0}, Landroidx/constraintlayout/solver/state/ConstraintReference;->getHeight()Landroidx/constraintlayout/solver/state/Dimension;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Landroidx/constraintlayout/solver/state/Dimension;->apply(Landroidx/constraintlayout/solver/state/State;Landroidx/constraintlayout/solver/widgets/ConstraintWidget;I)V

    .line 268
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_21
    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 269
    iget-object v2, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/state/HelperReference;

    .line 270
    invoke-virtual {v2}, Landroidx/constraintlayout/solver/state/HelperReference;->getHelperWidget()Landroidx/constraintlayout/solver/widgets/HelperWidget;

    move-result-object v2

    if-eqz v2, :cond_21

    .line 272
    iget-object v3, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/constraintlayout/solver/state/Reference;

    if-nez v3, :cond_47

    .line 274
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/state/State;->constraints(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/ConstraintReference;

    move-result-object v3

    .line 276
    :cond_47
    invoke-interface {v3, v2}, Landroidx/constraintlayout/solver/state/Reference;->setConstraintWidget(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    goto :goto_21

    .line 279
    :cond_4b
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_55
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_82

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 280
    iget-object v2, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/constraintlayout/solver/state/Reference;

    .line 281
    iget-object v2, p0, Landroidx/constraintlayout/solver/state/State;->mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

    if-eq v1, v2, :cond_7e

    .line 282
    invoke-interface {v1}, Landroidx/constraintlayout/solver/state/Reference;->getConstraintWidget()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v2

    const/4 v3, 0x0

    .line 283
    invoke-virtual {v2, v3}, Landroidx/constraintlayout/solver/widgets/ConstraintWidget;->setParent(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    .line 284
    instance-of v3, v1, Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;

    if-eqz v3, :cond_7a

    .line 286
    invoke-interface {v1}, Landroidx/constraintlayout/solver/state/Reference;->apply()V

    .line 288
    :cond_7a
    invoke-virtual {p1, v2}, Landroidx/constraintlayout/solver/widgets/ConstraintWidgetContainer;->add(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    goto :goto_55

    .line 290
    :cond_7e
    invoke-interface {v1, p1}, Landroidx/constraintlayout/solver/state/Reference;->setConstraintWidget(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    goto :goto_55

    .line 293
    :cond_82
    iget-object p1, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8c
    :goto_8c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_cc

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 294
    iget-object v1, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/HelperReference;

    .line 295
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/state/HelperReference;->getHelperWidget()Landroidx/constraintlayout/solver/widgets/HelperWidget;

    move-result-object v1

    if-eqz v1, :cond_8c

    .line 297
    iget-object v1, v0, Landroidx/constraintlayout/solver/state/HelperReference;->mReferences:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_aa
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 298
    iget-object v3, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/constraintlayout/solver/state/Reference;

    .line 299
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/state/HelperReference;->getHelperWidget()Landroidx/constraintlayout/solver/widgets/HelperWidget;

    move-result-object v3

    invoke-interface {v2}, Landroidx/constraintlayout/solver/state/Reference;->getConstraintWidget()Landroidx/constraintlayout/solver/widgets/ConstraintWidget;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroidx/constraintlayout/solver/widgets/HelperWidget;->add(Landroidx/constraintlayout/solver/widgets/ConstraintWidget;)V

    goto :goto_aa

    .line 301
    :cond_c8
    invoke-virtual {v0}, Landroidx/constraintlayout/solver/state/HelperReference;->apply()V

    goto :goto_8c

    .line 304
    :cond_cc
    iget-object p1, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_ec

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 305
    iget-object v1, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/Reference;

    .line 306
    invoke-interface {v0}, Landroidx/constraintlayout/solver/state/Reference;->apply()V

    goto :goto_d6

    :cond_ec
    return-void
.end method

.method public barrier(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Direction;)Landroidx/constraintlayout/solver/state/helpers/BarrierReference;
    .registers 4

    .line 223
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->BARRIER:Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/solver/state/State;->helper(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Helper;)Landroidx/constraintlayout/solver/state/HelperReference;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/solver/state/helpers/BarrierReference;

    .line 224
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/state/helpers/BarrierReference;->setBarrierDirection(Landroidx/constraintlayout/solver/state/State$Direction;)V

    return-object p1
.end method

.method public varargs centerHorizontally([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/helpers/AlignHorizontallyReference;
    .registers 4

    .line 241
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->ALIGN_HORIZONTALLY:Landroidx/constraintlayout/solver/state/State$Helper;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroidx/constraintlayout/solver/state/State;->helper(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Helper;)Landroidx/constraintlayout/solver/state/HelperReference;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/helpers/AlignHorizontallyReference;

    .line 242
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/helpers/AlignHorizontallyReference;->add([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/HelperReference;

    return-object v0
.end method

.method public varargs centerVertically([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/helpers/AlignVerticallyReference;
    .registers 4

    .line 247
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->ALIGN_VERTICALLY:Landroidx/constraintlayout/solver/state/State$Helper;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroidx/constraintlayout/solver/state/State;->helper(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Helper;)Landroidx/constraintlayout/solver/state/HelperReference;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/helpers/AlignVerticallyReference;

    .line 248
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/helpers/AlignVerticallyReference;->add([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/HelperReference;

    return-object v0
.end method

.method public constraints(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/ConstraintReference;
    .registers 4

    .line 154
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/Reference;

    if-nez v0, :cond_16

    .line 156
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/state/State;->createConstraintReference(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/ConstraintReference;

    move-result-object v0

    .line 157
    iget-object v1, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    invoke-interface {v0, p1}, Landroidx/constraintlayout/solver/state/Reference;->setKey(Ljava/lang/Object;)V

    .line 160
    :cond_16
    instance-of p1, v0, Landroidx/constraintlayout/solver/state/ConstraintReference;

    if-eqz p1, :cond_1d

    .line 161
    check-cast v0, Landroidx/constraintlayout/solver/state/ConstraintReference;

    return-object v0

    :cond_1d
    const/4 p1, 0x0

    return-object p1
.end method

.method public convertDimension(Ljava/lang/Object;)I
    .registers 3

    .line 112
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_b

    .line 113
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->intValue()I

    move-result p1

    return p1

    .line 115
    :cond_b
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_16

    .line 116
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_16
    const/4 p1, 0x0

    return p1
.end method

.method public createConstraintReference(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/ConstraintReference;
    .registers 2

    .line 128
    new-instance p1, Landroidx/constraintlayout/solver/state/ConstraintReference;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/solver/state/ConstraintReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    return-object p1
.end method

.method public directMapping()V
    .registers 4

    .line 253
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 254
    invoke-virtual {p0, v1}, Landroidx/constraintlayout/solver/state/State;->constraints(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/ConstraintReference;

    move-result-object v2

    .line 255
    invoke-virtual {v2, v1}, Landroidx/constraintlayout/solver/state/ConstraintReference;->setView(Ljava/lang/Object;)V

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public guideline(Ljava/lang/Object;I)Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;
    .registers 4

    .line 211
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/Reference;

    if-nez v0, :cond_1a

    .line 213
    new-instance v0, Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;

    invoke-direct {v0, p0}, Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    .line 214
    invoke-virtual {v0, p2}, Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;->setOrientation(I)V

    .line 215
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;->setKey(Ljava/lang/Object;)V

    .line 216
    iget-object p2, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    :cond_1a
    check-cast v0, Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;

    return-object v0
.end method

.method public height(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/State;
    .registers 2

    .line 136
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/state/State;->setHeight(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/State;

    move-result-object p1

    return-object p1
.end method

.method public helper(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Helper;)Landroidx/constraintlayout/solver/state/HelperReference;
    .registers 5

    if-nez p1, :cond_6

    .line 173
    invoke-direct {p0}, Landroidx/constraintlayout/solver/state/State;->createHelperKey()Ljava/lang/String;

    move-result-object p1

    .line 175
    :cond_6
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/HelperReference;

    if-nez v0, :cond_50

    .line 177
    sget-object v0, Landroidx/constraintlayout/solver/state/State$1;->$SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I

    invoke-virtual {p2}, Landroidx/constraintlayout/solver/state/State$Helper;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_45

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3f

    const/4 v1, 0x3

    if-eq v0, v1, :cond_39

    const/4 v1, 0x4

    if-eq v0, v1, :cond_33

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2d

    .line 194
    new-instance v0, Landroidx/constraintlayout/solver/state/HelperReference;

    invoke-direct {v0, p0, p2}, Landroidx/constraintlayout/solver/state/HelperReference;-><init>(Landroidx/constraintlayout/solver/state/State;Landroidx/constraintlayout/solver/state/State$Helper;)V

    goto :goto_4b

    .line 191
    :cond_2d
    new-instance p2, Landroidx/constraintlayout/solver/state/helpers/BarrierReference;

    invoke-direct {p2, p0}, Landroidx/constraintlayout/solver/state/helpers/BarrierReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    goto :goto_4a

    .line 188
    :cond_33
    new-instance p2, Landroidx/constraintlayout/solver/state/helpers/AlignVerticallyReference;

    invoke-direct {p2, p0}, Landroidx/constraintlayout/solver/state/helpers/AlignVerticallyReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    goto :goto_4a

    .line 185
    :cond_39
    new-instance p2, Landroidx/constraintlayout/solver/state/helpers/AlignHorizontallyReference;

    invoke-direct {p2, p0}, Landroidx/constraintlayout/solver/state/helpers/AlignHorizontallyReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    goto :goto_4a

    .line 182
    :cond_3f
    new-instance p2, Landroidx/constraintlayout/solver/state/helpers/VerticalChainReference;

    invoke-direct {p2, p0}, Landroidx/constraintlayout/solver/state/helpers/VerticalChainReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    goto :goto_4a

    .line 179
    :cond_45
    new-instance p2, Landroidx/constraintlayout/solver/state/helpers/HorizontalChainReference;

    invoke-direct {p2, p0}, Landroidx/constraintlayout/solver/state/helpers/HorizontalChainReference;-><init>(Landroidx/constraintlayout/solver/state/State;)V

    :goto_4a
    move-object v0, p2

    .line 197
    :goto_4b
    iget-object p2, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_50
    return-object v0
.end method

.method public varargs horizontalChain([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/helpers/HorizontalChainReference;
    .registers 4

    .line 235
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->HORIZONTAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroidx/constraintlayout/solver/state/State;->helper(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Helper;)Landroidx/constraintlayout/solver/state/HelperReference;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/helpers/HorizontalChainReference;

    .line 236
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/helpers/HorizontalChainReference;->add([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/HelperReference;

    return-object v0
.end method

.method public horizontalGuideline(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;
    .registers 3

    const/4 v0, 0x0

    .line 203
    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/solver/state/State;->guideline(Ljava/lang/Object;I)Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;

    move-result-object p1

    return-object p1
.end method

.method public map(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 260
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/state/State;->constraints(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/ConstraintReference;

    move-result-object p1

    .line 261
    invoke-virtual {p1, p2}, Landroidx/constraintlayout/solver/state/ConstraintReference;->setView(Ljava/lang/Object;)V

    return-void
.end method

.method reference(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/Reference;
    .registers 3

    .line 150
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mReferences:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/constraintlayout/solver/state/Reference;

    return-object p1
.end method

.method public reset()V
    .registers 2

    .line 100
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mHelperReferences:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public setHeight(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/State;
    .registers 3

    .line 145
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/ConstraintReference;->setHeight(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/ConstraintReference;

    return-object p0
.end method

.method public setWidth(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/State;
    .registers 3

    .line 140
    iget-object v0, p0, Landroidx/constraintlayout/solver/state/State;->mParent:Landroidx/constraintlayout/solver/state/ConstraintReference;

    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/ConstraintReference;->setWidth(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/ConstraintReference;

    return-object p0
.end method

.method public varargs verticalChain([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/helpers/VerticalChainReference;
    .registers 4

    .line 229
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->VERTICAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroidx/constraintlayout/solver/state/State;->helper(Ljava/lang/Object;Landroidx/constraintlayout/solver/state/State$Helper;)Landroidx/constraintlayout/solver/state/HelperReference;

    move-result-object v0

    check-cast v0, Landroidx/constraintlayout/solver/state/helpers/VerticalChainReference;

    .line 230
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/solver/state/helpers/VerticalChainReference;->add([Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/HelperReference;

    return-object v0
.end method

.method public verticalGuideline(Ljava/lang/Object;)Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;
    .registers 3

    const/4 v0, 0x1

    .line 207
    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/solver/state/State;->guideline(Ljava/lang/Object;I)Landroidx/constraintlayout/solver/state/helpers/GuidelineReference;

    move-result-object p1

    return-object p1
.end method

.method public width(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/State;
    .registers 2

    .line 132
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/solver/state/State;->setWidth(Landroidx/constraintlayout/solver/state/Dimension;)Landroidx/constraintlayout/solver/state/State;

    move-result-object p1

    return-object p1
.end method

###### Class androidx.constraintlayout.solver.state.State.AnonymousClass1 (androidx.constraintlayout.solver.state.State$1)
.class synthetic Landroidx/constraintlayout/solver/state/State$1;
.super Ljava/lang/Object;
.source "State.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/state/State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 177
    invoke-static {}, Landroidx/constraintlayout/solver/state/State$Helper;->values()[Landroidx/constraintlayout/solver/state/State$Helper;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Landroidx/constraintlayout/solver/state/State$1;->$SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I

    :try_start_9
    sget-object v1, Landroidx/constraintlayout/solver/state/State$Helper;->HORIZONTAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/state/State$Helper;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Landroidx/constraintlayout/solver/state/State$1;->$SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I

    sget-object v1, Landroidx/constraintlayout/solver/state/State$Helper;->VERTICAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/state/State$Helper;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    :try_start_1d
    sget-object v0, Landroidx/constraintlayout/solver/state/State$1;->$SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I

    sget-object v1, Landroidx/constraintlayout/solver/state/State$Helper;->ALIGN_HORIZONTALLY:Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/state/State$Helper;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_28} :catch_28

    :catch_28
    :try_start_28
    sget-object v0, Landroidx/constraintlayout/solver/state/State$1;->$SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I

    sget-object v1, Landroidx/constraintlayout/solver/state/State$Helper;->ALIGN_VERTICALLY:Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/state/State$Helper;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_33

    :catch_33
    :try_start_33
    sget-object v0, Landroidx/constraintlayout/solver/state/State$1;->$SwitchMap$androidx$constraintlayout$solver$state$State$Helper:[I

    sget-object v1, Landroidx/constraintlayout/solver/state/State$Helper;->BARRIER:Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {v1}, Landroidx/constraintlayout/solver/state/State$Helper;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3e

    :catch_3e
    return-void
.end method

###### Class androidx.constraintlayout.solver.state.State.Chain (androidx.constraintlayout.solver.state.State$Chain)
.class public final enum Landroidx/constraintlayout/solver/state/State$Chain;
.super Ljava/lang/Enum;
.source "State.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/state/State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Chain"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/solver/state/State$Chain;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/constraintlayout/solver/state/State$Chain;

.field public static final enum PACKED:Landroidx/constraintlayout/solver/state/State$Chain;

.field public static final enum SPREAD:Landroidx/constraintlayout/solver/state/State$Chain;

.field public static final enum SPREAD_INSIDE:Landroidx/constraintlayout/solver/state/State$Chain;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 90
    new-instance v0, Landroidx/constraintlayout/solver/state/State$Chain;

    const-string v1, "SPREAD"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/solver/state/State$Chain;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/solver/state/State$Chain;->SPREAD:Landroidx/constraintlayout/solver/state/State$Chain;

    .line 91
    new-instance v1, Landroidx/constraintlayout/solver/state/State$Chain;

    const-string v3, "SPREAD_INSIDE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroidx/constraintlayout/solver/state/State$Chain;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroidx/constraintlayout/solver/state/State$Chain;->SPREAD_INSIDE:Landroidx/constraintlayout/solver/state/State$Chain;

    .line 92
    new-instance v3, Landroidx/constraintlayout/solver/state/State$Chain;

    const-string v5, "PACKED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroidx/constraintlayout/solver/state/State$Chain;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroidx/constraintlayout/solver/state/State$Chain;->PACKED:Landroidx/constraintlayout/solver/state/State$Chain;

    const/4 v5, 0x3

    new-array v5, v5, [Landroidx/constraintlayout/solver/state/State$Chain;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 89
    sput-object v5, Landroidx/constraintlayout/solver/state/State$Chain;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Chain;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 89
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/solver/state/State$Chain;
    .registers 2

    .line 89
    const-class v0, Landroidx/constraintlayout/solver/state/State$Chain;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/solver/state/State$Chain;

    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/solver/state/State$Chain;
    .registers 1

    .line 89
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Chain;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Chain;

    invoke-virtual {v0}, [Landroidx/constraintlayout/solver/state/State$Chain;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/state/State$Chain;

    return-object v0
.end method

###### Class androidx.constraintlayout.solver.state.State.Constraint (androidx.constraintlayout.solver.state.State$Constraint)
.class public final enum Landroidx/constraintlayout/solver/state/State$Constraint;
.super Ljava/lang/Enum;
.source "State.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/state/State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Constraint"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/solver/state/State$Constraint;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum BASELINE_TO_BASELINE:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum BOTTOM_TO_BOTTOM:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum BOTTOM_TO_TOP:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum CENTER_HORIZONTALLY:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum CENTER_VERTICALLY:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum END_TO_END:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum END_TO_START:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum LEFT_TO_LEFT:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum LEFT_TO_RIGHT:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum RIGHT_TO_LEFT:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum RIGHT_TO_RIGHT:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum START_TO_END:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum START_TO_START:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum TOP_TO_BOTTOM:Landroidx/constraintlayout/solver/state/State$Constraint;

.field public static final enum TOP_TO_TOP:Landroidx/constraintlayout/solver/state/State$Constraint;


# direct methods
.method static constructor <clinit>()V
    .registers 18

    .line 53
    new-instance v0, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v1, "LEFT_TO_LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/solver/state/State$Constraint;->LEFT_TO_LEFT:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 54
    new-instance v1, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v3, "LEFT_TO_RIGHT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroidx/constraintlayout/solver/state/State$Constraint;->LEFT_TO_RIGHT:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 55
    new-instance v3, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v5, "RIGHT_TO_LEFT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroidx/constraintlayout/solver/state/State$Constraint;->RIGHT_TO_LEFT:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 56
    new-instance v5, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v7, "RIGHT_TO_RIGHT"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroidx/constraintlayout/solver/state/State$Constraint;->RIGHT_TO_RIGHT:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 57
    new-instance v7, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v9, "START_TO_START"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroidx/constraintlayout/solver/state/State$Constraint;->START_TO_START:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 58
    new-instance v9, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v11, "START_TO_END"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v9, Landroidx/constraintlayout/solver/state/State$Constraint;->START_TO_END:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 59
    new-instance v11, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v13, "END_TO_START"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v11, Landroidx/constraintlayout/solver/state/State$Constraint;->END_TO_START:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 60
    new-instance v13, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v15, "END_TO_END"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v13, Landroidx/constraintlayout/solver/state/State$Constraint;->END_TO_END:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 61
    new-instance v15, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v14, "TOP_TO_TOP"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v15, Landroidx/constraintlayout/solver/state/State$Constraint;->TOP_TO_TOP:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 62
    new-instance v14, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v12, "TOP_TO_BOTTOM"

    const/16 v10, 0x9

    invoke-direct {v14, v12, v10}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v14, Landroidx/constraintlayout/solver/state/State$Constraint;->TOP_TO_BOTTOM:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 63
    new-instance v12, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v10, "BOTTOM_TO_TOP"

    const/16 v8, 0xa

    invoke-direct {v12, v10, v8}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v12, Landroidx/constraintlayout/solver/state/State$Constraint;->BOTTOM_TO_TOP:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 64
    new-instance v10, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v8, "BOTTOM_TO_BOTTOM"

    const/16 v6, 0xb

    invoke-direct {v10, v8, v6}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v10, Landroidx/constraintlayout/solver/state/State$Constraint;->BOTTOM_TO_BOTTOM:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 65
    new-instance v8, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v6, "BASELINE_TO_BASELINE"

    const/16 v4, 0xc

    invoke-direct {v8, v6, v4}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v8, Landroidx/constraintlayout/solver/state/State$Constraint;->BASELINE_TO_BASELINE:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 66
    new-instance v6, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v4, "CENTER_HORIZONTALLY"

    const/16 v2, 0xd

    invoke-direct {v6, v4, v2}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v6, Landroidx/constraintlayout/solver/state/State$Constraint;->CENTER_HORIZONTALLY:Landroidx/constraintlayout/solver/state/State$Constraint;

    .line 67
    new-instance v4, Landroidx/constraintlayout/solver/state/State$Constraint;

    const-string v2, "CENTER_VERTICALLY"

    move-object/from16 v17, v6

    const/16 v6, 0xe

    invoke-direct {v4, v2, v6}, Landroidx/constraintlayout/solver/state/State$Constraint;-><init>(Ljava/lang/String;I)V

    sput-object v4, Landroidx/constraintlayout/solver/state/State$Constraint;->CENTER_VERTICALLY:Landroidx/constraintlayout/solver/state/State$Constraint;

    const/16 v2, 0xf

    new-array v2, v2, [Landroidx/constraintlayout/solver/state/State$Constraint;

    const/16 v16, 0x0

    aput-object v0, v2, v16

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    aput-object v3, v2, v0

    const/4 v0, 0x3

    aput-object v5, v2, v0

    const/4 v0, 0x4

    aput-object v7, v2, v0

    const/4 v0, 0x5

    aput-object v9, v2, v0

    const/4 v0, 0x6

    aput-object v11, v2, v0

    const/4 v0, 0x7

    aput-object v13, v2, v0

    const/16 v0, 0x8

    aput-object v15, v2, v0

    const/16 v0, 0x9

    aput-object v14, v2, v0

    const/16 v0, 0xa

    aput-object v12, v2, v0

    const/16 v0, 0xb

    aput-object v10, v2, v0

    const/16 v0, 0xc

    aput-object v8, v2, v0

    const/16 v0, 0xd

    aput-object v17, v2, v0

    aput-object v4, v2, v6

    .line 52
    sput-object v2, Landroidx/constraintlayout/solver/state/State$Constraint;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Constraint;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/solver/state/State$Constraint;
    .registers 2

    .line 52
    const-class v0, Landroidx/constraintlayout/solver/state/State$Constraint;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/solver/state/State$Constraint;

    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/solver/state/State$Constraint;
    .registers 1

    .line 52
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Constraint;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Constraint;

    invoke-virtual {v0}, [Landroidx/constraintlayout/solver/state/State$Constraint;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/state/State$Constraint;

    return-object v0
.end method

###### Class androidx.constraintlayout.solver.state.State.Direction (androidx.constraintlayout.solver.state.State$Direction)
.class public final enum Landroidx/constraintlayout/solver/state/State$Direction;
.super Ljava/lang/Enum;
.source "State.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/state/State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Direction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/solver/state/State$Direction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/constraintlayout/solver/state/State$Direction;

.field public static final enum BOTTOM:Landroidx/constraintlayout/solver/state/State$Direction;

.field public static final enum END:Landroidx/constraintlayout/solver/state/State$Direction;

.field public static final enum LEFT:Landroidx/constraintlayout/solver/state/State$Direction;

.field public static final enum RIGHT:Landroidx/constraintlayout/solver/state/State$Direction;

.field public static final enum START:Landroidx/constraintlayout/solver/state/State$Direction;

.field public static final enum TOP:Landroidx/constraintlayout/solver/state/State$Direction;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    .line 71
    new-instance v0, Landroidx/constraintlayout/solver/state/State$Direction;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/solver/state/State$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/solver/state/State$Direction;->LEFT:Landroidx/constraintlayout/solver/state/State$Direction;

    .line 72
    new-instance v1, Landroidx/constraintlayout/solver/state/State$Direction;

    const-string v3, "RIGHT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroidx/constraintlayout/solver/state/State$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroidx/constraintlayout/solver/state/State$Direction;->RIGHT:Landroidx/constraintlayout/solver/state/State$Direction;

    .line 73
    new-instance v3, Landroidx/constraintlayout/solver/state/State$Direction;

    const-string v5, "START"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroidx/constraintlayout/solver/state/State$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroidx/constraintlayout/solver/state/State$Direction;->START:Landroidx/constraintlayout/solver/state/State$Direction;

    .line 74
    new-instance v5, Landroidx/constraintlayout/solver/state/State$Direction;

    const-string v7, "END"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroidx/constraintlayout/solver/state/State$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroidx/constraintlayout/solver/state/State$Direction;->END:Landroidx/constraintlayout/solver/state/State$Direction;

    .line 75
    new-instance v7, Landroidx/constraintlayout/solver/state/State$Direction;

    const-string v9, "TOP"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroidx/constraintlayout/solver/state/State$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroidx/constraintlayout/solver/state/State$Direction;->TOP:Landroidx/constraintlayout/solver/state/State$Direction;

    .line 76
    new-instance v9, Landroidx/constraintlayout/solver/state/State$Direction;

    const-string v11, "BOTTOM"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Landroidx/constraintlayout/solver/state/State$Direction;-><init>(Ljava/lang/String;I)V

    sput-object v9, Landroidx/constraintlayout/solver/state/State$Direction;->BOTTOM:Landroidx/constraintlayout/solver/state/State$Direction;

    const/4 v11, 0x6

    new-array v11, v11, [Landroidx/constraintlayout/solver/state/State$Direction;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    .line 70
    sput-object v11, Landroidx/constraintlayout/solver/state/State$Direction;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Direction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/solver/state/State$Direction;
    .registers 2

    .line 70
    const-class v0, Landroidx/constraintlayout/solver/state/State$Direction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/solver/state/State$Direction;

    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/solver/state/State$Direction;
    .registers 1

    .line 70
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Direction;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Direction;

    invoke-virtual {v0}, [Landroidx/constraintlayout/solver/state/State$Direction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/state/State$Direction;

    return-object v0
.end method

###### Class androidx.constraintlayout.solver.state.State.Helper (androidx.constraintlayout.solver.state.State$Helper)
.class public final enum Landroidx/constraintlayout/solver/state/State$Helper;
.super Ljava/lang/Enum;
.source "State.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/solver/state/State;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Helper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/constraintlayout/solver/state/State$Helper;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum ALIGN_HORIZONTALLY:Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum ALIGN_VERTICALLY:Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum BARRIER:Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum FLOW:Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum HORIZONTAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum LAYER:Landroidx/constraintlayout/solver/state/State$Helper;

.field public static final enum VERTICAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    .line 80
    new-instance v0, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v1, "HORIZONTAL_CHAIN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->HORIZONTAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

    .line 81
    new-instance v1, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v3, "VERTICAL_CHAIN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v1, Landroidx/constraintlayout/solver/state/State$Helper;->VERTICAL_CHAIN:Landroidx/constraintlayout/solver/state/State$Helper;

    .line 82
    new-instance v3, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v5, "ALIGN_HORIZONTALLY"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v3, Landroidx/constraintlayout/solver/state/State$Helper;->ALIGN_HORIZONTALLY:Landroidx/constraintlayout/solver/state/State$Helper;

    .line 83
    new-instance v5, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v7, "ALIGN_VERTICALLY"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v5, Landroidx/constraintlayout/solver/state/State$Helper;->ALIGN_VERTICALLY:Landroidx/constraintlayout/solver/state/State$Helper;

    .line 84
    new-instance v7, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v9, "BARRIER"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v7, Landroidx/constraintlayout/solver/state/State$Helper;->BARRIER:Landroidx/constraintlayout/solver/state/State$Helper;

    .line 85
    new-instance v9, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v11, "LAYER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v9, Landroidx/constraintlayout/solver/state/State$Helper;->LAYER:Landroidx/constraintlayout/solver/state/State$Helper;

    .line 86
    new-instance v11, Landroidx/constraintlayout/solver/state/State$Helper;

    const-string v13, "FLOW"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Landroidx/constraintlayout/solver/state/State$Helper;-><init>(Ljava/lang/String;I)V

    sput-object v11, Landroidx/constraintlayout/solver/state/State$Helper;->FLOW:Landroidx/constraintlayout/solver/state/State$Helper;

    const/4 v13, 0x7

    new-array v13, v13, [Landroidx/constraintlayout/solver/state/State$Helper;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    .line 79
    sput-object v13, Landroidx/constraintlayout/solver/state/State$Helper;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Helper;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 79
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroidx/constraintlayout/solver/state/State$Helper;
    .registers 2

    .line 79
    const-class v0, Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/constraintlayout/solver/state/State$Helper;

    return-object p0
.end method

.method public static values()[Landroidx/constraintlayout/solver/state/State$Helper;
    .registers 1

    .line 79
    sget-object v0, Landroidx/constraintlayout/solver/state/State$Helper;->$VALUES:[Landroidx/constraintlayout/solver/state/State$Helper;

    invoke-virtual {v0}, [Landroidx/constraintlayout/solver/state/State$Helper;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/constraintlayout/solver/state/State$Helper;

    return-object v0
.end method
