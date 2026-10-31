###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern (com.navngo.igo.javaclient.store.IgoStoreWorkerModern)
.class public Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;
.super Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;
.source "IgoStoreWorkerModern.java"


# static fields
.field private static final logname:Ljava/lang/String; = "IgoStoreWorkerModern"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerBase;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
    .registers 2

    .line 29
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->consumePurchaseInternal2(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object p0

    return-object p0
.end method

.method private consumePurchaseInternal2(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/CompletableFuture<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 285
    new-instance v0, Ljava/util/concurrent/CompletableFuture;

    invoke-direct {v0}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    .line 286
    invoke-static {}, Lcom/android/billingclient/api/ConsumeParams;->newBuilder()Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/billingclient/api/ConsumeParams$Builder;->setPurchaseToken(Ljava/lang/String;)Lcom/android/billingclient/api/ConsumeParams$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams$Builder;->build()Lcom/android/billingclient/api/ConsumeParams;

    move-result-object p1

    .line 287
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getBillingClient()Lcom/android/billingclient/api/BillingClient;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$7;

    invoke-direct {v2, p0, v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$7;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;)V

    invoke-virtual {v1, p1, v2}, Lcom/android/billingclient/api/BillingClient;->consumeAsync(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V

    return-object v0
.end method

.method private getPurchasesForType(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/CompletableFuture<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;>;"
        }
    .end annotation

    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPurchasesForType started for type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerModern"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    new-instance v0, Ljava/util/concurrent/CompletableFuture;

    invoke-direct {v0}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    .line 250
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getBillingClient()Lcom/android/billingclient/api/BillingClient;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;

    invoke-direct {v2, p0, p1, v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/lang/String;Ljava/util/concurrent/CompletableFuture;)V

    invoke-virtual {v1, p1, v2}, Lcom/android/billingclient/api/BillingClient;->queryPurchasesAsync(Ljava/lang/String;Lcom/android/billingclient/api/PurchasesResponseListener;)V

    return-object v0
.end method

.method private listSkuDetails(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/CompletableFuture<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/SkuDetails;",
            ">;>;>;"
        }
    .end annotation

    .line 104
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 105
    new-instance p1, Landroid/util/Pair;

    const/4 p2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p1, p2, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p1}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    move-result-object p1

    return-object p1

    .line 108
    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "listSkuDetails called for item type \'"

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

    const-string v1, "IgoStoreWorkerModern"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    new-instance v0, Ljava/util/concurrent/CompletableFuture;

    invoke-direct {v0}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    .line 110
    invoke-static {}, Lcom/android/billingclient/api/SkuDetailsParams;->newBuilder()Lcom/android/billingclient/api/SkuDetailsParams$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/android/billingclient/api/SkuDetailsParams$Builder;->setSkusList(Ljava/util/List;)Lcom/android/billingclient/api/SkuDetailsParams$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/billingclient/api/SkuDetailsParams$Builder;->setType(Ljava/lang/String;)Lcom/android/billingclient/api/SkuDetailsParams$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/SkuDetailsParams$Builder;->build()Lcom/android/billingclient/api/SkuDetailsParams;

    move-result-object p1

    .line 111
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getBillingClient()Lcom/android/billingclient/api/BillingClient;

    move-result-object p2

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$2;

    invoke-direct {v1, p0, v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$2;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;)V

    invoke-virtual {p2, p1, v1}, Lcom/android/billingclient/api/BillingClient;->querySkuDetailsAsync(Lcom/android/billingclient/api/SkuDetailsParams;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V

    return-object v0
.end method


# virtual methods
.method public consumePurchaseInternal(Ljava/lang/String;)V
    .registers 2

    .line 280
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->consumePurchaseInternal2(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    return-void
.end method

.method public debug_ResetWithConsumeAllInternal()V
    .registers 3

    .line 311
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchases()Ljava/util/concurrent/CompletableFuture;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/CompletableFuture;->thenAccept(Ljava/util/function/Consumer;)Ljava/util/concurrent/CompletableFuture;

    return-void
.end method

.method public getPurchaseProduct(Ljava/lang/String;)Lcom/android/billingclient/api/SkuDetails;
    .registers 5

    .line 133
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 134
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "subs."

    .line 135
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    const-string v1, "subs"

    goto :goto_15

    :cond_13
    const-string v1, "inapp"

    .line 136
    :goto_15
    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->listSkuDetails(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v0

    const/4 v1, 0x0

    .line 140
    :try_start_1a
    invoke-virtual {v0}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    .line 141
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_2b

    return-object v1

    .line 144
    :cond_2b
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/billingclient/api/SkuDetails;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_35} :catch_36

    move-object v1, p1

    :catch_36
    return-object v1
.end method

.method public getPurchases()Ljava/util/concurrent/CompletableFuture;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CompletableFuture<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;>;"
        }
    .end annotation

    const-string v0, "IgoStoreWorkerModern"

    const-string v1, "Starting getPurchases"

    .line 192
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    new-instance v0, Ljava/util/concurrent/CompletableFuture;

    invoke-direct {v0}, Ljava/util/concurrent/CompletableFuture;-><init>()V

    const-string v1, "inapp"

    .line 195
    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchasesForType(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v1

    .line 197
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->isSubscriptionsSupported()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_20

    const-string v2, "subs"

    .line 198
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchasesForType(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v2

    goto :goto_32

    .line 200
    :cond_20
    new-instance v2, Landroid/util/Pair;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v2, v4, v5}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v2}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v2

    :goto_32
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/util/concurrent/CompletableFuture;

    aput-object v1, v4, v3

    const/4 v3, 0x1

    aput-object v2, v4, v3

    .line 203
    invoke-static {v4}, Ljava/util/concurrent/CompletableFuture;->allOf([Ljava/util/concurrent/CompletableFuture;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v3

    .line 204
    new-instance v4, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;

    invoke-direct {v4, p0, v0, v1, v2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;)V

    invoke-virtual {v3, v4}, Ljava/util/concurrent/CompletableFuture;->whenComplete(Ljava/util/function/BiConsumer;)Ljava/util/concurrent/CompletableFuture;

    return-object v0
.end method

.method public requestProductListInternal(Ljava/lang/String;)V
    .registers 7

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requestProductListAsynch started for: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerModern"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    new-instance v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;-><init>(Ljava/lang/String;)V

    .line 40
    iget-object p1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v2, 0x0

    if-nez p1, :cond_2f

    const-string p1, "requestProductListAsynch: nothing to do"

    .line 41
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, ""

    .line 42
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    return-void

    .line 46
    :cond_2f
    iget-object p1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->inapp:Ljava/util/ArrayList;

    const-string v1, "inapp"

    invoke-direct {p0, p1, v1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->listSkuDetails(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object p1

    .line 48
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->isSubscriptionsSupported()Z

    move-result v1

    if-eqz v1, :cond_46

    .line 49
    iget-object v1, v0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->subs:Ljava/util/ArrayList;

    const-string v3, "subs"

    invoke-direct {p0, v1, v3}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->listSkuDetails(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v1

    goto :goto_58

    .line 51
    :cond_46
    new-instance v1, Landroid/util/Pair;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v1, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v1}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v1

    :goto_58
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/util/concurrent/CompletableFuture;

    aput-object p1, v3, v2

    const/4 v2, 0x1

    aput-object v1, v3, v2

    .line 54
    invoke-static {v3}, Ljava/util/concurrent/CompletableFuture;->allOf([Ljava/util/concurrent/CompletableFuture;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v2

    .line 55
    new-instance v3, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;

    invoke-direct {v3, p0, p1, v1, v0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;)V

    invoke-virtual {v2, v3}, Ljava/util/concurrent/CompletableFuture;->whenComplete(Ljava/util/function/BiConsumer;)Ljava/util/concurrent/CompletableFuture;

    return-void
.end method

.method public restoreItemInternal(Ljava/lang/String;)V
    .registers 4

    .line 153
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchases()Ljava/util/concurrent/CompletableFuture;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;

    invoke-direct {v1, p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/CompletableFuture;->whenComplete(Ljava/util/function/BiConsumer;)Ljava/util/concurrent/CompletableFuture;

    return-void
.end method

.method public restorePurchasesInternal()V
    .registers 3

    .line 176
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchases()Ljava/util/concurrent/CompletableFuture;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$4;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$4;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/CompletableFuture;->whenComplete(Ljava/util/function/BiConsumer;)Ljava/util/concurrent/CompletableFuture;

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass1 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$1)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Ljava/util/function/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->requestProductListInternal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/BiConsumer<",
        "Ljava/lang/Void;",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

.field final synthetic val$inappSkuDetailsFuture:Ljava/util/concurrent/CompletableFuture;

.field final synthetic val$skuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

.field final synthetic val$subsSkuDetailsFuture:Ljava/util/concurrent/CompletableFuture;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;)V
    .registers 5

    .line 55
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->val$inappSkuDetailsFuture:Ljava/util/concurrent/CompletableFuture;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->val$subsSkuDetailsFuture:Ljava/util/concurrent/CompletableFuture;

    iput-object p4, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->val$skuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 55
    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/lang/Throwable;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->accept(Ljava/lang/Void;Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Void;Ljava/lang/Throwable;)V
    .registers 10

    const-string p1, "IgoStoreWorkerModern"

    const-string v0, "requestProductListAsynch: processing listSkuDetails results"

    .line 58
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ""

    const/4 v1, 0x6

    if-eqz p2, :cond_16

    const-string p2, "requestProductListAsynch: error getting prices"

    .line 60
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    goto/16 :goto_d3

    .line 63
    :cond_16
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 65
    :try_start_1b
    iget-object v2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->val$inappSkuDetailsFuture:Ljava/util/concurrent/CompletableFuture;

    invoke-virtual {v2}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 66
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    .line 67
    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_34

    .line 68
    invoke-virtual {p2, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 71
    :cond_34
    iget-object v2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->val$subsSkuDetailsFuture:Ljava/util/concurrent/CompletableFuture;

    invoke-virtual {v2}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 72
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    .line 73
    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_4d

    .line 74
    invoke-virtual {p2, v3}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_4d} :catch_d4

    .line 84
    :cond_4d
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    .line 85
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$1;->val$skuListsParser:Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_bc

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 86
    invoke-virtual {p2, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/billingclient/api/SkuDetails;

    .line 87
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "requestProductListAsynch: price loop, item=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\', found=\'"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_82

    const/4 v3, 0x1

    :cond_82
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, ";"

    if-eqz v4, :cond_ac

    .line 90
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/android/billingclient/api/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5a

    .line 92
    :cond_ac
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5a

    .line 95
    :cond_bc
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requestProductListAsynch: received prices: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    :goto_d3
    return-void

    :catch_d4
    const-string p2, "requestProductListAsynch: exception in accept()"

    .line 77
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/store/IgoStore;->onProductListResult(ILjava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass2 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$2)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$2;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Lcom/android/billingclient/api/SkuDetailsResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->listSkuDetails(Ljava/util/ArrayList;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

.field final synthetic val$result:Ljava/util/concurrent/CompletableFuture;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;)V
    .registers 3

    .line 111
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$2;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$2;->val$result:Ljava/util/concurrent/CompletableFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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

    .line 114
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    .line 115
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "IgoStoreWorkerModern"

    if-nez p1, :cond_3d

    .line 117
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_11
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_51

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/billingclient/api/SkuDetails;

    .line 118
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "listSkuDetails: adding sku to map: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    invoke-virtual {v2}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    .line 122
    :cond_3d
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "listSkuDetails: error getting SKU details, code: "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    :cond_51
    iget-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$2;->val$result:Ljava/util/concurrent/CompletableFuture;

    new-instance v1, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v1}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass3 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$3)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Ljava/util/function/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->restoreItemInternal(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/BiConsumer<",
        "Landroid/util/Pair<",
        "Ljava/lang/Integer;",
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Lcom/android/billingclient/api/Purchase;",
        ">;>;",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

.field final synthetic val$productID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/lang/String;)V
    .registers 3

    .line 153
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;->val$productID:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Landroid/util/Pair;Ljava/lang/Throwable;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x6

    const-string v1, "IgoStoreWorkerModern"

    const-string v2, ""

    if-eqz p2, :cond_21

    .line 157
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Exception during restore for product "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;->val$productID:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    invoke-static {v0, v2, v2}, Lcom/navngo/igo/javaclient/store/IgoStore;->onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_85

    .line 160
    :cond_21
    iget-object p2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .line 161
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RestoreMap size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v3, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashMap;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;->val$productID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/billingclient/api/Purchase;

    if-nez v3, :cond_55

    move-object v4, v2

    goto :goto_59

    .line 163
    :cond_55
    invoke-virtual {v3}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v4

    :goto_59
    if-nez v3, :cond_5c

    goto :goto_60

    .line 164
    :cond_5c
    invoke-virtual {v3}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v2

    :goto_60
    if-nez v3, :cond_63

    goto :goto_64

    :cond_63
    move v0, p2

    .line 166
    :goto_64
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Restore for "

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;->val$productID:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " result="

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    invoke-static {v0, v4, v2}, Lcom/navngo/igo/javaclient/store/IgoStore;->onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V

    :goto_85
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 153
    check-cast p1, Landroid/util/Pair;

    check-cast p2, Ljava/lang/Throwable;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$3;->accept(Landroid/util/Pair;Ljava/lang/Throwable;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass4 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$4)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$4;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Ljava/util/function/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->restorePurchasesInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/BiConsumer<",
        "Landroid/util/Pair<",
        "Ljava/lang/Integer;",
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Lcom/android/billingclient/api/Purchase;",
        ">;>;",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;)V
    .registers 2

    .line 176
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$4;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Landroid/util/Pair;Ljava/lang/Throwable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    if-eqz p2, :cond_a

    const/4 p1, 0x6

    const/4 p2, 0x0

    new-array p2, p2, [B

    .line 180
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStore;->onRestoreResult(I[B)V

    goto :goto_34

    .line 182
    :cond_a
    iget-object p2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashMap;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/store/IgoStore;->SerializeRestoreMap(Ljava/util/HashMap;)[B

    move-result-object p2

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bufsize:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerModern"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStore;->onRestoreResult(I[B)V

    :goto_34
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 176
    check-cast p1, Landroid/util/Pair;

    check-cast p2, Ljava/lang/Throwable;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$4;->accept(Landroid/util/Pair;Ljava/lang/Throwable;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass5 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$5)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Ljava/util/function/BiConsumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchases()Ljava/util/concurrent/CompletableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/BiConsumer<",
        "Ljava/lang/Void;",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

.field final synthetic val$inappFuture:Ljava/util/concurrent/CompletableFuture;

.field final synthetic val$result:Ljava/util/concurrent/CompletableFuture;

.field final synthetic val$subsFuture:Ljava/util/concurrent/CompletableFuture;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;Ljava/util/concurrent/CompletableFuture;)V
    .registers 5

    .line 204
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$result:Ljava/util/concurrent/CompletableFuture;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$inappFuture:Ljava/util/concurrent/CompletableFuture;

    iput-object p4, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$subsFuture:Ljava/util/concurrent/CompletableFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 204
    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/lang/Throwable;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->accept(Ljava/lang/Void;Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Void;Ljava/lang/Throwable;)V
    .registers 9

    const-string p1, "IgoStoreWorkerModern"

    if-eqz p2, :cond_1f

    const-string p2, "getPurchases finished with error"

    .line 208
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$result:Ljava/util/concurrent/CompletableFuture;

    new-instance p2, Landroid/util/Pair;

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p2, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, p2}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    goto/16 :goto_a7

    .line 214
    :cond_1f
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 217
    :try_start_27
    iget-object v3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$inappFuture:Ljava/util/concurrent/CompletableFuture;

    invoke-virtual {v3}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2f} :catch_44

    .line 218
    :try_start_2f
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_45

    .line 219
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_41} :catch_45

    move v4, v0

    const/4 v0, 0x0

    goto :goto_46

    :catch_44
    move-object v3, v1

    :catch_45
    :cond_45
    const/4 v4, 0x0

    .line 225
    :goto_46
    :try_start_46
    iget-object v5, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$subsFuture:Ljava/util/concurrent/CompletableFuture;

    invoke-virtual {v5}, Ljava/util/concurrent/CompletableFuture;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Pair;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_4e} :catch_69

    if-eqz v0, :cond_66

    .line 226
    :try_start_50
    iget-object v1, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_66

    .line 227
    iget-object v1, v5, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_62} :catch_64

    move v4, v0

    goto :goto_67

    :catch_64
    move-object v1, v5

    goto :goto_69

    :cond_66
    move v2, v0

    :goto_67
    move v0, v2

    goto :goto_6a

    :catch_69
    :goto_69
    move-object v5, v1

    :goto_6a
    if-eqz v0, :cond_7e

    if-eqz v3, :cond_75

    .line 233
    iget-object v1, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    :cond_75
    if-eqz v5, :cond_7e

    .line 234
    iget-object v1, v5, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p2, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 236
    :cond_7e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPurchases finished with: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_8d

    const-string v0, "success"

    goto :goto_8f

    :cond_8d
    const-string v0, "failure"

    :goto_8f
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$5;->val$result:Ljava/util/concurrent/CompletableFuture;

    new-instance v0, Landroid/util/Pair;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    :goto_a7
    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass6 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$6)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Lcom/android/billingclient/api/PurchasesResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->getPurchasesForType(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

.field final synthetic val$InappType:Ljava/lang/String;

.field final synthetic val$result:Ljava/util/concurrent/CompletableFuture;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/lang/String;Ljava/util/concurrent/CompletableFuture;)V
    .registers 4

    .line 250
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;->val$InappType:Ljava/lang/String;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;->val$result:Ljava/util/concurrent/CompletableFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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

    .line 253
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPurchasesForType response code for type \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;->val$InappType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\': "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStoreWorkerModern"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_3a

    .line 270
    iget-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;->val$result:Ljava/util/concurrent/CompletableFuture;

    new-instance v0, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v0}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    goto :goto_95

    .line 257
    :cond_3a
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 258
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_43
    :goto_43
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_87

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/billingclient/api/Purchase;

    .line 259
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getSkus()Ljava/util/ArrayList;

    move-result-object v3

    .line 260
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_76

    .line 261
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getPurchasesForType: ignoring extra skus for purchase: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    :cond_76
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getPurchaseState()I

    move-result v4

    if-ne v4, v5, :cond_43

    const/4 v4, 0x0

    .line 264
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_43

    .line 267
    :cond_87
    iget-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$6;->val$result:Ljava/util/concurrent/CompletableFuture;

    new-instance v1, Landroid/util/Pair;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p2, v1}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    :goto_95
    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass7 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$7)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$7;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Lcom/android/billingclient/api/ConsumeResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->consumePurchaseInternal2(Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

.field final synthetic val$result:Ljava/util/concurrent/CompletableFuture;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/util/concurrent/CompletableFuture;)V
    .registers 3

    .line 287
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$7;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$7;->val$result:Ljava/util/concurrent/CompletableFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
    .registers 6

    .line 290
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p2

    const-string v0, "IgoStoreWorkerModern"

    if-eqz p2, :cond_2b

    const/16 v1, 0x8

    if-eq p2, v1, :cond_25

    .line 299
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "consumePurchaseInternal error, code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30

    :cond_25
    const-string p1, "consumePurchaseInternal error: user does not own this item"

    .line 296
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_30

    :cond_2b
    const-string p1, "consumeAsync was successful"

    .line 293
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    :goto_30
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$7;->val$result:Ljava/util/concurrent/CompletableFuture;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/concurrent/CompletableFuture;->complete(Ljava/lang/Object;)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass8 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$8)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->debug_ResetWithConsumeAllInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Landroid/util/Pair<",
        "Ljava/lang/Integer;",
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Lcom/android/billingclient/api/Purchase;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;)V
    .registers 2

    .line 311
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Landroid/util/Pair;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;)V"
        }
    .end annotation

    .line 314
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-string v1, "IgoStoreWorkerModern"

    if-eqz v0, :cond_21

    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPurchases returned with error, code="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 319
    :cond_21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RestoreMap size"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v2, 0x0

    aput v2, v0, v2

    .line 321
    iget-object v2, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 322
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/billingclient/api/Purchase;

    invoke-virtual {v4}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v4

    .line 323
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "calling consumePurchaseInternal for product "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    iget-object v3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;->this$0:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;->access$000(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;Ljava/lang/String;)Ljava/util/concurrent/CompletableFuture;

    move-result-object v3

    new-instance v4, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;

    invoke-direct {v4, p0, v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;-><init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;[ILandroid/util/Pair;)V

    invoke-virtual {v3, v4}, Ljava/util/concurrent/CompletableFuture;->thenAccept(Ljava/util/function/Consumer;)Ljava/util/concurrent/CompletableFuture;

    goto :goto_4f

    :cond_8e
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .registers 2

    .line 311
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;->accept(Landroid/util/Pair;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass8.AnonymousClass1 (com.navngo.igo.javaclient.store.IgoStoreWorkerModern$8$1)
.class Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;
.super Ljava/lang/Object;
.source "IgoStoreWorkerModern.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;->accept(Landroid/util/Pair;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Consumer<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;

.field final synthetic val$itemsConsumed:[I

.field final synthetic val$result:Landroid/util/Pair;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;[ILandroid/util/Pair;)V
    .registers 4

    .line 324
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;->this$1:Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;->val$itemsConsumed:[I

    iput-object p3, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;->val$result:Landroid/util/Pair;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .registers 4

    .line 327
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;->val$itemsConsumed:[I

    const/4 v0, 0x0

    aget v1, p1, v0

    add-int/lit8 v1, v1, 0x1

    aput v1, p1, v0

    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;->val$result:Landroid/util/Pair;

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result p1

    if-ne v1, p1, :cond_1c

    const-string p1, "IgoStoreWorkerModern"

    const-string v0, "GOOGLE STORE RESET finished"

    .line 328
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1c
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .registers 2

    .line 324
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern$8$1;->accept(Ljava/lang/Integer;)V

    return-void
.end method
