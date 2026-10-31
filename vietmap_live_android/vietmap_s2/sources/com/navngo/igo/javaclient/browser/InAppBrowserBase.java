package com.navngo.igo.javaclient.browser;

import android.content.Intent;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.CString;
import com.navngo.igo.javaclient.browser.BrowserActivityBase;
import java.util.ArrayList;
import java.util.Objects;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class InAppBrowserBase {
    protected static final String CANCELLED = "CANCELLED";
    private static final String logname = "InAppBrowserBase";
    protected ArrayList<BrowserActivityBase.ButtonData> mButtonData = new ArrayList<>();
    protected String mUrl = null;
    protected String mCallbackFunc = null;
    protected Boolean mUICall = true;
    protected BrowserActivityBase mCurrentBrowser = null;
    protected Class<?> mBrowserActivityClass = null;

    public void loadUrl(final String str) {
        BrowserActivityBase browserActivityBase = this.mCurrentBrowser;
        if (browserActivityBase == null || browserActivityBase.webView == null) {
            throw new IllegalStateException("No browser to load");
        }
        this.mCurrentBrowser.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.browser.InAppBrowserBase.1
            @Override // java.lang.Runnable
            public void run() {
                InAppBrowserBase.this.mCurrentBrowser.webView.loadUrl(str);
            }
        });
    }

    public void show(String str, String str2) throws IllegalStateException {
        Objects.requireNonNull(str, "Url parameter can't be null");
        if (str.length() == 0) {
            throw new IllegalArgumentException("Url can't be empty !");
        }
        this.mUrl = str;
        if (str2 == null || str2.length() == 0) {
            throw new IllegalArgumentException("openPageCallback must be supplied !");
        }
        this.mCallbackFunc = str2;
        this.mUICall = false;
        if (this.mCallbackFunc.startsWith("ui.")) {
            this.mCallbackFunc = this.mCallbackFunc.substring(3);
            this.mUICall = true;
        }
        Intent intent = new Intent(Application.getIgoActivity(), this.mBrowserActivityClass);
        intent.putExtra("buttonData", this.mButtonData);
        Application.getIgoActivity().startActivity(intent);
    }

    public String getUrl() {
        return this.mUrl;
    }

    public String getCallbackFunc() {
        return this.mCallbackFunc;
    }

    void onBrowserCancelled() {
        callOpenPageCallback(CANCELLED);
        this.mCurrentBrowser = null;
    }

    public void close() throws IllegalStateException {
        if (this.mCurrentBrowser == null) {
            throw new IllegalStateException("No browser to close");
        }
        DebugLogger.D4(logname, "Closing browser");
        this.mCurrentBrowser.finishBrowser();
        this.mCurrentBrowser = null;
    }

    public void addButton(int i, String str, String str2) {
        this.mButtonData.add(new BrowserActivityBase.ButtonData(i, str, str2));
    }

    public void removeButtons() {
        this.mButtonData.clear();
    }

    void onButtonPressed(String str) {
        callOpenPageCallback(str);
    }

    void setBrowser(BrowserActivityBase browserActivityBase) {
        this.mCurrentBrowser = browserActivityBase;
    }

    void callOpenPageCallback(String str) {
        AndroidGo androidGo = AndroidGo.getInstance();
        if (this.mUICall.booleanValue()) {
            androidGo.callUI(this.mCallbackFunc, null, new CString(str));
        } else {
            androidGo.callIgo(this.mCallbackFunc, null, new CString(str));
        }
    }
}
