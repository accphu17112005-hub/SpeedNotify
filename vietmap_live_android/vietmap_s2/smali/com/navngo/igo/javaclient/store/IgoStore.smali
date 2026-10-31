###### Class com.navngo.igo.javaclient.store.IgoStore (com.navngo.igo.javaclient.store.IgoStore)
.class public final enum Lcom/navngo/igo/javaclient/store/IgoStore;
.super Ljava/lang/Enum;
.source "IgoStore.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;,
        Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/store/IgoStore;",
        ">;",
        "Lcom/navngo/igo/javaclient/functors/IFunctorCollection;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/store/IgoStore;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/store/IgoStore;

.field public static final SUBS_PREFIX:Ljava/lang/String; = "subs."

.field private static final logname:Ljava/lang/String; = "IgoStore"


# instance fields
.field mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 30
    new-instance v0, Lcom/navngo/igo/javaclient/store/IgoStore;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/store/IgoStore;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/store/IgoStore;->INSTANCE:Lcom/navngo/igo/javaclient/store/IgoStore;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/store/IgoStore;

    aput-object v0, v1, v2

    .line 29
    sput-object v1, Lcom/navngo/igo/javaclient/store/IgoStore;->$VALUES:[Lcom/navngo/igo/javaclient/store/IgoStore;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 54
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    .line 60
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 61
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x18

    if-lt p2, v0, :cond_1a

    .line 62
    new-instance p2, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;

    invoke-direct {p2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerModern;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    goto :goto_21

    .line 64
    :cond_1a
    new-instance p2, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;

    invoke-direct {p2}, Lcom/navngo/igo/javaclient/store/IgoStoreWorkerLegacy;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    .line 66
    :goto_21
    iget-object p2, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {p2, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->setContext(Landroid/content/Context;)V

    return-void
.end method

.method public static SerializeRestoreMap(Ljava/util/HashMap;)[B
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/billingclient/api/Purchase;",
            ">;)[B"
        }
    .end annotation

    .line 182
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>()V

    .line 183
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 185
    :try_start_a
    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 186
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/billingclient/api/Purchase;

    .line 187
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getOriginalJson()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 188
    invoke-virtual {v2}, Lcom/android/billingclient/api/Purchase;->getSignature()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_33} :catch_3b

    goto :goto_19

    .line 194
    :cond_34
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object p0

    iget-object p0, p0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    return-object p0

    :catch_3b
    move-exception p0

    const-string v0, "IgoStore"

    const-string v1, "Serializing restore map failed"

    .line 191
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    new-array p0, p0, [B

    return-object p0
.end method

.method static onProductListResult(ILjava/lang/String;)V
    .registers 5

    .line 105
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    aput-object p1, v1, p0

    const-string p0, "android.store.on_product_list_result"

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method static onPurchaseResult(ILjava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 108
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    aput-object p1, v1, p0

    const/4 p0, 0x2

    aput-object p2, v1, p0

    const-string p0, "android.store.on_purchase_result"

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method static onRestoreResult(I[B)V
    .registers 5

    .line 111
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    aput-object p1, v1, p0

    const-string p0, "android.store.on_restore_result"

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method static shouldBindToBillingService()Z
    .registers 2

    .line 72
    new-instance v0, Ljava/io/File;

    const-string v1, "webshop_mode"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 73
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/store/IgoStore;
    .registers 2

    .line 29
    const-class v0, Lcom/navngo/igo/javaclient/store/IgoStore;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/store/IgoStore;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/store/IgoStore;
    .registers 1

    .line 29
    sget-object v0, Lcom/navngo/igo/javaclient/store/IgoStore;->$VALUES:[Lcom/navngo/igo/javaclient/store/IgoStore;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/store/IgoStore;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/store/IgoStore;

    return-object v0
.end method


# virtual methods
.method public acknowledgePurchase(Ljava/lang/String;)V
    .registers 3

    .line 207
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isBillingServiceConnected()Z

    move-result v0

    if-nez v0, :cond_10

    const-string p1, "IgoStore"

    const-string v0, "acknowledgePurchase: Billing service is not connected"

    .line 208
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 212
    :cond_10
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->acknowledgePurchaseInternal(Ljava/lang/String;)V

    return-void
.end method

.method public consumePurchase(Ljava/lang/String;)V
    .registers 3

    .line 198
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isBillingServiceConnected()Z

    move-result v0

    if-nez v0, :cond_10

    const-string p1, "IgoStore"

    const-string v0, "consumePurchase: Billing service is not connected"

    .line 199
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 203
    :cond_10
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->consumePurchaseInternal(Ljava/lang/String;)V

    return-void
.end method

.method public debug_ResetWithConsumeAll()V
    .registers 3

    const-string v0, "IgoStore"

    const-string v1, "GOOGLE STORE RESET started"

    .line 222
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->debug_ResetWithConsumeAllInternal()V

    return-void
.end method

.method public init()V
    .registers 3

    .line 90
    invoke-static {}, Lcom/navngo/igo/javaclient/store/IgoStore;->shouldBindToBillingService()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 91
    new-instance v0, Lcom/navngo/igo/javaclient/store/IgoStore$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/store/IgoStore$1;-><init>(Lcom/navngo/igo/javaclient/store/IgoStore;)V

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->addEngineStoppedCallback(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    .line 97
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/store/IgoStore;->setBindStatus(Z)V

    goto :goto_1a

    :cond_13
    const-string v0, "IgoStore"

    const-string v1, "IgoStore(): Bind to billing service skipped"

    .line 100
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1a
    return-void
.end method

.method public pendingPurchaseTimeout()V
    .registers 3

    .line 146
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isPurchaseInProgress()Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "IgoStore"

    const-string v1, "ERROR: Purchase timeout occured, but there is no pending purchase "

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    :cond_f
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->setPurchaseInProgress(Z)V

    return-void
.end method

.method public purchaseProduct(Ljava/lang/String;)I
    .registers 4

    .line 151
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isPurchaseInProgress()Z

    move-result v0

    const-string v1, "IgoStore"

    if-eqz v0, :cond_11

    const-string p1, "purchaseProduct: Cannot start purchase (pending purchase is in progress)"

    .line 152
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x6

    return p1

    .line 156
    :cond_11
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isBillingServiceConnected()Z

    move-result v0

    if-nez v0, :cond_20

    const-string p1, "purchaseProduct: Billing service is not connected"

    .line 157
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    return p1

    .line 161
    :cond_20
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->purchaseProductInternal(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public registerFunctors()V
    .registers 4

    .line 77
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.store.request_product_list"

    const-string v2, "requestProductList"

    .line 78
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.purchase_product"

    const-string v2, "purchaseProduct"

    .line 79
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.pending_purchase_timeout"

    const-string v2, "pendingPurchaseTimeout"

    .line 80
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.restore_purchases"

    const-string v2, "restorePurchases"

    .line 81
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.consume_purchase"

    const-string v2, "consumePurchase"

    .line 82
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.acknowledge_purchase"

    const-string v2, "acknowledgePurchase"

    .line 83
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.set_bind_status"

    const-string v2, "setBindStatus"

    .line 84
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.store.debug_reset_with_consume_all"

    const-string v2, "debug_ResetWithConsumeAll"

    .line 85
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/store/IgoStore;->init()V

    return-void
.end method

.method public requestProductList(Ljava/lang/String;)I
    .registers 3

    .line 115
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isBillingServiceConnected()Z

    move-result v0

    if-nez v0, :cond_11

    const-string p1, "IgoStore"

    const-string v0, "requestProductList: Billing service is not connected"

    .line 116
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    return p1

    .line 120
    :cond_11
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->requestProductListInternal(Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method

.method public restoreItem(Ljava/lang/String;)V
    .registers 4

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "restoreItem called for product: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStore"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->restoreItemInternal(Ljava/lang/String;)V

    return-void
.end method

.method public restorePurchases()V
    .registers 3

    const-string v0, "IgoStore"

    const-string v1, "restorePurchases"

    .line 171
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->isBillingServiceConnected()Z

    move-result v1

    if-nez v1, :cond_1c

    const-string v1, "restorePurchases: Billing service is not connected"

    .line 173
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x1

    const/4 v1, 0x0

    new-array v1, v1, [B

    .line 174
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->onRestoreResult(I[B)V

    return-void

    .line 178
    :cond_1c
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->restorePurchasesInternal()V

    return-void
.end method

.method public setBindStatus(Z)V
    .registers 4

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setBindStatus("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoStore"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore;->mWorker:Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;->setBindStatusInternal(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStore.AnonymousClass1 (com.navngo.igo.javaclient.store.IgoStore$1)
.class Lcom/navngo/igo/javaclient/store/IgoStore$1;
.super Ljava/lang/Object;
.source "IgoStore.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/store/IgoStore;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/store/IgoStore;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/store/IgoStore;)V
    .registers 2

    .line 91
    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStore$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 94
    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore$1;->this$0:Lcom/navngo/igo/javaclient/store/IgoStore;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/store/IgoStore;->setBindStatus(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker (com.navngo.igo.javaclient.store.IgoStore$IgoStoreWorker)
.class public interface abstract Lcom/navngo/igo/javaclient/store/IgoStore$IgoStoreWorker;
.super Ljava/lang/Object;
.source "IgoStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/store/IgoStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IgoStoreWorker"
.end annotation


# virtual methods
.method public abstract acknowledgePurchaseInternal(Ljava/lang/String;)V
.end method

.method public abstract consumePurchaseInternal(Ljava/lang/String;)V
.end method

.method public abstract debug_ResetWithConsumeAllInternal()V
.end method

.method public abstract getBillingClient()Lcom/android/billingclient/api/BillingClient;
.end method

.method public abstract getPurchaseProduct(Ljava/lang/String;)Lcom/android/billingclient/api/SkuDetails;
.end method

.method public abstract isBillingServiceConnected()Z
.end method

.method public abstract isPurchaseInProgress()Z
.end method

.method public abstract isSubscriptionsSupported()Z
.end method

.method public abstract purchaseProductInternal(Ljava/lang/String;)I
.end method

.method public abstract requestProductListInternal(Ljava/lang/String;)V
.end method

.method public abstract restoreItemInternal(Ljava/lang/String;)V
.end method

.method public abstract restorePurchasesInternal()V
.end method

.method public abstract setBindStatusInternal(Z)V
.end method

.method public abstract setContext(Landroid/content/Context;)V
.end method

.method public abstract setPurchaseInProgress(Z)V
.end method

###### Class com.navngo.igo.javaclient.store.IgoStore.SkuListsParser (com.navngo.igo.javaclient.store.IgoStore$SkuListsParser)
.class public Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;
.super Ljava/lang/Object;
.source "IgoStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/store/IgoStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SkuListsParser"
.end annotation


# instance fields
.field inapp:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field naviextras:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field subs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 4

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 126
    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    .line 127
    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->inapp:Ljava/util/ArrayList;

    .line 128
    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->subs:Ljava/util/ArrayList;

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    .line 132
    new-instance p1, Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->naviextras:Ljava/util/ArrayList;

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->inapp:Ljava/util/ArrayList;

    .line 133
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->subs:Ljava/util/ArrayList;

    .line 135
    iget-object p1, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->inapp:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_31
    :goto_31
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 136
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "subs."

    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 138
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 139
    iget-object v1, p0, Lcom/navngo/igo/javaclient/store/IgoStore$SkuListsParser;->subs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_31

    :cond_4e
    return-void
.end method
