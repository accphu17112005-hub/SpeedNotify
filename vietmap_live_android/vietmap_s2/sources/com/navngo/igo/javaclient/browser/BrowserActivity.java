package com.navngo.igo.javaclient.browser;

import android.os.Bundle;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BrowserActivity extends BrowserActivityBase {
    @Override // com.navngo.igo.javaclient.browser.BrowserActivityBase, android.app.Activity
    protected void onCreate(Bundle bundle) {
        this.inappBrowserBase = InAppBrowser.getInstance();
        super.onCreate(bundle);
    }
}
