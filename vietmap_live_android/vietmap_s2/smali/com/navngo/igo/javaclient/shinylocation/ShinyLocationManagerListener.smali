###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationManagerListener (com.navngo.igo.javaclient.shinylocation.ShinyLocationManagerListener)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;
.implements Landroid/location/LocationListener;


# instance fields
.field private provider:Ljava/lang/String;

.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V
    .registers 3

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    .line 53
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->provider:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getProviderName()Ljava/lang/String;
    .registers 2

    .line 76
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->provider:Ljava/lang/String;

    return-object v0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .registers 5

    const-string v0, "gps"

    .line 82
    :try_start_2
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->locationToJson(Landroid/location/Location;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    move-result-object v1

    .line 83
    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 84
    iget-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v2, v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    .line 85
    :cond_17
    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object p1

    const-string v0, "network"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_33

    .line 86
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v0, "net"

    invoke-virtual {p1, v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2a} :catch_2b

    goto :goto_33

    :catch_2b
    move-exception p1

    .line 88
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onLocationChanged"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :cond_33
    :goto_33
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 4

    .line 132
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "provider"

    .line 133
    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "disable"

    invoke-virtual {p1, v1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_1a

    :catch_12
    move-exception p1

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onProviderDisabled"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_1a
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 4

    .line 121
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "provider"

    .line 122
    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "enable"

    invoke-virtual {p1, v1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_1a

    :catch_12
    move-exception p1

    .line 125
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onProviderEnabled"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_1a
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 7

    .line 95
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "unknown"

    if-eqz p2, :cond_16

    const/4 v2, 0x1

    if-eq p2, v2, :cond_13

    const/4 v2, 0x2

    if-eq p2, v2, :cond_10

    goto :goto_18

    :cond_10
    const-string v1, "AVAILABLE"

    goto :goto_18

    :cond_13
    const-string v1, "TEMPORARILY_UNAVAILABLE"

    goto :goto_18

    :cond_16
    const-string v1, "OUT_OF_SERVICE"

    :goto_18
    const-string p2, "provider"

    .line 108
    invoke-virtual {v0, p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "status"

    .line 109
    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "extras"

    .line 110
    invoke-virtual {v0, p1, p3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 112
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string p2, "providerStatus"

    invoke-virtual {p1, p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_2e} :catch_2f

    goto :goto_37

    :catch_2f
    move-exception p1

    .line 114
    iget-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string p3, "onStatusChanged"

    invoke-virtual {p2, p3, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_37
    return-void
.end method

.method public startListening()V
    .registers 8

    .line 60
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v1

    iget-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->provider:Ljava/lang/String;

    const-wide/16 v3, 0x3e8

    const/4 v5, 0x0

    move-object v6, p0

    invoke-virtual/range {v1 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 61
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->getProviderName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Z)V
    :try_end_19
    .catchall {:try_start_0 .. :try_end_19} :catchall_1a

    goto :goto_24

    :catchall_1a
    move-exception v0

    .line 63
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_24
    return-void
.end method

.method public stopListening()V
    .registers 3

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 71
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationManagerListener;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;)V

    return-void
.end method
