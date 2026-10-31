###### Class com.google.android.gms.common.config.GservicesValue (com.google.android.gms.common.config.GservicesValue)
.class public abstract Lcom/google/android/gms/common/config/GservicesValue;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/config/GservicesValue$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final sLock:Ljava/lang/Object;

.field private static zzbl:Lcom/google/android/gms/common/config/GservicesValue$zza;

.field private static zzbm:I

.field private static zzbn:Landroid/content/Context;

.field private static zzbo:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final mKey:Ljava/lang/String;

.field protected final zzbp:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private zzbq:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 45
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/config/GservicesValue;->sLock:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/common/config/GservicesValue;->zzbq:Ljava/lang/Object;

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/common/config/GservicesValue;->mKey:Ljava/lang/String;

    .line 10
    iput-object p2, p0, Lcom/google/android/gms/common/config/GservicesValue;->zzbp:Ljava/lang/Object;

    return-void
.end method

.method public static isInitialized()Z
    .registers 2

    .line 1
    sget-object v0, Lcom/google/android/gms/common/config/GservicesValue;->sLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 2
    :try_start_4
    monitor-exit v0

    return v1

    :catchall_6
    move-exception v1

    .line 3
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_6

    throw v1
.end method

.method public static value(Ljava/lang/String;Ljava/lang/Float;)Lcom/google/android/gms/common/config/GservicesValue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ")",
            "Lcom/google/android/gms/common/config/GservicesValue<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/google/android/gms/common/config/zzd;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/config/zzd;-><init>(Ljava/lang/String;Ljava/lang/Float;)V

    return-object v0
.end method

.method public static value(Ljava/lang/String;Ljava/lang/Integer;)Lcom/google/android/gms/common/config/GservicesValue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ")",
            "Lcom/google/android/gms/common/config/GservicesValue<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 42
    new-instance v0, Lcom/google/android/gms/common/config/zzc;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/config/zzc;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public static value(Ljava/lang/String;Ljava/lang/Long;)Lcom/google/android/gms/common/config/GservicesValue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ")",
            "Lcom/google/android/gms/common/config/GservicesValue<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 41
    new-instance v0, Lcom/google/android/gms/common/config/zzb;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/config/zzb;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method public static value(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/common/config/GservicesValue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/common/config/GservicesValue<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 44
    new-instance v0, Lcom/google/android/gms/common/config/zze;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/config/zze;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static value(Ljava/lang/String;Z)Lcom/google/android/gms/common/config/GservicesValue;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/google/android/gms/common/config/GservicesValue<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 40
    new-instance v0, Lcom/google/android/gms/common/config/zza;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/config/zza;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method private static zzi()Z
    .registers 2

    .line 4
    sget-object v0, Lcom/google/android/gms/common/config/GservicesValue;->sLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 5
    :try_start_4
    monitor-exit v0

    return v1

    :catchall_6
    move-exception v1

    .line 6
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_6

    throw v1
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/common/config/GservicesValue;->zzbq:Ljava/lang/Object;

    if-eqz v0, :cond_5

    return-object v0

    .line 21
    :cond_5
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    .line 22
    sget-object v1, Lcom/google/android/gms/common/config/GservicesValue;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 23
    :try_start_c
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_3d

    .line 24
    monitor-enter v1

    const/4 v2, 0x0

    .line 25
    :try_start_f
    sput-object v2, Lcom/google/android/gms/common/config/GservicesValue;->zzbo:Ljava/util/HashSet;

    .line 26
    sput-object v2, Lcom/google/android/gms/common/config/GservicesValue;->zzbn:Landroid/content/Context;

    .line 27
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_3a

    .line 28
    :try_start_14
    iget-object v1, p0, Lcom/google/android/gms/common/config/GservicesValue;->mKey:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/google/android/gms/common/config/GservicesValue;->zzd(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1
    :try_end_1a
    .catch Ljava/lang/SecurityException; {:try_start_14 .. :try_end_1a} :catch_20
    .catchall {:try_start_14 .. :try_end_1a} :catchall_1e

    .line 29
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    return-object v1

    :catchall_1e
    move-exception v1

    goto :goto_36

    .line 32
    :catch_20
    :try_start_20
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v1
    :try_end_24
    .catchall {:try_start_20 .. :try_end_24} :catchall_1e

    .line 33
    :try_start_24
    iget-object v3, p0, Lcom/google/android/gms/common/config/GservicesValue;->mKey:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/google/android/gms/common/config/GservicesValue;->zzd(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3
    :try_end_2a
    .catchall {:try_start_24 .. :try_end_2a} :catchall_31

    .line 34
    :try_start_2a
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_1e

    .line 35
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    return-object v3

    :catchall_31
    move-exception v3

    .line 37
    :try_start_32
    invoke-static {v1, v2}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v3
    :try_end_36
    .catchall {:try_start_32 .. :try_end_36} :catchall_1e

    .line 38
    :goto_36
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    throw v1

    :catchall_3a
    move-exception v0

    .line 27
    :try_start_3b
    monitor-exit v1
    :try_end_3c
    .catchall {:try_start_3b .. :try_end_3c} :catchall_3a

    throw v0

    :catchall_3d
    move-exception v0

    .line 23
    :try_start_3e
    monitor-exit v1
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3d

    throw v0
.end method

.method public final getBinderSafe()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/google/android/gms/common/config/GservicesValue;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public override(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const-string v0, "GservicesValue"

    const-string v1, "GservicesValue.override(): test should probably call initForTests() first"

    .line 12
    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    iput-object p1, p0, Lcom/google/android/gms/common/config/GservicesValue;->zzbq:Ljava/lang/Object;

    .line 14
    sget-object p1, Lcom/google/android/gms/common/config/GservicesValue;->sLock:Ljava/lang/Object;

    monitor-enter p1

    .line 15
    :try_start_c
    invoke-static {}, Lcom/google/android/gms/common/config/GservicesValue;->zzi()Z

    .line 16
    monitor-exit p1

    return-void

    :catchall_11
    move-exception v0

    monitor-exit p1
    :try_end_13
    .catchall {:try_start_c .. :try_end_13} :catchall_11

    throw v0
.end method

.method public resetOverride()V
    .registers 2

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/google/android/gms/common/config/GservicesValue;->zzbq:Ljava/lang/Object;

    return-void
.end method

.method protected abstract zzd(Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation
.end method

###### Class com.google.android.gms.common.config.GservicesValue.zza (com.google.android.gms.common.config.GservicesValue$zza)
.class interface abstract Lcom/google/android/gms/common/config/GservicesValue$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/config/GservicesValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "zza"
.end annotation


# virtual methods
.method public abstract getLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
.end method

.method public abstract getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract zza(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
.end method

.method public abstract zza(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
.end method

.method public abstract zza(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
.end method
