###### Class com.navngo.igo.javaclient.intentprocessers.NavigateToProcesser (com.navngo.igo.javaclient.intentprocessers.NavigateToProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;
.super Ljava/lang/Object;
.source "NavigateToProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# static fields
.field public static ACTION_NAVIGATE_TO:Ljava/lang/String; = "com.navngo.igo.javaclient.NAVIGATE_TO"

.field public static EXTRA_CITY:Ljava/lang/String; = "com.navngo.igo.address.CITY"

.field public static EXTRA_COUNTRY:Ljava/lang/String; = "com.navngo.igo.address.COUNTRY"

.field public static EXTRA_LATITUDE:Ljava/lang/String; = "com.navngo.igo.address.LATITUDE"

.field public static EXTRA_LONGITUDE:Ljava/lang/String; = "com.navngo.igo.address.LONGITUDE"

.field public static EXTRA_NUMBER:Ljava/lang/String; = "com.navngo.igo.address.NUMBER"

.field public static EXTRA_PREFER_COORDINATE_OVER_ADDRESS:Ljava/lang/String; = "com.navngo.igo.address.PREFER_COORDINATE_OVER_ADDRESS"

.field public static EXTRA_STATE:Ljava/lang/String; = "com.navngo.igo.address.STATE"

.field public static EXTRA_STREET:Ljava/lang/String; = "com.navngo.igo.address.STREET"

.field public static EXTRA_ZIP:Ljava/lang/String; = "com.navngo.igo.address.ZIP"

.field public static MIMETYPE:Ljava/lang/String; = "vnd.navngo.igo.item/address"


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 4

    .line 42
    sget-object v0, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->ACTION_NAVIGATE_TO:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v0, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->MIMETYPE:Ljava/lang/String;

    .line 43
    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1a

    const/4 p1, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    return p1
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 13

    .line 48
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_6b

    .line 49
    sget-object v0, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_PREFER_COORDINATE_OVER_ADDRESS:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 50
    sget-object v2, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_LATITUDE:Ljava/lang/String;

    const-wide v3, 0x406f400000000000L    # 250.0

    invoke-virtual {p1, v2, v3, v4}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v5

    .line 51
    sget-object v2, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_LONGITUDE:Ljava/lang/String;

    invoke-virtual {p1, v2, v3, v4}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v2

    .line 52
    new-instance v4, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v4, v5, v6, v2, v3}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>(DD)V

    .line 54
    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result v2

    if-eqz v2, :cond_33

    if-eqz v0, :cond_33

    .line 56
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V

    goto :goto_6c

    .line 60
    :cond_33
    sget-object v1, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_COUNTRY:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 61
    sget-object v1, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_STATE:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 62
    sget-object v1, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_CITY:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 63
    sget-object v1, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_STREET:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 64
    sget-object v1, Lcom/navngo/igo/javaclient/intentprocessers/NavigateToProcesser;->EXTRA_ZIP:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 66
    new-instance p1, Lcom/navngo/igo/javaclient/address/StructuredAddress;

    move-object v5, p1

    invoke-direct/range {v5 .. v10}, Lcom/navngo/igo/javaclient/address/StructuredAddress;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_62

    .line 68
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddress(Lcom/navngo/igo/javaclient/address/StructuredAddress;)Z

    move-result v1

    goto :goto_6c

    .line 71
    :cond_62
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    invoke-virtual {v0, p1, v4}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressOrPosition(Lcom/navngo/igo/javaclient/address/StructuredAddress;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)Z

    move-result v1

    goto :goto_6c

    :cond_6b
    const/4 v1, 0x0

    :goto_6c
    return v1
.end method
