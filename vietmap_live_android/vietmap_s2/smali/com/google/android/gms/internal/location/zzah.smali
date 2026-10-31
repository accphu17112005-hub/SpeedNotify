###### Class com.google.android.gms.internal.location.zzah (com.google.android.gms.internal.location.zzah)
.class final Lcom/google/android/gms/internal/location/zzah;
.super Lcom/google/android/gms/internal/location/zzai;


# instance fields
.field private final synthetic zzct:Lcom/google/android/gms/location/zzal;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/location/zzaf;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/location/zzal;)V
    .registers 4

    iput-object p3, p0, Lcom/google/android/gms/internal/location/zzah;->zzct:Lcom/google/android/gms/location/zzal;

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/location/zzai;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method


# virtual methods
.method protected final synthetic doExecute(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    check-cast p1, Lcom/google/android/gms/internal/location/zzaz;

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzah;->zzct:Lcom/google/android/gms/location/zzal;

    invoke-virtual {p1, v0, p0}, Lcom/google/android/gms/internal/location/zzaz;->zza(Lcom/google/android/gms/location/zzal;Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)V

    return-void
.end method
