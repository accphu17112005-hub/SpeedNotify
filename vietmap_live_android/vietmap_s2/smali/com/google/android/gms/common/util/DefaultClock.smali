###### Class com.google.android.gms.common.util.DefaultClock (com.google.android.gms.common.util.DefaultClock)
.class public Lcom/google/android/gms/common/util/DefaultClock;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/util/Clock;


# static fields
.field private static final zzgk:Lcom/google/android/gms/common/util/DefaultClock;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 7
    new-instance v0, Lcom/google/android/gms/common/util/DefaultClock;

    invoke-direct {v0}, Lcom/google/android/gms/common/util/DefaultClock;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/util/DefaultClock;->zzgk:Lcom/google/android/gms/common/util/DefaultClock;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/google/android/gms/common/util/Clock;
    .registers 1

    .line 1
    sget-object v0, Lcom/google/android/gms/common/util/DefaultClock;->zzgk:Lcom/google/android/gms/common/util/DefaultClock;

    return-object v0
.end method


# virtual methods
.method public currentThreadTimeMillis()J
    .registers 3

    .line 5
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public currentTimeMillis()J
    .registers 3

    .line 2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public elapsedRealtime()J
    .registers 3

    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method public nanoTime()J
    .registers 3

    .line 4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method
