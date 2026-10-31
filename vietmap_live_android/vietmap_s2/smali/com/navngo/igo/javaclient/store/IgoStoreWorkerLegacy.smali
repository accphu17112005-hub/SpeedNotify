###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy (com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy)
.class public Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;
.super Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;
.source "IgoStoreWorkerLegacy.java"

# interfaces
.implements Lcom/android/billingclient/api/SkuDetailsResponseListener;
.implements Lcom/android/billingclient/api/PurchasesResponseListener;


# static fields
.field private static final logname:Ljava/lang/String; = "IgoStoreWorkerLegacy"


# instance fields
.field private final mGetPurchasesEvent:Ljava/lang/Object;

.field private mGetPurchasesFinished:Z

.field private mGetPurchasesResponseCode:I

.field private mPendingPurchaseQueries:I

.field private mPendingSkuDetailsQueries:I

.field private mPurchasesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;"
        }
    .end annotation
.end field

.field private mSkuDetailsMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/SkuDetails;",
            ">;"
        }
    .end annotation
.end field

.field private mSkuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 21
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuDetailsMap:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingSkuDetailsQueries:I

    .line 31
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPurchasesMap:Ljava/util/HashMap;

    .line 32
    iput v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    .line 33
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesEvent:Ljava/lang/Object;

    .line 34
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesFinished:Z

    .line 35
    iput v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesResponseCode:I

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V
    .registers 1

    .line 21
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->getPurchasesLegacy()V

    return-void
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)I
    .registers 1

    .line 21
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->waitForPurchasesQueryBlocking()I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)Ljava/util/HashMap;
    .registers 1

    .line 21
    iget-object p0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPurchasesMap:Ljava/util/HashMap;

    return-object p0
.end method

.method private getPurchasesForTypeLegacy(Ljava/lang/String;)V
    .registers 4

    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPurchasesForTypeLegacy started for type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerLegacy"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->getBillingClient()Lcom/android/billingclient/api/BillingClient;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lcom/android/billingclient/api/BillingClient;->queryPurchasesAsync(Ljava/lang/String;Lcom/android/billingclient/api/PurchasesResponseListener;)V

    return-void
.end method

.method private getPurchasesLegacy()V
    .registers 3

    const-string v0, "IgoStoreWorkerLegacy"

    const-string v1, "Starting getPurchasesLegacy"

    .line 195
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    monitor-enter p0

    const/4 v0, 0x0

    .line 198
    :try_start_9
    iput v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesResponseCode:I

    .line 199
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesFinished:Z

    .line 200
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPurchasesMap:Ljava/util/HashMap;

    .line 201
    iget v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    const-string v0, "inapp"

    .line 202
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->getPurchasesForTypeLegacy(Ljava/lang/String;)V

    .line 203
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->isSubscriptionsSupported()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 204
    iget v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    const-string v0, "subs"

    .line 205
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->getPurchasesForTypeLegacy(Ljava/lang/String;)V

    .line 207
    :cond_30
    monitor-exit p0

    return-void

    :catchall_32
    move-exception v0

    monitor-exit p0
    :try_end_34
    .catchall {:try_start_9 .. :try_end_34} :catchall_32

    throw v0
.end method

.method private listSkuDetailsLegacy(Ljava/util/ArrayList;Ljava/lang/String;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/SkuDetailsResponseListener;",
            ")V"
        }
    .end annotation

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "listSkuDetailsLegacy called for item type \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\' with "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " SKUs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerLegacy"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    invoke-static {}, Lcom/android/billingclient/api/SkuDetailsParams;->newBuilder()Lcom/android/billingclient/api/SkuDetailsParams$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/SkuDetailsParams$Builder;->setSkusList(Ljava/util/List;)Lcom/android/billingclient/api/SkuDetailsParams$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/billingclient/api/SkuDetailsParams$Builder;->setType(Ljava/lang/String;)Lcom/android/billingclient/api/SkuDetailsParams$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/SkuDetailsParams$Builder;->build()Lcom/android/billingclient/api/SkuDetailsParams;

    move-result-object p1

    .line 88
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->getBillingClient()Lcom/android/billingclient/api/BillingClient;

    move-result-object p2

    invoke-virtual {p2, p1, p3}, Lcom/android/billingclient/api/BillingClient;->querySkuDetailsAsync(Lcom/android/billingclient/api/SkuDetailsParams;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V

    return-void
.end method

.method private processPurchasesResponse()V
    .registers 3

    const-string v0, "IgoStoreWorkerLegacy"

    const-string v1, "processPurchasesResponse"

    .line 154
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesEvent:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 156
    :try_start_b
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesFinished:Z

    .line 157
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesEvent:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 158
    monitor-exit v0

    return-void

    :catchall_14
    move-exception v1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_b .. :try_end_16} :catchall_14

    throw v1
.end method

.method private declared-synchronized processSkuDetailsResponse()V
    .registers 10

    monitor-enter p0

    :try_start_1
    const-string v0, "IgoStoreWorkerLegacy"

    const-string v1, "processSkuDetailsResponse"

    .line 39
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    .line 41
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuDetailsMap:Ljava/util/HashMap;

    .line 45
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2}, Ljava/lang/String;-><init>()V

    .line 46
    iget-object v0, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_7d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 47
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/billingclient/api/SkuDetails;

    const-string v6, "IgoStoreWorkerLegacy"

    .line 48
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "requestProductListAsynch: price loop, item=\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\', found=\'"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v5, :cond_41

    const/4 v4, 0x1

    :cond_41
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, "\'"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_6b

    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/android/billingclient/api/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ";"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_17

    .line 53
    :cond_6b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ";"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_17

    :cond_7d
    const-string v0, "IgoStoreWorkerLegacy"

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestProductListAsynch: received prices: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-static {v4, v2}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    const/4 v0, 0x0

    .line 59
    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;
    :try_end_99
    .catchall {:try_start_1 .. :try_end_99} :catchall_9b

    .line 60
    monitor-exit p0

    return-void

    :catchall_9b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private waitForPurchasesQueryBlocking()I
    .registers 3

    .line 212
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesEvent:Ljava/lang/Object;

    monitor-enter v0

    .line 213
    :catch_3
    :goto_3
    :try_start_3
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesFinished:Z
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_11

    if-nez v1, :cond_d

    .line 215
    :try_start_7
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesEvent:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_c} :catch_3
    .catchall {:try_start_7 .. :try_end_c} :catchall_11

    goto :goto_3

    .line 219
    :cond_d
    :try_start_d
    iget v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesResponseCode:I

    .line 220
    monitor-exit v0

    return v1

    :catchall_11
    move-exception v1

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_d .. :try_end_13} :catchall_11

    throw v1
.end method


# virtual methods
.method public consumePurchaseInternal(Ljava/lang/String;)V
    .registers 4

    .line 247
    invoke-static {}, Lcom/android/billingclient/api/ConsumeParams;->newBuilder()Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/ConsumeParams$Builder;->setPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams$Builder;->build()Lcom/android/billingclient/api/ConsumeParams;

    move-result-object p1

    .line 248
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->getBillingClient()Lcom/android/billingclient/api/BillingClient;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$3;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$3;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V

    invoke-virtual {v0, p1, v1}, Lcom/android/billingclient/api/BillingClient;->consumeAsync(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V

    return-void
.end method

.method public debug_ResetWithConsumeAllInternal()V
    .registers 1

    return-void
.end method

.method public getPurchaseProduct(Ljava/lang/String;)Lcom/android/billingclient/api/SkuDetails;
    .registers 3

    .line 125
    monitor-enter p0

    .line 126
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuDetailsMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/billingclient/api/SkuDetails;

    .line 127
    monitor-exit p0

    return-object p1

    :catchall_b
    move-exception p1

    monitor-exit p0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_b

    throw p1
.end method

.method public onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)V"
        }
    .end annotation

    .line 163
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    const-string v0, "IgoStoreWorkerLegacy"

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onQueryPurchasesResponse response code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x1

    if-eqz p1, :cond_23

    goto :goto_6c

    .line 168
    :cond_23
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_27
    :goto_27
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/billingclient/api/Purchase;

    .line 169
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getSkus()Ljava/util/ArrayList;

    move-result-object v3

    .line 170
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v1, :cond_5b

    const-string v4, "IgoStoreWorkerLegacy"

    .line 171
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onQueryPurchasesResponse: ignoring extra skus for purchase: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v3, v1, v6}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :cond_5b
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v4

    if-ne v4, v1, :cond_27

    const/4 v4, 0x0

    .line 174
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_27

    .line 182
    :cond_6c
    :goto_6c
    monitor-enter p0

    if-nez p1, :cond_75

    .line 184
    :try_start_6f
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPurchasesMap:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    goto :goto_77

    .line 186
    :cond_75
    iput p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mGetPurchasesResponseCode:I

    .line 188
    :goto_77
    iget p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    sub-int/2addr p1, v1

    iput p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingPurchaseQueries:I

    if-nez p1, :cond_81

    .line 189
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->processPurchasesResponse()V

    .line 191
    :cond_81
    monitor-exit p0

    return-void

    :catchall_83
    move-exception p1

    monitor-exit p0
    :try_end_85
    .catchall {:try_start_6f .. :try_end_85} :catchall_83

    throw p1
.end method

.method public onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/SkuDetails;",
            ">;)V"
        }
    .end annotation

    .line 64
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-nez p1, :cond_3d

    .line 67
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_f
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_53

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/SkuDetails;

    const-string v2, "IgoStoreWorkerLegacy"

    .line 68
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSkuDetailsResponse: adding sku to map: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    invoke-virtual {v1}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    :cond_3d
    const-string p2, "IgoStoreWorkerLegacy"

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSkuDetailsResponse: error getting SKU details, code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    :cond_53
    monitor-enter p0

    if-nez p1, :cond_5b

    .line 77
    :try_start_56
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuDetailsMap:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 79
    :cond_5b
    iget p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingSkuDetailsQueries:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingSkuDetailsQueries:I

    if-nez p1, :cond_66

    .line 80
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->processSkuDetailsResponse()V

    .line 82
    :cond_66
    monitor-exit p0

    return-void

    :catchall_68
    move-exception p1

    monitor-exit p0
    :try_end_6a
    .catchall {:try_start_56 .. :try_end_6a} :catchall_68

    throw p1
.end method

.method public requestProductListInternal(Ljava/lang/String;)V
    .registers 5

    const-string v0, "IgoStoreWorkerLegacy"

    .line 94
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestProductListInternal started for: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    new-instance v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;-><init>(Ljava/lang/String;)V

    .line 97
    iget-object p1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_31

    const-string p1, "IgoStoreWorkerLegacy"

    const-string v0, "requestProductListInternal: nothing to do"

    .line 98
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, ""

    const/4 v0, 0x0

    .line 99
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    return-void

    .line 103
    :cond_31
    monitor-enter p0

    .line 104
    :try_start_32
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    if-eqz p1, :cond_45

    const-string p1, "IgoStoreWorkerLegacy"

    const-string v0, "requestProductListInternal: error: a query is already in progress!"

    .line 106
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x6

    const-string v0, ""

    .line 107
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    .line 108
    monitor-exit p0

    return-void

    .line 111
    :cond_45
    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mSkuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    const/4 p1, 0x0

    add-int/lit8 p1, p1, 0x1

    .line 113
    iput p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingSkuDetailsQueries:I

    .line 114
    iget-object p1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->inapp:Ljava/util/ArrayList;

    const-string v1, "inapp"

    invoke-direct {p0, p1, v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->listSkuDetailsLegacy(Ljava/util/ArrayList;Ljava/lang/String;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V

    .line 115
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->isSubscriptionsSupported()Z

    move-result p1

    if-eqz p1, :cond_6e

    iget-object p1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->subs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_6e

    .line 116
    iget p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingSkuDetailsQueries:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->mPendingSkuDetailsQueries:I

    .line 117
    iget-object p1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->subs:Ljava/util/ArrayList;

    const-string v0, "subs"

    invoke-direct {p0, p1, v0, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->listSkuDetailsLegacy(Ljava/util/ArrayList;Ljava/lang/String;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V

    .line 119
    :cond_6e
    monitor-exit p0

    return-void

    :catchall_70
    move-exception p1

    monitor-exit p0
    :try_end_72
    .catchall {:try_start_32 .. :try_end_72} :catchall_70

    throw p1
.end method

.method public restoreItemInternal(Ljava/lang/String;)V
    .registers 4

    .line 133
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;

    invoke-direct {v1, p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 150
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public restorePurchasesInternal()V
    .registers 3

    .line 232
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 242
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.AnonymousClass1 (com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy$1)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;
.super Ljava/lang/Object;
.source "IgoStoreWorkerLegacy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->restoreItemInternal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

.field final synthetic val$productID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;Ljava/lang/String;)V
    .registers 3

    .line 133
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->val$productID:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$000(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V

    .line 137
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$100(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)I

    move-result v0

    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RestoreMap size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$200(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)Ljava/util/HashMap;

    move-result-object v2

    if-eqz v2, :cond_2c

    iget-object v2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$200(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_2e

    :cond_2c
    const-string v2, "null"

    :goto_2e
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IgoStoreWorkerLegacy"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v0, :cond_4b

    .line 142
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$200(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->val$productID:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/Purchase;

    goto :goto_4c

    :cond_4b
    const/4 v1, 0x0

    :goto_4c
    const-string v3, ""

    if-nez v1, :cond_52

    move-object v4, v3

    goto :goto_56

    .line 144
    :cond_52
    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v4

    :goto_56
    if-nez v1, :cond_59

    goto :goto_5d

    .line 145
    :cond_59
    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v3

    :goto_5d
    if-nez v1, :cond_60

    const/4 v0, 0x6

    .line 147
    :cond_60
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Restore for "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$1;->val$productID:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " result="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    invoke-static {v0, v4, v3}, Lcom/navngo/igo/javaclient/store/IgoStore;->onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.AnonymousClass2 (com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy$2)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;
.super Ljava/lang/Object;
.source "IgoStoreWorkerLegacy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->restorePurchasesInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V
    .registers 2

    .line 232
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 235
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$000(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V

    .line 236
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$100(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)I

    move-result v0

    .line 238
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$2;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->access$200(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)Ljava/util/HashMap;

    move-result-object v1

    invoke-static {v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->SerializeRestoreMap(Ljava/util/HashMap;)[B

    move-result-object v1

    .line 239
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bufsize:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "IgoStoreWorkerLegacy"

    invoke-static {v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onRestoreResult(I[B)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.AnonymousClass3 (com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy$3)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$3;
.super Ljava/lang/Object;
.source "IgoStoreWorkerLegacy.java"

# interfaces
.implements Lcom/android/billingclient/api/ConsumeResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;->consumePurchaseInternal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;)V
    .registers 2

    .line 248
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy$3;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
    .registers 5

    .line 251
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p2

    const-string v0, "IgoStoreWorkerLegacy"

    if-eqz p2, :cond_2b

    const/16 v1, 0x8

    if-eq p2, v1, :cond_25

    .line 260
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "consumePurchaseInternal error, code: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30

    :cond_25
    const-string p1, "consumePurchaseInternal error: user does not own this item"

    .line 257
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30

    :cond_2b
    const-string p1, "consumeAsync was successful"

    .line 254
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_30
    return-void
.end method
