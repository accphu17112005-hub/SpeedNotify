###### Class com.google.android.gms.internal.location.zzbf (com.google.android.gms.internal.location.zzbf)
.class public final Lcom/google/android/gms/internal/location/zzbf;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/location/zzbf;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zzbv:Landroid/app/PendingIntent;

.field private zzcg:I

.field private zzcj:Lcom/google/android/gms/internal/location/zzaj;

.field private zzdl:Lcom/google/android/gms/internal/location/zzbd;

.field private zzdm:Lcom/google/android/gms/location/zzx;

.field private zzdn:Lcom/google/android/gms/location/zzu;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/internal/location/zzbg;

    invoke-direct {v0}, Lcom/google/android/gms/internal/location/zzbg;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/location/zzbf;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V
    .registers 7

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzcg:I

    iput-object p2, p0, Lcom/google/android/gms/internal/location/zzbf;->zzdl:Lcom/google/android/gms/internal/location/zzbd;

    const/4 p1, 0x0

    if-nez p3, :cond_c

    move-object p2, p1

    goto :goto_10

    :cond_c
    invoke-static {p3}, Lcom/google/android/gms/location/zzy;->zzc(Landroid/os/IBinder;)Lcom/google/android/gms/location/zzx;

    move-result-object p2

    :goto_10
    iput-object p2, p0, Lcom/google/android/gms/internal/location/zzbf;->zzdm:Lcom/google/android/gms/location/zzx;

    iput-object p4, p0, Lcom/google/android/gms/internal/location/zzbf;->zzbv:Landroid/app/PendingIntent;

    if-nez p5, :cond_18

    move-object p2, p1

    goto :goto_1c

    :cond_18
    invoke-static {p5}, Lcom/google/android/gms/location/zzv;->zzb(Landroid/os/IBinder;)Lcom/google/android/gms/location/zzu;

    move-result-object p2

    :goto_1c
    iput-object p2, p0, Lcom/google/android/gms/internal/location/zzbf;->zzdn:Lcom/google/android/gms/location/zzu;

    if-nez p6, :cond_21

    goto :goto_36

    :cond_21
    if-nez p6, :cond_24

    goto :goto_36

    :cond_24
    const-string p1, "com.google.android.gms.location.internal.IFusedLocationProviderCallback"

    invoke-interface {p6, p1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p1

    instance-of p2, p1, Lcom/google/android/gms/internal/location/zzaj;

    if-eqz p2, :cond_31

    check-cast p1, Lcom/google/android/gms/internal/location/zzaj;

    goto :goto_36

    :cond_31
    new-instance p1, Lcom/google/android/gms/internal/location/zzal;

    invoke-direct {p1, p6}, Lcom/google/android/gms/internal/location/zzal;-><init>(Landroid/os/IBinder;)V

    :goto_36
    iput-object p1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzcj:Lcom/google/android/gms/internal/location/zzaj;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/location/zzu;Lcom/google/android/gms/internal/location/zzaj;)Lcom/google/android/gms/internal/location/zzbf;
    .registers 10

    new-instance v7, Lcom/google/android/gms/internal/location/zzbf;

    invoke-interface {p0}, Lcom/google/android/gms/location/zzu;->asBinder()Landroid/os/IBinder;

    move-result-object v5

    if-eqz p1, :cond_d

    invoke-interface {p1}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    goto :goto_e

    :cond_d
    const/4 p0, 0x0

    :goto_e
    move-object v6, p0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/location/zzbf;-><init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V

    return-object v7
.end method

.method public static zza(Lcom/google/android/gms/location/zzx;Lcom/google/android/gms/internal/location/zzaj;)Lcom/google/android/gms/internal/location/zzbf;
    .registers 10

    new-instance v7, Lcom/google/android/gms/internal/location/zzbf;

    invoke-interface {p0}, Lcom/google/android/gms/location/zzx;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    if-eqz p1, :cond_d

    invoke-interface {p1}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object p0

    goto :goto_e

    :cond_d
    const/4 p0, 0x0

    :goto_e
    move-object v6, p0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/location/zzbf;-><init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V

    return-object v7
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 8

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzcg:I

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeInt(Landroid/os/Parcel;II)V

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzdl:Lcom/google/android/gms/internal/location/zzbd;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, v2, v1, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzdm:Lcom/google/android/gms/location/zzx;

    const/4 v2, 0x0

    if-nez v1, :cond_18

    move-object v1, v2

    goto :goto_1c

    :cond_18
    invoke-interface {v1}, Lcom/google/android/gms/location/zzx;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    :goto_1c
    const/4 v4, 0x3

    invoke-static {p1, v4, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    const/4 v1, 0x4

    iget-object v4, p0, Lcom/google/android/gms/internal/location/zzbf;->zzbv:Landroid/app/PendingIntent;

    invoke-static {p1, v1, v4, p2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeParcelable(Landroid/os/Parcel;ILandroid/os/Parcelable;IZ)V

    const/4 p2, 0x5

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzdn:Lcom/google/android/gms/location/zzu;

    if-nez v1, :cond_2d

    move-object v1, v2

    goto :goto_31

    :cond_2d
    invoke-interface {v1}, Lcom/google/android/gms/location/zzu;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    :goto_31
    invoke-static {p1, p2, v1, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    const/4 p2, 0x6

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzbf;->zzcj:Lcom/google/android/gms/internal/location/zzaj;

    if-nez v1, :cond_3a

    goto :goto_3e

    :cond_3a
    invoke-interface {v1}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    :goto_3e
    invoke-static {p1, p2, v2, v3}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeIBinder(Landroid/os/Parcel;ILandroid/os/IBinder;Z)V

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method
