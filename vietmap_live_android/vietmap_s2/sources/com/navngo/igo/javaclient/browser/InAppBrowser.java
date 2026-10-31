package com.navngo.igo.javaclient.browser;

import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class InAppBrowser extends InAppBrowserBase implements IFunctorCollection {
    private static InAppBrowser instance;

    private InAppBrowser() {
        this.mButtonData.clear();
        this.mBrowserActivityClass = BrowserActivity.class;
    }

    public static InAppBrowser getInstance() {
        if (instance == null) {
            instance = new InAppBrowser();
        }
        return instance;
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.browser.show", this, "show");
        androidGo.registerFunctor("android.browser.close", this, "close");
        androidGo.registerFunctor("android.browser.removeButtons", this, "removeButtons");
        androidGo.registerFunctor("android.browser.addButton", this, "addButton");
        androidGo.registerFunctor("android.browser.loadUrl", this, "loadUrl");
    }
}
