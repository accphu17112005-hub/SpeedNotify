package com.navngo.igo.javaclient.store;

import android.content.Context;
import android.os.Build;
import com.android.billingclient.api.BillingClient;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.SkuDetails;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ServerRunner;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import java.io.DataOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum IgoStore implements IFunctorCollection {
    INSTANCE;

    public static final String SUBS_PREFIX = "subs.";
    private static final String logname = "IgoStore";
    IgoStoreWorker mWorker;

    public interface IgoStoreWorker {
        void acknowledgePurchaseInternal(String str);

        void consumePurchaseInternal(String str);

        void debug_ResetWithConsumeAllInternal();

        BillingClient getBillingClient();

        SkuDetails getPurchaseProduct(String str);

        boolean isBillingServiceConnected();

        boolean isPurchaseInProgress();

        boolean isSubscriptionsSupported();

        int purchaseProductInternal(String str);

        void requestProductListInternal(String str);

        void restoreItemInternal(String str);

        void restorePurchasesInternal();

        void setBindStatusInternal(boolean z);

        void setContext(Context context);

        void setPurchaseInProgress(boolean z);
    }

    IgoStore() {
        this.mWorker = null;
        Context applicationContext = Application.anApplication.getApplicationContext();
        if (Build.VERSION.SDK_INT >= 24) {
            this.mWorker = new IgoStoreWorkerModern();
        } else {
            this.mWorker = new IgoStoreWorkerLegacy();
        }
        this.mWorker.setContext(applicationContext);
    }

    static boolean shouldBindToBillingService() {
        return !new File("webshop_mode").exists();
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.store.request_product_list", this, "requestProductList");
        androidGo.registerFunctor("android.store.purchase_product", this, "purchaseProduct");
        androidGo.registerFunctor("android.store.pending_purchase_timeout", this, "pendingPurchaseTimeout");
        androidGo.registerFunctor("android.store.restore_purchases", this, "restorePurchases");
        androidGo.registerFunctor("android.store.consume_purchase", this, "consumePurchase");
        androidGo.registerFunctor("android.store.acknowledge_purchase", this, "acknowledgePurchase");
        androidGo.registerFunctor("android.store.set_bind_status", this, "setBindStatus");
        androidGo.registerFunctor("android.store.debug_reset_with_consume_all", this, "debug_ResetWithConsumeAll");
        init();
    }

    public void init() {
        if (shouldBindToBillingService()) {
            ServerRunner.addEngineStoppedCallback(new Runnable() { // from class: com.navngo.igo.javaclient.store.IgoStore.1
                @Override // java.lang.Runnable
                public void run() {
                    IgoStore.this.setBindStatus(false);
                }
            });
            setBindStatus(true);
        } else {
            DebugLogger.D3(logname, "IgoStore(): Bind to billing service skipped");
        }
    }

    static void onProductListResult(int i, String str) {
        AndroidGo.getInstance().callIgo("android.store.on_product_list_result", null, Integer.valueOf(i), str);
    }

    static void onPurchaseResult(int i, String str, String str2) {
        AndroidGo.getInstance().callIgo("android.store.on_purchase_result", null, Integer.valueOf(i), str, str2);
    }

    static void onRestoreResult(int i, byte[] bArr) {
        AndroidGo.getInstance().callIgo("android.store.on_restore_result", null, Integer.valueOf(i), bArr);
    }

    public int requestProductList(String str) {
        if (!this.mWorker.isBillingServiceConnected()) {
            DebugLogger.D2(logname, "requestProductList: Billing service is not connected");
            return -1;
        }
        this.mWorker.requestProductListInternal(str);
        return 0;
    }

    public static class SkuListsParser {
        ArrayList<String> inapp;
        ArrayList<String> naviextras;
        ArrayList<String> subs;

        SkuListsParser(String str) {
            this.naviextras = null;
            this.inapp = null;
            this.subs = null;
            this.naviextras = new ArrayList<>(Arrays.asList(str.split(";")));
            this.inapp = new ArrayList<>(this.naviextras);
            this.subs = new ArrayList<>();
            Iterator<String> it = this.inapp.iterator();
            while (it.hasNext()) {
                String next = it.next();
                if (next.startsWith(IgoStore.SUBS_PREFIX)) {
                    it.remove();
                    this.subs.add(next);
                }
            }
        }
    }

    public void pendingPurchaseTimeout() {
        if (!this.mWorker.isPurchaseInProgress()) {
            DebugLogger.D2(logname, "ERROR: Purchase timeout occured, but there is no pending purchase ");
        }
        this.mWorker.setPurchaseInProgress(false);
    }

    public int purchaseProduct(String str) {
        if (this.mWorker.isPurchaseInProgress()) {
            DebugLogger.D2(logname, "purchaseProduct: Cannot start purchase (pending purchase is in progress)");
            return 6;
        }
        if (!this.mWorker.isBillingServiceConnected()) {
            DebugLogger.D2(logname, "purchaseProduct: Billing service is not connected");
            return -1;
        }
        return this.mWorker.purchaseProductInternal(str);
    }

    public void restoreItem(String str) {
        DebugLogger.D3(logname, "restoreItem called for product: " + str);
        this.mWorker.restoreItemInternal(str);
    }

    public void restorePurchases() {
        DebugLogger.D3(logname, "restorePurchases");
        if (!this.mWorker.isBillingServiceConnected()) {
            DebugLogger.D3(logname, "restorePurchases: Billing service is not connected");
            onRestoreResult(-1, new byte[0]);
        } else {
            this.mWorker.restorePurchasesInternal();
        }
    }

    public static byte[] SerializeRestoreMap(HashMap<String, Purchase> map) {
        ByteArrayOutputStreamDirect byteArrayOutputStreamDirect = new ByteArrayOutputStreamDirect();
        DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStreamDirect);
        try {
            dataOutputStream.writeInt(map.size());
            for (Purchase purchase : map.values()) {
                dataOutputStream.writeUTF(purchase.getOriginalJson());
                dataOutputStream.writeUTF(purchase.getSignature());
            }
            return byteArrayOutputStreamDirect.getBuffer().buffer;
        } catch (Exception e) {
            DebugLogger.D1(logname, "Serializing restore map failed", e);
            return new byte[0];
        }
    }

    public void consumePurchase(String str) {
        if (!this.mWorker.isBillingServiceConnected()) {
            DebugLogger.D3(logname, "consumePurchase: Billing service is not connected");
        } else {
            this.mWorker.consumePurchaseInternal(str);
        }
    }

    public void acknowledgePurchase(String str) {
        if (!this.mWorker.isBillingServiceConnected()) {
            DebugLogger.D3(logname, "acknowledgePurchase: Billing service is not connected");
        } else {
            this.mWorker.acknowledgePurchaseInternal(str);
        }
    }

    public void setBindStatus(boolean z) {
        DebugLogger.D3(logname, "setBindStatus(" + z + ")");
        this.mWorker.setBindStatusInternal(z);
    }

    public void debug_ResetWithConsumeAll() {
        DebugLogger.D3(logname, "GOOGLE STORE RESET started");
        this.mWorker.debug_ResetWithConsumeAllInternal();
    }
}
