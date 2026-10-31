package com.navngo.igo.javaclient.store;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.android.billingclient.api.AcknowledgePurchaseParams;
import com.android.billingclient.api.AcknowledgePurchaseResponseListener;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingClientStateListener;
import com.android.billingclient.api.BillingFlowParams;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesUpdatedListener;
import com.android.billingclient.api.SkuDetails;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.store.IgoStore;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class IgoStoreWorkerBase implements IgoStore.IgoStoreWorker, BillingClientStateListener, PurchasesUpdatedListener {
    private static final long RECONNECT_TIMER_MILLISECONDS = 5000;
    private static final String logname = "IgoStoreWorkerBase";
    protected BillingClient mBillingClient;
    protected Context mContext;
    protected String mLastPurchaseID;
    protected boolean mSubscriptionsSupported;
    protected boolean mPurchaseInProgress = false;
    protected boolean mBillingServiceConnected = false;

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void setContext(Context context) {
        this.mContext = context;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public boolean isBillingServiceConnected() {
        return this.mBillingServiceConnected;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public BillingClient getBillingClient() {
        return this.mBillingClient;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public boolean isSubscriptionsSupported() {
        return this.mSubscriptionsSupported;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public boolean isPurchaseInProgress() {
        return this.mPurchaseInProgress;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void setPurchaseInProgress(boolean z) {
        this.mPurchaseInProgress = z;
    }

    @Override // com.android.billingclient.api.PurchasesUpdatedListener
    public void onPurchasesUpdated(BillingResult billingResult, List<Purchase> list) {
        this.mPurchaseInProgress = false;
        int responseCode = billingResult.getResponseCode();
        if (responseCode != 0) {
            if (responseCode == 1) {
                DebugLogger.D3(logname, "onPurchasesUpdated: purchase flow was canceled by the user");
                IgoStore.onPurchaseResult(1, Config.def_additional_assets, Config.def_additional_assets);
                return;
            } else {
                if (responseCode == 7) {
                    DebugLogger.D3(logname, "onPurchasesUpdated: item already owned, starting restore");
                    IgoStore.INSTANCE.restoreItem(this.mLastPurchaseID);
                    return;
                }
                DebugLogger.D3(logname, "onPurchasesUpdated: error, response code: " + responseCode);
                IgoStore.onPurchaseResult(responseCode, Config.def_additional_assets, Config.def_additional_assets);
                return;
            }
        }
        if (list == null) {
            DebugLogger.D2(logname, "onPurchasesUpdated: list of purchases is null");
            return;
        }
        DebugLogger.D3(logname, "onPurchasesUpdated: received " + list.size() + " new purchase(s)");
        for (Purchase purchase : list) {
            DebugLogger.D3(logname, "purchase.getSkus()=" + purchase.getSkus() + ", purchase.getPurchaseState()=" + purchase.getPurchaseState());
            IgoStore.onPurchaseResult(responseCode, purchase.getOriginalJson(), purchase.getSignature());
        }
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public int purchaseProductInternal(String str) {
        DebugLogger.D3(logname, "purchaseProductInternal: Starting purchase for product '" + str + "'");
        SkuDetails purchaseProduct = getPurchaseProduct(str);
        if (purchaseProduct == null) {
            DebugLogger.D2(logname, "purchaseProductInternal: Cannot find product + " + str);
            return 6;
        }
        int responseCode = this.mBillingClient.launchBillingFlow(Application.getIgoActivity(), BillingFlowParams.newBuilder().setSkuDetails(purchaseProduct).build()).getResponseCode();
        if (responseCode != 0) {
            DebugLogger.D3(logname, "purchaseProductInternal: Error starting billing flow for product '" + str + "', response code: " + responseCode);
            return responseCode;
        }
        this.mLastPurchaseID = str;
        this.mPurchaseInProgress = true;
        return 0;
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public void onBillingServiceDisconnected() {
        DebugLogger.D3(logname, "Billing service disconnected.");
        this.mBillingServiceConnected = false;
        retryBillingConnection();
    }

    @Override // com.android.billingclient.api.BillingClientStateListener
    public void onBillingSetupFinished(BillingResult billingResult) {
        int responseCode = billingResult.getResponseCode();
        DebugLogger.D3(logname, "onBillingSetupFinished response code: " + responseCode);
        if (responseCode == 0) {
            DebugLogger.D3(logname, "Billing service connected.");
            this.mBillingServiceConnected = true;
            this.mSubscriptionsSupported = this.mBillingClient.isFeatureSupported(BillingClient.FeatureType.SUBSCRIPTIONS).getResponseCode() == 0;
        } else if (responseCode == 3) {
            DebugLogger.D2(logname, "Error initializing billing support, payments disabled");
        } else {
            retryBillingConnection();
        }
    }

    private void retryBillingConnection() {
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerBase$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m20lambda$retryBillingConnection$0$comnavngoigojavaclientstoreIgoStoreWorkerBase();
            }
        }, RECONNECT_TIMER_MILLISECONDS);
    }

    /* JADX INFO: renamed from: lambda$retryBillingConnection$0$com-navngo-igo-javaclient-store-IgoStoreWorkerBase, reason: not valid java name */
    /* synthetic */ void m20lambda$retryBillingConnection$0$comnavngoigojavaclientstoreIgoStoreWorkerBase() {
        BillingClient billingClient;
        if (!IgoStore.shouldBindToBillingService() || (billingClient = this.mBillingClient) == null) {
            return;
        }
        billingClient.startConnection(this);
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void setBindStatusInternal(boolean z) {
        BillingClient billingClient;
        if (z && this.mBillingClient == null) {
            BillingClient billingClientBuild = BillingClient.newBuilder(this.mContext).setListener(this).enablePendingPurchases().build();
            this.mBillingClient = billingClientBuild;
            billingClientBuild.startConnection(this);
        } else {
            if (z || (billingClient = this.mBillingClient) == null) {
                return;
            }
            billingClient.endConnection();
            this.mBillingClient = null;
        }
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void acknowledgePurchaseInternal(String str) {
        this.mBillingClient.acknowledgePurchase(AcknowledgePurchaseParams.newBuilder().setPurchaseToken(str).build(), new AcknowledgePurchaseResponseListener() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerBase.1
            @Override // com.android.billingclient.api.AcknowledgePurchaseResponseListener
            public void onAcknowledgePurchaseResponse(BillingResult billingResult) {
                int responseCode = billingResult.getResponseCode();
                if (responseCode == 0) {
                    DebugLogger.D3(IgoStoreWorkerBase.logname, "acknowledgePurchase was successful");
                    return;
                }
                DebugLogger.D2(IgoStoreWorkerBase.logname, "acknowledgePurchase error, code: " + responseCode);
            }
        });
    }
}
