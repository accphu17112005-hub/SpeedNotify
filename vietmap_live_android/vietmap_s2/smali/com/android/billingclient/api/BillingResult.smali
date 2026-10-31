###### Class com.android.billingclient.api.BillingResult (com.android.billingclient.api.BillingResult)
.class public final Lcom/android/billingclient/api/BillingResult;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/BillingResult$Builder;
    }
.end annotation


# instance fields
.field private zza:I

.field private zzb:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newBuilder()Lcom/android/billingclient/api/BillingResult$Builder;
    .registers 2

    new-instance v0, Lcom/android/billingclient/api/BillingResult$Builder;

    const/4 v1, 0x0

    .line 1
    invoke-direct {v0, v1}, Lcom/android/billingclient/api/BillingResult$Builder;-><init>(Lcom/android/billingclient/api/zzaj;)V

    return-object v0
.end method

.method static synthetic zza(Lcom/android/billingclient/api/BillingResult;I)I
    .registers 2

    iput p1, p0, Lcom/android/billingclient/api/BillingResult;->zza:I

    return p1
.end method

.method static synthetic zzb(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/BillingResult;->zzb:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public getDebugMessage()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/BillingResult;->zzb:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseCode()I
    .registers 2

    iget v0, p0, Lcom/android/billingclient/api/BillingResult;->zza:I

    return v0
.end method

###### Class com.android.billingclient.api.BillingResult.Builder (com.android.billingclient.api.BillingResult$Builder)
.class public Lcom/android/billingclient/api/BillingResult$Builder;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private zza:I

.field private zzb:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/android/billingclient/api/BillingResult$Builder;->zzb:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/billingclient/api/zzaj;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, ""

    iput-object p1, p0, Lcom/android/billingclient/api/BillingResult$Builder;->zzb:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/android/billingclient/api/BillingResult;
    .registers 3

    new-instance v0, Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v0}, Lcom/android/billingclient/api/BillingResult;-><init>()V

    iget v1, p0, Lcom/android/billingclient/api/BillingResult$Builder;->zza:I

    .line 1
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingResult;->zza(Lcom/android/billingclient/api/BillingResult;I)I

    iget-object v1, p0, Lcom/android/billingclient/api/BillingResult$Builder;->zzb:Ljava/lang/String;

    .line 2
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingResult;->zzb(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)Ljava/lang/String;

    return-object v0
.end method

.method public setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult$Builder;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/BillingResult$Builder;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public setResponseCode(I)Lcom/android/billingclient/api/BillingResult$Builder;
    .registers 2

    iput p1, p0, Lcom/android/billingclient/api/BillingResult$Builder;->zza:I

    return-object p0
.end method
