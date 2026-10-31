###### Class com.google.android.gms.common.api.BooleanResult (com.google.android.gms.common.api.BooleanResult)
.class public Lcom/google/android/gms/common/api/BooleanResult;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Result;


# instance fields
.field private final mStatus:Lcom/google/android/gms/common/api/Status;

.field private final zabg:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/Status;Z)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Status must not be null"

    .line 2
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/api/Status;

    iput-object p1, p0, Lcom/google/android/gms/common/api/BooleanResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    .line 3
    iput-boolean p2, p0, Lcom/google/android/gms/common/api/BooleanResult;->zabg:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_4

    return v0

    .line 12
    :cond_4
    instance-of v1, p1, Lcom/google/android/gms/common/api/BooleanResult;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 14
    :cond_a
    check-cast p1, Lcom/google/android/gms/common/api/BooleanResult;

    .line 15
    iget-object v1, p0, Lcom/google/android/gms/common/api/BooleanResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    iget-object v3, p1, Lcom/google/android/gms/common/api/BooleanResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/common/api/Status;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1d

    iget-boolean v1, p0, Lcom/google/android/gms/common/api/BooleanResult;->zabg:Z

    iget-boolean p1, p1, Lcom/google/android/gms/common/api/BooleanResult;->zabg:Z

    if-ne v1, p1, :cond_1d

    return v0

    :cond_1d
    return v2
.end method

.method public getStatus()Lcom/google/android/gms/common/api/Status;
    .registers 2

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/api/BooleanResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    return-object v0
.end method

.method public getValue()Z
    .registers 2

    .line 6
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/BooleanResult;->zabg:Z

    return v0
.end method

.method public final hashCode()I
    .registers 3

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/api/BooleanResult;->mStatus:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    .line 8
    iget-boolean v1, p0, Lcom/google/android/gms/common/api/BooleanResult;->zabg:Z

    add-int/2addr v0, v1

    return v0
.end method
