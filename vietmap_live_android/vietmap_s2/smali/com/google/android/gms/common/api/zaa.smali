###### Class com.google.android.gms.common.api.zaa (com.google.android.gms.common.api.zaa)
.class final Lcom/google/android/gms/common/api/zaa;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/PendingResult$StatusListener;


# instance fields
.field private final synthetic zabd:Lcom/google/android/gms/common/api/Batch;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/Batch;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/common/api/Status;)V
    .registers 6

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {v0}, Lcom/google/android/gms/common/api/Batch;->zaa(Lcom/google/android/gms/common/api/Batch;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 3
    :try_start_7
    iget-object v1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/PendingResult;->isCanceled()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 4
    monitor-exit v0

    return-void

    .line 5
    :cond_11
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isCanceled()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1e

    .line 6
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1, v2}, Lcom/google/android/gms/common/api/Batch;->zaa(Lcom/google/android/gms/common/api/Batch;Z)Z

    goto :goto_29

    .line 7
    :cond_1e
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result p1

    if-nez p1, :cond_29

    .line 8
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1, v2}, Lcom/google/android/gms/common/api/Batch;->zab(Lcom/google/android/gms/common/api/Batch;Z)Z

    .line 9
    :cond_29
    :goto_29
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1}, Lcom/google/android/gms/common/api/Batch;->zab(Lcom/google/android/gms/common/api/Batch;)I

    .line 10
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1}, Lcom/google/android/gms/common/api/Batch;->zac(Lcom/google/android/gms/common/api/Batch;)I

    move-result p1

    if-nez p1, :cond_64

    .line 11
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1}, Lcom/google/android/gms/common/api/Batch;->zad(Lcom/google/android/gms/common/api/Batch;)Z

    move-result p1

    if-eqz p1, :cond_44

    .line 12
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1}, Lcom/google/android/gms/common/api/Batch;->zae(Lcom/google/android/gms/common/api/Batch;)V

    goto :goto_64

    .line 13
    :cond_44
    iget-object p1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    invoke-static {p1}, Lcom/google/android/gms/common/api/Batch;->zaf(Lcom/google/android/gms/common/api/Batch;)Z

    move-result p1

    if-eqz p1, :cond_54

    .line 14
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0xd

    invoke-direct {p1, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    goto :goto_56

    .line 15
    :cond_54
    sget-object p1, Lcom/google/android/gms/common/api/Status;->RESULT_SUCCESS:Lcom/google/android/gms/common/api/Status;

    .line 16
    :goto_56
    iget-object v1, p0, Lcom/google/android/gms/common/api/zaa;->zabd:Lcom/google/android/gms/common/api/Batch;

    new-instance v2, Lcom/google/android/gms/common/api/BatchResult;

    invoke-static {v1}, Lcom/google/android/gms/common/api/Batch;->zag(Lcom/google/android/gms/common/api/Batch;)[Lcom/google/android/gms/common/api/PendingResult;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lcom/google/android/gms/common/api/BatchResult;-><init>(Lcom/google/android/gms/common/api/Status;[Lcom/google/android/gms/common/api/PendingResult;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 17
    :cond_64
    :goto_64
    monitor-exit v0

    return-void

    :catchall_66
    move-exception p1

    monitor-exit v0
    :try_end_68
    .catchall {:try_start_7 .. :try_end_68} :catchall_66

    throw p1
.end method
