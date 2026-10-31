###### Class com.navngo.igo.javaclient.intentprocessers.GoogleMapsAddressProcesser (com.navngo.igo.javaclient.intentprocessers.GoogleMapsAddressProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/GoogleMapsAddressProcesser;
.super Ljava/lang/Object;
.source "GoogleMapsAddressProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getPositionFromGoogleQuery(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 5

    if-eqz p1, :cond_1d

    const-string v0, "[(][^()]*[)]"

    .line 84
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 85
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 86
    :goto_c
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_1d

    const-string p1, ""

    .line 87
    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 88
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    goto :goto_c

    :cond_1d
    if-eqz p1, :cond_24

    .line 92
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseGoogleCoordsFromString(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object p1

    goto :goto_25

    :cond_24
    const/4 p1, 0x0

    :goto_25
    return-object p1
.end method


# virtual methods
.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 4

    .line 34
    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 35
    :cond_18
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_30

    .line 36
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v0, "maps.google.com"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_30

    const/4 p1, 0x1

    goto :goto_31

    :cond_30
    const/4 p1, 0x0

    :goto_31
    return p1
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 6

    .line 42
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GoogleMapsAddressProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_6d

    .line 43
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string v0, "q"

    .line 44
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1a

    const-string v3, "near"

    .line 45
    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_1a
    if-nez v3, :cond_22

    const-string v3, "ll"

    .line 46
    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 48
    :cond_22
    invoke-direct {p0, v3}, Lcom/navngo/igo/javaclient/intentprocessers/GoogleMapsAddressProcesser;->getPositionFromGoogleQuery(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v3

    if-nez v3, :cond_65

    const-string v3, "daddr"

    .line 51
    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_36

    const-string v3, "saddr"

    .line 52
    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_36
    if-nez v3, :cond_3e

    const-string v3, "mrad"

    .line 53
    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_3e
    if-nez v3, :cond_44

    .line 54
    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_44
    if-eqz v3, :cond_6d

    const/16 p1, 0x2b

    const/16 v0, 0x20

    .line 56
    invoke-virtual {v3, p1, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->getPositionFromAddress(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v0

    if-nez v0, :cond_5d

    .line 59
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    goto :goto_6e

    .line 61
    :cond_5d
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V

    goto :goto_6e

    .line 67
    :cond_65
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V

    goto :goto_6e

    :cond_6d
    const/4 v1, 0x0

    :goto_6e
    return v1
.end method
