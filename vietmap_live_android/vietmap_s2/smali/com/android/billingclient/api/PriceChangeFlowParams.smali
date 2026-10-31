###### Class com.android.billingclient.api.PriceChangeFlowParams (com.android.billingclient.api.PriceChangeFlowParams)
.class public Lcom/android/billingclient/api/PriceChangeFlowParams;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;
    }
.end annotation


# instance fields
.field private zza:Lcom/android/billingclient/api/SkuDetails;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newBuilder()Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;
    .registers 1

    new-instance v0, Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;

    invoke-direct {v0}, Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;-><init>()V

    return-object v0
.end method

.method static synthetic zza(Lcom/android/billingclient/api/PriceChangeFlowParams;Lcom/android/billingclient/api/SkuDetails;)Lcom/android/billingclient/api/SkuDetails;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/PriceChangeFlowParams;->zza:Lcom/android/billingclient/api/SkuDetails;

    return-object p1
.end method


# virtual methods
.method public getSkuDetails()Lcom/android/billingclient/api/SkuDetails;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/PriceChangeFlowParams;->zza:Lcom/android/billingclient/api/SkuDetails;

    return-object v0
.end method

###### Class com.android.billingclient.api.PriceChangeFlowParams.Builder (com.android.billingclient.api.PriceChangeFlowParams$Builder)
.class public Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/PriceChangeFlowParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private zza:Lcom/android/billingclient/api/SkuDetails;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/android/billingclient/api/PriceChangeFlowParams;
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;->zza:Lcom/android/billingclient/api/SkuDetails;

    if-eqz v0, :cond_f

    .line 1
    new-instance v0, Lcom/android/billingclient/api/PriceChangeFlowParams;

    invoke-direct {v0}, Lcom/android/billingclient/api/PriceChangeFlowParams;-><init>()V

    iget-object v1, p0, Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;->zza:Lcom/android/billingclient/api/SkuDetails;

    .line 2
    invoke-static {v0, v1}, Lcom/android/billingclient/api/PriceChangeFlowParams;->zza(Lcom/android/billingclient/api/PriceChangeFlowParams;Lcom/android/billingclient/api/SkuDetails;)Lcom/android/billingclient/api/SkuDetails;

    return-object v0

    .line 0
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SkuDetails must be set"

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSkuDetails(Lcom/android/billingclient/api/SkuDetails;)Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/PriceChangeFlowParams$Builder;->zza:Lcom/android/billingclient/api/SkuDetails;

    return-object p0
.end method
