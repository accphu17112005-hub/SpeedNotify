package com.navngo.igo.javaclient.store;

import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.ConsumeParams;
import com.android.billingclient.api.ConsumeResponseListener;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesResponseListener;
import com.android.billingclient.api.SkuDetails;
import com.android.billingclient.api.SkuDetailsParams;
import com.android.billingclient.api.SkuDetailsResponseListener;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.store.IgoStore;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IgoStoreWorkerLegacy extends IgoStoreWorkerBase implements SkuDetailsResponseListener, PurchasesResponseListener {
    private static final String logname = "IgoStoreWorkerLegacy";
    private IgoStore.SkuListsParser mSkuListsParser = null;
    private HashMap<String, SkuDetails> mSkuDetailsMap = new HashMap<>();
    private int mPendingSkuDetailsQueries = 0;
    private HashMap<String, Purchase> mPurchasesMap = new HashMap<>();
    private int mPendingPurchaseQueries = 0;
    private final Object mGetPurchasesEvent = new Object();
    private boolean mGetPurchasesFinished = false;
    private int mGetPurchasesResponseCode = 0;

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void debug_ResetWithConsumeAllInternal() {
    }

    private synchronized void processSkuDetailsResponse() {
        DebugLogger.D3(logname, "processSkuDetailsResponse");
        IgoStore.SkuListsParser skuListsParser = this.mSkuListsParser;
        HashMap<String, SkuDetails> map = this.mSkuDetailsMap;
        String str = new String();
        Iterator<String> it = skuListsParser.naviextras.iterator();
        while (true) {
            if (it.hasNext()) {
                String next = it.next();
                SkuDetails skuDetails = map.get(next);
                StringBuilder sb = new StringBuilder();
                sb.append("requestProductListAsynch: price loop, item='");
                sb.append(next);
                sb.append("', found='");
                sb.append(skuDetails != null);
                sb.append("'");
                DebugLogger.D3(logname, sb.toString());
                if (skuDetails != null) {
                    str = str + skuDetails.getPrice() + ";";
                } else {
                    str = str + ";";
                }
            } else {
                DebugLogger.D3(logname, "requestProductListAsynch: received prices: " + str);
                IgoStore.onProductListResult(0, str);
                this.mSkuListsParser = null;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0063 A[Catch: all -> 0x0068, TryCatch #0 {, blocks: (B:11:0x0056, B:12:0x005b, B:14:0x0063, B:15:0x0066), top: B:20:0x0056 }] */
    @Override // com.android.billingclient.api.SkuDetailsResponseListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public void onSkuDetailsResponse(com.android.billingclient.api.BillingResult r6, java.util.List<com.android.billingclient.api.SkuDetails> r7) {
        /*
            r5 = this;
            int r6 = r6.getResponseCode()
            java.util.HashMap r0 = new java.util.HashMap
            r0.<init>()
            if (r6 != 0) goto L3d
            java.util.Iterator r7 = r7.iterator()
        Lf:
            boolean r1 = r7.hasNext()
            if (r1 == 0) goto L53
            java.lang.Object r1 = r7.next()
            com.android.billingclient.api.SkuDetails r1 = (com.android.billingclient.api.SkuDetails) r1
            java.lang.String r2 = "IgoStoreWorkerLegacy"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "onSkuDetailsResponse: adding sku to map: "
            r3.append(r4)
            java.lang.String r4 = r1.getSku()
            r3.append(r4)
            java.lang.String r3 = r3.toString()
            com.navngo.igo.javaclient.DebugLogger.D3(r2, r3)
            java.lang.String r2 = r1.getSku()
            r0.put(r2, r1)
            goto Lf
        L3d:
            java.lang.String r7 = "IgoStoreWorkerLegacy"
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "onSkuDetailsResponse: error getting SKU details, code: "
            r1.append(r2)
            r1.append(r6)
            java.lang.String r1 = r1.toString()
            com.navngo.igo.javaclient.DebugLogger.D3(r7, r1)
        L53:
            monitor-enter(r5)
            if (r6 != 0) goto L5b
            java.util.HashMap<java.lang.String, com.android.billingclient.api.SkuDetails> r6 = r5.mSkuDetailsMap     // Catch: java.lang.Throwable -> L68
            r6.putAll(r0)     // Catch: java.lang.Throwable -> L68
        L5b:
            int r6 = r5.mPendingSkuDetailsQueries     // Catch: java.lang.Throwable -> L68
            int r6 = r6 + (-1)
            r5.mPendingSkuDetailsQueries = r6     // Catch: java.lang.Throwable -> L68
            if (r6 != 0) goto L66
            r5.processSkuDetailsResponse()     // Catch: java.lang.Throwable -> L68
        L66:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L68
            return
        L68:
            r6 = move-exception
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L68
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.onSkuDetailsResponse(com.android.billingclient.api.BillingResult, java.util.List):void");
    }

    private void listSkuDetailsLegacy(ArrayList<String> arrayList, String str, SkuDetailsResponseListener skuDetailsResponseListener) {
        DebugLogger.D3(logname, "listSkuDetailsLegacy called for item type '" + str + "' with " + arrayList.size() + " SKUs");
        getBillingClient().querySkuDetailsAsync(SkuDetailsParams.newBuilder().setSkusList(arrayList).setType(str).build(), skuDetailsResponseListener);
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void requestProductListInternal(String str) {
        DebugLogger.D3(logname, "requestProductListInternal started for: " + str);
        IgoStore.SkuListsParser skuListsParser = new IgoStore.SkuListsParser(str);
        if (skuListsParser.naviextras.size() == 0) {
            DebugLogger.D3(logname, "requestProductListInternal: nothing to do");
            IgoStore.onProductListResult(0, Config.def_additional_assets);
            return;
        }
        synchronized (this) {
            if (this.mSkuListsParser != null) {
                DebugLogger.D2(logname, "requestProductListInternal: error: a query is already in progress!");
                IgoStore.onProductListResult(6, Config.def_additional_assets);
                return;
            }
            this.mSkuListsParser = skuListsParser;
            this.mPendingSkuDetailsQueries = 0 + 1;
            listSkuDetailsLegacy(skuListsParser.inapp, BillingClient.SkuType.INAPP, this);
            if (isSubscriptionsSupported() && !skuListsParser.subs.isEmpty()) {
                this.mPendingSkuDetailsQueries++;
                listSkuDetailsLegacy(skuListsParser.subs, BillingClient.SkuType.SUBS, this);
            }
        }
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public SkuDetails getPurchaseProduct(String str) {
        SkuDetails skuDetails;
        synchronized (this) {
            skuDetails = this.mSkuDetailsMap.get(str);
        }
        return skuDetails;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void restoreItemInternal(final String str) {
        new Thread(new Runnable() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.1
            @Override // java.lang.Runnable
            public void run() {
                IgoStoreWorkerLegacy.this.getPurchasesLegacy();
                int iWaitForPurchasesQueryBlocking = IgoStoreWorkerLegacy.this.waitForPurchasesQueryBlocking();
                StringBuilder sb = new StringBuilder();
                sb.append("RestoreMap size=");
                sb.append(IgoStoreWorkerLegacy.this.mPurchasesMap != null ? Integer.valueOf(IgoStoreWorkerLegacy.this.mPurchasesMap.size()) : "null");
                DebugLogger.D3(IgoStoreWorkerLegacy.logname, sb.toString());
                Purchase purchase = iWaitForPurchasesQueryBlocking == 0 ? (Purchase) IgoStoreWorkerLegacy.this.mPurchasesMap.get(str) : null;
                String signature = Config.def_additional_assets;
                String originalJson = purchase == null ? Config.def_additional_assets : purchase.getOriginalJson();
                if (purchase != null) {
                    signature = purchase.getSignature();
                }
                if (purchase == null) {
                    iWaitForPurchasesQueryBlocking = 6;
                }
                DebugLogger.D3(IgoStoreWorkerLegacy.logname, "Restore for " + str + " result=" + iWaitForPurchasesQueryBlocking);
                IgoStore.onPurchaseResult(iWaitForPurchasesQueryBlocking, originalJson, signature);
            }
        }).start();
    }

    private void processPurchasesResponse() {
        DebugLogger.D3(logname, "processPurchasesResponse");
        synchronized (this.mGetPurchasesEvent) {
            this.mGetPurchasesFinished = true;
            this.mGetPurchasesEvent.notifyAll();
        }
    }

    @Override // com.android.billingclient.api.PurchasesResponseListener
    public void onQueryPurchasesResponse(BillingResult billingResult, List<Purchase> list) {
        int responseCode = billingResult.getResponseCode();
        DebugLogger.D3(logname, "onQueryPurchasesResponse response code: " + responseCode);
        HashMap map = new HashMap();
        if (responseCode == 0) {
            for (Purchase purchase : list) {
                ArrayList<String> skus = purchase.getSkus();
                if (skus.size() > 1) {
                    DebugLogger.D3(logname, "onQueryPurchasesResponse: ignoring extra skus for purchase: " + skus.subList(1, skus.size()));
                }
                if (purchase.getPurchaseState() == 1) {
                    map.put(skus.get(0), purchase);
                }
            }
        }
        synchronized (this) {
            if (responseCode == 0) {
                this.mPurchasesMap.putAll(map);
            } else {
                this.mGetPurchasesResponseCode = responseCode;
            }
            int i = this.mPendingPurchaseQueries - 1;
            this.mPendingPurchaseQueries = i;
            if (i == 0) {
                processPurchasesResponse();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void getPurchasesLegacy() {
        DebugLogger.D3(logname, "Starting getPurchasesLegacy");
        synchronized (this) {
            this.mGetPurchasesResponseCode = 0;
            this.mGetPurchasesFinished = false;
            this.mPurchasesMap = new HashMap<>();
            this.mPendingPurchaseQueries++;
            getPurchasesForTypeLegacy(BillingClient.SkuType.INAPP);
            if (isSubscriptionsSupported()) {
                this.mPendingPurchaseQueries++;
                getPurchasesForTypeLegacy(BillingClient.SkuType.SUBS);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int waitForPurchasesQueryBlocking() {
        int i;
        synchronized (this.mGetPurchasesEvent) {
            while (!this.mGetPurchasesFinished) {
                try {
                    this.mGetPurchasesEvent.wait();
                } catch (InterruptedException unused) {
                }
            }
            i = this.mGetPurchasesResponseCode;
        }
        return i;
    }

    private void getPurchasesForTypeLegacy(String str) {
        DebugLogger.D3(logname, "getPurchasesForTypeLegacy started for type: " + str);
        getBillingClient().queryPurchasesAsync(str, this);
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void restorePurchasesInternal() {
        new Thread(new Runnable() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.2
            @Override // java.lang.Runnable
            public void run() {
                IgoStoreWorkerLegacy.this.getPurchasesLegacy();
                int iWaitForPurchasesQueryBlocking = IgoStoreWorkerLegacy.this.waitForPurchasesQueryBlocking();
                byte[] bArrSerializeRestoreMap = IgoStore.SerializeRestoreMap(IgoStoreWorkerLegacy.this.mPurchasesMap);
                DebugLogger.D3(IgoStoreWorkerLegacy.logname, "bufsize:" + bArrSerializeRestoreMap.length);
                IgoStore.onRestoreResult(iWaitForPurchasesQueryBlocking, bArrSerializeRestoreMap);
            }
        }).start();
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void consumePurchaseInternal(String str) {
        getBillingClient().consumeAsync(ConsumeParams.newBuilder().setPurchaseToken(str).build(), new ConsumeResponseListener() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerLegacy.3
            @Override // com.android.billingclient.api.ConsumeResponseListener
            public void onConsumeResponse(BillingResult billingResult, String str2) {
                int responseCode = billingResult.getResponseCode();
                if (responseCode == 0) {
                    DebugLogger.D3(IgoStoreWorkerLegacy.logname, "consumeAsync was successful");
                    return;
                }
                if (responseCode == 8) {
                    DebugLogger.D2(IgoStoreWorkerLegacy.logname, "consumePurchaseInternal error: user does not own this item");
                    return;
                }
                DebugLogger.D2(IgoStoreWorkerLegacy.logname, "consumePurchaseInternal error, code: " + billingResult.getResponseCode());
            }
        });
    }
}
