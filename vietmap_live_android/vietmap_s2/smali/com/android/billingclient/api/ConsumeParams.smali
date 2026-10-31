###### Class com.android.billingclient.api.ConsumeParams (com.android.billingclient.api.ConsumeParams)
.class public final Lcom/android/billingclient/api/ConsumeParams;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/ConsumeParams$Builder;
    }
.end annotation


# instance fields
.field private zza:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/billingclient/api/zzal;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newBuilder()Lcom/android/billingclient/api/ConsumeParams$Builder;
    .registers 2

    new-instance v0, Lcom/android/billingclient/api/ConsumeParams$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/billingclient/api/ConsumeParams$Builder;-><init>(Lcom/android/billingclient/api/zzal;)V

    return-object v0
.end method

.method static synthetic zza(Lcom/android/billingclient/api/ConsumeParams;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/ConsumeParams;->zza:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public getPurchaseToken()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/ConsumeParams;->zza:Ljava/lang/String;

    return-object v0
.end method

###### Class com.android.billingclient.api.ConsumeParams.Builder (com.android.billingclient.api.ConsumeParams$Builder)
.class public final Lcom/android/billingclient/api/ConsumeParams$Builder;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/ConsumeParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private zza:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/billingclient/api/zzal;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/android/billingclient/api/ConsumeParams;
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/ConsumeParams$Builder;->zza:Ljava/lang/String;

    if-eqz v0, :cond_10

    .line 1
    new-instance v0, Lcom/android/billingclient/api/ConsumeParams;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/billingclient/api/ConsumeParams;-><init>(Lcom/android/billingclient/api/zzal;)V

    iget-object v1, p0, Lcom/android/billingclient/api/ConsumeParams$Builder;->zza:Ljava/lang/String;

    .line 2
    invoke-static {v0, v1}, Lcom/android/billingclient/api/ConsumeParams;->zza(Lcom/android/billingclient/api/ConsumeParams;Ljava/lang/String;)Ljava/lang/String;

    return-object v0

    .line 0
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Purchase token must be set"

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/ConsumeParams$Builder;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/ConsumeParams$Builder;->zza:Ljava/lang/String;

    return-object p0
.end method
