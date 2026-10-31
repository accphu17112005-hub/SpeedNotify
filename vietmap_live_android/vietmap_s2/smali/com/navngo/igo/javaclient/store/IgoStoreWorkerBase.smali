###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerBase (com.navngo.igo.javaclient.store.IgoStoreWorkerBase)
.class public abstract Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;
.super Ljava/lang/Object;
.source "IgoStoreWorkerBase.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;
.implements Lcom/android/billingclient/api/BillingClientStateListener;
.implements Lcom/android/billingclient/api/PurchasesUpdatedListener;


# static fields
.field private static final RECONNECT_TIMER_MILLISECONDS:J = 0x1388L

.field private static final logname:Ljava/lang/String; = "IgoStoreWorkerBase"


# instance fields
.field protected mBillingClient:Lcom/android/billingclient/api/BillingClient;

.field protected mBillingServiceConnected:Z

.field protected mContext:Landroid/content/Context;

.field protected mLastPurchaseID:Ljava/lang/String;

.field protected mPurchaseInProgress:Z

.field protected mSubscriptionsSupported:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mPurchaseInProgress:Z

    .line 32
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingServiceConnected:Z

    return-void
.end method

.method private retryBillingConnection()V
    .registers 5

    .line 153
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;)V

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method public acknowledgePurchaseInternal(Ljava/lang/String;)V
    .registers 4

    .line 173
    invoke-static {}, Lcom/android/billingclient/api/AcknowledgePurchaseParams;->newBuilder()Lcom/android/billingclient/api/AcknowledgePurchaseParams$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseParams$Builder;->setPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/AcknowledgePurchaseParams$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/AcknowledgePurchaseParams$Builder;->build()Lcom/android/billingclient/api/AcknowledgePurchaseParams;

    move-result-object p1

    .line 174
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$1;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;)V

    invoke-virtual {v0, p1, v1}, Lcom/android/billingclient/api/BillingClient;->acknowledgePurchase(Lcom/android/billingclient/api/AcknowledgePurchaseParams;Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;)V

    return-void
.end method

.method public getBillingClient()Lcom/android/billingclient/api/BillingClient;
    .registers 2

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    return-object v0
.end method

.method public isBillingServiceConnected()Z
    .registers 2

    .line 43
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingServiceConnected:Z

    return v0
.end method

.method public isPurchaseInProgress()Z
    .registers 2

    .line 58
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mPurchaseInProgress:Z

    return v0
.end method

.method public isSubscriptionsSupported()Z
    .registers 2

    .line 53
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mSubscriptionsSupported:Z

    return v0
.end method

.method synthetic lambda$retryBillingConnection$0$com-navngo-igo-javaclient-store-IgoStoreWorkerBase()V
    .registers 2

    .line 154
    invoke-static {}, Lcom/navngo/igo/javaclient/store/IgoStore;->shouldBindToBillingService()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    if-eqz v0, :cond_d

    .line 155
    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/BillingClient;->startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V

    :cond_d
    return-void
.end method

.method public onBillingServiceDisconnected()V
    .registers 3

    const-string v0, "IgoStoreWorkerBase"

    const-string v1, "Billing service disconnected."

    .line 128
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 129
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingServiceConnected:Z

    .line 130
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->retryBillingConnection()V

    return-void
.end method

.method public onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V
    .registers 4

    .line 135
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onBillingSetupFinished response code: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerBase"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_29

    const/4 v0, 0x3

    if-eq p1, v0, :cond_23

    .line 147
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->retryBillingConnection()V

    goto :goto_43

    :cond_23
    const-string p1, "Error initializing billing support, payments disabled"

    .line 144
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_43

    :cond_29
    const-string p1, "Billing service connected."

    .line 139
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 140
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingServiceConnected:Z

    .line 141
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    const-string v1, "subscriptions"

    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingClient;->isFeatureSupported(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    if-nez v0, :cond_40

    goto :goto_41

    :cond_40
    const/4 p1, 0x0

    :goto_41
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mSubscriptionsSupported:Z

    :goto_43
    return-void
.end method

.method public onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mPurchaseInProgress:Z

    .line 69
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    const-string v0, "IgoStoreWorkerBase"

    if-eqz p1, :cond_42

    const/4 p2, 0x1

    const-string v1, ""

    if-eq p1, p2, :cond_39

    const/4 p2, 0x7

    if-eq p1, p2, :cond_2c

    .line 97
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPurchasesUpdated: error, response code: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-static {p1, v1, v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_a7

    :cond_2c
    const-string p1, "onPurchasesUpdated: item already owned, starting restore"

    .line 91
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    sget-object p1, Lcom/navngo/igo/javaclient/store/IgoStore;->INSTANCE:Lcom/navngo/igo/javaclient/store/IgoStore;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mLastPurchaseID:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStore;->restoreItem(Ljava/lang/String;)V

    goto :goto_a7

    :cond_39
    const-string p1, "onPurchasesUpdated: purchase flow was canceled by the user"

    .line 85
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    invoke-static {p2, v1, v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_a7

    :cond_42
    if-nez p2, :cond_4a

    const-string p1, "onPurchasesUpdated: list of purchases is null"

    .line 73
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a7

    .line 77
    :cond_4a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPurchasesUpdated: received "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " new purchase(s)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_6b
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/Purchase;

    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "purchase.getSkus()="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getSkus()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", purchase.getPurchaseState()="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v2, v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_6b

    :cond_a7
    :goto_a7
    return-void
.end method

.method public purchaseProductInternal(Ljava/lang/String;)I
    .registers 6

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "purchaseProductInternal: Starting purchase for product \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerBase"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->getPurchaseProduct(Ljava/lang/String;)Lcom/android/billingclient/api/SkuDetails;

    move-result-object v0

    if-nez v0, :cond_37

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "purchaseProductInternal: Cannot find product + "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x6

    return p1

    .line 113
    :cond_37
    invoke-static {}, Lcom/android/billingclient/api/BillingFlowParams;->newBuilder()Lcom/android/billingclient/api/BillingFlowParams$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->setSkuDetails(Lcom/android/billingclient/api/SkuDetails;)Lcom/android/billingclient/api/BillingFlowParams$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingFlowParams$Builder;->build()Lcom/android/billingclient/api/BillingFlowParams;

    move-result-object v0

    .line 114
    iget-object v2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/android/billingclient/api/BillingClient;->launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;

    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    if-eqz v0, :cond_70

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "purchaseProductInternal: Error starting billing flow for product \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\', response code: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 121
    :cond_70
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mLastPurchaseID:Ljava/lang/String;

    const/4 p1, 0x1

    .line 122
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mPurchaseInProgress:Z

    const/4 p1, 0x0

    return p1
.end method

.method public setBindStatusInternal(Z)V
    .registers 3

    if-eqz p1, :cond_1e

    .line 162
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    if-nez v0, :cond_1e

    .line 163
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/billingclient/api/BillingClient;->newBuilder(Landroid/content/Context;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/android/billingclient/api/BillingClient$Builder;->setListener(Lcom/android/billingclient/api/PurchasesUpdatedListener;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingClient$Builder;->enablePendingPurchases()Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingClient$Builder;->build()Lcom/android/billingclient/api/BillingClient;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    .line 164
    invoke-virtual {p1, p0}, Lcom/android/billingclient/api/BillingClient;->startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V

    goto :goto_2a

    :cond_1e
    if-nez p1, :cond_2a

    .line 165
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    if-eqz p1, :cond_2a

    .line 166
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingClient;->endConnection()V

    const/4 p1, 0x0

    .line 167
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mBillingClient:Lcom/android/billingclient/api/BillingClient;

    :cond_2a
    :goto_2a
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .registers 2

    .line 38
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mContext:Landroid/content/Context;

    return-void
.end method

.method public setPurchaseInProgress(Z)V
    .registers 2

    .line 63
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->mPurchaseInProgress:Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerBase.AnonymousClass1 (com.navngo.igo.javaclient.store.IgoStoreWorkerBase$1)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$1;
.super Ljava/lang/Object;
.source "IgoStoreWorkerBase.java"

# interfaces
.implements Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->acknowledgePurchaseInternal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;)V
    .registers 2

    .line 174
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V
    .registers 5

    .line 177
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    const-string v0, "IgoStoreWorkerBase"

    if-eqz p1, :cond_1d

    .line 183
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "acknowledgePurchase error, code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_22

    :cond_1d
    const-string p1, "acknowledgePurchase was successful"

    .line 180
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_22
    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerBase$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.store.IgoStoreWorkerBase$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;->lambda$retryBillingConnection$0$com-navngo-igo-javaclient-store-IgoStoreWorkerBase()V

    return-void
.end method
