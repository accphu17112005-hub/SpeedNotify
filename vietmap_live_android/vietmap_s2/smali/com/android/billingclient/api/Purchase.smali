###### Class com.android.billingclient.api.Purchase (com.android.billingclient.api.Purchase)
.class public Lcom/android/billingclient/api/Purchase;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/Purchase$PurchasesResult;,
        Lcom/android/billingclient/api/Purchase$PurchaseState;
    }
.end annotation


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:Ljava/lang/String;

.field private final zzc:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/Purchase;->zza:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/billingclient/api/Purchase;->zzb:Ljava/lang/String;

    .line 1
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 1
    :cond_4
    instance-of v1, p1, Lcom/android/billingclient/api/Purchase;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    .line 2
    :cond_a
    check-cast p1, Lcom/android/billingclient/api/Purchase;

    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zza:Ljava/lang/String;

    .line 3
    invoke-virtual {p1}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_25

    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zzb:Ljava/lang/String;

    .line 4
    invoke-virtual {p1}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_25

    return v0

    :cond_25
    return v2
.end method

.method public getAccountIdentifiers()Lcom/android/billingclient/api/AccountIdentifiers;
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "obfuscatedAccountId"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v2, "obfuscatedProfileId"

    .line 2
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_16

    if-nez v1, :cond_16

    const/4 v0, 0x0

    return-object v0

    :cond_16
    new-instance v2, Lcom/android/billingclient/api/AccountIdentifiers;

    .line 3
    invoke-direct {v2, v0, v1}, Lcom/android/billingclient/api/AccountIdentifiers;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method

.method public getDeveloperPayload()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "developerPayload"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOrderId()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "orderId"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOriginalJson()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zza:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "packageName"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPurchaseState()I
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "purchaseState"

    const/4 v2, 0x1

    .line 1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_d

    return v2

    :cond_d
    const/4 v0, 0x2

    return v0
.end method

.method public getPurchaseTime()J
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "purchaseTime"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPurchaseToken()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "purchaseToken"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "token"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQuantity()I
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "quantity"

    const/4 v2, 0x1

    .line 1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzb:Ljava/lang/String;

    return-object v0
.end method

.method public getSkus()Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    .line 1
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v2, "productIds"

    .line 2
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_28

    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    .line 3
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_3b

    const/4 v2, 0x0

    .line 4
    :goto_18
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_3b

    .line 5
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    :cond_28
    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v2, "productId"

    .line 6
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3b

    iget-object v1, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    .line 7
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3b
    return-object v0
.end method

.method public hashCode()I
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zza:Ljava/lang/String;

    .line 1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isAcknowledged()Z
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "acknowledged"

    const/4 v2, 0x1

    .line 1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isAutoRenewing()Z
    .registers 3

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zzc:Lorg/json/JSONObject;

    const-string v1, "autoRenewing"

    .line 1
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase;->zza:Ljava/lang/String;

    .line 1
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "Purchase. Json: "

    if-eqz v1, :cond_13

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_18

    :cond_13
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_18
    return-object v0
.end method

###### Class com.android.billingclient.api.Purchase.PurchaseState (com.android.billingclient.api.Purchase$PurchaseState)
.class public interface abstract annotation Lcom/android/billingclient/api/Purchase$PurchaseState;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/Purchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "PurchaseState"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final PENDING:I = 0x2

.field public static final PURCHASED:I = 0x1

.field public static final UNSPECIFIED_STATE:I

###### Class com.android.billingclient.api.Purchase.PurchasesResult (com.android.billingclient.api.Purchase$PurchasesResult)
.class public Lcom/android/billingclient/api/Purchase$PurchasesResult;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/Purchase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PurchasesResult"
.end annotation


# instance fields
.field private final zza:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;"
        }
    .end annotation
.end field

.field private final zzb:Lcom/android/billingclient/api/BillingResult;


# direct methods
.method public constructor <init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;->zza:Ljava/util/List;

    iput-object p1, p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;->zzb:Lcom/android/billingclient/api/BillingResult;

    return-void
.end method


# virtual methods
.method public getBillingResult()Lcom/android/billingclient/api/BillingResult;
    .registers 2

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;->zzb:Lcom/android/billingclient/api/BillingResult;

    return-object v0
.end method

.method public getPurchasesList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;->zza:Ljava/util/List;

    return-object v0
.end method

.method public getResponseCode()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/Purchase$PurchasesResult;->getBillingResult()Lcom/android/billingclient/api/BillingResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    return v0
.end method
