###### Class com.google.android.gms.common.api.internal.zabf (com.google.android.gms.common.api.internal.zabf)
.class abstract Lcom/google/android/gms/common/api/internal/zabf;
.super Ljava/lang/Object;


# instance fields
.field private final zaht:Lcom/google/android/gms/common/api/internal/zabd;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/common/api/internal/zabd;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zabf;->zaht:Lcom/google/android/gms/common/api/internal/zabd;

    return-void
.end method


# virtual methods
.method protected abstract zaan()V
.end method

.method public final zac(Lcom/google/android/gms/common/api/internal/zabe;)V
    .registers 4

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/zabe;->zaa(Lcom/google/android/gms/common/api/internal/zabe;)Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 5
    :try_start_7
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/zabe;->zab(Lcom/google/android/gms/common/api/internal/zabe;)Lcom/google/android/gms/common/api/internal/zabd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zabf;->zaht:Lcom/google/android/gms/common/api/internal/zabd;
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_22

    if-eq v0, v1, :cond_17

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/zabe;->zaa(Lcom/google/android/gms/common/api/internal/zabe;)Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 8
    :cond_17
    :try_start_17
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zabf;->zaan()V
    :try_end_1a
    .catchall {:try_start_17 .. :try_end_1a} :catchall_22

    .line 9
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/zabe;->zaa(Lcom/google/android/gms/common/api/internal/zabe;)Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_22
    move-exception v0

    .line 11
    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/zabe;->zaa(Lcom/google/android/gms/common/api/internal/zabe;)Ljava/util/concurrent/locks/Lock;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method
