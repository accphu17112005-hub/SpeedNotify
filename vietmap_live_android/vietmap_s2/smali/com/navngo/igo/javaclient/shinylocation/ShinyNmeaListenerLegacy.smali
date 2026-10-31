###### Class com.navngo.igo.javaclient.shinylocation.ShinyNmeaListenerLegacy (com.navngo.igo.javaclient.shinylocation.ShinyNmeaListenerLegacy)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;
.implements Landroid/location/GpsStatus$NmeaListener;


# instance fields
.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V
    .registers 2

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    return-void
.end method


# virtual methods
.method public getProviderName()Ljava/lang/String;
    .registers 2

    const-string v0, "NNG!Nmea"

    return-object v0
.end method

.method public onNmeaReceived(JLjava/lang/String;)V
    .registers 6

    const-string v0, "nmea"

    .line 184
    :try_start_2
    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 185
    invoke-virtual {v1, v0, p3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "timestamp"

    .line 186
    invoke-virtual {v1, p3, p1, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addLong(Ljava/lang/String;J)V

    .line 187
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p1, v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_14} :catch_15

    goto :goto_1d

    :catch_15
    move-exception p1

    .line 189
    iget-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string p3, "onNmeaReceived"

    invoke-virtual {p2, p3, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_1d
    return-void
.end method

.method public startListening()V
    .registers 8

    .line 153
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    .line 155
    const-class v1, Landroid/location/LocationManager;

    const-string v2, "addNmeaListener"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/location/GpsStatus$NmeaListener;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v6

    .line 156
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 157
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Z)V
    :try_end_2d
    .catchall {:try_start_0 .. :try_end_2d} :catchall_2e

    goto :goto_38

    :catchall_2e
    move-exception v0

    .line 159
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_38
    return-void
.end method

.method public stopListening()V
    .registers 8

    .line 166
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    .line 168
    const-class v1, Landroid/location/LocationManager;

    const-string v2, "removeNmeaListener"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/location/GpsStatus$NmeaListener;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v6

    .line 169
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;)V
    :try_end_26
    .catchall {:try_start_0 .. :try_end_26} :catchall_27

    goto :goto_31

    :catchall_27
    move-exception v0

    .line 172
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListenerLegacy;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_31
    return-void
.end method
