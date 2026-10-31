###### Class com.navngo.igo.javaclient.ValidationFunctors (com.navngo.igo.javaclient.ValidationFunctors)
.class public Lcom/navngo/igo/javaclient/ValidationFunctors;
.super Ljava/lang/Object;
.source "ValidationFunctors.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# instance fields
.field mMatchingRevisions:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ValidationFunctors;->mMatchingRevisions:Z

    .line 14
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    sget-object v1, Lcom/navngo/program/ProgramPhases$Phase;->UI_READY:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v2, Lcom/navngo/igo/javaclient/ValidationFunctors$1;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/ValidationFunctors$1;-><init>(Lcom/navngo/igo/javaclient/ValidationFunctors;)V

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3, v2}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getRevision()Ljava/lang/String;
    .registers 3

    const-string v0, "9.35.2.281488"

    const-string v1, "\\."

    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 26
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public registerFunctors()V
    .registers 4

    .line 35
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "vietmap.getRevision"

    const-string v2, "getRevision"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "vietmap.setMatchValue"

    const-string v2, "setMatchValue"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public setMatchValue(Z)V
    .registers 2

    .line 30
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ValidationFunctors;->mMatchingRevisions:Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.ValidationFunctors.AnonymousClass1 (com.navngo.igo.javaclient.ValidationFunctors$1)
.class Lcom/navngo/igo/javaclient/ValidationFunctors$1;
.super Ljava/lang/Object;
.source "ValidationFunctors.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ValidationFunctors;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ValidationFunctors;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ValidationFunctors;)V
    .registers 2

    .line 14
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ValidationFunctors$1;->this$0:Lcom/navngo/igo/javaclient/ValidationFunctors;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 17
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ValidationFunctors$1;->this$0:Lcom/navngo/igo/javaclient/ValidationFunctors;

    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/ValidationFunctors;->mMatchingRevisions:Z

    if-nez v0, :cond_a

    const/4 v0, 0x1

    .line 18
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    :cond_a
    return-void
.end method
