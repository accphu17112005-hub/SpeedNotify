###### Class com.google.android.gms.internal.location.zzt (com.google.android.gms.internal.location.zzt)
.class final Lcom/google/android/gms/internal/location/zzt;
.super Lcom/google/android/gms/internal/location/zzab;


# instance fields
.field private final synthetic zzcn:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/location/zzq;Lcom/google/android/gms/common/api/GoogleApiClient;Z)V
    .registers 4

    iput-boolean p3, p0, Lcom/google/android/gms/internal/location/zzt;->zzcn:Z

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/location/zzab;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

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

    iget-boolean v0, p0, Lcom/google/android/gms/internal/location/zzt;->zzcn:Z

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/location/zzaz;->zza(Z)V

    sget-object p1, Lcom/google/android/gms/common/api/Status;->RESULT_SUCCESS:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/location/zzt;->setResult(Lcom/google/android/gms/common/api/Result;)V

    return-void
.end method
