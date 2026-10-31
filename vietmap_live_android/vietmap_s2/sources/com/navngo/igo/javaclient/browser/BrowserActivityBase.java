package com.navngo.igo.javaclient.browser;

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.os.Message;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import android.webkit.HttpAuthHandler;
import android.webkit.JsPromptResult;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.RelativeLayout;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.R;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Objects;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BrowserActivityBase extends Activity {
    private static final String logname = "BrowserActivityBase";
    WebView webView;
    protected InAppBrowserBase inappBrowserBase = null;
    protected String urlToLoad = null;
    WebViewClient webWiewClient = new WebViewClient() { // from class: com.navngo.igo.javaclient.browser.BrowserActivityBase.2
        @Override // android.webkit.WebViewClient
        public void onLoadResource(WebView webView, String str) {
            super.onLoadResource(webView, str);
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
            super.onPageStarted(webView, str, bitmap);
            DebugLogger.D4(BrowserActivityBase.logname, "onPageStarted " + str);
            BrowserActivityBase.this.inappBrowserBase.mUrl = str;
            BrowserActivityBase.this.notifyiGO(str);
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String str) {
            super.onPageFinished(webView, str);
            DebugLogger.D4(BrowserActivityBase.logname, "onPageFinished " + str);
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, int i, String str, String str2) {
            super.onReceivedError(webView, i, str, str2);
            DebugLogger.D4(BrowserActivityBase.logname, "onReceivedError errorCode: " + Integer.toString(i) + " " + str);
            BrowserActivityBase.this.errorReceived(i, str, str2);
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedHttpAuthRequest(WebView webView, HttpAuthHandler httpAuthHandler, String str, String str2) {
            super.onReceivedHttpAuthRequest(webView, httpAuthHandler, str, str2);
            DebugLogger.D4(BrowserActivityBase.logname, String.format("onReceivedHttpAuthRequest handler = '%s', ream = '%s'", httpAuthHandler, str2));
        }
    };
    WebChromeClient webChromeClient = new WebChromeClient() { // from class: com.navngo.igo.javaclient.browser.BrowserActivityBase.3
        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView webView, int i) {
            super.onProgressChanged(webView, i);
            DebugLogger.D4(BrowserActivityBase.logname, String.format(null, "progress = %d", Integer.valueOf(i)));
        }

        @Override // android.webkit.WebChromeClient
        public boolean onCreateWindow(WebView webView, boolean z, boolean z2, Message message) {
            DebugLogger.D4(BrowserActivityBase.logname, String.format("onCreateWindow", new Object[0]));
            return super.onCreateWindow(webView, z, z2, message);
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsAlert(WebView webView, String str, String str2, JsResult jsResult) {
            DebugLogger.D4(BrowserActivityBase.logname, String.format("onJsAlert", new Object[0]));
            return super.onJsAlert(webView, str, str2, jsResult);
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsPrompt(WebView webView, String str, String str2, String str3, JsPromptResult jsPromptResult) {
            DebugLogger.D4(BrowserActivityBase.logname, String.format("onJsPrompt", new Object[0]));
            return super.onJsPrompt(webView, str, str2, str3, jsPromptResult);
        }
    };
    protected boolean mFinishedManually = false;

    public static class ButtonData implements Serializable {
        public static final int TopCenter = 2;
        public static final int TopLeft = 1;
        public static final int TopRight = 3;
        public final String buttonText;
        public final String callbackID;
        public final int positionID;

        public ButtonData(int i, String str, String str2) {
            this.positionID = i;
            this.buttonText = str;
            this.callbackID = str2;
        }
    }

    private static void enablePlugins(WebSettings webSettings) {
        if (Build.VERSION.SDK_INT < 8) {
            try {
                WebSettings.class.getMethod("setPluginsEnabled", Boolean.class).invoke(webSettings, true);
                return;
            } catch (Exception e) {
                DebugLogger.D1(logname, "can't call WebSettings.setPluginsEnabled", e);
                return;
            }
        }
        webSettings.setPluginState(WebSettings.PluginState.ON);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        InAppBrowserBase inAppBrowserBase = this.inappBrowserBase;
        Objects.requireNonNull(inAppBrowserBase, "inappBrowserBase can't be null");
        this.mFinishedManually = false;
        this.urlToLoad = inAppBrowserBase.getUrl();
        this.inappBrowserBase.setBrowser(this);
        if (this.urlToLoad == null) {
            throw new IllegalStateException("No URL specified");
        }
        requestWindowFeature(1);
        DebugLogger.D4(logname, "Url to load: " + this.urlToLoad);
        View viewInflate = getLayoutInflater().inflate(R.layout.inapp_browser, (ViewGroup) null);
        CookieSyncManager.createInstance(this);
        this.webView = (WebView) viewInflate.findViewById(R.id.webView);
        setContentView(viewInflate);
        this.webView.setInitialScale(1);
        this.webView.getSettings().setUseWideViewPort(true);
        this.webView.setScrollBarStyle(33554432);
        ArrayList arrayList = (ArrayList) getIntent().getSerializableExtra("buttonData");
        if (arrayList != null && arrayList.size() > 0) {
            RelativeLayout relativeLayout = (RelativeLayout) viewInflate.findViewById(R.id.buttonBar);
            for (int i = 0; i < arrayList.size(); i++) {
                ButtonData buttonData = (ButtonData) arrayList.get(i);
                Button button = new Button(this, null, android.R.attr.buttonStyleSmall);
                button.setText(buttonData.buttonText);
                button.setMinimumWidth(100);
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams.leftMargin = 1;
                layoutParams.rightMargin = 1;
                layoutParams.topMargin = 3;
                layoutParams.addRule(10);
                int i2 = buttonData.positionID;
                if (i2 != 2) {
                    if (i2 != 3) {
                        layoutParams.addRule(9);
                    } else {
                        layoutParams.addRule(11);
                    }
                }
                button.setLayoutParams(layoutParams);
                button.setTag(buttonData.callbackID);
                button.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.browser.BrowserActivityBase.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        BrowserActivityBase.this.inappBrowserBase.onButtonPressed((String) view.getTag());
                    }
                });
                relativeLayout.addView(button);
            }
        }
        CookieManager.getInstance().removeAllCookie();
        WebSettings settings = this.webView.getSettings();
        settings.setJavaScriptEnabled(true);
        enablePlugins(settings);
        DebugLogger.D4(logname, "User agent: " + settings.getUserAgentString());
        this.webView.setWebViewClient(this.webWiewClient);
        this.webView.loadUrl(this.urlToLoad);
    }

    protected final void notifyiGO(String str) {
        this.inappBrowserBase.callOpenPageCallback(str);
    }

    protected void errorReceived(int i, String str, String str2) {
        this.inappBrowserBase.callOpenPageCallback("onReceivedError;" + Integer.toString(i) + ";" + str2 + ";" + str);
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4 && this.webView.canGoBack()) {
            this.webView.goBack();
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    void finishBrowser() {
        this.mFinishedManually = true;
        DebugLogger.D4(logname, "Finishing browser");
        if (isFinishing()) {
            return;
        }
        finish();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.mFinishedManually) {
            return;
        }
        this.inappBrowserBase.onBrowserCancelled();
    }
}
