###### Class com.navngo.igo.javaclient.browser.BrowserActivity (com.navngo.igo.javaclient.browser.BrowserActivity)
.class public Lcom/navngo/igo/javaclient/browser/BrowserActivity;
.super Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;
.source "BrowserActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 18
    invoke-static {}, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->getInstance()Lcom/navngo/igo/javaclient/browser/InAppBrowser;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/browser/BrowserActivity;->inappBrowserBase:Lcom/navngo/igo/javaclient/browser/InAppBrowserBase;

    .line 19
    invoke-super {p0, p1}, Lcom/navngo/igo/javaclient/browser/BrowserActivityBase;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method
