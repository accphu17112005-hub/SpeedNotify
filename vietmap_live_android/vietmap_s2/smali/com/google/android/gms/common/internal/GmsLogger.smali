###### Class com.google.android.gms.common.internal.GmsLogger (com.google.android.gms.common.internal.GmsLogger)
.class public final Lcom/google/android/gms/common/internal/GmsLogger;
.super Ljava/lang/Object;


# static fields
.field private static final zzef:I = 0xf

.field private static final zzeg:Ljava/lang/String;


# instance fields
.field private final zzeh:Ljava/lang/String;

.field private final zzei:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/common/internal/GmsLogger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "log tag cannot be null"

    .line 2
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0x17

    if-gt v0, v3, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v2

    .line 5
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v1

    const-string v1, "tag \"%s\" is longer than the %d character maximum"

    .line 6
    invoke-static {v0, v1, v4}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 7
    iput-object p1, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzeh:Ljava/lang/String;

    if-eqz p2, :cond_33

    .line 8
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-gtz p1, :cond_30

    goto :goto_33

    .line 10
    :cond_30
    iput-object p2, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzei:Ljava/lang/String;

    return-void

    :cond_33
    :goto_33
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzei:Ljava/lang/String;

    return-void
.end method

.method private final varargs zza(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 65
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 66
    iget-object p2, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzei:Ljava/lang/String;

    if-nez p2, :cond_9

    return-object p1

    .line 68
    :cond_9
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private final zzh(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 62
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzei:Ljava/lang/String;

    if-nez v0, :cond_5

    return-object p1

    .line 64
    :cond_5
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public final canLog(I)Z
    .registers 3

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzeh:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    return p1
.end method

.method public final canLogPii()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x3

    .line 16
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 17
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    return-void
.end method

.method public final d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x3

    .line 19
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 20
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e
    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x6

    .line 43
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 44
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x6

    .line 46
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 47
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e
    return-void
.end method

.method public final varargs efmt(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5

    const/4 v0, 0x6

    .line 49
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 50
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/common/internal/GmsLogger;->zza(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    return-void
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x4

    .line 28
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 29
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    return-void
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x4

    .line 31
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 32
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e
    return-void
.end method

.method public final pii(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 56
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLogPii()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 57
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, " PII_LOG"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1d

    :cond_17
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    :goto_1d
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_24
    return-void
.end method

.method public final pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 6

    .line 59
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLogPii()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 60
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, " PII_LOG"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1d

    :cond_17
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    :goto_1d
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_24
    return-void
.end method

.method public final v(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x2

    .line 22
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 23
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    return-void
.end method

.method public final v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x2

    .line 25
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 26
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e
    return-void
.end method

.method public final w(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    const/4 v0, 0x5

    .line 34
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 35
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_e
    return-void
.end method

.method public final w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x5

    .line 37
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 38
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_e
    return-void
.end method

.method public final varargs wfmt(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4

    const/4 p1, 0x5

    .line 40
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result p1

    if-eqz p1, :cond_10

    .line 41
    iget-object p1, p0, Lcom/google/android/gms/common/internal/GmsLogger;->zzeh:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/common/internal/GmsLogger;->zza(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_10
    return-void
.end method

.method public final wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    const/4 v0, 0x7

    .line 52
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/GmsLogger;->canLog(I)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 53
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/internal/GmsLogger;->zzh(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_15
    return-void
.end method
