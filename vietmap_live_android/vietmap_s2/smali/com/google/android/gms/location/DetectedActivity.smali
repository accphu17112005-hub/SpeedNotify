###### Class com.google.android.gms.location.DetectedActivity (com.google.android.gms.location.DetectedActivity)
.class public Lcom/google/android/gms/location/DetectedActivity;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/location/DetectedActivity;",
            ">;"
        }
    .end annotation
.end field

.field public static final IN_VEHICLE:I = 0x0

.field public static final ON_BICYCLE:I = 0x1

.field public static final ON_FOOT:I = 0x2

.field public static final RUNNING:I = 0x8

.field public static final STILL:I = 0x3

.field public static final TILTING:I = 0x5

.field public static final UNKNOWN:I = 0x4

.field public static final WALKING:I = 0x7

.field private static final zzo:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/google/android/gms/location/DetectedActivity;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzp:[I

.field private static final zzq:[I

.field private static final zzr:[I


# instance fields
.field private zzi:I

.field private zzs:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/location/zzh;

    invoke-direct {v0}, Lcom/google/android/gms/location/zzh;-><init>()V

    sput-object v0, Lcom/google/android/gms/location/DetectedActivity;->zzo:Ljava/util/Comparator;

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_2a

    sput-object v0, Lcom/google/android/gms/location/DetectedActivity;->zzp:[I

    const/16 v0, 0x11

    new-array v0, v0, [I

    fill-array-data v0, :array_32

    sput-object v0, Lcom/google/android/gms/location/DetectedActivity;->zzq:[I

    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_58

    sput-object v0, Lcom/google/android/gms/location/DetectedActivity;->zzr:[I

    new-instance v0, Lcom/google/android/gms/location/zzi;

    invoke-direct {v0}, Lcom/google/android/gms/location/zzi;-><init>()V

    sput-object v0, Lcom/google/android/gms/location/DetectedActivity;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void

    nop

    :array_2a
    .array-data 4
        0x9
        0xa
    .end array-data

    :array_32
    .array-data 4
        0x0
        0x1
        0x2
        0x4
        0x5
        0x6
        0x7
        0x8
        0xa
        0xb
        0xc
        0xd
        0xe
        0x10
        0x11
        0x12
        0x13
    .end array-data

    :array_58
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x7
        0x8
        0x10
        0x11
    .end array-data
.end method

.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    iput p1, p0, Lcom/google/android/gms/location/DetectedActivity;->zzi:I

    iput p2, p0, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    return-void
.end method

.method public static zzb(I)V
    .registers 6

    sget-object v0, Lcom/google/android/gms/location/DetectedActivity;->zzr:[I

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_5
    if-ge v2, v1, :cond_f

    aget v4, v0, v2

    if-ne v4, p0, :cond_c

    const/4 v3, 0x1

    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_f
    if-nez v3, :cond_29

    const/16 v0, 0x51

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid DetectedActivity supported by Activity Transition API."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "DetectedActivity"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_29
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_21

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_12

    goto :goto_21

    :cond_12
    check-cast p1, Lcom/google/android/gms/location/DetectedActivity;

    iget v2, p0, Lcom/google/android/gms/location/DetectedActivity;->zzi:I

    iget v3, p1, Lcom/google/android/gms/location/DetectedActivity;->zzi:I

    if-ne v2, v3, :cond_21

    iget v2, p0, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    iget p1, p1, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    if-ne v2, p1, :cond_21

    return v0

    :cond_21
    :goto_21
    return v1
.end method

.method public getConfidence()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    return v0
.end method

.method public getType()I
    .registers 3

    iget v0, p0, Lcom/google/android/gms/location/DetectedActivity;->zzi:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_a

    if-gez v0, :cond_9

    goto :goto_a

    :cond_9
    return v0

    :cond_a
    :goto_a
    const/4 v0, 0x4

    return v0
.end method

.method public hashCode()I
    .registers 4

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/google/android/gms/location/DetectedActivity;->zzi:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    invoke-virtual {p0}, Lcom/google/android/gms/location/DetectedActivity;->getType()I

    move-result v0

    if-eqz v0, :cond_45

    const/4 v1, 0x1

    if-eq v0, v1, :cond_42

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3f

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3c

    const/4 v1, 0x4

    if-eq v0, v1, :cond_39

    const/4 v1, 0x5

    if-eq v0, v1, :cond_36

    const/4 v1, 0x7

    if-eq v0, v1, :cond_33

    const/16 v1, 0x8

    if-eq v0, v1, :cond_30

    packed-switch v0, :pswitch_data_72

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_47

    :pswitch_24
    const-string v0, "IN_FOUR_WHEELER_VEHICLE"

    goto :goto_47

    :pswitch_27
    const-string v0, "IN_TWO_WHEELER_VEHICLE"

    goto :goto_47

    :pswitch_2a
    const-string v0, "IN_RAIL_VEHICLE"

    goto :goto_47

    :pswitch_2d
    const-string v0, "IN_ROAD_VEHICLE"

    goto :goto_47

    :cond_30
    const-string v0, "RUNNING"

    goto :goto_47

    :cond_33
    const-string v0, "WALKING"

    goto :goto_47

    :cond_36
    const-string v0, "TILTING"

    goto :goto_47

    :cond_39
    const-string v0, "UNKNOWN"

    goto :goto_47

    :cond_3c
    const-string v0, "STILL"

    goto :goto_47

    :cond_3f
    const-string v0, "ON_FOOT"

    goto :goto_47

    :cond_42
    const-string v0, "ON_BICYCLE"

    goto :goto_47

    :cond_45
    const-string v0, "IN_VEHICLE"

    :goto_47
    iget v1, p0, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x30

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "DetectedActivity [type="

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", confidence="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_72
    .packed-switch 0x10
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_24
    .end packed-switch
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result p2

    iget v0, p0, Lcom/google/android/gms/location/DetectedActivity;->zzi:I

    const/4 v1, 0x1

    invoke-static {p1, v1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeInt(Landroid/os/Parcel;II)V

    iget v0, p0, Lcom/google/android/gms/location/DetectedActivity;->zzs:I

    const/4 v1, 0x2

    invoke-static {p1, v1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeInt(Landroid/os/Parcel;II)V

    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method
