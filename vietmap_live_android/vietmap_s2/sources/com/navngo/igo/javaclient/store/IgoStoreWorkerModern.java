package com.navngo.igo.javaclient.store;

import android.util.Pair;
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
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.function.BiConsumer;
import java.util.function.Consumer;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IgoStoreWorkerModern extends IgoStoreWorkerBase {
    private static final String logname = "IgoStoreWorkerModern";

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void requestProductListInternal(String str) {
        final CompletableFuture<Pair<Integer, HashMap<String, SkuDetails>>> completableFutureCompletedFuture;
        DebugLogger.D3(logname, "requestProductListAsynch started for: " + str);
        final IgoStore.SkuListsParser skuListsParser = new IgoStore.SkuListsParser(str);
        if (skuListsParser.naviextras.size() == 0) {
            DebugLogger.D3(logname, "requestProductListAsynch: nothing to do");
            IgoStore.onProductListResult(0, Config.def_additional_assets);
            return;
        }
        final CompletableFuture<Pair<Integer, HashMap<String, SkuDetails>>> completableFutureListSkuDetails = listSkuDetails(skuListsParser.inapp, BillingClient.SkuType.INAPP);
        if (isSubscriptionsSupported()) {
            completableFutureCompletedFuture = listSkuDetails(skuListsParser.subs, BillingClient.SkuType.SUBS);
        } else {
            completableFutureCompletedFuture = CompletableFuture.completedFuture(new Pair(0, new HashMap()));
        }
        CompletableFuture.allOf(completableFutureListSkuDetails, completableFutureCompletedFuture).whenComplete((BiConsumer<? super Void, ? super Throwable>) new BiConsumer<Void, Throwable>() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.1
            @Override // java.util.function.BiConsumer
            public void accept(Void r8, Throwable th) {
                DebugLogger.D3(IgoStoreWorkerModern.logname, "requestProductListAsynch: processing listSkuDetails results");
                if (th != null) {
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "requestProductListAsynch: error getting prices");
                    IgoStore.onProductListResult(6, Config.def_additional_assets);
                    return;
                }
                HashMap map = new HashMap();
                try {
                    Pair pair = (Pair) completableFutureListSkuDetails.get();
                    HashMap map2 = (HashMap) pair.second;
                    if (((Integer) pair.first).intValue() == 0) {
                        map.putAll(map2);
                    }
                    Pair pair2 = (Pair) completableFutureCompletedFuture.get();
                    HashMap map3 = (HashMap) pair2.second;
                    if (((Integer) pair2.first).intValue() == 0) {
                        map.putAll(map3);
                    }
                    String str2 = new String();
                    Iterator<String> it = skuListsParser.naviextras.iterator();
                    while (true) {
                        if (it.hasNext()) {
                            String next = it.next();
                            SkuDetails skuDetails = (SkuDetails) map.get(next);
                            StringBuilder sb = new StringBuilder();
                            sb.append("requestProductListAsynch: price loop, item='");
                            sb.append(next);
                            sb.append("', found='");
                            sb.append(skuDetails != null);
                            sb.append("'");
                            DebugLogger.D3(IgoStoreWorkerModern.logname, sb.toString());
                            if (skuDetails != null) {
                                str2 = str2 + skuDetails.getPrice() + ";";
                            } else {
                                str2 = str2 + ";";
                            }
                        } else {
                            DebugLogger.D3(IgoStoreWorkerModern.logname, "requestProductListAsynch: received prices: " + str2);
                            IgoStore.onProductListResult(0, str2);
                            return;
                        }
                    }
                } catch (Exception unused) {
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "requestProductListAsynch: exception in accept()");
                    IgoStore.onProductListResult(6, Config.def_additional_assets);
                }
            }
        });
    }

    private CompletableFuture<Pair<Integer, HashMap<String, SkuDetails>>> listSkuDetails(ArrayList<String> arrayList, String str) {
        if (arrayList.isEmpty()) {
            return CompletableFuture.completedFuture(new Pair(0, new HashMap()));
        }
        DebugLogger.D3(logname, "listSkuDetails called for item type '" + str + "' with " + arrayList.size() + " SKUs");
        final CompletableFuture<Pair<Integer, HashMap<String, SkuDetails>>> completableFuture = new CompletableFuture<>();
        getBillingClient().querySkuDetailsAsync(SkuDetailsParams.newBuilder().setSkusList(arrayList).setType(str).build(), new SkuDetailsResponseListener() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.2
            @Override // com.android.billingclient.api.SkuDetailsResponseListener
            public void onSkuDetailsResponse(BillingResult billingResult, List<SkuDetails> list) {
                int responseCode = billingResult.getResponseCode();
                HashMap map = new HashMap();
                if (responseCode == 0) {
                    for (SkuDetails skuDetails : list) {
                        DebugLogger.D3(IgoStoreWorkerModern.logname, "listSkuDetails: adding sku to map: " + skuDetails.getSku());
                        map.put(skuDetails.getSku(), skuDetails);
                    }
                } else {
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "listSkuDetails: error getting SKU details, code: " + responseCode);
                }
                completableFuture.complete(new Pair(Integer.valueOf(responseCode), map));
            }
        });
        return completableFuture;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public SkuDetails getPurchaseProduct(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add(str);
        try {
            Pair<Integer, HashMap<String, SkuDetails>> pair = listSkuDetails(arrayList, str.startsWith(IgoStore.SUBS_PREFIX) ? BillingClient.SkuType.SUBS : BillingClient.SkuType.INAPP).get();
            if (((Integer) pair.first).intValue() != 0) {
                return null;
            }
            return (SkuDetails) ((HashMap) pair.second).get(str);
        } catch (Exception unused) {
            return null;
        }
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void restoreItemInternal(final String str) {
        getPurchases().whenComplete((BiConsumer<? super Pair<Integer, HashMap<String, Purchase>>, ? super Throwable>) new BiConsumer<Pair<Integer, HashMap<String, Purchase>>, Throwable>() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.3
            @Override // java.util.function.BiConsumer
            public void accept(Pair<Integer, HashMap<String, Purchase>> pair, Throwable th) {
                String signature = Config.def_additional_assets;
                if (th != null) {
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "Exception during restore for product " + str);
                    IgoStore.onPurchaseResult(6, Config.def_additional_assets, Config.def_additional_assets);
                    return;
                }
                int iIntValue = ((Integer) pair.first).intValue();
                DebugLogger.D3(IgoStoreWorkerModern.logname, "RestoreMap size=" + ((HashMap) pair.second).size());
                Purchase purchase = (Purchase) ((HashMap) pair.second).get(str);
                String originalJson = purchase == null ? Config.def_additional_assets : purchase.getOriginalJson();
                if (purchase != null) {
                    signature = purchase.getSignature();
                }
                int i = purchase != null ? iIntValue : 6;
                DebugLogger.D3(IgoStoreWorkerModern.logname, "Restore for " + str + " result=" + pair);
                IgoStore.onPurchaseResult(i, originalJson, signature);
            }
        });
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void restorePurchasesInternal() {
        getPurchases().whenComplete((BiConsumer<? super Pair<Integer, HashMap<String, Purchase>>, ? super Throwable>) new BiConsumer<Pair<Integer, HashMap<String, Purchase>>, Throwable>() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.4
            @Override // java.util.function.BiConsumer
            public void accept(Pair<Integer, HashMap<String, Purchase>> pair, Throwable th) {
                if (th != null) {
                    IgoStore.onRestoreResult(6, new byte[0]);
                    return;
                }
                byte[] bArrSerializeRestoreMap = IgoStore.SerializeRestoreMap((HashMap) pair.second);
                DebugLogger.D3(IgoStoreWorkerModern.logname, "bufsize:" + bArrSerializeRestoreMap.length);
                IgoStore.onRestoreResult(((Integer) pair.first).intValue(), bArrSerializeRestoreMap);
            }
        });
    }

    public CompletableFuture<Pair<Integer, HashMap<String, Purchase>>> getPurchases() {
        final CompletableFuture<Pair<Integer, HashMap<String, Purchase>>> completableFutureCompletedFuture;
        DebugLogger.D3(logname, "Starting getPurchases");
        final CompletableFuture<Pair<Integer, HashMap<String, Purchase>>> completableFuture = new CompletableFuture<>();
        final CompletableFuture<Pair<Integer, HashMap<String, Purchase>>> purchasesForType = getPurchasesForType(BillingClient.SkuType.INAPP);
        if (isSubscriptionsSupported()) {
            completableFutureCompletedFuture = getPurchasesForType(BillingClient.SkuType.SUBS);
        } else {
            completableFutureCompletedFuture = CompletableFuture.completedFuture(new Pair(0, new HashMap()));
        }
        CompletableFuture.allOf(purchasesForType, completableFutureCompletedFuture).whenComplete((BiConsumer<? super Void, ? super Throwable>) new BiConsumer<Void, Throwable>() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.5
            /* JADX WARN: Removed duplicated region for block: B:20:0x0066  */
            @Override // java.util.function.BiConsumer
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct code enable 'Show inconsistent code' option in preferences
            */
            public void accept(java.lang.Void r7, java.lang.Throwable r8) {
                /*
                    r6 = this;
                    java.lang.String r7 = "IgoStoreWorkerModern"
                    if (r8 == 0) goto L1f
                    java.lang.String r8 = "getPurchases finished with error"
                    com.navngo.igo.javaclient.DebugLogger.D3(r7, r8)
                    java.util.concurrent.CompletableFuture r7 = r2
                    android.util.Pair r8 = new android.util.Pair
                    r0 = 6
                    java.lang.Integer r0 = java.lang.Integer.valueOf(r0)
                    java.util.HashMap r1 = new java.util.HashMap
                    r1.<init>()
                    r8.<init>(r0, r1)
                    r7.complete(r8)
                    goto La7
                L1f:
                    java.util.HashMap r8 = new java.util.HashMap
                    r8.<init>()
                    r0 = 1
                    r1 = 0
                    r2 = 0
                    java.util.concurrent.CompletableFuture r3 = r3     // Catch: java.lang.Exception -> L44
                    java.lang.Object r3 = r3.get()     // Catch: java.lang.Exception -> L44
                    android.util.Pair r3 = (android.util.Pair) r3     // Catch: java.lang.Exception -> L44
                    java.lang.Object r4 = r3.first     // Catch: java.lang.Exception -> L45
                    java.lang.Integer r4 = (java.lang.Integer) r4     // Catch: java.lang.Exception -> L45
                    int r4 = r4.intValue()     // Catch: java.lang.Exception -> L45
                    if (r4 == 0) goto L45
                    java.lang.Object r4 = r3.first     // Catch: java.lang.Exception -> L45
                    java.lang.Integer r4 = (java.lang.Integer) r4     // Catch: java.lang.Exception -> L45
                    int r0 = r4.intValue()     // Catch: java.lang.Exception -> L45
                    r4 = r0
                    r0 = 0
                    goto L46
                L44:
                    r3 = r1
                L45:
                    r4 = 0
                L46:
                    java.util.concurrent.CompletableFuture r5 = r4     // Catch: java.lang.Exception -> L69
                    java.lang.Object r5 = r5.get()     // Catch: java.lang.Exception -> L69
                    android.util.Pair r5 = (android.util.Pair) r5     // Catch: java.lang.Exception -> L69
                    if (r0 == 0) goto L66
                    java.lang.Object r1 = r5.first     // Catch: java.lang.Exception -> L64
                    java.lang.Integer r1 = (java.lang.Integer) r1     // Catch: java.lang.Exception -> L64
                    int r1 = r1.intValue()     // Catch: java.lang.Exception -> L64
                    if (r1 == 0) goto L66
                    java.lang.Object r1 = r5.first     // Catch: java.lang.Exception -> L64
                    java.lang.Integer r1 = (java.lang.Integer) r1     // Catch: java.lang.Exception -> L64
                    int r0 = r1.intValue()     // Catch: java.lang.Exception -> L64
                    r4 = r0
                    goto L67
                L64:
                    r1 = r5
                    goto L69
                L66:
                    r2 = r0
                L67:
                    r0 = r2
                    goto L6a
                L69:
                    r5 = r1
                L6a:
                    if (r0 == 0) goto L7e
                    if (r3 == 0) goto L75
                    java.lang.Object r1 = r3.second
                    java.util.Map r1 = (java.util.Map) r1
                    r8.putAll(r1)
                L75:
                    if (r5 == 0) goto L7e
                    java.lang.Object r1 = r5.second
                    java.util.Map r1 = (java.util.Map) r1
                    r8.putAll(r1)
                L7e:
                    java.lang.StringBuilder r1 = new java.lang.StringBuilder
                    r1.<init>()
                    java.lang.String r2 = "getPurchases finished with: "
                    r1.append(r2)
                    if (r0 == 0) goto L8d
                    java.lang.String r0 = "success"
                    goto L8f
                L8d:
                    java.lang.String r0 = "failure"
                L8f:
                    r1.append(r0)
                    java.lang.String r0 = r1.toString()
                    com.navngo.igo.javaclient.DebugLogger.D3(r7, r0)
                    java.util.concurrent.CompletableFuture r7 = r2
                    android.util.Pair r0 = new android.util.Pair
                    java.lang.Integer r1 = java.lang.Integer.valueOf(r4)
                    r0.<init>(r1, r8)
                    r7.complete(r0)
                La7:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.AnonymousClass5.accept(java.lang.Void, java.lang.Throwable):void");
            }
        });
        return completableFuture;
    }

    private CompletableFuture<Pair<Integer, HashMap<String, Purchase>>> getPurchasesForType(final String str) {
        DebugLogger.D3(logname, "getPurchasesForType started for type: " + str);
        final CompletableFuture<Pair<Integer, HashMap<String, Purchase>>> completableFuture = new CompletableFuture<>();
        getBillingClient().queryPurchasesAsync(str, new PurchasesResponseListener() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.6
            @Override // com.android.billingclient.api.PurchasesResponseListener
            public void onQueryPurchasesResponse(BillingResult billingResult, List<Purchase> list) {
                int responseCode = billingResult.getResponseCode();
                DebugLogger.D3(IgoStoreWorkerModern.logname, "getPurchasesForType response code for type '" + str + "': " + responseCode);
                if (responseCode == 0) {
                    HashMap map = new HashMap();
                    for (Purchase purchase : list) {
                        ArrayList<String> skus = purchase.getSkus();
                        if (skus.size() > 1) {
                            DebugLogger.D3(IgoStoreWorkerModern.logname, "getPurchasesForType: ignoring extra skus for purchase: " + skus.subList(1, skus.size()));
                        }
                        if (purchase.getPurchaseState() == 1) {
                            map.put(skus.get(0), purchase);
                        }
                    }
                    completableFuture.complete(new Pair(Integer.valueOf(responseCode), map));
                    return;
                }
                completableFuture.complete(new Pair(Integer.valueOf(responseCode), new HashMap()));
            }
        });
        return completableFuture;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void consumePurchaseInternal(String str) {
        consumePurchaseInternal2(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public CompletableFuture<Integer> consumePurchaseInternal2(String str) {
        final CompletableFuture<Integer> completableFuture = new CompletableFuture<>();
        getBillingClient().consumeAsync(ConsumeParams.newBuilder().setPurchaseToken(str).build(), new ConsumeResponseListener() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.7
            @Override // com.android.billingclient.api.ConsumeResponseListener
            public void onConsumeResponse(BillingResult billingResult, String str2) {
                int responseCode = billingResult.getResponseCode();
                if (responseCode == 0) {
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "consumeAsync was successful");
                } else if (responseCode == 8) {
                    DebugLogger.D2(IgoStoreWorkerModern.logname, "consumePurchaseInternal error: user does not own this item");
                } else {
                    DebugLogger.D2(IgoStoreWorkerModern.logname, "consumePurchaseInternal error, code: " + billingResult.getResponseCode());
                }
                completableFuture.complete(Integer.valueOf(responseCode));
            }
        });
        return completableFuture;
    }

    @Override // com.navngo.igo.javaclient.store.IgoStore.IgoStoreWorker
    public void debug_ResetWithConsumeAllInternal() {
        getPurchases().thenAccept((Consumer<? super Pair<Integer, HashMap<String, Purchase>>>) new Consumer<Pair<Integer, HashMap<String, Purchase>>>() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.8
            @Override // java.util.function.Consumer
            public void accept(final Pair<Integer, HashMap<String, Purchase>> pair) {
                if (((Integer) pair.first).intValue() != 0) {
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "getPurchases returned with error, code=" + pair);
                    return;
                }
                DebugLogger.D3(IgoStoreWorkerModern.logname, "RestoreMap size" + ((HashMap) pair.second).size());
                final int[] iArr = {0};
                for (Map.Entry entry : ((HashMap) pair.second).entrySet()) {
                    String purchaseToken = ((Purchase) entry.getValue()).getPurchaseToken();
                    DebugLogger.D3(IgoStoreWorkerModern.logname, "calling consumePurchaseInternal for product " + ((String) entry.getKey()));
                    IgoStoreWorkerModern.this.consumePurchaseInternal2(purchaseToken).thenAccept((Consumer) new Consumer<Integer>() { // from class: com.navngo.igo.javaclient.store.IgoStoreWorkerModern.8.1
                        @Override // java.util.function.Consumer
                        public void accept(Integer num) {
                            int[] iArr2 = iArr;
                            int i = iArr2[0] + 1;
                            iArr2[0] = i;
                            if (i == ((HashMap) pair.second).size()) {
                                DebugLogger.D3(IgoStoreWorkerModern.logname, "GOOGLE STORE RESET finished");
                            }
                        }
                    });
                }
            }
        });
    }
}
