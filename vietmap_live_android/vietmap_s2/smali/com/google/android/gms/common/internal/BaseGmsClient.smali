###### Class com.google.android.gms.common.internal.BaseGmsClient (com.google.android.gms.common.internal.BaseGmsClient)
.class public abstract Lcom/google/android/gms/common/internal/BaseGmsClient;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zza;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;,
        Lcom/google/android/gms/common/internal/BaseGmsClient$zze;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroid/os/IInterface;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final CONNECT_STATE_CONNECTED:I = 0x4

.field public static final CONNECT_STATE_DISCONNECTED:I = 0x1

.field public static final CONNECT_STATE_DISCONNECTING:I = 0x5

.field public static final DEFAULT_ACCOUNT:Ljava/lang/String; = "<<default account>>"

.field public static final GOOGLE_PLUS_REQUIRED_FEATURES:[Ljava/lang/String;

.field public static final KEY_PENDING_INTENT:Ljava/lang/String; = "pendingIntent"

.field private static final zzbs:[Lcom/google/android/gms/common/Feature;


# instance fields
.field private final mContext:Landroid/content/Context;

.field final mHandler:Landroid/os/Handler;

.field private final mLock:Ljava/lang/Object;

.field private zzbt:I

.field private zzbu:J

.field private zzbv:J

.field private zzbw:I

.field private zzbx:J

.field private zzby:Lcom/google/android/gms/common/internal/zzh;

.field private final zzbz:Landroid/os/Looper;

.field private final zzca:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

.field private final zzcb:Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

.field private final zzcc:Ljava/lang/Object;

.field private zzcd:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

.field protected zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

.field private zzcf:Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final zzcg:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/internal/BaseGmsClient$zzc<",
            "*>;>;"
        }
    .end annotation
.end field

.field private zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/internal/BaseGmsClient$zze;"
        }
    .end annotation
.end field

.field private zzci:I

.field private final zzcj:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

.field private final zzck:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

.field private final zzcl:I

.field private final zzcm:Ljava/lang/String;

.field private zzcn:Lcom/google/android/gms/common/ConnectionResult;

.field private zzco:Z

.field private volatile zzcp:Lcom/google/android/gms/common/internal/zzb;

.field protected zzcq:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/common/Feature;

    .line 357
    sput-object v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbs:[Lcom/google/android/gms/common/Feature;

    const-string v0, "service_esmobile"

    const-string v1, "service_googleme"

    .line 358
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->GOOGLE_PLUS_REQUIRED_FEATURES:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/google/android/gms/common/internal/GmsClientSupervisor;Lcom/google/android/gms/common/GoogleApiAvailabilityLight;ILcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;)V
    .registers 11

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 32
    iput v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcn:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v1, 0x0

    .line 34
    iput-boolean v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzco:Z

    .line 35
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcp:Lcom/google/android/gms/common/internal/zzb;

    .line 36
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    const-string v1, "Context must not be null"

    .line 37
    invoke-static {p1, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mContext:Landroid/content/Context;

    const-string p1, "Handler must not be null"

    .line 38
    invoke-static {p2, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Handler;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    .line 39
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbz:Landroid/os/Looper;

    const-string p1, "Supervisor must not be null"

    .line 40
    invoke-static {p3, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzca:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    const-string p1, "API availability must not be null"

    .line 42
    invoke-static {p4, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcb:Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    .line 43
    iput p5, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcl:I

    .line 44
    iput-object p6, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcj:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    .line 45
    iput-object p7, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzck:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    .line 46
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcm:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;Ljava/lang/String;)V
    .registers 16

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    move-result-object v3

    .line 3
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    move-result-object v4

    .line 4
    invoke-static {p4}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    move-object v6, p4

    check-cast v6, Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    .line 5
    invoke-static {p5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    move-object v7, p4

    check-cast v7, Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, p3

    move-object v8, p6

    .line 6
    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/common/internal/BaseGmsClient;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/GmsClientSupervisor;Lcom/google/android/gms/common/GoogleApiAvailabilityLight;ILcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;Ljava/lang/String;)V

    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/GmsClientSupervisor;Lcom/google/android/gms/common/GoogleApiAvailabilityLight;ILcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;Ljava/lang/String;)V
    .registers 11

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    .line 10
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 12
    iput v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcn:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v1, 0x0

    .line 14
    iput-boolean v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzco:Z

    .line 15
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcp:Lcom/google/android/gms/common/internal/zzb;

    .line 16
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    const-string v0, "Context must not be null"

    .line 17
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mContext:Landroid/content/Context;

    const-string p1, "Looper must not be null"

    .line 18
    invoke-static {p2, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Looper;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbz:Landroid/os/Looper;

    const-string p1, "Supervisor must not be null"

    .line 19
    invoke-static {p3, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzca:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    const-string p1, "API availability must not be null"

    .line 21
    invoke-static {p4, p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcb:Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    .line 22
    new-instance p1, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;

    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    .line 23
    iput p5, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcl:I

    .line 24
    iput-object p6, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcj:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    .line 25
    iput-object p7, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzck:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    .line 26
    iput-object p8, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcm:Ljava/lang/String;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/ConnectionResult;)Lcom/google/android/gms/common/ConnectionResult;
    .registers 2

    .line 347
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcn:Lcom/google/android/gms/common/ConnectionResult;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/internal/IGmsServiceBroker;)Lcom/google/android/gms/common/internal/IGmsServiceBroker;
    .registers 2

    .line 346
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcd:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;)Ljava/lang/Object;
    .registers 1

    .line 345
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    return-object p0
.end method

.method private final zza(ILandroid/os/IInterface;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    const/4 v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_7

    const/4 v3, 0x1

    goto :goto_8

    :cond_7
    const/4 v3, 0x0

    :goto_8
    if-eqz p2, :cond_c

    const/4 v4, 0x1

    goto :goto_d

    :cond_c
    const/4 v4, 0x0

    :goto_d
    if-ne v3, v4, :cond_11

    const/4 v3, 0x1

    goto :goto_12

    :cond_11
    const/4 v3, 0x0

    .line 65
    :goto_12
    invoke-static {v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(Z)V

    .line 66
    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 67
    :try_start_18
    iput p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    .line 68
    iput-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcf:Landroid/os/IInterface;

    .line 69
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onSetConnectState(ILandroid/os/IInterface;)V

    const/4 v4, 0x0

    if-eq p1, v2, :cond_13c

    const/4 v5, 0x2

    const/4 v6, 0x3

    if-eq p1, v5, :cond_31

    if-eq p1, v6, :cond_31

    if-eq p1, v0, :cond_2c

    goto/16 :goto_157

    .line 113
    :cond_2c
    invoke-virtual {p0, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectedLocked(Landroid/os/IInterface;)V

    goto/16 :goto_157

    .line 72
    :cond_31
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    if-eqz p1, :cond_96

    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    if-eqz p1, :cond_96

    const-string p2, "GmsClient"

    .line 74
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/zzh;->zzt()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 75
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzh;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x46

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v5, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "Calling connect() while still connected, missing disconnect() for "

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " on "

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 76
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v7, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzca:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 78
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/zzh;->zzt()Ljava/lang/String;

    move-result-object v8

    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 79
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/zzh;->getPackageName()Ljava/lang/String;

    move-result-object v9

    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 80
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/zzh;->zzq()I

    move-result v10

    iget-object v11, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 81
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzj()Ljava/lang/String;

    move-result-object v12

    .line 82
    invoke-virtual/range {v7 .. v12}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->zza(Ljava/lang/String;Ljava/lang/String;ILandroid/content/ServiceConnection;Ljava/lang/String;)V

    .line 83
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 84
    :cond_96
    new-instance p1, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    invoke-direct {p1, p0, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 86
    iget p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/16 p2, 0x81

    if-ne p1, v6, :cond_c1

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getLocalStartServiceAction()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_c1

    .line 87
    new-instance p1, Lcom/google/android/gms/common/internal/zzh;

    .line 88
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 89
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getLocalStartServiceAction()Ljava/lang/String;

    move-result-object v1

    .line 90
    invoke-direct {p1, v0, v1, v2, p2}, Lcom/google/android/gms/common/internal/zzh;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    goto :goto_ce

    .line 92
    :cond_c1
    new-instance p1, Lcom/google/android/gms/common/internal/zzh;

    .line 93
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServicePackage()Ljava/lang/String;

    move-result-object v0

    .line 94
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServiceAction()Ljava/lang/String;

    move-result-object v2

    .line 95
    invoke-direct {p1, v0, v2, v1, p2}, Lcom/google/android/gms/common/internal/zzh;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    .line 96
    :goto_ce
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 97
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzca:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    .line 98
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/zzh;->zzt()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 99
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzh;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 100
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/zzh;->zzq()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 101
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzj()Ljava/lang/String;

    move-result-object v5

    .line 103
    new-instance v6, Lcom/google/android/gms/common/internal/GmsClientSupervisor$zza;

    invoke-direct {v6, p1, v0, v1}, Lcom/google/android/gms/common/internal/GmsClientSupervisor$zza;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {p2, v6, v2, v5}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->zza(Lcom/google/android/gms/common/internal/GmsClientSupervisor$zza;Landroid/content/ServiceConnection;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_157

    const-string p1, "GmsClient"

    .line 105
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 106
    invoke-virtual {p2}, Lcom/google/android/gms/common/internal/zzh;->zzt()Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    .line 107
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzh;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x22

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "unable to connect to service: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " on "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 108
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x10

    .line 109
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 110
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    .line 111
    invoke-virtual {p0, p1, v4, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/Bundle;I)V

    goto :goto_157

    .line 116
    :cond_13c
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    if-eqz p1, :cond_157

    .line 117
    iget-object v5, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzca:Lcom/google/android/gms/common/internal/GmsClientSupervisor;

    .line 118
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServiceAction()Ljava/lang/String;

    move-result-object v6

    .line 119
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServicePackage()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x81

    .line 120
    iget-object v9, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 121
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzj()Ljava/lang/String;

    move-result-object v10

    .line 122
    invoke-virtual/range {v5 .. v10}, Lcom/google/android/gms/common/internal/GmsClientSupervisor;->zza(Ljava/lang/String;Ljava/lang/String;ILandroid/content/ServiceConnection;Ljava/lang/String;)V

    .line 123
    iput-object v4, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzch:Lcom/google/android/gms/common/internal/BaseGmsClient$zze;

    .line 124
    :cond_157
    :goto_157
    monitor-exit v3

    return-void

    :catchall_159
    move-exception p1

    monitor-exit v3
    :try_end_15b
    .catchall {:try_start_18 .. :try_end_15b} :catchall_159

    throw p1
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V
    .registers 2

    const/16 p1, 0x10

    .line 344
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(I)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V
    .registers 3

    const/4 p2, 0x0

    .line 350
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/IInterface;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/internal/zzb;)V
    .registers 2

    .line 356
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/zzb;)V

    return-void
.end method

.method private final zza(Lcom/google/android/gms/common/internal/zzb;)V
    .registers 2

    .line 51
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcp:Lcom/google/android/gms/common/internal/zzb;

    return-void
.end method

.method private final zza(IILandroid/os/IInterface;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IITT;)Z"
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 127
    :try_start_3
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    if-eq v1, p1, :cond_a

    const/4 p1, 0x0

    .line 128
    monitor-exit v0

    return p1

    .line 129
    :cond_a
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/IInterface;)V

    const/4 p1, 0x1

    .line 130
    monitor-exit v0

    return p1

    :catchall_10
    move-exception p1

    .line 131
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw p1
.end method

.method static synthetic zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z
    .registers 4

    .line 353
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(IILandroid/os/IInterface;)Z

    move-result p0

    return p0
.end method

.method private final zzb(I)V
    .registers 5

    .line 171
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzk()Z

    move-result p1

    if-eqz p1, :cond_b

    const/4 p1, 0x5

    const/4 v0, 0x1

    .line 173
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzco:Z

    goto :goto_c

    :cond_b
    const/4 p1, 0x4

    .line 175
    :goto_c
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    const/16 v2, 0x10

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/common/internal/BaseGmsClient;)Z
    .registers 1

    .line 348
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzl()Z

    move-result p0

    return p0
.end method

.method static synthetic zzc(Lcom/google/android/gms/common/internal/BaseGmsClient;)Z
    .registers 1

    .line 349
    iget-boolean p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzco:Z

    return p0
.end method

.method static synthetic zzd(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/ConnectionResult;
    .registers 1

    .line 351
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcn:Lcom/google/android/gms/common/ConnectionResult;

    return-object p0
.end method

.method static synthetic zze(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;
    .registers 1

    .line 352
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcj:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    return-object p0
.end method

.method static synthetic zzf(Lcom/google/android/gms/common/internal/BaseGmsClient;)Ljava/util/ArrayList;
    .registers 1

    .line 354
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic zzg(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;
    .registers 1

    .line 355
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzck:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    return-object p0
.end method

.method private final zzj()Ljava/lang/String;
    .registers 2

    .line 49
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcm:Ljava/lang/String;

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method private final zzk()Z
    .registers 4

    .line 150
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 151
    :try_start_3
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_a

    const/4 v1, 0x1

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    monitor-exit v0

    return v1

    :catchall_d
    move-exception v1

    .line 152
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v1
.end method

.method private final zzl()Z
    .registers 3

    .line 330
    iget-boolean v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzco:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    .line 332
    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11

    return v1

    .line 334
    :cond_11
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getLocalStartServiceAction()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1c

    return v1

    .line 336
    :cond_1c
    :try_start_1c
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_23
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1c .. :try_end_23} :catch_25

    const/4 v0, 0x1

    return v0

    :catch_25
    return v1
.end method


# virtual methods
.method public checkAvailabilityAndConnect()V
    .registers 4

    .line 132
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcb:Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mContext:Landroid/content/Context;

    .line 133
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getMinApkVersion()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->isGooglePlayServicesAvailable(Landroid/content/Context;I)I

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 135
    invoke-direct {p0, v1, v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/IInterface;)V

    .line 136
    new-instance v1, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;

    invoke-direct {v1, p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;)V

    invoke-virtual {p0, v1, v0, v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->triggerNotAvailable(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;ILandroid/app/PendingIntent;)V

    return-void

    .line 138
    :cond_1c
    new-instance v0, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V

    return-void
.end method

.method protected final checkConnected()V
    .registers 3

    .line 197
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 198
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected. Call connect() and wait for onConnected() to be called."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public connect(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;)V
    .registers 3

    const-string v0, "Connection progress callbacks cannot be null."

    .line 141
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    const/4 p1, 0x2

    const/4 v0, 0x0

    .line 142
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/IInterface;)V

    return-void
.end method

.method protected abstract createServiceInterface(Landroid/os/IBinder;)Landroid/os/IInterface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/IBinder;",
            ")TT;"
        }
    .end annotation
.end method

.method public disconnect()V
    .registers 5

    .line 153
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 154
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    monitor-enter v0

    .line 155
    :try_start_8
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v1, :cond_1f

    .line 157
    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->removeListener()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 159
    :cond_1f
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcg:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 160
    monitor-exit v0
    :try_end_25
    .catchall {:try_start_8 .. :try_end_25} :catchall_34

    .line 161
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    .line 162
    :try_start_29
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcd:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 163
    monitor-exit v1
    :try_end_2c
    .catchall {:try_start_29 .. :try_end_2c} :catchall_31

    const/4 v1, 0x1

    .line 164
    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/IInterface;)V

    return-void

    :catchall_31
    move-exception v0

    .line 163
    :try_start_32
    monitor-exit v1
    :try_end_33
    .catchall {:try_start_32 .. :try_end_33} :catchall_31

    throw v0

    :catchall_34
    move-exception v1

    .line 160
    :try_start_35
    monitor-exit v0
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    throw v1
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 14

    .line 266
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter p2

    .line 267
    :try_start_3
    iget p4, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    .line 268
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcf:Landroid/os/IInterface;

    .line 269
    monitor-exit p2
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_18b

    .line 270
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    monitor-enter v1

    .line 271
    :try_start_b
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcd:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 272
    monitor-exit v1
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_188

    .line 273
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v1

    const-string v2, "mConnectState="

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq p4, v2, :cond_44

    if-eq p4, v1, :cond_3e

    const/4 v3, 0x3

    if-eq p4, v3, :cond_38

    const/4 v3, 0x4

    if-eq p4, v3, :cond_32

    const/4 v3, 0x5

    if-eq p4, v3, :cond_2c

    const-string p4, "UNKNOWN"

    .line 285
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_49

    :cond_2c
    const-string p4, "DISCONNECTING"

    .line 281
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_49

    :cond_32
    const-string p4, "CONNECTED"

    .line 279
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_49

    :cond_38
    const-string p4, "LOCAL_CONNECTING"

    .line 277
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_49

    :cond_3e
    const-string p4, "REMOTE_CONNECTING"

    .line 275
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_49

    :cond_44
    const-string p4, "DISCONNECTED"

    .line 283
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    :goto_49
    const-string p4, " mService="

    .line 286
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    if-nez v0, :cond_56

    const-string p4, "null"

    .line 288
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    goto :goto_73

    .line 290
    :cond_56
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    const-string v3, "@"

    .line 291
    invoke-virtual {p4, v3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    .line 292
    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    :goto_73
    const-string p4, " mServiceBroker="

    .line 293
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    if-nez p2, :cond_80

    const-string p2, "null"

    .line 295
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_95

    :cond_80
    const-string p4, "IGmsServiceBroker@"

    .line 297
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    .line 298
    invoke-interface {p2}, Lcom/google/android/gms/common/internal/IGmsServiceBroker;->asBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 299
    :goto_95
    new-instance p2, Ljava/text/SimpleDateFormat;

    const-string p4, "yyyy-MM-dd HH:mm:ss.SSS"

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {p2, p4, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 300
    iget-wide v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbv:J

    const-wide/16 v5, 0x0

    cmp-long p4, v3, v5

    if-lez p4, :cond_de

    .line 302
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    const-string v0, "lastConnectedTime="

    .line 303
    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    iget-wide v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbv:J

    new-instance v0, Ljava/util/Date;

    iget-wide v7, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbv:J

    invoke-direct {v0, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 304
    invoke-virtual {p2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, 0x15

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v8, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 305
    :cond_de
    iget-wide v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbu:J

    cmp-long p4, v3, v5

    if-lez p4, :cond_13a

    .line 306
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    const-string v0, "lastSuspendedCause="

    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 307
    iget p4, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbt:I

    if-eq p4, v2, :cond_101

    if-eq p4, v1, :cond_fb

    .line 312
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    goto :goto_106

    :cond_fb
    const-string p4, "CAUSE_NETWORK_LOST"

    .line 310
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    goto :goto_106

    :cond_101
    const-string p4, "CAUSE_SERVICE_DISCONNECTED"

    .line 308
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    :goto_106
    const-string p4, " lastSuspendedTime="

    .line 314
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p4

    iget-wide v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbu:J

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbu:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 315
    invoke-virtual {p2, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x15

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 316
    :cond_13a
    iget-wide v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbx:J

    cmp-long p4, v0, v5

    if-lez p4, :cond_187

    .line 318
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    const-string p4, "lastFailedStatus="

    .line 319
    invoke-virtual {p1, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    iget p4, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbw:I

    .line 320
    invoke-static {p4}, Lcom/google/android/gms/common/api/CommonStatusCodes;->getStatusCodeString(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p4}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string p1, " lastFailedTime="

    .line 322
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    iget-wide p3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbx:J

    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbx:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 323
    invoke-virtual {p2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x15

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_187
    return-void

    :catchall_188
    move-exception p1

    .line 272
    :try_start_189
    monitor-exit v1
    :try_end_18a
    .catchall {:try_start_189 .. :try_end_18a} :catchall_188

    throw p1

    :catchall_18b
    move-exception p1

    .line 269
    :try_start_18c
    monitor-exit p2
    :try_end_18d
    .catchall {:try_start_18c .. :try_end_18d} :catchall_18b

    throw p1
.end method

.method public getAccount()Landroid/accounts/Account;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public getApiFeatures()[Lcom/google/android/gms/common/Feature;
    .registers 2

    .line 187
    sget-object v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbs:[Lcom/google/android/gms/common/Feature;

    return-object v0
.end method

.method public final getAvailableFeatures()[Lcom/google/android/gms/common/Feature;
    .registers 2

    .line 53
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcp:Lcom/google/android/gms/common/internal/zzb;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 55
    :cond_6
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzb;->zzda:[Lcom/google/android/gms/common/Feature;

    return-object v0
.end method

.method public getConnectionHint()Landroid/os/Bundle;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getContext()Landroid/content/Context;
    .registers 2

    .line 184
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getEndpointPackageName()Ljava/lang/String;
    .registers 3

    .line 340
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzby:Lcom/google/android/gms/common/internal/zzh;

    if-eqz v0, :cond_f

    .line 341
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/zzh;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 342
    :cond_f
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Failed to connect when checking package"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getGetServiceRequestExtraArgs()Landroid/os/Bundle;
    .registers 2

    .line 188
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    return-object v0
.end method

.method protected getLocalStartServiceAction()Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getLooper()Landroid/os/Looper;
    .registers 2

    .line 185
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbz:Landroid/os/Looper;

    return-object v0
.end method

.method public getMinApkVersion()I
    .registers 2

    .line 343
    sget v0, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    return v0
.end method

.method public getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/internal/IAccountAccessor;",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;)V"
        }
    .end annotation

    .line 208
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getGetServiceRequestExtraArgs()Landroid/os/Bundle;

    move-result-object v0

    .line 209
    new-instance v1, Lcom/google/android/gms/common/internal/GetServiceRequest;

    iget v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcl:I

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/internal/GetServiceRequest;-><init>(I)V

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mContext:Landroid/content/Context;

    .line 210
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 211
    iput-object v2, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdh:Ljava/lang/String;

    .line 215
    iput-object v0, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdk:Landroid/os/Bundle;

    if-eqz p2, :cond_25

    .line 220
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/common/api/Scope;

    invoke-interface {p2, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/google/android/gms/common/api/Scope;

    iput-object p2, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdj:[Lcom/google/android/gms/common/api/Scope;

    .line 221
    :cond_25
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->requiresSignIn()Z

    move-result p2

    if-eqz p2, :cond_4a

    .line 224
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getAccount()Landroid/accounts/Account;

    move-result-object p2

    if-eqz p2, :cond_36

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getAccount()Landroid/accounts/Account;

    move-result-object p2

    goto :goto_3f

    :cond_36
    new-instance p2, Landroid/accounts/Account;

    const-string v0, "<<default account>>"

    const-string v2, "com.google"

    invoke-direct {p2, v0, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    :goto_3f
    iput-object p2, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdl:Landroid/accounts/Account;

    if-eqz p1, :cond_56

    .line 231
    invoke-interface {p1}, Lcom/google/android/gms/common/internal/IAccountAccessor;->asBinder()Landroid/os/IBinder;

    move-result-object p1

    iput-object p1, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdi:Landroid/os/IBinder;

    goto :goto_56

    .line 233
    :cond_4a
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->requiresAccount()Z

    move-result p1

    if-eqz p1, :cond_56

    .line 234
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getAccount()Landroid/accounts/Account;

    move-result-object p1

    .line 235
    iput-object p1, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdl:Landroid/accounts/Account;

    .line 237
    :cond_56
    :goto_56
    sget-object p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbs:[Lcom/google/android/gms/common/Feature;

    .line 239
    iput-object p1, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdm:[Lcom/google/android/gms/common/Feature;

    .line 240
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getApiFeatures()[Lcom/google/android/gms/common/Feature;

    move-result-object p1

    .line 241
    iput-object p1, v1, Lcom/google/android/gms/common/internal/GetServiceRequest;->zzdn:[Lcom/google/android/gms/common/Feature;

    .line 242
    :try_start_60
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    monitor-enter p1
    :try_end_63
    .catch Landroid/os/DeadObjectException; {:try_start_60 .. :try_end_63} :catch_9b
    .catch Ljava/lang/SecurityException; {:try_start_60 .. :try_end_63} :catch_99
    .catch Landroid/os/RemoteException; {:try_start_60 .. :try_end_63} :catch_84
    .catch Ljava/lang/RuntimeException; {:try_start_60 .. :try_end_63} :catch_82

    .line 243
    :try_start_63
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcd:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    if-eqz p2, :cond_76

    .line 244
    new-instance v0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    invoke-direct {v0, p0, v2}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    invoke-interface {p2, v0, v1}, Lcom/google/android/gms/common/internal/IGmsServiceBroker;->getService(Lcom/google/android/gms/common/internal/IGmsCallbacks;Lcom/google/android/gms/common/internal/GetServiceRequest;)V

    goto :goto_7d

    :cond_76
    const-string p2, "GmsClient"

    const-string v0, "mServiceBroker is null, client disconnected"

    .line 245
    invoke-static {p2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    :goto_7d
    monitor-exit p1

    return-void

    :catchall_7f
    move-exception p2

    monitor-exit p1
    :try_end_81
    .catchall {:try_start_63 .. :try_end_81} :catchall_7f

    :try_start_81
    throw p2
    :try_end_82
    .catch Landroid/os/DeadObjectException; {:try_start_81 .. :try_end_82} :catch_9b
    .catch Ljava/lang/SecurityException; {:try_start_81 .. :try_end_82} :catch_99
    .catch Landroid/os/RemoteException; {:try_start_81 .. :try_end_82} :catch_84
    .catch Ljava/lang/RuntimeException; {:try_start_81 .. :try_end_82} :catch_82

    :catch_82
    move-exception p1

    goto :goto_85

    :catch_84
    move-exception p1

    :goto_85
    const-string p2, "GmsClient"

    const-string v0, "IGmsServiceBroker.getService failed"

    .line 253
    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/16 p1, 0x8

    .line 254
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 255
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    const/4 v0, 0x0

    .line 256
    invoke-virtual {p0, p1, v0, v0, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onPostInitHandler(ILandroid/os/IBinder;Landroid/os/Bundle;I)V

    return-void

    :catch_99
    move-exception p1

    .line 251
    throw p1

    :catch_9b
    move-exception p1

    const-string p2, "GmsClient"

    const-string v0, "IGmsServiceBroker.getService failed"

    .line 248
    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x1

    .line 249
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->triggerConnectionSuspended(I)V

    return-void
.end method

.method protected getScopes()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    .line 265
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public final getService()Landroid/os/IInterface;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/DeadObjectException;
        }
    .end annotation

    .line 201
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 202
    :try_start_3
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_1b

    .line 204
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkConnected()V

    .line 205
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcf:Landroid/os/IInterface;

    if-eqz v1, :cond_11

    const/4 v1, 0x1

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    const-string v2, "Client is connected but service is null"

    invoke-static {v1, v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 206
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcf:Landroid/os/IInterface;

    monitor-exit v0

    return-object v1

    .line 203
    :cond_1b
    new-instance v1, Landroid/os/DeadObjectException;

    invoke-direct {v1}, Landroid/os/DeadObjectException;-><init>()V

    throw v1

    :catchall_21
    move-exception v1

    .line 207
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw v1
.end method

.method public getServiceBrokerBinder()Landroid/os/IBinder;
    .registers 3

    .line 325
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcc:Ljava/lang/Object;

    monitor-enter v0

    .line 326
    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcd:Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    if-nez v1, :cond_a

    const/4 v1, 0x0

    .line 327
    monitor-exit v0

    return-object v1

    .line 328
    :cond_a
    invoke-interface {v1}, Lcom/google/android/gms/common/internal/IGmsServiceBroker;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_10
    move-exception v1

    .line 329
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v1
.end method

.method protected abstract getServiceDescriptor()Ljava/lang/String;
.end method

.method public getSignInIntent()Landroid/content/Intent;
    .registers 3

    .line 264
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not a sign in API"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected abstract getStartServiceAction()Ljava/lang/String;
.end method

.method protected getStartServicePackage()Ljava/lang/String;
    .registers 2

    const-string v0, "com.google.android.gms"

    return-object v0
.end method

.method public isConnected()Z
    .registers 4

    .line 144
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 145
    :try_start_3
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_a

    const/4 v1, 0x1

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    monitor-exit v0

    return v1

    :catchall_d
    move-exception v1

    .line 146
    monitor-exit v0
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v1
.end method

.method public isConnecting()Z
    .registers 4

    .line 147
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 148
    :try_start_3
    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzci:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_e

    const/4 v2, 0x3

    if-ne v1, v2, :cond_c

    goto :goto_e

    :cond_c
    const/4 v1, 0x0

    goto :goto_f

    :cond_e
    :goto_e
    const/4 v1, 0x1

    :goto_f
    monitor-exit v0

    return v1

    :catchall_11
    move-exception v1

    .line 149
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v1
.end method

.method protected onConnectedLocked(Landroid/os/IInterface;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 57
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbv:J

    return-void
.end method

.method protected onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4

    .line 62
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result p1

    iput p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbw:I

    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbx:J

    return-void
.end method

.method protected onConnectionSuspended(I)V
    .registers 4

    .line 59
    iput p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbt:I

    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzbu:J

    return-void
.end method

.method protected onPostInitHandler(ILandroid/os/IBinder;Landroid/os/Bundle;I)V
    .registers 7

    .line 189
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IBinder;Landroid/os/Bundle;)V

    const/4 p1, 0x1

    const/4 p2, -0x1

    .line 190
    invoke-virtual {v0, p1, p4, p2, v1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 191
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method onSetConnectState(ILandroid/os/IInterface;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    return-void
.end method

.method public onUserSignOut(Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;)V
    .registers 2

    .line 259
    invoke-interface {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;->onSignOutComplete()V

    return-void
.end method

.method public providesSignIn()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public requiresAccount()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public requiresGooglePlayServices()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public requiresSignIn()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public triggerConnectionSuspended(I)V
    .registers 5

    .line 166
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 167
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    const/4 v2, 0x6

    .line 168
    invoke-virtual {v0, v2, v1, p1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 169
    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected triggerNotAvailable(Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;ILandroid/app/PendingIntent;)V
    .registers 6

    const-string v0, "Connection progress callbacks cannot be null."

    .line 178
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    .line 179
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 180
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, 0x3

    .line 181
    invoke-virtual {p1, v1, v0, p2, p3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p2

    .line 182
    invoke-virtual {p1, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected final zza(ILandroid/os/Bundle;I)V
    .registers 6

    .line 193
    iget-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/Bundle;)V

    const/4 p1, 0x7

    const/4 v1, -0x1

    .line 194
    invoke-virtual {p2, p1, p3, v1, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 195
    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.BaseConnectionCallbacks (com.google.android.gms.common.internal.BaseGmsClient$BaseConnectionCallbacks)
.class public interface abstract Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BaseConnectionCallbacks"
.end annotation


# virtual methods
.method public abstract onConnected(Landroid/os/Bundle;)V
.end method

.method public abstract onConnectionSuspended(I)V
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.BaseOnConnectionFailedListener (com.google.android.gms.common.internal.BaseGmsClient$BaseOnConnectionFailedListener)
.class public interface abstract Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BaseOnConnectionFailedListener"
.end annotation


# virtual methods
.method public abstract onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.ConnectionProgressReportCallbacks (com.google.android.gms.common.internal.BaseGmsClient$ConnectionProgressReportCallbacks)
.class public interface abstract Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ConnectionProgressReportCallbacks"
.end annotation


# virtual methods
.method public abstract onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.LegacyClientCallbackAdapter (com.google.android.gms.common.internal.BaseGmsClient$LegacyClientCallbackAdapter)
.class public Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "LegacyClientCallbackAdapter"
.end annotation


# instance fields
.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 3
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getScopes()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getRemoteService(Lcom/google/android/gms/common/internal/IAccountAccessor;Ljava/util/Set;)V

    return-void

    .line 4
    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzg(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$LegacyClientCallbackAdapter;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzg(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_22
    return-void
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.SignOutCallbacks (com.google.android.gms.common.internal.BaseGmsClient$SignOutCallbacks)
.class public interface abstract Lcom/google/android/gms/common/internal/BaseGmsClient$SignOutCallbacks;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SignOutCallbacks"
.end annotation


# virtual methods
.method public abstract onSignOutComplete()V
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zza (com.google.android.gms.common.internal.BaseGmsClient$zza)
.class abstract Lcom/google/android/gms/common/internal/BaseGmsClient$zza;
.super Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/BaseGmsClient$zzc<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private final statusCode:I

.field private final zzcr:Landroid/os/Bundle;

.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/Bundle;)V
    .registers 5

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;Ljava/lang/Object;)V

    .line 3
    iput p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->statusCode:I

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcr:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method protected abstract zza(Lcom/google/android/gms/common/ConnectionResult;)V
.end method

.method protected final synthetic zza(Ljava/lang/Object;)V
    .registers 6

    .line 7
    check-cast p1, Ljava/lang/Boolean;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_c

    .line 9
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V

    return-void

    .line 11
    :cond_c
    iget p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->statusCode:I

    if-eqz p1, :cond_61

    const/16 v2, 0xa

    if-eq p1, v2, :cond_31

    .line 21
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V

    .line 23
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcr:Landroid/os/Bundle;

    if-eqz p1, :cond_26

    const-string v0, "pendingIntent"

    .line 24
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Landroid/app/PendingIntent;

    .line 25
    :cond_26
    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    iget v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->statusCode:I

    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_76

    .line 15
    :cond_31
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V

    .line 16
    new-instance p1, Ljava/lang/IllegalStateException;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 18
    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getStartServiceAction()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 19
    invoke-virtual {v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    const-string v0, "A fatal developer error has occurred. Class name: %s. Start service action: %s. Service Descriptor: %s. "

    .line 20
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 12
    :cond_61
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzm()Z

    move-result p1

    if-nez p1, :cond_76

    .line 13
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V

    .line 14
    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v0, 0x8

    invoke-direct {p1, v0, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_76
    :goto_76
    return-void
.end method

.method protected abstract zzm()Z
.end method

.method protected final zzn()V
    .registers 1

    return-void
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zzb (com.google.android.gms.common.internal.BaseGmsClient$zzb)
.class final Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;
.super Lcom/google/android/gms/internal/common/zze;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "zzb"
.end annotation


# instance fields
.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;Landroid/os/Looper;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/common/zze;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method private static zza(Landroid/os/Message;)V
    .registers 1

    .line 52
    iget-object p0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 53
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzn()V

    .line 54
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->unregister()V

    return-void
.end method

.method private static zzb(Landroid/os/Message;)Z
    .registers 4

    .line 56
    iget v0, p0, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_12

    iget v0, p0, Landroid/os/Message;->what:I

    if-eq v0, v1, :cond_12

    iget p0, p0, Landroid/os/Message;->what:I

    const/4 v0, 0x7

    if-ne p0, v0, :cond_10

    goto :goto_12

    :cond_10
    const/4 p0, 0x0

    return p0

    :cond_12
    :goto_12
    return v1
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .registers 9

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzcq:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-eq v0, v1, :cond_16

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzb(Landroid/os/Message;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza(Landroid/os/Message;)V

    :cond_15
    return-void

    .line 8
    :cond_16
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    const/4 v2, 0x1

    const/4 v3, 0x5

    if-eq v0, v2, :cond_2a

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v4, 0x7

    if-eq v0, v4, :cond_2a

    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v1, :cond_2a

    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v3, :cond_36

    :cond_2a
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_36

    .line 10
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza(Landroid/os/Message;)V

    return-void

    .line 12
    :cond_36
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v4, 0x8

    const/4 v5, 0x3

    const/4 v6, 0x0

    if-ne v0, v1, :cond_81

    .line 13
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {v1, p1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/ConnectionResult;)Lcom/google/android/gms/common/ConnectionResult;

    .line 14
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(Lcom/google/android/gms/common/internal/BaseGmsClient;)Z

    move-result p1

    if-eqz p1, :cond_60

    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzc(Lcom/google/android/gms/common/internal/BaseGmsClient;)Z

    move-result p1

    if-nez p1, :cond_60

    .line 15
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1, v5, v6}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V

    return-void

    .line 17
    :cond_60
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzd(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/ConnectionResult;

    move-result-object p1

    if-eqz p1, :cond_6f

    .line 18
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzd(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/ConnectionResult;

    move-result-object p1

    goto :goto_74

    .line 19
    :cond_6f
    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p1, v4}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    .line 20
    :goto_74
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 21
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    .line 23
    :cond_81
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v3, :cond_a6

    .line 24
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzd(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/ConnectionResult;

    move-result-object p1

    if-eqz p1, :cond_94

    .line 25
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzd(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/ConnectionResult;

    move-result-object p1

    goto :goto_99

    .line 26
    :cond_94
    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p1, v4}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    .line 27
    :goto_99
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 28
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    .line 30
    :cond_a6
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v5, :cond_c9

    .line 31
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Landroid/app/PendingIntent;

    if-eqz v0, :cond_b5

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Landroid/app/PendingIntent;

    .line 32
    :cond_b5
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {v0, p1, v6}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    .line 33
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object p1, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 34
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    .line 36
    :cond_c9
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_f3

    .line 37
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0, v3, v6}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IInterface;)V

    .line 38
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zze(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    move-result-object v0

    if-eqz v0, :cond_e6

    .line 39
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zze(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;->onConnectionSuspended(I)V

    .line 40
    :cond_e6
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionSuspended(I)V

    .line 41
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1, v3, v2, v6}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z

    return-void

    .line 43
    :cond_f3
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_104

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    move-result v0

    if-nez v0, :cond_104

    .line 44
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza(Landroid/os/Message;)V

    return-void

    .line 46
    :cond_104
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzb(Landroid/os/Message;)Z

    move-result v0

    if-eqz v0, :cond_112

    .line 47
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 48
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzo()V

    return-void

    .line 50
    :cond_112
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x2d

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Don\'t know how to handle message: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    const-string v1, "GmsClient"

    invoke-static {v1, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zzc (com.google.android.gms.common.internal.BaseGmsClient$zzc)
.class public abstract Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T",
        "Listener:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

.field private zzct:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT",
            "Listener;"
        }
    .end annotation
.end field

.field private zzcu:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT",
            "Listener;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzct:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzcu:Z

    return-void
.end method


# virtual methods
.method public final removeListener()V
    .registers 2

    .line 26
    monitor-enter p0

    const/4 v0, 0x0

    .line 27
    :try_start_2
    iput-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzct:Ljava/lang/Object;

    .line 28
    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_2 .. :try_end_8} :catchall_6

    throw v0
.end method

.method public final unregister()V
    .registers 3

    .line 22
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->removeListener()V

    .line 23
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzf(Lcom/google/android/gms/common/internal/BaseGmsClient;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    .line 24
    :try_start_a
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzf(Lcom/google/android/gms/common/internal/BaseGmsClient;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 25
    monitor-exit v0

    return-void

    :catchall_15
    move-exception v1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_a .. :try_end_17} :catchall_15

    throw v1
.end method

.method protected abstract zza(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT",
            "Listener;",
            ")V"
        }
    .end annotation
.end method

.method protected abstract zzn()V
.end method

.method public final zzo()V
    .registers 6

    .line 5
    monitor-enter p0

    .line 6
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzct:Ljava/lang/Object;

    .line 7
    iget-boolean v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzcu:Z

    if-eqz v1, :cond_30

    const-string v1, "GmsClient"

    .line 8
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x2f

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Callback proxy "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " being reused. This is not safe."

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    :cond_30
    monitor-exit p0
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_4b

    if-eqz v0, :cond_3c

    .line 11
    :try_start_33
    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zza(Ljava/lang/Object;)V
    :try_end_36
    .catch Ljava/lang/RuntimeException; {:try_start_33 .. :try_end_36} :catch_37

    goto :goto_3f

    :catch_37
    move-exception v0

    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzn()V

    .line 15
    throw v0

    .line 16
    :cond_3c
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzn()V

    .line 17
    :goto_3f
    monitor-enter p0

    const/4 v0, 0x1

    .line 18
    :try_start_41
    iput-boolean v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzcu:Z

    .line 19
    monitor-exit p0
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_48

    .line 20
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->unregister()V

    return-void

    :catchall_48
    move-exception v0

    .line 19
    :try_start_49
    monitor-exit p0
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_48

    throw v0

    :catchall_4b
    move-exception v0

    .line 9
    :try_start_4c
    monitor-exit p0
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4b

    throw v0
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zzd (com.google.android.gms.common.internal.BaseGmsClient$zzd)
.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;
.super Lcom/google/android/gms/common/internal/IGmsCallbacks$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzd"
.end annotation


# instance fields
.field private zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

.field private final zzcw:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V
    .registers 3

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/IGmsCallbacks$zza;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 3
    iput p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcw:I

    return-void
.end method


# virtual methods
.method public final onPostInitComplete(ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .registers 6

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const-string v1, "onPostInitComplete can be called only once per call to getRemoteService"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcw:I

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onPostInitHandler(ILandroid/os/IBinder;Landroid/os/Bundle;I)V

    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

    return-void
.end method

.method public final zza(ILandroid/os/Bundle;)V
    .registers 4

    .line 5
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    const-string p2, "GmsClient"

    const-string v0, "received deprecated onAccountValidationComplete callback, ignoring"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public final zza(ILandroid/os/IBinder;Lcom/google/android/gms/common/internal/zzb;)V
    .registers 6

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const-string v1, "onPostInitCompleteWithConnectionInfo can be called only once per call togetRemoteService"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->zzcv:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/internal/zzb;)V

    .line 16
    iget-object p3, p3, Lcom/google/android/gms/common/internal/zzb;->zzcz:Landroid/os/Bundle;

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzd;->onPostInitComplete(ILandroid/os/IBinder;Landroid/os/Bundle;)V

    return-void
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zze (com.google.android.gms.common.internal.BaseGmsClient$zze)
.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zze;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zze"
.end annotation


# instance fields
.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

.field private final zzcw:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcw:I

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 7

    if-nez p2, :cond_a

    .line 5
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/16 p2, 0x10

    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;I)V

    return-void

    .line 7
    :cond_a
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    .line 8
    :try_start_11
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v1, 0x0

    if-nez p2, :cond_18

    move-object v2, v1

    goto :goto_2c

    :cond_18
    const-string v2, "com.google.android.gms.common.internal.IGmsServiceBroker"

    .line 11
    invoke-interface {p2, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v2

    if-eqz v2, :cond_27

    .line 12
    instance-of v3, v2, Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    if-eqz v3, :cond_27

    .line 13
    check-cast v2, Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    goto :goto_2c

    .line 14
    :cond_27
    new-instance v2, Lcom/google/android/gms/common/internal/IGmsServiceBroker$Stub$zza;

    invoke-direct {v2, p2}, Lcom/google/android/gms/common/internal/IGmsServiceBroker$Stub$zza;-><init>(Landroid/os/IBinder;)V

    .line 15
    :goto_2c
    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/internal/IGmsServiceBroker;)Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 16
    monitor-exit p1
    :try_end_30
    .catchall {:try_start_11 .. :try_end_30} :catchall_39

    .line 17
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 p2, 0x0

    iget v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcw:I

    invoke-virtual {p1, p2, v1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(ILandroid/os/Bundle;I)V

    return-void

    :catchall_39
    move-exception p2

    .line 16
    :try_start_3a
    monitor-exit p1
    :try_end_3b
    .catchall {:try_start_3a .. :try_end_3b} :catchall_39

    throw p2
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 6

    .line 19
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    .line 20
    :try_start_7
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/internal/IGmsServiceBroker;)Lcom/google/android/gms/common/internal/IGmsServiceBroker;

    .line 21
    monitor-exit p1
    :try_end_e
    .catchall {:try_start_7 .. :try_end_e} :catchall_22

    .line 22
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object p1, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x6

    iget v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zze;->zzcw:I

    const/4 v3, 0x1

    .line 23
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_22
    move-exception v0

    .line 21
    :try_start_23
    monitor-exit p1
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    throw v0
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zzf (com.google.android.gms.common.internal.BaseGmsClient$zzf)
.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;
.super Lcom/google/android/gms/common/internal/BaseGmsClient$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "zzf"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/BaseGmsClient$zza;"
    }
.end annotation


# instance fields
.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

.field private final zzcx:Landroid/os/IBinder;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .registers 5

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/Bundle;)V

    .line 3
    iput-object p3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcx:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method protected final zza(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzg(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzg(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 7
    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method protected final zzm()Z
    .registers 7

    const-string v0, "GmsClient"

    const/4 v1, 0x0

    .line 9
    :try_start_3
    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcx:Landroid/os/IBinder;

    invoke-interface {v2}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v2
    :try_end_9
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_9} :catch_88

    .line 14
    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4b

    .line 15
    iget-object v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x22

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "service descriptor mismatch: "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " vs. "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 17
    :cond_4b
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcx:Landroid/os/IBinder;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/internal/BaseGmsClient;->createServiceInterface(Landroid/os/IBinder;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_87

    .line 19
    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v3, 0x2

    const/4 v4, 0x4

    invoke-static {v2, v3, v4, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z

    move-result v2

    if-nez v2, :cond_68

    iget-object v2, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v3, 0x3

    .line 20
    invoke-static {v2, v3, v4, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z

    move-result v0

    if-eqz v0, :cond_87

    .line 21
    :cond_68
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;Lcom/google/android/gms/common/ConnectionResult;)Lcom/google/android/gms/common/ConnectionResult;

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getConnectionHint()Landroid/os/Bundle;

    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zze(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    move-result-object v1

    if-eqz v1, :cond_85

    .line 24
    iget-object v1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzf;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zze(Lcom/google/android/gms/common/internal/BaseGmsClient;)Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;->onConnected(Landroid/os/Bundle;)V

    :cond_85
    const/4 v0, 0x1

    return v0

    :cond_87
    return v1

    :catch_88
    const-string v2, "service probably died"

    .line 12
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

###### Class com.google.android.gms.common.internal.BaseGmsClient.zzg (com.google.android.gms.common.internal.BaseGmsClient$zzg)
.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;
.super Lcom/google/android/gms/common/internal/BaseGmsClient$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "zzg"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/BaseGmsClient$zza;"
    }
.end annotation


# instance fields
.field private final synthetic zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/Bundle;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    const/4 p3, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/common/internal/BaseGmsClient$zza;-><init>(Lcom/google/android/gms/common/internal/BaseGmsClient;ILandroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method protected final zza(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 3

    .line 4
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method protected final zzm()Z
    .registers 3

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzg;->zzcs:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzce:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    sget-object v1, Lcom/google/android/gms/common/ConnectionResult;->RESULT_SUCCESS:Lcom/google/android/gms/common/ConnectionResult;

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    const/4 v0, 0x1

    return v0
.end method
