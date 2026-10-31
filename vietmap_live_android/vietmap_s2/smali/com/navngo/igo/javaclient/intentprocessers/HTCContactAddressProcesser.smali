###### Class com.navngo.igo.javaclient.intentprocessers.HTCContactAddressProcesser (com.navngo.igo.javaclient.intentprocessers.HTCContactAddressProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/HTCContactAddressProcesser;
.super Ljava/lang/Object;
.source "HTCContactAddressProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getAddressFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .registers 4

    .line 13
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_8

    return-object v0

    :cond_8
    const-string v1, "REVERSE_ADDR_ON_MAP_BUNDLE"

    .line 15
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_11

    return-object v0

    :cond_11
    const-string v0, "Address"

    .line 17
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 3

    .line 21
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/HTCContactAddressProcesser;->getAddressFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_c

    const-string v0, ""

    if-eq p1, v0, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 4

    .line 26
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/HTCContactAddressProcesser;->getAddressFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_15

    const-string v0, ""

    if-ne p1, v0, :cond_b

    goto :goto_15

    .line 28
    :cond_b
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_15
    :goto_15
    const/4 p1, 0x0

    return p1
.end method
