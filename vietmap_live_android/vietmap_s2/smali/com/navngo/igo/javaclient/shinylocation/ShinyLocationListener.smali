###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationListener (com.navngo.igo.javaclient.shinylocation.ShinyLocationListener)
.class public final Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"


# static fields
.field private static final CURRENT_LOG_VERSION:I = 0x8


# instance fields
.field private listeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;",
            ">;"
        }
    .end annotation
.end field

.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;Landroid/content/Context;)V
    .registers 7

    .line 530
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 526
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    .line 531
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-direct {v0, p1, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;-><init>(Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string p1, "ShinyLocationListener created"

    .line 532
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->logDebugMessage(Ljava/lang/String;)V

    .line 533
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->sendInitMessage()V

    .line 536
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x18

    if-ge p1, p2, :cond_21

    const/4 p1, 0x1

    goto :goto_22

    :cond_21
    const/4 p1, 0x0

    .line 538
    :goto_22
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v3, "gps"

    invoke-direct {v1, v3, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 539
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v3, "network"

    invoke-direct {v1, v3, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz p1, :cond_4c

    .line 541
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 542
    :cond_4c
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 544
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, p2, :cond_74

    .line 545
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance p2, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-direct {p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 546
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance p2, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-direct {p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 549
    :cond_74
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->isGooglePlayServicesAvailable()Z

    move-result p1

    if-eqz p1, :cond_88

    .line 550
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    new-instance p2, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-direct {p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_88
    return-void
.end method

.method private createPhoneObject()Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 576
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 577
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v2, "api_version"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addInt(Ljava/lang/String;I)V

    .line 578
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v2, "brand"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 579
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "model"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    sget-object v1, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    const-string v2, "serial"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_40

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-ge v1, v2, :cond_40

    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v2, "android.permission.READ_PHONE_STATE"

    .line 583
    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->hasPermission(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_40

    .line 584
    invoke-static {}, Landroid/os/Build;->getSerial()Ljava/lang/String;

    move-result-object v1

    const-string v2, "serial26"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 586
    :cond_40
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v2, "android_id"

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getSecureSetting(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private sendInitMessage()V
    .registers 4

    .line 564
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "log_version"

    const/16 v2, 0x8

    .line 565
    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addInt(Ljava/lang/String;I)V

    const-string v1, "phone"

    .line 566
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->createPhoneObject()Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addObject(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    .line 568
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v2, "init"

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_25

    :catch_1d
    move-exception v0

    .line 570
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v2, "sendInitMessage"

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_25
    return-void
.end method


# virtual methods
.method public done()V
    .registers 4

    .line 559
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v2, "done"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    return-void
.end method

.method public getListeners()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;",
            ">;"
        }
    .end annotation

    .line 556
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getShinyLocationUtils()Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;
    .registers 2

    .line 554
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    return-object v0
.end method

.method public startListening()V
    .registers 4

    .line 593
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v2, "startListening"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    .line 594
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;

    .line 595
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;->startListening()V

    goto :goto_12

    :cond_22
    return-void
.end method

.method public stopListening()V
    .registers 4

    .line 599
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v2, "stopListening"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    .line 600
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;

    .line 601
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;->stopListening()V

    goto :goto_12

    :cond_22
    return-void
.end method
