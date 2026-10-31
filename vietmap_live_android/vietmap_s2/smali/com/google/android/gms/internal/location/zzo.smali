###### Class com.google.android.gms.internal.location.zzo (com.google.android.gms.internal.location.zzo)
.class public final Lcom/google/android/gms/internal/location/zzo;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/location/zzo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zzcg:I

.field private zzch:Lcom/google/android/gms/internal/location/zzm;

.field private zzci:Lcom/google/android/gms/location/zzr;

.field private zzcj:Lcom/google/android/gms/internal/location/zzaj;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/internal/location/zzp;

    invoke-direct {v0}, Lcom/google/android/gms/internal/location/zzp;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/location/zzo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/internal/location/zzm;Landroid/os/IBinder;Landroid/os/IBinder;)V
    .registers 5

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/location/zzo;->zzcg:I

    iput-object p2, p0, Lcom/google/android/gms/internal/location/zzo;->zzch:Lcom/google/android/gms/internal/location/zzm;

    const/4 p1, 0x0

    if-nez p3, :cond_c

    move-object p2, p1

    goto :goto_10

    :cond_c
    invoke-static {p3}, Lcom/google/android/gms/location/zzs;->zza(Landroid/os/IBinder;)Lcom/google/android/gms/location/zzr;

    move-result-object p2

    :goto_10
    iput-object p2, p0, Lcom/google/android/gms/internal/location/zzo;->zzci:Lcom/google/android/gms/location/zzr;

    if-nez p4, :cond_15

    goto :goto_2a

    :cond_15
    if-nez p4, :cond_18

    goto :goto_2a

    :cond_18
    const-string p1, "com.google.android.gms.location.internal.IFusedLocationProviderCallback"

    invoke-interface {p4, p1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p1

    instance-of p2, p1, Lcom/google/android/gms/internal/location/zzaj;

    if-eqz p2, :cond_25

    check-cast p1, Lcom/google/android/gms/internal/location/zzaj;

    goto :goto_2a

    :cond_25
    new-instance p1, Lcom/google/android/gms/internal/location/zzal;

    invoke-direct {p1, p4}, Lcom/google/android/gms/internal/location/zzal;-><init>(Landroid/os/IBinder;)V

    :goto_2a
    iput-object p1, p0, Lcom/google/android/gms/internal/location/zzo;->zzcj:Lcom/google/android/gms/internal/location/zzaj;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 7

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/location/zzo;->zzcg:I

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeInt(Landroid/os/Parcel;II)V

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzo;->zzch:Lcom/google/android/gms/internal/location/zzm;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, v2, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    iget-object p2, p0, Lcom/google/android/gms/internal/location/zzo;->zzci:Lcom/google/android/gms/location/zzr;

    const/4 v1, 0x0

    if-nez p2, :cond_18

    move-object p2, v1

    goto :goto_1c

    :cond_18
    invoke-interface {p2}, Lcom/google/android/gms/location/zzr;->asBinder()Landroid/os/IBinder;

    move-result-object p2

    :goto_1c
    const/4 v2, 0x3

    invoke-static {p1, v2, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    const/4 p2, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/location/zzo;->zzcj:Lcom/google/android/gms/internal/location/zzaj;

    if-nez v2, :cond_26

    goto :goto_2a

    :cond_26
    invoke-interface {v2}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    :goto_2a
    invoke-static {p1, p2, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method
