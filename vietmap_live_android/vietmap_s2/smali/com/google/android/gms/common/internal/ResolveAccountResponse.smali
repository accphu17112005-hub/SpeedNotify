###### Class com.google.android.gms.common.internal.ResolveAccountResponse (com.google.android.gms.common.internal.ResolveAccountResponse)
.class public Lcom/google/android/gms/common/internal/ResolveAccountResponse;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/common/internal/ResolveAccountResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zadh:Lcom/google/android/gms/common/ConnectionResult;

.field private zagf:Z

.field private final zale:I

.field private zanw:Landroid/os/IBinder;

.field private zapb:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 45
    new-instance v0, Lcom/google/android/gms/common/internal/zan;

    invoke-direct {v0}, Lcom/google/android/gms/common/internal/zan;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 4

    .line 10
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;-><init>(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method constructor <init>(ILandroid/os/IBinder;Lcom/google/android/gms/common/ConnectionResult;ZZ)V
    .registers 6

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zale:I

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zanw:Landroid/os/IBinder;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zadh:Lcom/google/android/gms/common/ConnectionResult;

    .line 5
    iput-boolean p4, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zagf:Z

    .line 6
    iput-boolean p5, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zapb:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 8

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v3, p1

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;-><init>(ILandroid/os/IBinder;Lcom/google/android/gms/common/ConnectionResult;ZZ)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 39
    :cond_4
    instance-of v1, p1, Lcom/google/android/gms/common/internal/ResolveAccountResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 41
    :cond_a
    check-cast p1, Lcom/google/android/gms/common/internal/ResolveAccountResponse;

    .line 42
    iget-object v1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zadh:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v3, p1, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zadh:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/common/ConnectionResult;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 43
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->getAccountAccessor()Lcom/google/android/gms/common/internal/IAccountAccessor;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->getAccountAccessor()Lcom/google/android/gms/common/internal/IAccountAccessor;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_25

    return v0

    :cond_25
    return v2
.end method

.method public getAccountAccessor()Lcom/google/android/gms/common/internal/IAccountAccessor;
    .registers 2

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zanw:Landroid/os/IBinder;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/IAccountAccessor$Stub;->asInterface(Landroid/os/IBinder;)Lcom/google/android/gms/common/internal/IAccountAccessor;

    move-result-object v0

    return-object v0
.end method

.method public getConnectionResult()Lcom/google/android/gms/common/ConnectionResult;
    .registers 2

    .line 15
    iget-object v0, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zadh:Lcom/google/android/gms/common/ConnectionResult;

    return-object v0
.end method

.method public getSaveDefaultAccount()Z
    .registers 2

    .line 16
    iget-boolean v0, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zagf:Z

    return v0
.end method

.method public isFromCrossClientAuth()Z
    .registers 2

    .line 19
    iget-boolean v0, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zapb:Z

    return v0
.end method

.method public setAccountAccessor(Lcom/google/android/gms/common/internal/IAccountAccessor;)Lcom/google/android/gms/common/internal/ResolveAccountResponse;
    .registers 2

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_8

    .line 13
    :cond_4
    invoke-interface {p1}, Lcom/google/android/gms/common/internal/IAccountAccessor;->asBinder()Landroid/os/IBinder;

    move-result-object p1

    :goto_8
    iput-object p1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zanw:Landroid/os/IBinder;

    return-object p0
.end method

.method public setIsFromCrossClientAuth(Z)Lcom/google/android/gms/common/internal/ResolveAccountResponse;
    .registers 2

    .line 20
    iput-boolean p1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zapb:Z

    return-object p0
.end method

.method public setSaveDefaultAccount(Z)Lcom/google/android/gms/common/internal/ResolveAccountResponse;
    .registers 2

    .line 17
    iput-boolean p1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zagf:Z

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 7

    .line 23
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result v0

    .line 24
    iget v1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zale:I

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeInt(Landroid/os/Parcel;II)V

    .line 25
    iget-object v1, p0, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->zanw:Landroid/os/IBinder;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, v2, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    .line 27
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->getConnectionResult()Lcom/google/android/gms/common/ConnectionResult;

    move-result-object v1

    const/4 v2, 0x3

    .line 28
    invoke-static {p1, v2, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    .line 30
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->getSaveDefaultAccount()Z

    move-result p2

    const/4 v1, 0x4

    .line 31
    invoke-static {p1, v1, p2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBoolean(Landroid/os/Parcel;IZ)V

    .line 33
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->isFromCrossClientAuth()Z

    move-result p2

    const/4 v1, 0x5

    .line 34
    invoke-static {p1, v1, p2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBoolean(Landroid/os/Parcel;IZ)V

    .line 35
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method
