###### Class com.google.android.gms.common.providers.PooledExecutorsProvider (com.google.android.gms.common.providers.PooledExecutorsProvider)
.class public Lcom/google/android/gms/common/providers/PooledExecutorsProvider;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;
    }
.end annotation


# static fields
.field private static zzey:Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;
    .registers 2

    const-class v0, Lcom/google/android/gms/common/providers/PooledExecutorsProvider;

    monitor-enter v0

    .line 1
    :try_start_3
    sget-object v1, Lcom/google/android/gms/common/providers/PooledExecutorsProvider;->zzey:Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;

    if-nez v1, :cond_e

    .line 2
    new-instance v1, Lcom/google/android/gms/common/providers/zza;

    invoke-direct {v1}, Lcom/google/android/gms/common/providers/zza;-><init>()V

    .line 3
    sput-object v1, Lcom/google/android/gms/common/providers/PooledExecutorsProvider;->zzey:Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;

    .line 4
    :cond_e
    sget-object v1, Lcom/google/android/gms/common/providers/PooledExecutorsProvider;->zzey:Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v0

    return-object v1

    :catchall_12
    move-exception v1

    monitor-exit v0

    throw v1
.end method

###### Class com.google.android.gms.common.providers.PooledExecutorsProvider.PooledExecutorFactory (com.google.android.gms.common.providers.PooledExecutorsProvider$PooledExecutorFactory)
.class public interface abstract Lcom/google/android/gms/common/providers/PooledExecutorsProvider$PooledExecutorFactory;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/providers/PooledExecutorsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PooledExecutorFactory"
.end annotation


# virtual methods
.method public abstract newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;
.end method
