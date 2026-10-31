###### Class com.google.android.gms.common.GoogleSignatureVerifier (com.google.android.gms.common.GoogleSignatureVerifier)
.class public Lcom/google/android/gms/common/GoogleSignatureVerifier;
.super Ljava/lang/Object;


# annotations
.annotation runtime Ljavax/annotation/CheckReturnValue;
.end annotation


# static fields
.field private static zzal:Lcom/google/android/gms/common/GoogleSignatureVerifier;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private volatile zzam:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->mContext:Landroid/content/Context;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/google/android/gms/common/GoogleSignatureVerifier;
    .registers 3

    .line 4
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    const-class v0, Lcom/google/android/gms/common/GoogleSignatureVerifier;

    monitor-enter v0

    .line 6
    :try_start_6
    sget-object v1, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zzal:Lcom/google/android/gms/common/GoogleSignatureVerifier;

    if-nez v1, :cond_14

    .line 7
    invoke-static {p0}, Lcom/google/android/gms/common/zzc;->zza(Landroid/content/Context;)V

    .line 8
    new-instance v1, Lcom/google/android/gms/common/GoogleSignatureVerifier;

    invoke-direct {v1, p0}, Lcom/google/android/gms/common/GoogleSignatureVerifier;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zzal:Lcom/google/android/gms/common/GoogleSignatureVerifier;

    .line 9
    :cond_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_6 .. :try_end_15} :catchall_18

    .line 10
    sget-object p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zzal:Lcom/google/android/gms/common/GoogleSignatureVerifier;

    return-object p0

    :catchall_18
    move-exception p0

    .line 9
    :try_start_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_18

    throw p0
.end method

.method private static varargs zza(Landroid/content/pm/PackageInfo;[Lcom/google/android/gms/common/zze;)Lcom/google/android/gms/common/zze;
    .registers 5

    .line 88
    iget-object v0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 90
    :cond_6
    iget-object v0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v0, v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_14

    const-string p0, "GoogleSignatureVerifier"

    const-string p1, "Package has more than one signature."

    .line 91
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    .line 93
    :cond_14
    new-instance v0, Lcom/google/android/gms/common/zzf;

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v2, 0x0

    aget-object p0, p0, v2

    invoke-virtual {p0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/zzf;-><init>([B)V

    .line 94
    :goto_22
    array-length p0, p1

    if-ge v2, p0, :cond_33

    .line 95
    aget-object p0, p1, v2

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/zze;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_30

    .line 96
    aget-object p0, p1, v2

    return-object p0

    :cond_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    :cond_33
    return-object v1
.end method

.method private final zza(Landroid/content/pm/PackageInfo;)Lcom/google/android/gms/common/zzm;
    .registers 8

    .line 69
    iget-object v0, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->honorsDebugCertificates(Landroid/content/Context;)Z

    move-result v0

    if-nez p1, :cond_f

    const-string p1, "null pkg"

    .line 72
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1

    .line 73
    :cond_f
    iget-object v1, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    array-length v1, v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1c

    const-string p1, "single cert required"

    .line 74
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1

    .line 75
    :cond_1c
    new-instance v1, Lcom/google/android/gms/common/zzf;

    iget-object v2, p1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/android/gms/common/zzf;-><init>([B)V

    .line 76
    iget-object v2, p1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 78
    invoke-static {v2, v1, v0}, Lcom/google/android/gms/common/zzc;->zza(Ljava/lang/String;Lcom/google/android/gms/common/zze;Z)Lcom/google/android/gms/common/zzm;

    move-result-object v4

    .line 80
    iget-boolean v5, v4, Lcom/google/android/gms/common/zzm;->zzac:Z

    if-eqz v5, :cond_51

    .line 81
    iget-object v5, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v5, :cond_51

    iget-object p1, p1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_51

    if-eqz v0, :cond_4a

    .line 82
    invoke-static {v2, v1, v3}, Lcom/google/android/gms/common/zzc;->zza(Ljava/lang/String;Lcom/google/android/gms/common/zze;Z)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    .line 83
    iget-boolean p1, p1, Lcom/google/android/gms/common/zzm;->zzac:Z

    if-eqz p1, :cond_51

    :cond_4a
    const-string p1, "debuggable release cert app rejected"

    .line 85
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1

    :cond_51
    return-object v4
.end method

.method private final zza(Ljava/lang/String;I)Lcom/google/android/gms/common/zzm;
    .registers 5

    .line 47
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->mContext:Landroid/content/Context;

    .line 48
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    const/16 v1, 0x40

    .line 49
    invoke-virtual {v0, p1, v1, p2}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->zza(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;

    move-result-object p2

    .line 50
    invoke-direct {p0, p2}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;)Lcom/google/android/gms/common/zzm;

    move-result-object p1
    :try_end_10
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_10} :catch_11

    return-object p1

    :catch_11
    nop

    const-string p2, "no pkg "

    .line 52
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_28

    :cond_23
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_28
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1
.end method

.method public static zza(Landroid/content/pm/PackageInfo;Z)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_20

    .line 33
    iget-object v1, p0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    if-eqz v1, :cond_20

    const/4 v1, 0x1

    if-eqz p1, :cond_11

    .line 35
    sget-object p1, Lcom/google/android/gms/common/zzh;->zzx:[Lcom/google/android/gms/common/zze;

    invoke-static {p0, p1}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;[Lcom/google/android/gms/common/zze;)Lcom/google/android/gms/common/zze;

    move-result-object p0

    goto :goto_1d

    :cond_11
    new-array p1, v1, [Lcom/google/android/gms/common/zze;

    .line 36
    sget-object v2, Lcom/google/android/gms/common/zzh;->zzx:[Lcom/google/android/gms/common/zze;

    aget-object v2, v2, v0

    aput-object v2, p1, v0

    invoke-static {p0, p1}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;[Lcom/google/android/gms/common/zze;)Lcom/google/android/gms/common/zze;

    move-result-object p0

    :goto_1d
    if-eqz p0, :cond_20

    return v1

    :cond_20
    return v0
.end method

.method private final zzc(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;
    .registers 4

    if-nez p1, :cond_9

    const-string p1, "null pkg"

    .line 54
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1

    .line 55
    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zzam:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 56
    invoke-static {}, Lcom/google/android/gms/common/zzm;->zze()Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1

    .line 57
    :cond_16
    :try_start_16
    iget-object v0, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->mContext:Landroid/content/Context;

    .line 58
    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    const/16 v1, 0x40

    .line 59
    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_22
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_16 .. :try_end_22} :catch_2d

    .line 63
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;)Lcom/google/android/gms/common/zzm;

    move-result-object v0

    .line 65
    iget-boolean v1, v0, Lcom/google/android/gms/common/zzm;->zzac:Z

    if-eqz v1, :cond_2c

    .line 67
    iput-object p1, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zzam:Ljava/lang/String;

    :cond_2c
    return-object v0

    :catch_2d
    nop

    const-string v0, "no pkg "

    .line 62
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3f

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_44

    :cond_3f
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_44
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public isGooglePublicSignedPackage(Landroid/content/pm/PackageInfo;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 40
    :cond_4
    invoke-static {p1, v0}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;Z)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_c

    return v2

    .line 42
    :cond_c
    invoke-static {p1, v2}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;Z)Z

    move-result p1

    if-eqz p1, :cond_22

    .line 43
    iget-object p1, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->honorsDebugCertificates(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1b

    return v2

    :cond_1b
    const-string p1, "GoogleSignatureVerifier"

    const-string v1, "Test-keys aren\'t accepted on this build."

    .line 45
    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_22
    return v0
.end method

.method public isPackageGoogleSigned(Ljava/lang/String;)Z
    .registers 2

    .line 28
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zzc(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/google/android/gms/common/zzm;->zzf()V

    .line 31
    iget-boolean p1, p1, Lcom/google/android/gms/common/zzm;->zzac:Z

    return p1
.end method

.method public isUidGoogleSigned(I)Z
    .registers 7

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/common/GoogleSignatureVerifier;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/common/wrappers/Wrappers;->packageManager(Landroid/content/Context;)Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/wrappers/PackageManagerWrapper;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 13
    array-length v1, v0

    if-nez v1, :cond_10

    goto :goto_22

    :cond_10
    const/4 v1, 0x0

    .line 16
    array-length v2, v0

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v2, :cond_28

    aget-object v1, v0, v3

    .line 17
    invoke-direct {p0, v1, p1}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Ljava/lang/String;I)Lcom/google/android/gms/common/zzm;

    move-result-object v1

    .line 19
    iget-boolean v4, v1, Lcom/google/android/gms/common/zzm;->zzac:Z

    if-nez v4, :cond_28

    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_22
    :goto_22
    const-string p1, "no pkgs"

    .line 14
    invoke-static {p1}, Lcom/google/android/gms/common/zzm;->zzb(Ljava/lang/String;)Lcom/google/android/gms/common/zzm;

    move-result-object v1

    .line 24
    :cond_28
    invoke-virtual {v1}, Lcom/google/android/gms/common/zzm;->zzf()V

    .line 26
    iget-boolean p1, v1, Lcom/google/android/gms/common/zzm;->zzac:Z

    return p1
.end method
