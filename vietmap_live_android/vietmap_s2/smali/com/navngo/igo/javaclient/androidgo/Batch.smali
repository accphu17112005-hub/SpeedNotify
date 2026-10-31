###### Class com.navngo.igo.javaclient.androidgo.Batch (com.navngo.igo.javaclient.androidgo.Batch)
.class public Lcom/navngo/igo/javaclient/androidgo/Batch;
.super Ljava/lang/Object;
.source "Batch.java"


# static fields
.field public static final BATCH:Ljava/lang/String; = "BATCH"


# instance fields
.field private mRunningTasks:I

.field private mStarted:Z

.field private mSucceeded:Z

.field mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;)V
    .registers 4

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mStarted:Z

    const/4 v1, 0x0

    .line 24
    iput v1, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mRunningTasks:I

    .line 25
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mSucceeded:Z

    .line 26
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    if-nez p1, :cond_1c

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "WARNING: endBatch callback is null. It doesn\'t have much use with null value :). You can\'t detect the end of the Batch..."

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1c
    return-void
.end method

.method private checkAndCallSuccessCallback()V
    .registers 4

    .line 79
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mStarted:Z

    if-nez v0, :cond_13

    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mRunningTasks:I

    if-nez v0, :cond_13

    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mSuccessCallback:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;

    if-eqz v0, :cond_13

    .line 80
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mSucceeded:Z

    const-string v2, "BATCH"

    invoke-interface {v0, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;->actionSucceeded(Ljava/lang/String;Z)V

    :cond_13
    return-void
.end method


# virtual methods
.method public end()V
    .registers 2

    const/4 v0, 0x0

    .line 59
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mStarted:Z

    .line 61
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/Batch;->checkAndCallSuccessCallback()V

    return-void
.end method

.method public startTask()V
    .registers 2

    .line 39
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mRunningTasks:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mRunningTasks:I

    return-void
.end method

.method public taskCompleted(Z)V
    .registers 4

    .line 47
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mRunningTasks:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mRunningTasks:I

    .line 48
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mSucceeded:Z

    if-nez v0, :cond_e

    if-eqz p1, :cond_d

    goto :goto_e

    :cond_d
    const/4 v1, 0x0

    :cond_e
    :goto_e
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/androidgo/Batch;->mSucceeded:Z

    .line 50
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/Batch;->checkAndCallSuccessCallback()V

    return-void
.end method
