###### Class com.google.android.gms.internal.play_billing.zzl (com.google.android.gms.internal.play_billing.zzl)
.class abstract Lcom/google/android/gms/internal/play_billing/zzl;
.super Lcom/google/android/gms/internal/play_billing/zzs;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/play_billing/zzs<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final zza:I

.field private zzb:I


# direct methods
.method protected constructor <init>(II)V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/internal/play_billing/zzs;-><init>()V

    const-string v0, "index"

    .line 1
    invoke-static {p2, p1, v0}, Lcom/google/android/gms/internal/play_billing/zzj;->zzb(IILjava/lang/String;)I

    iput p1, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zza:I

    iput p2, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .registers 3

    iget v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zza:I

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    return v0

    :cond_8
    const/4 v0, 0x0

    return v0
.end method

.method public final hasPrevious()Z
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    return v0

    :cond_6
    const/4 v0, 0x0

    return v0
.end method

.method public final next()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/play_billing/zzl;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/play_billing/zzl;->zza(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 0
    :cond_11
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 1
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public final nextIndex()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    return v0
.end method

.method public final previous()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/play_billing/zzl;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/play_billing/zzl;->zza(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 0
    :cond_11
    new-instance v0, Ljava/util/NoSuchElementException;

    .line 1
    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public final previousIndex()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/play_billing/zzl;->zzb:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method protected abstract zza(I)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation
.end method
