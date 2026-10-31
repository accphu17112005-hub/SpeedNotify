###### Class com.navngo.igo.javaclient.browser.InAppBrowserBase (com.navngo.igo.javaclient.browser.InAppBrowserBase)
.class public Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;
.super Ljava/lang/Object;
.source "InAppBrowserBase.java"


# static fields
.field protected static final CANCELLED:Ljava/lang/String; = "CANCELLED"

.field private static final logname:Ljava/lang/String; = "InAppBrowserBase"


# instance fields
.field protected mBrowserActivityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field protected mButtonData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;",
            ">;"
        }
    .end annotation
.end field

.field protected mCallbackFunc:Ljava/lang/String;

.field protected mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

.field protected mUICall:Ljava/lang/Boolean;

.field protected mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mButtonData:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 115
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUrl:Ljava/lang/String;

    .line 116
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    const/4 v1, 0x1

    .line 117
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUICall:Ljava/lang/Boolean;

    .line 118
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    .line 119
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mBrowserActivityClass:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public addButton(ILjava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 88
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mButtonData:Ljava/util/ArrayList;

    new-instance v1, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;

    invoke-direct {v1, p1, p2, p3}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase$ButtonData;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method callOpenPageCallback(Ljava/lang/String;)V
    .registers 8

    .line 108
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    .line 109
    iget-object v1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUICall:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_1e

    .line 110
    iget-object v1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    new-instance v5, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    invoke-direct {v5, p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;-><init>(Ljava/lang/String;)V

    aput-object v5, v3, v2

    invoke-virtual {v0, v1, v4, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_2c

    .line 112
    :cond_1e
    iget-object v1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    new-instance v5, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    invoke-direct {v5, p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;-><init>(Ljava/lang/String;)V

    aput-object v5, v3, v2

    invoke-virtual {v0, v1, v4, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :goto_2c
    return-void
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    if-eqz v0, :cond_14

    const-string v0, "InAppBrowserBase"

    const-string v1, "Closing browser"

    .line 80
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->finishBrowser()V

    const/4 v0, 0x0

    .line 82
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    return-void

    .line 79
    :cond_14
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No browser to close"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCallbackFunc()Ljava/lang/String;
    .registers 2

    .line 64
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .line 60
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUrl:Ljava/lang/String;

    return-object v0
.end method

.method public loadUrl(Ljava/lang/String;)V
    .registers 4

    .line 20
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    if-eqz v0, :cond_13

    iget-object v0, v0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    if-eqz v0, :cond_13

    .line 21
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    new-instance v1, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;

    invoke-direct {v1, p0, p1}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;-><init>(Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    .line 20
    :cond_13
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "No browser to load"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method onBrowserCancelled()V
    .registers 2

    const-string v0, "CANCELLED"

    .line 70
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->callOpenPageCallback(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    return-void
.end method

.method onButtonPressed(Ljava/lang/String;)V
    .registers 2

    .line 96
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->callOpenPageCallback(Ljava/lang/String;)V

    return-void
.end method

.method public removeButtons()V
    .registers 2

    .line 92
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mButtonData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method setBrowser(Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;)V
    .registers 2

    .line 104
    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    return-void
.end method

.method public show(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const-string v0, "Url parameter can\'t be null"

    .line 38
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_5a

    .line 40
    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUrl:Ljava/lang/String;

    if-eqz p2, :cond_52

    .line 41
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_52

    .line 43
    iput-object p2, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    const/4 p1, 0x0

    .line 45
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUICall:Ljava/lang/Boolean;

    .line 48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    const-string p2, "ui."

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_38

    .line 50
    iget-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCallbackFunc:Ljava/lang/String;

    const/4 p1, 0x1

    .line 51
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mUICall:Ljava/lang/Boolean;

    .line 54
    :cond_38
    new-instance p1, Landroid/content/Intent;

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mBrowserActivityClass:Ljava/lang/Class;

    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 55
    iget-object p2, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mButtonData:Ljava/util/ArrayList;

    const-string v0, "buttonData"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 56
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 42
    :cond_52
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "openPageCallback must be supplied !"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 39
    :cond_5a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Url can\'t be empty !"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

###### Class com.navngo.igo.javaclient.browser.InAppBrowserBase.AnonymousClass1 (com.navngo.igo.javaclient.browser.InAppBrowserBase$1)
.class Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;
.super Ljava/lang/Object;
.source "InAppBrowserBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->loadUrl(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;Ljava/lang/String;)V
    .registers 3

    .line 21
    iput-object p1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;->this$0:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 23
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;->this$0:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;->mCurrentBrowser:Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->webView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
