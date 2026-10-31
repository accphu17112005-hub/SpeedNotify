###### Class com.google.android.gms.location.Geofence (com.google.android.gms.location.Geofence)
.class public interface abstract Lcom/google/android/gms/location/Geofence;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/location/Geofence$Builder;
    }
.end annotation


# static fields
.field public static final GEOFENCE_TRANSITION_DWELL:I = 0x4

.field public static final GEOFENCE_TRANSITION_ENTER:I = 0x1

.field public static final GEOFENCE_TRANSITION_EXIT:I = 0x2

.field public static final NEVER_EXPIRE:J = -0x1L


# virtual methods
.method public abstract getRequestId()Ljava/lang/String;
.end method

###### Class com.google.android.gms.location.Geofence.Builder (com.google.android.gms.location.Geofence$Builder)
.class public final Lcom/google/android/gms/location/Geofence$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/location/Geofence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private zzad:Ljava/lang/String;

.field private zzae:I

.field private zzaf:J

.field private zzag:S

.field private zzah:D

.field private zzai:D

.field private zzaj:F

.field private zzak:I

.field private zzal:I


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzad:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzae:I

    const-wide/high16 v1, -0x8000000000000000L

    iput-wide v1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaf:J

    const/4 v1, -0x1

    iput-short v1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzag:S

    iput v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzak:I

    iput v1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzal:I

    return-void
.end method


# virtual methods
.method public final build()Lcom/google/android/gms/location/Geofence;
    .registers 15

    iget-object v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzad:Ljava/lang/String;

    if-eqz v0, :cond_62

    iget v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzae:I

    if-eqz v0, :cond_5a

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_19

    iget v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzal:I

    if-ltz v0, :cond_11

    goto :goto_19

    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Non-negative loitering delay needs to be set when transition types include GEOFENCE_TRANSITION_DWELLING."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_19
    :goto_19
    iget-wide v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaf:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v4, v0, v2

    if-eqz v4, :cond_52

    iget-short v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzag:S

    const/4 v1, -0x1

    if-eq v0, v1, :cond_4a

    iget v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzak:I

    if-ltz v0, :cond_42

    new-instance v0, Lcom/google/android/gms/internal/location/zzbh;

    iget-object v2, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzad:Ljava/lang/String;

    iget v3, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzae:I

    const/4 v4, 0x1

    iget-wide v5, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzah:D

    iget-wide v7, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzai:D

    iget v9, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaj:F

    iget-wide v10, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaf:J

    iget v12, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzak:I

    iget v13, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzal:I

    move-object v1, v0

    invoke-direct/range {v1 .. v13}, Lcom/google/android/gms/internal/location/zzbh;-><init>(Ljava/lang/String;ISDDFJII)V

    return-object v0

    :cond_42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Notification responsiveness should be nonnegative."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Geofence region not set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_52
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Expiration not set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Transitions types not set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Request ID not set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setCircularRegion(DDF)Lcom/google/android/gms/location/Geofence$Builder;
    .registers 7

    const/4 v0, 0x1

    iput-short v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzag:S

    iput-wide p1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzah:D

    iput-wide p3, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzai:D

    iput p5, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaj:F

    return-object p0
.end method

.method public final setExpirationDuration(J)Lcom/google/android/gms/location/Geofence$Builder;
    .registers 6

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_b

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaf:J

    goto :goto_12

    :cond_b
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzaf:J

    :goto_12
    return-object p0
.end method

.method public final setLoiteringDelay(I)Lcom/google/android/gms/location/Geofence$Builder;
    .registers 2

    iput p1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzal:I

    return-object p0
.end method

.method public final setNotificationResponsiveness(I)Lcom/google/android/gms/location/Geofence$Builder;
    .registers 2

    iput p1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzak:I

    return-object p0
.end method

.method public final setRequestId(Ljava/lang/String;)Lcom/google/android/gms/location/Geofence$Builder;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzad:Ljava/lang/String;

    return-object p0
.end method

.method public final setTransitionTypes(I)Lcom/google/android/gms/location/Geofence$Builder;
    .registers 2

    iput p1, p0, Lcom/google/android/gms/location/Geofence$Builder;->zzae:I

    return-object p0
.end method
