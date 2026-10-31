###### Class com.navngo.igo.javaclient.shinylocation.ShinyGpsStatusListenerLegacy (com.navngo.igo.javaclient.shinylocation.ShinyGpsStatusListenerLegacy)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;
.implements Landroid/location/GpsStatus$Listener;


# instance fields
.field private prevSatellites:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;",
            ">;"
        }
    .end annotation
.end field

.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V
    .registers 3

    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->prevSatellites:Ljava/util/HashMap;

    .line 244
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    return-void
.end method


# virtual methods
.method public getProviderName()Ljava/lang/String;
    .registers 2

    const-string v0, "NNG!GpsStatus"

    return-object v0
.end method

.method public onGpsStatusChanged(I)V
    .registers 9

    .line 273
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p1, v1, :cond_8e

    const/4 v1, 0x2

    if-eq p1, v1, :cond_8b

    const/4 v1, 0x3

    if-eq p1, v1, :cond_74

    const/4 v1, 0x4

    if-eq p1, v1, :cond_14

    goto/16 :goto_90

    :cond_14
    const-string p1, "gpsSatellites"

    .line 291
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getGpsStatus(Landroid/location/GpsStatus;)Landroid/location/GpsStatus;

    move-result-object v1

    .line 292
    invoke-virtual {v1}, Landroid/location/GpsStatus;->getSatellites()Ljava/lang/Iterable;

    move-result-object v1

    .line 294
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 295
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 296
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_32
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/location/GpsSatellite;

    .line 297
    invoke-virtual {v4}, Landroid/location/GpsSatellite;->getPrn()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 298
    new-instance v6, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;

    invoke-direct {v6, v4}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;-><init>(Landroid/location/GpsSatellite;)V

    .line 299
    invoke-virtual {v2, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    iget-object v4, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->prevSatellites:Ljava/util/HashMap;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;

    .line 302
    invoke-virtual {v6, v4}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->getDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    .line 304
    :cond_5e
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->prevSatellites:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6c

    const-string v1, "data"

    .line 305
    invoke-virtual {v0, v1, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addArray(Ljava/lang/String;Ljava/lang/Iterable;)V

    goto :goto_71

    :cond_6c
    const-string v1, "diff"

    .line 307
    invoke-virtual {v0, v1, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addArray(Ljava/lang/String;Ljava/lang/Iterable;)V

    .line 310
    :goto_71
    iput-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->prevSatellites:Ljava/util/HashMap;

    goto :goto_89

    :cond_74
    const-string p1, "gpsFirstFix"

    .line 286
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/location/LocationManager;->getGpsStatus(Landroid/location/GpsStatus;)Landroid/location/GpsStatus;

    move-result-object v1

    const-string v2, "timeToFirstFix"

    .line 287
    invoke-virtual {v1}, Landroid/location/GpsStatus;->getTimeToFirstFix()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addInt(Ljava/lang/String;I)V

    :goto_89
    move-object v2, p1

    goto :goto_90

    :cond_8b
    const-string v2, "gpsStop"

    goto :goto_90

    :cond_8e
    const-string v2, "gpsStart"

    .line 315
    :goto_90
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_95
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_95} :catch_96

    goto :goto_9e

    :catch_96
    move-exception p1

    .line 317
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onStatusChanged"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_9e
    return-void
.end method

.method public startListening()V
    .registers 4

    .line 251
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->addGpsStatusListener(Landroid/location/GpsStatus$Listener;)Z

    move-result v0

    .line 252
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_0 .. :try_end_13} :catchall_14

    goto :goto_1e

    :catchall_14
    move-exception v0

    .line 254
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1e
    return-void
.end method

.method public stopListening()V
    .registers 3

    .line 260
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeGpsStatusListener(Landroid/location/GpsStatus$Listener;)V

    .line 261
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGpsStatusListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;)V

    return-void
.end method
