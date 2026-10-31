###### Class com.navngo.igo.javaclient.browser.InAppBrowser (com.navngo.igo.javaclient.browser.InAppBrowser)
.class public Lcom/navngo/igo/javaclient/browser/InAppBrowser;
.super Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;
.source "InAppBrowser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# static fields
.field private static instance:Lcom/navngo/igo/javaclient/browser/InAppBrowser;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .line 33
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;-><init>()V

    .line 34
    iget-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->mButtonData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 35
    const-class v0, Lcom/navngo/igo/javaclient/browser/BrowserActivity;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->mBrowserActivityClass:Ljava/lang/Class;

    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/browser/InAppBrowser;
    .registers 1

    .line 39
    sget-object v0, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->instance:Lcom/navngo/igo/javaclient/browser/InAppBrowser;

    if-nez v0, :cond_b

    .line 40
    new-instance v0, Lcom/navngo/igo/javaclient/browser/InAppBrowser;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/browser/InAppBrowser;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->instance:Lcom/navngo/igo/javaclient/browser/InAppBrowser;

    .line 42
    :cond_b
    sget-object v0, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->instance:Lcom/navngo/igo/javaclient/browser/InAppBrowser;

    return-object v0
.end method


# virtual methods
.method public registerFunctors()V
    .registers 4

    .line 46
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.browser.show"

    const-string v2, "show"

    .line 48
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.browser.close"

    const-string v2, "close"

    .line 49
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.browser.removeButtons"

    const-string v2, "removeButtons"

    .line 51
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.browser.addButton"

    const-string v2, "addButton"

    .line 52
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.browser.loadUrl"

    const-string v2, "loadUrl"

    .line 54
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
