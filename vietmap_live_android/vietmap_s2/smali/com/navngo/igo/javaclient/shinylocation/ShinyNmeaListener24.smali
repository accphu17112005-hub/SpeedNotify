###### Class com.navngo.igo.javaclient.shinylocation.ShinyNmeaListener24 (com.navngo.igo.javaclient.shinylocation.ShinyNmeaListener24)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;
.implements Landroid/location/OnNmeaMessageListener;


# instance fields
.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V
    .registers 2

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    return-void
.end method


# virtual methods
.method public getProviderName()Ljava/lang/String;
    .registers 2

    const-string v0, "NNG!Nmea24"

    return-object v0
.end method

.method public onNmeaMessage(Ljava/lang/String;J)V
    .registers 6

    .line 228
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "nmea"

    .line 229
    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "timestamp"

    .line 230
    invoke-virtual {v0, p1, p2, p3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addLong(Ljava/lang/String;J)V

    .line 231
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string p2, "nmea24"

    invoke-virtual {p1, p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_16} :catch_17

    goto :goto_1f

    :catch_17
    move-exception p1

    .line 233
    iget-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string p3, "onNmeaMessage"

    invoke-virtual {p2, p3, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_1f
    return-void
.end method

.method public startListening()V
    .registers 4

    .line 207
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->addNmeaListener(Landroid/location/OnNmeaMessageListener;)Z

    move-result v0

    .line 208
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_0 .. :try_end_13} :catchall_14

    goto :goto_1e

    :catchall_14
    move-exception v0

    .line 210
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1e
    return-void
.end method

.method public stopListening()V
    .registers 3

    .line 216
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeNmeaListener(Landroid/location/OnNmeaMessageListener;)V

    .line 217
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyNmeaListener24;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;)V

    return-void
.end method
