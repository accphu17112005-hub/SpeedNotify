###### Class com.google.android.gms.internal.location.zzas (com.google.android.gms.internal.location.zzas)
.class public final Lcom/google/android/gms/internal/location/zzas;
.super Ljava/lang/Object;


# instance fields
.field private final zzcb:Lcom/google/android/gms/internal/location/zzbj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/location/zzbj<",
            "Lcom/google/android/gms/internal/location/zzao;",
            ">;"
        }
    .end annotation
.end field

.field private final zzcu:Landroid/content/Context;

.field private zzcv:Landroid/content/ContentProviderClient;

.field private zzcw:Z

.field private final zzcx:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey<",
            "Lcom/google/android/gms/location/LocationListener;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzax;",
            ">;"
        }
    .end annotation
.end field

.field private final zzcy:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzaw;",
            ">;"
        }
    .end annotation
.end field

.field private final zzcz:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey<",
            "Lcom/google/android/gms/location/LocationCallback;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/location/zzbj;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/internal/location/zzbj<",
            "Lcom/google/android/gms/internal/location/zzao;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcv:Landroid/content/ContentProviderClient;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcw:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcy:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    iput-object p1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcu:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    return-void
.end method

.method private final zza(Lcom/google/android/gms/common/api/internal/ListenerHolder;)Lcom/google/android/gms/internal/location/zzax;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder<",
            "Lcom/google/android/gms/location/LocationListener;",
            ">;)",
            "Lcom/google/android/gms/internal/location/zzax;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->getListenerKey()Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/location/zzax;

    if-nez v1, :cond_16

    new-instance v1, Lcom/google/android/gms/internal/location/zzax;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/location/zzax;-><init>(Lcom/google/android/gms/common/api/internal/ListenerHolder;)V

    :cond_16
    iget-object v2, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->getListenerKey()Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;

    move-result-object p1

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-object v1

    :catchall_21
    move-exception p1

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw p1
.end method

.method private final zzb(Lcom/google/android/gms/common/api/internal/ListenerHolder;)Lcom/google/android/gms/internal/location/zzat;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder<",
            "Lcom/google/android/gms/location/LocationCallback;",
            ">;)",
            "Lcom/google/android/gms/internal/location/zzat;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->getListenerKey()Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/location/zzat;

    if-nez v1, :cond_16

    new-instance v1, Lcom/google/android/gms/internal/location/zzat;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/location/zzat;-><init>(Lcom/google/android/gms/common/api/internal/ListenerHolder;)V

    :cond_16
    iget-object v2, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->getListenerKey()Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;

    move-result-object p1

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-object v1

    :catchall_21
    move-exception p1

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw p1
.end method


# virtual methods
.method public final getLastLocation()Landroid/location/Location;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcu:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/location/zzao;->zza(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    return-object v0
.end method

.method public final removeAllListeners()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/location/zzax;

    if-eqz v2, :cond_d

    iget-object v4, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v4}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/location/zzao;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/location/zzbf;->zza(Lcom/google/android/gms/location/zzx;Lcom/google/android/gms/internal/location/zzaj;)Lcom/google/android/gms/internal/location/zzbf;

    move-result-object v2

    invoke-interface {v4, v2}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    goto :goto_d

    :cond_2c
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    monitor-exit v0
    :try_end_32
    .catchall {:try_start_3 .. :try_end_32} :catchall_a1

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    monitor-enter v1

    :try_start_35
    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3f
    :goto_3f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/location/zzat;

    if-eqz v2, :cond_3f

    iget-object v4, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v4}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/location/zzao;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/location/zzbf;->zza(Lcom/google/android/gms/location/zzu;Lcom/google/android/gms/internal/location/zzaj;)Lcom/google/android/gms/internal/location/zzbf;

    move-result-object v2

    invoke-interface {v4, v2}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    goto :goto_3f

    :cond_5d
    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    monitor-exit v1
    :try_end_63
    .catchall {:try_start_35 .. :try_end_63} :catchall_9e

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcy:Ljava/util/Map;

    monitor-enter v0

    :try_start_66
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcy:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_70
    :goto_70
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_94

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/location/zzaw;

    if-eqz v2, :cond_70

    iget-object v4, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v4}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/location/zzao;

    new-instance v5, Lcom/google/android/gms/internal/location/zzo;

    const/4 v6, 0x2

    invoke-interface {v2}, Lcom/google/android/gms/location/zzr;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-direct {v5, v6, v3, v2, v3}, Lcom/google/android/gms/internal/location/zzo;-><init>(ILcom/google/android/gms/internal/location/zzm;Landroid/os/IBinder;Landroid/os/IBinder;)V

    invoke-interface {v4, v5}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzo;)V

    goto :goto_70

    :cond_94
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcy:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    monitor-exit v0

    return-void

    :catchall_9b
    move-exception v1

    monitor-exit v0
    :try_end_9d
    .catchall {:try_start_66 .. :try_end_9d} :catchall_9b

    throw v1

    :catchall_9e
    move-exception v0

    :try_start_9f
    monitor-exit v1
    :try_end_a0
    .catchall {:try_start_9f .. :try_end_a0} :catchall_9e

    throw v0

    :catchall_a1
    move-exception v1

    :try_start_a2
    monitor-exit v0
    :try_end_a3
    .catchall {:try_start_a2 .. :try_end_a3} :catchall_a1

    throw v1
.end method

.method public final zza()Lcom/google/android/gms/location/LocationAvailability;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcu:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/location/zzao;->zzb(Ljava/lang/String;)Lcom/google/android/gms/location/LocationAvailability;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Landroid/app/PendingIntent;Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    new-instance v8, Lcom/google/android/gms/internal/location/zzbf;

    if-eqz p2, :cond_16

    invoke-interface {p2}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object p2

    goto :goto_17

    :cond_16
    const/4 p2, 0x0

    :goto_17
    move-object v7, p2

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v1, v8

    move-object v5, p1

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/location/zzbf;-><init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V

    invoke-interface {v0, v8}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    return-void
.end method

.method public final zza(Landroid/location/Location;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Landroid/location/Location;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey<",
            "Lcom/google/android/gms/location/LocationListener;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzaj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    const-string v0, "Invalid null listener key"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    monitor-enter v0

    :try_start_d
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcx:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/location/zzax;

    if-eqz p1, :cond_29

    invoke-virtual {p1}, Lcom/google/android/gms/internal/location/zzax;->release()V

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v1}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/location/zzao;

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/location/zzbf;->zza(Lcom/google/android/gms/location/zzx;Lcom/google/android/gms/internal/location/zzaj;)Lcom/google/android/gms/internal/location/zzbf;

    move-result-object p1

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    :cond_29
    monitor-exit v0

    return-void

    :catchall_2b
    move-exception p1

    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_d .. :try_end_2d} :catchall_2b

    throw p1
.end method

.method public final zza(Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzaj;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/location/zzbd;Lcom/google/android/gms/common/api/internal/ListenerHolder;Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/location/zzbd;",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder<",
            "Lcom/google/android/gms/location/LocationCallback;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzaj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/location/zzas;->zzb(Lcom/google/android/gms/common/api/internal/ListenerHolder;)Lcom/google/android/gms/internal/location/zzat;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    new-instance v8, Lcom/google/android/gms/internal/location/zzbf;

    invoke-interface {p2}, Lcom/google/android/gms/location/zzu;->asBinder()Landroid/os/IBinder;

    move-result-object v6

    if-eqz p3, :cond_1e

    invoke-interface {p3}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object p2

    goto :goto_1f

    :cond_1e
    const/4 p2, 0x0

    :goto_1f
    move-object v7, p2

    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, v8

    move-object v3, p1

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/location/zzbf;-><init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V

    invoke-interface {v0, v8}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/location/LocationRequest;Landroid/app/PendingIntent;Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    invoke-static {p1}, Lcom/google/android/gms/internal/location/zzbd;->zza(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/internal/location/zzbd;

    move-result-object v3

    new-instance p1, Lcom/google/android/gms/internal/location/zzbf;

    if-eqz p3, :cond_1a

    invoke-interface {p3}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object p3

    goto :goto_1b

    :cond_1a
    const/4 p3, 0x0

    :goto_1b
    move-object v7, p3

    const/4 v2, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/location/zzbf;-><init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    return-void
.end method

.method public final zza(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/common/api/internal/ListenerHolder;Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/location/LocationRequest;",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder<",
            "Lcom/google/android/gms/location/LocationListener;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzaj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/location/zzas;->zza(Lcom/google/android/gms/common/api/internal/ListenerHolder;)Lcom/google/android/gms/internal/location/zzax;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    invoke-static {p1}, Lcom/google/android/gms/internal/location/zzbd;->zza(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/internal/location/zzbd;

    move-result-object v3

    new-instance p1, Lcom/google/android/gms/internal/location/zzbf;

    invoke-interface {p2}, Lcom/google/android/gms/location/zzx;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    if-eqz p3, :cond_22

    invoke-interface {p3}, Lcom/google/android/gms/internal/location/zzaj;->asBinder()Landroid/os/IBinder;

    move-result-object p2

    goto :goto_23

    :cond_22
    const/4 p2, 0x0

    :goto_23
    move-object v7, p2

    const/4 v2, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/location/zzbf;-><init>(ILcom/google/android/gms/internal/location/zzbd;Landroid/os/IBinder;Landroid/app/PendingIntent;Landroid/os/IBinder;Landroid/os/IBinder;)V

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    return-void
.end method

.method public final zza(Z)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/location/zzao;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Z)V

    iput-boolean p1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcw:Z

    return-void
.end method

.method public final zzb()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcw:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/location/zzas;->zza(Z)V

    :cond_8
    return-void
.end method

.method public final zzb(Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;Lcom/google/android/gms/internal/location/zzaj;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey<",
            "Lcom/google/android/gms/location/LocationCallback;",
            ">;",
            "Lcom/google/android/gms/internal/location/zzaj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v0}, Lcom/google/android/gms/internal/location/zzbj;->checkConnected()V

    const-string v0, "Invalid null listener key"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    monitor-enter v0

    :try_start_d
    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcz:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/location/zzat;

    if-eqz p1, :cond_29

    invoke-virtual {p1}, Lcom/google/android/gms/internal/location/zzat;->release()V

    iget-object v1, p0, Lcom/google/android/gms/internal/location/zzas;->zzcb:Lcom/google/android/gms/internal/location/zzbj;

    invoke-interface {v1}, Lcom/google/android/gms/internal/location/zzbj;->getService()Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/location/zzao;

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/location/zzbf;->zza(Lcom/google/android/gms/location/zzu;Lcom/google/android/gms/internal/location/zzaj;)Lcom/google/android/gms/internal/location/zzbf;

    move-result-object p1

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/location/zzao;->zza(Lcom/google/android/gms/internal/location/zzbf;)V

    :cond_29
    monitor-exit v0

    return-void

    :catchall_2b
    move-exception p1

    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_d .. :try_end_2d} :catchall_2b

    throw p1
.end method
