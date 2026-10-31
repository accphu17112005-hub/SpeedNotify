###### Class com.android.billingclient.api.BillingClient (com.android.billingclient.api.BillingClient)
.class public abstract Lcom/android/billingclient/api/BillingClient;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/BillingClient$Builder;,
        Lcom/android/billingclient/api/BillingClient$ConnectionState;,
        Lcom/android/billingclient/api/BillingClient$BillingResponseCode;,
        Lcom/android/billingclient/api/BillingClient$FeatureType;,
        Lcom/android/billingclient/api/BillingClient$SkuType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newBuilder(Landroid/content/Context;)Lcom/android/billingclient/api/BillingClient$Builder;
    .registers 3

    new-instance v0, Lcom/android/billingclient/api/BillingClient$Builder;

    const/4 v1, 0x0

    .line 1
    invoke-direct {v0, p0, v1}, Lcom/android/billingclient/api/BillingClient$Builder;-><init>(Landroid/content/Context;Lcom/android/billingclient/api/zzi;)V

    return-object v0
.end method


# virtual methods
.method public abstract acknowledgePurchase(Lcom/android/billingclient/api/AcknowledgePurchaseParams;Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;)V
.end method

.method public abstract consumeAsync(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V
.end method

.method public abstract endConnection()V
.end method

.method public abstract getConnectionState()I
.end method

.method public abstract isFeatureSupported(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;
.end method

.method public abstract isReady()Z
.end method

.method public abstract launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;
.end method

.method public abstract launchPriceChangeConfirmationFlow(Landroid/app/Activity;Lcom/android/billingclient/api/PriceChangeFlowParams;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V
.end method

.method public abstract queryPurchaseHistoryAsync(Ljava/lang/String;Lcom/android/billingclient/api/PurchaseHistoryResponseListener;)V
.end method

.method public abstract queryPurchases(Ljava/lang/String;)Lcom/android/billingclient/api/Purchase$PurchasesResult;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract queryPurchasesAsync(Ljava/lang/String;Lcom/android/billingclient/api/PurchasesResponseListener;)V
.end method

.method public abstract querySkuDetailsAsync(Lcom/android/billingclient/api/SkuDetailsParams;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V
.end method

.method public abstract startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V
.end method

###### Class com.android.billingclient.api.BillingClient.BillingResponseCode (com.android.billingclient.api.BillingClient$BillingResponseCode)
.class public interface abstract annotation Lcom/android/billingclient/api/BillingClient$BillingResponseCode;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "BillingResponseCode"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final BILLING_UNAVAILABLE:I = 0x3

.field public static final DEVELOPER_ERROR:I = 0x5

.field public static final ERROR:I = 0x6

.field public static final FEATURE_NOT_SUPPORTED:I = -0x2

.field public static final ITEM_ALREADY_OWNED:I = 0x7

.field public static final ITEM_NOT_OWNED:I = 0x8

.field public static final ITEM_UNAVAILABLE:I = 0x4

.field public static final OK:I = 0x0

.field public static final SERVICE_DISCONNECTED:I = -0x1

.field public static final SERVICE_TIMEOUT:I = -0x3

.field public static final SERVICE_UNAVAILABLE:I = 0x2

.field public static final USER_CANCELED:I = 0x1

###### Class com.android.billingclient.api.BillingClient.Builder (com.android.billingclient.api.BillingClient$Builder)
.class public final Lcom/android/billingclient/api/BillingClient$Builder;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private volatile zza:Ljava/lang/String;

.field private volatile zzb:Z

.field private final zzc:Landroid/content/Context;

.field private volatile zzd:Lcom/android/billingclient/api/PurchasesUpdatedListener;


# direct methods
.method synthetic constructor <init>(Landroid/content/Context;Lcom/android/billingclient/api/zzi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzc:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public build()Lcom/android/billingclient/api/BillingClient;
    .registers 6

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzc:Landroid/content/Context;

    if-eqz v0, :cond_29

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzd:Lcom/android/billingclient/api/PurchasesUpdatedListener;

    if-eqz v0, :cond_21

    .line 2
    iget-boolean v0, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzb:Z

    if-eqz v0, :cond_19

    .line 3
    new-instance v0, Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzb:Z

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzc:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzd:Lcom/android/billingclient/api/PurchasesUpdatedListener;

    .line 4
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;-><init>(Ljava/lang/String;ZLandroid/content/Context;Lcom/android/billingclient/api/PurchasesUpdatedListener;)V

    return-object v0

    .line 2
    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Support for pending purchases must be enabled. Enable this by calling \'enablePendingPurchases()\' on BillingClientBuilder."

    .line 3
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1
    :cond_21
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Please provide a valid listener for purchases updates."

    .line 2
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 0
    :cond_29
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Please provide a valid Context."

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public enablePendingPurchases()Lcom/android/billingclient/api/BillingClient$Builder;
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzb:Z

    return-object p0
.end method

.method public setListener(Lcom/android/billingclient/api/PurchasesUpdatedListener;)Lcom/android/billingclient/api/BillingClient$Builder;
    .registers 2

    iput-object p1, p0, Lcom/android/billingclient/api/BillingClient$Builder;->zzd:Lcom/android/billingclient/api/PurchasesUpdatedListener;

    return-object p0
.end method

###### Class com.android.billingclient.api.BillingClient.ConnectionState (com.android.billingclient.api.BillingClient$ConnectionState)
.class public interface abstract annotation Lcom/android/billingclient/api/BillingClient$ConnectionState;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "ConnectionState"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final CLOSED:I = 0x3

.field public static final CONNECTED:I = 0x2

.field public static final CONNECTING:I = 0x1

.field public static final DISCONNECTED:I

###### Class com.android.billingclient.api.BillingClient.FeatureType (com.android.billingclient.api.BillingClient$FeatureType)
.class public interface abstract annotation Lcom/android/billingclient/api/BillingClient$FeatureType;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "FeatureType"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final IN_APP_ITEMS_ON_VR:Ljava/lang/String; = "inAppItemsOnVr"

.field public static final PRICE_CHANGE_CONFIRMATION:Ljava/lang/String; = "priceChangeConfirmation"

.field public static final SUBSCRIPTIONS:Ljava/lang/String; = "subscriptions"

.field public static final SUBSCRIPTIONS_ON_VR:Ljava/lang/String; = "subscriptionsOnVr"

.field public static final SUBSCRIPTIONS_UPDATE:Ljava/lang/String; = "subscriptionsUpdate"

###### Class com.android.billingclient.api.BillingClient.SkuType (com.android.billingclient.api.BillingClient$SkuType)
.class public interface abstract annotation Lcom/android/billingclient/api/BillingClient$SkuType;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/BillingClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2609
    name = "SkuType"
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation


# static fields
.field public static final INAPP:Ljava/lang/String; = "inapp"

.field public static final SUBS:Ljava/lang/String; = "subs"
