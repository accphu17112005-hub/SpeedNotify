###### Class com.google.android.gms.tasks.zzg (com.google.android.gms.tasks.zzg)
.class final Lcom/google/android/gms/tasks/zzg;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tasks/zzq;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/zzq<",
        "TTResult;>;"
    }
.end annotation


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private final zzd:Ljava/util/concurrent/Executor;

.field private zzj:Lcom/google/android/gms/tasks/OnCanceledListener;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCanceledListener;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tasks/zzg;->mLock:Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/tasks/zzg;->zzd:Ljava/util/concurrent/Executor;

    .line 4
    iput-object p2, p0, Lcom/google/android/gms/tasks/zzg;->zzj:Lcom/google/android/gms/tasks/OnCanceledListener;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/tasks/zzg;)Ljava/lang/Object;
    .registers 1

    .line 16
    iget-object p0, p0, Lcom/google/android/gms/tasks/zzg;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic zzb(Lcom/google/android/gms/tasks/zzg;)Lcom/google/android/gms/tasks/OnCanceledListener;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/google/android/gms/tasks/zzg;->zzj:Lcom/google/android/gms/tasks/OnCanceledListener;

    return-object p0
.end method


# virtual methods
.method public final cancel()V
    .registers 3

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzg;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 14
    :try_start_4
    iput-object v1, p0, Lcom/google/android/gms/tasks/zzg;->zzj:Lcom/google/android/gms/tasks/OnCanceledListener;

    .line 15
    monitor-exit v0

    return-void

    :catchall_8
    move-exception v1

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_8

    throw v1
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isCanceled()Z

    move-result p1

    if-eqz p1, :cond_1e

    .line 7
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzg;->mLock:Ljava/lang/Object;

    monitor-enter p1

    .line 8
    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzg;->zzj:Lcom/google/android/gms/tasks/OnCanceledListener;

    if-nez v0, :cond_f

    .line 9
    monitor-exit p1

    return-void

    .line 10
    :cond_f
    monitor-exit p1
    :try_end_10
    .catchall {:try_start_9 .. :try_end_10} :catchall_1b

    .line 11
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzg;->zzd:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/google/android/gms/tasks/zzh;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tasks/zzh;-><init>(Lcom/google/android/gms/tasks/zzg;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1e

    :catchall_1b
    move-exception v0

    .line 10
    :try_start_1c
    monitor-exit p1
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    throw v0

    :cond_1e
    :goto_1e
    return-void
.end method
