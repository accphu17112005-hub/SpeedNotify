###### Class com.navngo.igo.javaclient.browser.BrowserActivityBase (com.navngo.igo.javaclient.browser.BrowserActivityBase)
.class public Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;
.super Landroid/app/Activity;
.source "BrowserActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "BrowserActivityBase"


# instance fields
.field protected inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

.field protected mFinishedManually:Z

.field protected urlToLoad:Ljava/lang/String;

.field webChromeClient:Landroid/webkit/WebChromeClient;

.field webView:Landroid/webkit/WebView;

.field webWiewClient:Landroid/webkit/WebViewClient;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 38
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    .line 180
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->urlToLoad:Ljava/lang/String;

    .line 182
    new-instance v0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;-><init>(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webWiewClient:Landroid/webkit/WebViewClient;

    .line 218
    new-instance v0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$3;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$3;-><init>(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webChromeClient:Landroid/webkit/WebChromeClient;

    const/4 v0, 0x0

    .line 273
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->mFinishedManually:Z

    return-void
.end method

.method private static enablePlugins(Landroid/webkit/WebSettings;)V
    .registers 7

    .line 67
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-ge v0, v1, :cond_2b

    .line 71
    :try_start_6
    const-class v0, Landroid/webkit/WebSettings;

    const-string v1, "setPluginsEnabled"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/Boolean;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_21} :catch_22

    goto :goto_30

    :catch_22
    move-exception p0

    const-string v0, "BrowserActivityBase"

    const-string v1, "can\'t call WebSettings.setPluginsEnabled"

    .line 73
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_30

    .line 77
    :cond_2b
    sget-object v0, Landroid/webkit/WebSettings$PluginState;->ON:Landroid/webkit/WebSettings$PluginState;

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setPluginState(Landroid/webkit/WebSettings$PluginState;)V

    :goto_30
    return-void
.end method


# virtual methods
.method protected errorReceived(ILjava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 176
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceivedError;"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ";"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->callOpenPageCallback(Ljava/lang/String;)V

    return-void
.end method

.method finishBrowser()V
    .registers 3

    const/4 v0, 0x1

    .line 258
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->mFinishedManually:Z

    const-string v0, "BrowserActivityBase"

    const-string v1, "Finishing browser"

    .line 259
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_13

    .line 261
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->finish()V

    :cond_13
    return-void
.end method

.method protected final notifyiGO(Ljava/lang/String;)V
    .registers 3

    .line 172
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->callOpenPageCallback(Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 13

    .line 84
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    const-string v0, "inappBrowserBase can\'t be null"

    .line 86
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 88
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->mFinishedManually:Z

    .line 90
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->getUrl()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->urlToLoad:Ljava/lang/String;

    .line 91
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    invoke-virtual {p1, p0}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->setBrowser(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V

    .line 93
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->urlToLoad:Ljava/lang/String;

    if-eqz p1, :cond_116

    const/4 p1, 0x1

    .line 96
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->requestWindowFeature(I)Z

    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Url to load: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->urlToLoad:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BrowserActivityBase"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    sget v3, Lcom/navngo/igo/javaclient/R$layout;->inapp_browser:I

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 101
    invoke-static {p0}, Landroid/webkit/CookieSyncManager;->createInstance(Landroid/content/Context;)Landroid/webkit/CookieSyncManager;

    .line 104
    sget v3, Lcom/navngo/igo/javaclient/R$id;->webView:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    .line 105
    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->setContentView(Landroid/view/View;)V

    .line 108
    iget-object v3, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    invoke-virtual {v3, p1}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 109
    iget-object v3, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 110
    iget-object v3, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    const/high16 v5, 0x2000000

    invoke-virtual {v3, v5}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 112
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v5, "buttonData"

    .line 113
    invoke-virtual {v3, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_dc

    .line 114
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_dc

    .line 115
    sget v5, Lcom/navngo/igo/javaclient/R$id;->buttonBar:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    .line 116
    :goto_84
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_dc

    .line 117
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;

    .line 119
    new-instance v6, Landroid/widget/Button;

    const v7, 0x1010049

    invoke-direct {v6, p0, v4, v7}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 120
    iget-object v7, v5, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;->buttonText:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/16 v7, 0x64

    .line 122
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setMinimumWidth(I)V

    .line 124
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v7, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 128
    iput p1, v7, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    .line 129
    iput p1, v7, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    const/4 v8, 0x3

    .line 130
    iput v8, v7, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    const/16 v9, 0xa

    .line 132
    invoke-virtual {v7, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 134
    iget v9, v5, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;->positionID:I

    const/4 v10, 0x2

    if-eq v9, v10, :cond_c6

    if-eq v9, v8, :cond_c1

    const/16 v8, 0x9

    .line 137
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_c6

    :cond_c1
    const/16 v8, 0xb

    .line 140
    invoke-virtual {v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 147
    :cond_c6
    :goto_c6
    invoke-virtual {v6, v7}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    iget-object v5, v5, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;->callbackID:Ljava/lang/String;

    invoke-virtual {v6, v5}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 151
    new-instance v5, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$1;

    invoke-direct {v5, p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$1;-><init>(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V

    invoke-virtual {v6, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    invoke-virtual {v1, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_84

    .line 161
    :cond_dc
    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/CookieManager;->removeAllCookie()V

    .line 162
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 163
    invoke-virtual {v0, p1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 164
    invoke-static {v0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->enablePlugins(Landroid/webkit/WebSettings;)V

    .line 165
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "User agent: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webWiewClient:Landroid/webkit/WebViewClient;

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 168
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->urlToLoad:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void

    .line 94
    :cond_116
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "No URL specified"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected onDestroy()V
    .registers 2

    .line 266
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 268
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->mFinishedManually:Z

    if-nez v0, :cond_c

    .line 269
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->onBrowserCancelled()V

    :cond_c
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_12

    .line 249
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 250
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    const/4 p1, 0x1

    return p1

    .line 254
    :cond_12
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

###### Class com.navngo.igo.javaclient.browser.BrowserActivityBase.AnonymousClass1 (com.navngo.igo.javaclient.browser.BrowserActivityBase$1)
.class Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$1;
.super Ljava/lang/Object;
.source "BrowserActivityBase.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V
    .registers 2

    .line 151
    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$1;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$1;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->onButtonPressed(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.browser.BrowserActivityBase.AnonymousClass2 (com.navngo.igo.javaclient.browser.BrowserActivityBase$2)
.class Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;
.super Landroid/webkit/WebViewClient;
.source "BrowserActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V
    .registers 2

    .line 182
    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 3

    .line 186
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .registers 4

    .line 199
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 200
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onPageFinished "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "BrowserActivityBase"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 4

    .line 191
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 192
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "onPageStarted "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "BrowserActivityBase"

    invoke-static {p3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    iput-object p2, p1, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUrl:Ljava/lang/String;

    .line 194
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->notifyiGO(Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 205
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 206
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onReceivedError errorCode: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "BrowserActivityBase"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$2;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    invoke-virtual {p1, p2, p3, p4}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->errorReceived(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 212
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    aput-object p2, p1, p3

    const/4 p2, 0x1

    aput-object p4, p1, p2

    const-string p2, "onReceivedHttpAuthRequest handler = \'%s\', ream = \'%s\'"

    .line 213
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "BrowserActivityBase"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.browser.BrowserActivityBase.AnonymousClass3 (com.navngo.igo.javaclient.browser.BrowserActivityBase$3)
.class Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$3;
.super Landroid/webkit/WebChromeClient;
.source "BrowserActivityBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V
    .registers 2

    .line 218
    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$3;->this$0:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .registers 7

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onCreateWindow"

    .line 228
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BrowserActivityBase"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .registers 7

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onJsAlert"

    .line 234
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BrowserActivityBase"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    return p1
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .registers 8

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "onJsPrompt"

    .line 240
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BrowserActivityBase"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    invoke-super/range {p0 .. p5}, Landroid/webkit/WebChromeClient;->onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result p1

    return p1
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .registers 5

    .line 222
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    const/4 p1, 0x0

    .line 223
    move-object v0, p1

    check-cast v0, Ljava/util/Locale;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const-string p2, "progress = %d"

    invoke-static {p1, p2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "BrowserActivityBase"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.browser.BrowserActivityBase.ButtonData (com.navngo.igo.javaclient.browser.BrowserActivityBase$ButtonData)
.class public Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;
.super Ljava/lang/Object;
.source "BrowserActivityBase.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ButtonData"
.end annotation


# static fields
.field public static final TopCenter:I = 0x2

.field public static final TopLeft:I = 0x1

.field public static final TopRight:I = 0x3


# instance fields
.field public final buttonText:Ljava/lang/String;

.field public final callbackID:Ljava/lang/String;

.field public final positionID:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput p1, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;->positionID:I

    .line 56
    iput-object p2, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;->buttonText:Ljava/lang/String;

    .line 57
    iput-object p3, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;->callbackID:Ljava/lang/String;

    return-void
.end method
