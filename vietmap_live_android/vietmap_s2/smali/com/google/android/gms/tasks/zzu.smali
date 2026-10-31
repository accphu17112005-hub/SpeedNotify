###### Class com.google.android.gms.tasks.zzu (com.google.android.gms.tasks.zzu)
.class final Lcom/google/android/gms/tasks/zzu;
.super Lcom/google/android/gms/tasks/Task;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tasks/zzu$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/tasks/Task<",
        "TTResult;>;"
    }
.end annotation


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private zzaa:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTResult;"
        }
    .end annotation
.end field

.field private zzab:Ljava/lang/Exception;

.field private final zzx:Lcom/google/android/gms/tasks/zzr;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/zzr<",
            "TTResult;>;"
        }
    .end annotation
.end field

.field private zzy:Z

.field private volatile zzz:Z


# direct methods
.method constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/tasks/Task;-><init>()V

    .line 2
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    .line 3
    new-instance v0, Lcom/google/android/gms/tasks/zzr;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/zzr;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    return-void
.end method

.method private final zzb()V
    .registers 3

    .line 121
    iget-boolean v0, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    const-string v1, "Task is not yet complete"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    return-void
.end method

.method private final zzc()V
    .registers 3

    .line 123
    iget-boolean v0, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Task is already complete"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    return-void
.end method

.method private final zzd()V
    .registers 3

    .line 125
    iget-boolean v0, p0, Lcom/google/android/gms/tasks/zzu;->zzz:Z

    if-nez v0, :cond_5

    return-void

    .line 126
    :cond_5
    new-instance v0, Ljava/util/concurrent/CancellationException;

    const-string v1, "Task is already canceled."

    invoke-direct {v0, v1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final zze()V
    .registers 3

    .line 128
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 129
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    if-nez v1, :cond_9

    .line 130
    monitor-exit v0

    return-void

    .line 131
    :cond_9
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_10

    .line 132
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/Task;)V

    return-void

    :catchall_10
    move-exception v1

    .line 131
    :try_start_11
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_10

    throw v1
.end method


# virtual methods
.method public final addOnCanceledListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/OnCanceledListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 67
    new-instance v0, Lcom/google/android/gms/tasks/zzg;

    sget-object v1, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, p2}, Lcom/google/android/gms/tasks/zzg;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCanceledListener;)V

    .line 68
    iget-object p2, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 69
    invoke-static {p1}, Lcom/google/android/gms/tasks/zzu$zza;->zza(Landroid/app/Activity;)Lcom/google/android/gms/tasks/zzu$zza;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/zzu$zza;->zzb(Lcom/google/android/gms/tasks/zzq;)V

    .line 70
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnCanceledListener(Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/OnCanceledListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 63
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->addOnCanceledListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final addOnCanceledListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/OnCanceledListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v1, Lcom/google/android/gms/tasks/zzg;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/tasks/zzg;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCanceledListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 65
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnCompleteListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/OnCompleteListener<",
            "TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 52
    new-instance v0, Lcom/google/android/gms/tasks/zzi;

    sget-object v1, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, p2}, Lcom/google/android/gms/tasks/zzi;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)V

    .line 53
    iget-object p2, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 54
    invoke-static {p1}, Lcom/google/android/gms/tasks/zzu$zza;->zza(Landroid/app/Activity;)Lcom/google/android/gms/tasks/zzu$zza;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/zzu$zza;->zzb(Lcom/google/android/gms/tasks/zzq;)V

    .line 55
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/OnCompleteListener<",
            "TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 48
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/OnCompleteListener<",
            "TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v1, Lcom/google/android/gms/tasks/zzi;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/tasks/zzi;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 50
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnFailureListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/OnFailureListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/google/android/gms/tasks/zzk;

    sget-object v1, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, p2}, Lcom/google/android/gms/tasks/zzk;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)V

    .line 44
    iget-object p2, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 45
    invoke-static {p1}, Lcom/google/android/gms/tasks/zzu$zza;->zza(Landroid/app/Activity;)Lcom/google/android/gms/tasks/zzu$zza;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/zzu$zza;->zzb(Lcom/google/android/gms/tasks/zzq;)V

    .line 46
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/OnFailureListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 39
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final addOnFailureListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/OnFailureListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v1, Lcom/google/android/gms/tasks/zzk;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/tasks/zzk;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnFailureListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 41
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnSuccessListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/OnSuccessListener<",
            "-TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 34
    new-instance v0, Lcom/google/android/gms/tasks/zzm;

    sget-object v1, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, p2}, Lcom/google/android/gms/tasks/zzm;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)V

    .line 35
    iget-object p2, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 36
    invoke-static {p1}, Lcom/google/android/gms/tasks/zzu$zza;->zza(Landroid/app/Activity;)Lcom/google/android/gms/tasks/zzu$zza;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/zzu$zza;->zzb(Lcom/google/android/gms/tasks/zzq;)V

    .line 37
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/OnSuccessListener<",
            "-TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 30
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final addOnSuccessListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/OnSuccessListener<",
            "-TTResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v1, Lcom/google/android/gms/tasks/zzm;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/tasks/zzm;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnSuccessListener;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 32
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object p0
.end method

.method public final continueWith(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/tasks/Continuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 57
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/Continuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 58
    new-instance v0, Lcom/google/android/gms/tasks/zzu;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/zzu;-><init>()V

    .line 59
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v2, Lcom/google/android/gms/tasks/zzc;

    invoke-direct {v2, p1, p2, v0}, Lcom/google/android/gms/tasks/zzc;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;Lcom/google/android/gms/tasks/zzu;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 60
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object v0
.end method

.method public final continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/tasks/Continuation<",
            "TTResult;",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 62
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/Continuation<",
            "TTResult;",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 72
    new-instance v0, Lcom/google/android/gms/tasks/zzu;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/zzu;-><init>()V

    .line 73
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v2, Lcom/google/android/gms/tasks/zze;

    invoke-direct {v2, p1, p2, v0}, Lcom/google/android/gms/tasks/zze;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;Lcom/google/android/gms/tasks/zzu;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 74
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object v0
.end method

.method public final getException()Ljava/lang/Exception;
    .registers 3

    .line 27
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 28
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    .line 29
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public final getResult()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTResult;"
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 12
    :try_start_3
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zzb()V

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zzd()V

    .line 14
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    if-nez v1, :cond_11

    .line 16
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzaa:Ljava/lang/Object;

    monitor-exit v0

    return-object v1

    .line 15
    :cond_11
    new-instance v1, Lcom/google/android/gms/tasks/RuntimeExecutionException;

    iget-object v2, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    invoke-direct {v1, v2}, Lcom/google/android/gms/tasks/RuntimeExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catchall_19
    move-exception v1

    .line 17
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public final getResult(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/Class<",
            "TX;>;)TTResult;^TX;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 19
    :try_start_3
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zzb()V

    .line 20
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zzd()V

    .line 21
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 23
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    if-nez p1, :cond_19

    .line 25
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzaa:Ljava/lang/Object;

    monitor-exit v0

    return-object p1

    .line 24
    :cond_19
    new-instance p1, Lcom/google/android/gms/tasks/RuntimeExecutionException;

    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    invoke-direct {p1, v1}, Lcom/google/android/gms/tasks/RuntimeExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 22
    :cond_21
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Throwable;

    throw p1

    :catchall_2a
    move-exception p1

    .line 26
    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_2a

    throw p1
.end method

.method public final isCanceled()Z
    .registers 2

    .line 7
    iget-boolean v0, p0, Lcom/google/android/gms/tasks/zzu;->zzz:Z

    return v0
.end method

.method public final isComplete()Z
    .registers 3

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 5
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    .line 6
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public final isSuccessful()Z
    .registers 3

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 9
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    if-eqz v1, :cond_11

    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzz:Z

    if-nez v1, :cond_11

    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    if-nez v1, :cond_11

    const/4 v1, 0x1

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    monitor-exit v0

    return v1

    :catchall_14
    move-exception v1

    .line 10
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public final onSuccessTask(Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/tasks/SuccessContinuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 80
    sget-object v0, Lcom/google/android/gms/tasks/TaskExecutors;->MAIN_THREAD:Ljava/util/concurrent/Executor;

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/tasks/Task;->onSuccessTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public final onSuccessTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;)Lcom/google/android/gms/tasks/Task;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TContinuationResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/android/gms/tasks/SuccessContinuation<",
            "TTResult;TTContinuationResult;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTContinuationResult;>;"
        }
    .end annotation

    .line 76
    new-instance v0, Lcom/google/android/gms/tasks/zzu;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/zzu;-><init>()V

    .line 77
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    new-instance v2, Lcom/google/android/gms/tasks/zzo;

    invoke-direct {v2, p1, p2, v0}, Lcom/google/android/gms/tasks/zzo;-><init>(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/SuccessContinuation;Lcom/google/android/gms/tasks/zzu;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/zzq;)V

    .line 78
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zze()V

    return-object v0
.end method

.method public final setException(Ljava/lang/Exception;)V
    .registers 4

    const-string v0, "Exception must not be null"

    .line 96
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 98
    :try_start_8
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zzc()V

    const/4 v1, 0x1

    .line 99
    iput-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    .line 100
    iput-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    .line 101
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_17

    .line 102
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/Task;)V

    return-void

    :catchall_17
    move-exception p1

    .line 101
    :try_start_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw p1
.end method

.method public final setResult(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)V"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 82
    :try_start_3
    invoke-direct {p0}, Lcom/google/android/gms/tasks/zzu;->zzc()V

    const/4 v1, 0x1

    .line 83
    iput-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    .line 84
    iput-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzaa:Ljava/lang/Object;

    .line 85
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_12

    .line 86
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/Task;)V

    return-void

    :catchall_12
    move-exception p1

    .line 85
    :try_start_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw p1
.end method

.method public final trySetException(Ljava/lang/Exception;)Z
    .registers 4

    const-string v0, "Exception must not be null"

    .line 104
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 106
    :try_start_8
    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    if-eqz v1, :cond_f

    const/4 p1, 0x0

    .line 107
    monitor-exit v0

    return p1

    :cond_f
    const/4 v1, 0x1

    .line 108
    iput-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    .line 109
    iput-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzab:Ljava/lang/Exception;

    .line 110
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_8 .. :try_end_15} :catchall_1b

    .line 111
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/Task;)V

    return v1

    :catchall_1b
    move-exception p1

    .line 110
    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1b

    throw p1
.end method

.method public final trySetResult(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)Z"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 89
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    if-eqz v1, :cond_a

    const/4 p1, 0x0

    .line 90
    monitor-exit v0

    return p1

    :cond_a
    const/4 v1, 0x1

    .line 91
    iput-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    .line 92
    iput-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzaa:Ljava/lang/Object;

    .line 93
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_16

    .line 94
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/Task;)V

    return v1

    :catchall_16
    move-exception p1

    .line 93
    :try_start_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw p1
.end method

.method public final zza()Z
    .registers 3

    .line 113
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 114
    :try_start_3
    iget-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    if-eqz v1, :cond_a

    const/4 v1, 0x0

    .line 115
    monitor-exit v0

    return v1

    :cond_a
    const/4 v1, 0x1

    .line 116
    iput-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzy:Z

    .line 117
    iput-boolean v1, p0, Lcom/google/android/gms/tasks/zzu;->zzz:Z

    .line 118
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_16

    .line 119
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu;->zzx:Lcom/google/android/gms/tasks/zzr;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/tasks/zzr;->zza(Lcom/google/android/gms/tasks/Task;)V

    return v1

    :catchall_16
    move-exception v1

    .line 118
    :try_start_17
    monitor-exit v0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v1
.end method

###### Class com.google.android.gms.tasks.zzu.zza (com.google.android.gms.tasks.zzu$zza)
.class Lcom/google/android/gms/tasks/zzu$zza;
.super Lcom/google/android/gms/common/api/internal/LifecycleCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tasks/zzu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zza"
.end annotation


# instance fields
.field private final zzac:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Lcom/google/android/gms/tasks/zzq<",
            "*>;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/internal/LifecycleFragment;)V
    .registers 3

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/internal/LifecycleCallback;-><init>(Lcom/google/android/gms/common/api/internal/LifecycleFragment;)V

    .line 8
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tasks/zzu$zza;->zzac:Ljava/util/List;

    .line 9
    iget-object p1, p0, Lcom/google/android/gms/tasks/zzu$zza;->mLifecycleFragment:Lcom/google/android/gms/common/api/internal/LifecycleFragment;

    const-string v0, "TaskOnStopCallback"

    invoke-interface {p1, v0, p0}, Lcom/google/android/gms/common/api/internal/LifecycleFragment;->addCallback(Ljava/lang/String;Lcom/google/android/gms/common/api/internal/LifecycleCallback;)V

    return-void
.end method

.method public static zza(Landroid/app/Activity;)Lcom/google/android/gms/tasks/zzu$zza;
    .registers 3

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/tasks/zzu$zza;->getFragment(Landroid/app/Activity;)Lcom/google/android/gms/common/api/internal/LifecycleFragment;

    move-result-object p0

    .line 2
    const-class v0, Lcom/google/android/gms/tasks/zzu$zza;

    const-string v1, "TaskOnStopCallback"

    invoke-interface {p0, v1, v0}, Lcom/google/android/gms/common/api/internal/LifecycleFragment;->getCallbackOrNull(Ljava/lang/String;Ljava/lang/Class;)Lcom/google/android/gms/common/api/internal/LifecycleCallback;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/zzu$zza;

    if-nez v0, :cond_15

    .line 4
    new-instance v0, Lcom/google/android/gms/tasks/zzu$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tasks/zzu$zza;-><init>(Lcom/google/android/gms/common/api/internal/LifecycleFragment;)V

    :cond_15
    return-object v0
.end method


# virtual methods
.method public onStop()V
    .registers 4

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu$zza;->zzac:Ljava/util/List;

    monitor-enter v0

    .line 15
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu$zza;->zzac:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 16
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/tasks/zzq;

    if-eqz v2, :cond_9

    .line 18
    invoke-interface {v2}, Lcom/google/android/gms/tasks/zzq;->cancel()V

    goto :goto_9

    .line 20
    :cond_21
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu$zza;->zzac:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 21
    monitor-exit v0

    return-void

    :catchall_28
    move-exception v1

    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v1
.end method

.method public final zzb(Lcom/google/android/gms/tasks/zzq;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/tasks/zzq<",
            "TT;>;)V"
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/tasks/zzu$zza;->zzac:Ljava/util/List;

    monitor-enter v0

    .line 12
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/tasks/zzu$zza;->zzac:Ljava/util/List;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    monitor-exit v0

    return-void

    :catchall_f
    move-exception p1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw p1
.end method
