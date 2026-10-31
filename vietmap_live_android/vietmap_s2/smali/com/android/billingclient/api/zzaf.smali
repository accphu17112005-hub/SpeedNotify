###### Class com.android.billingclient.api.zzaf (com.android.billingclient.api.zzaf)
.class final Lcom/android/billingclient/api/zzaf;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic zza:Lcom/android/billingclient/api/BillingClientImpl;

.field private final zzb:Ljava/lang/Object;

.field private zzc:Z

.field private zzd:Lcom/android/billingclient/api/BillingClientStateListener;


# direct methods
.method synthetic constructor <init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/BillingClientStateListener;Lcom/android/billingclient/api/zzy;)V
    .registers 4

    iput-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/billingclient/api/zzaf;->zzc:Z

    iput-object p2, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    return-void
.end method

.method private final zzd(Lcom/android/billingclient/api/BillingResult;)V
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    if-eqz v1, :cond_a

    .line 1
    invoke-interface {v1, p1}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    .line 2
    :cond_a
    monitor-exit v0

    return-void

    :catchall_c
    move-exception p1

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw p1
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 9

    const-string p1, "BillingClient"

    const-string v0, "Billing service connected."

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/internal/play_billing/zzc;->zzn(Landroid/os/IBinder;)Lcom/google/android/gms/internal/play_billing/zzd;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    new-instance v1, Lcom/android/billingclient/api/zzae;

    .line 3
    invoke-direct {v1, p0}, Lcom/android/billingclient/api/zzae;-><init>(Lcom/android/billingclient/api/zzaf;)V

    new-instance v4, Lcom/android/billingclient/api/zzad;

    invoke-direct {v4, p0}, Lcom/android/billingclient/api/zzad;-><init>(Lcom/android/billingclient/api/zzaf;)V

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 4
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClientImpl;->zzh(Lcom/android/billingclient/api/BillingClientImpl;)Landroid/os/Handler;

    move-result-object v5

    const-wide/16 v2, 0x7530

    .line 5
    invoke-static/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzr(Lcom/android/billingclient/api/BillingClientImpl;Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-nez p1, :cond_33

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 6
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClientImpl;->zzj(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    :cond_33
    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 3

    const-string p1, "BillingClient"

    const-string v0, "Billing service disconnected."

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v0, 0x0

    .line 2
    invoke-static {p1, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v0, 0x0

    .line 3
    invoke-static {p1, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter p1

    :try_start_16
    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    if-eqz v0, :cond_1d

    .line 4
    invoke-interface {v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingServiceDisconnected()V

    .line 5
    :cond_1d
    monitor-exit p1

    return-void

    :catchall_1f
    move-exception v0

    monitor-exit p1
    :try_end_21
    .catchall {:try_start_16 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method public final synthetic zza()Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Lcom/android/billingclient/api/zzaf;->zzc:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    .line 1
    monitor-exit v0

    return-object v2

    .line 2
    :cond_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_12d

    const/4 v0, 0x3

    const/4 v1, 0x0

    :try_start_d
    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zzd(Lcom/android/billingclient/api/BillingClientImpl;)Landroid/content/Context;

    move-result-object v3

    .line 3
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_17} :catch_10d

    const/16 v4, 0x10

    const/16 v5, 0x10

    const/4 v6, 0x3

    :goto_1c
    if-lt v5, v0, :cond_33

    :try_start_1e
    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 4
    invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->zzl(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/google/android/gms/internal/play_billing/zzd;

    move-result-object v7

    const-string v8, "subs"

    invoke-interface {v7, v5, v3, v8}, Lcom/google/android/gms/internal/play_billing/zzd;->zzb(ILjava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_2d

    goto :goto_34

    :cond_2d
    add-int/lit8 v5, v5, -0x1

    goto :goto_1c

    :catch_30
    move v0, v6

    goto/16 :goto_10d

    :cond_33
    const/4 v5, 0x0

    :goto_34
    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v8, 0x5

    const/4 v9, 0x1

    if-lt v5, v8, :cond_3c

    const/4 v8, 0x1

    goto :goto_3d

    :cond_3c
    const/4 v8, 0x0

    .line 5
    :goto_3d
    invoke-static {v7, v8}, Lcom/android/billingclient/api/BillingClientImpl;->zzC(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    if-lt v5, v0, :cond_46

    const/4 v8, 0x1

    goto :goto_47

    :cond_46
    const/4 v8, 0x0

    .line 6
    :goto_47
    invoke-static {v7, v8}, Lcom/android/billingclient/api/BillingClientImpl;->zzt(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    if-ge v5, v0, :cond_53

    const-string v5, "BillingClient"

    const-string v7, "In-app billing API does not support subscription on this device."

    .line 7
    invoke-static {v5, v7}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    :cond_53
    const/16 v5, 0x10

    :goto_55
    if-lt v5, v0, :cond_6e

    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 8
    invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->zzl(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/google/android/gms/internal/play_billing/zzd;

    move-result-object v7

    const-string v8, "inapp"

    invoke-interface {v7, v5, v3, v8}, Lcom/google/android/gms/internal/play_billing/zzd;->zzb(ILjava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_6b

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 9
    invoke-static {v3, v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzb(Lcom/android/billingclient/api/BillingClientImpl;I)I

    goto :goto_6e

    :cond_6b
    add-int/lit8 v5, v5, -0x1

    goto :goto_55

    :cond_6e
    :goto_6e
    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v5

    if-lt v5, v4, :cond_78

    const/4 v4, 0x1

    goto :goto_79

    :cond_78
    const/4 v4, 0x0

    .line 10
    :goto_79
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzu(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xf

    if-lt v4, v5, :cond_88

    const/4 v4, 0x1

    goto :goto_89

    :cond_88
    const/4 v4, 0x0

    .line 11
    :goto_89
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzv(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xe

    if-lt v4, v5, :cond_98

    const/4 v4, 0x1

    goto :goto_99

    :cond_98
    const/4 v4, 0x0

    .line 12
    :goto_99
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzw(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xc

    if-lt v4, v5, :cond_a8

    const/4 v4, 0x1

    goto :goto_a9

    :cond_a8
    const/4 v4, 0x0

    .line 13
    :goto_a9
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzx(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xa

    if-lt v4, v5, :cond_b8

    const/4 v4, 0x1

    goto :goto_b9

    :cond_b8
    const/4 v4, 0x0

    .line 14
    :goto_b9
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzy(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0x9

    if-lt v4, v5, :cond_c8

    const/4 v4, 0x1

    goto :goto_c9

    :cond_c8
    const/4 v4, 0x0

    .line 15
    :goto_c9
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzz(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_d8

    const/4 v4, 0x1

    goto :goto_d9

    :cond_d8
    const/4 v4, 0x0

    .line 16
    :goto_d9
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzA(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/4 v5, 0x6

    if-lt v4, v5, :cond_e6

    goto :goto_e7

    :cond_e6
    const/4 v9, 0x0

    .line 17
    :goto_e7
    invoke-static {v3, v9}, Lcom/android/billingclient/api/BillingClientImpl;->zzB(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v3

    if-ge v3, v0, :cond_f9

    const-string v0, "BillingClient"

    const-string v3, "In-app billing API version 3 is not supported on this device."

    .line 18
    invoke-static {v0, v3}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    :cond_f9
    if-nez v6, :cond_102

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v3, 0x2

    .line 19
    invoke-static {v0, v3}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    goto :goto_11f

    .line 26
    :cond_102
    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 20
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 21
    invoke-static {v0, v2}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;
    :try_end_10c
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_10c} :catch_30

    goto :goto_11f

    :catch_10d
    :goto_10d
    const-string v3, "BillingClient"

    const-string v4, "Exception while checking if billing is supported; try to reconnect"

    .line 22
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 23
    invoke-static {v3, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object v1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 24
    invoke-static {v1, v2}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    move v6, v0

    :goto_11f
    if-nez v6, :cond_127

    .line 25
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, v0}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    goto :goto_12c

    .line 26
    :cond_127
    sget-object v0, Lcom/android/billingclient/api/zzak;->zza:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, v0}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    :goto_12c
    return-object v2

    :catchall_12d
    move-exception v1

    .line 2
    :try_start_12e
    monitor-exit v0
    :try_end_12f
    .catchall {:try_start_12e .. :try_end_12f} :catchall_12d

    throw v1
.end method

.method public final synthetic zzb()V
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v1, 0x0

    .line 1
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v1, 0x0

    .line 2
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    .line 3
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzr:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, v0}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    return-void
.end method

.method final zzc()V
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    iput-object v1, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/billingclient/api/zzaf;->zzc:Z

    .line 1
    monitor-exit v0

    return-void

    :catchall_b
    move-exception v1

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_4 .. :try_end_d} :catchall_b

    throw v1
.end method

###### Class com.android.billingclient.api.zzad (com.android.billingclient.api.zzad)
.class public final synthetic Lcom/android/billingclient/api/zzad;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/android/billingclient/api/zzaf;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/zzaf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzad;->zza:Lcom/android/billingclient/api/zzaf;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/zzad;->zza:Lcom/android/billingclient/api/zzaf;

    invoke-virtual {v0}, Lcom/android/billingclient/api/zzaf;->zzb()V

    return-void
.end method

###### Class com.android.billingclient.api.zzae (com.android.billingclient.api.zzae)
.class public final synthetic Lcom/android/billingclient/api/zzae;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic zza:Lcom/android/billingclient/api/zzaf;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/zzaf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzae;->zza:Lcom/android/billingclient/api/zzaf;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/zzae;->zza:Lcom/android/billingclient/api/zzaf;

    invoke-virtual {v0}, Lcom/android/billingclient/api/zzaf;->zza()Ljava/lang/Object;

    const/4 v0, 0x0

    return-object v0
.end method
