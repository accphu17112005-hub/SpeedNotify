###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationUtils (com.navngo.igo.javaclient.shinylocation.ShinyLocationUtils)
.class public Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;
.super Ljava/lang/Object;
.source "ShinyLocationUtils.java"


# static fields
.field public static final LOCATION_UPDATE_INTERVAL:I = 0x3e8


# instance fields
.field private consumer:Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;

.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;Landroid/content/Context;)V
    .registers 3

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->consumer:Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;

    .line 26
    iput-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    .line 58
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getLocationManager()Landroid/location/LocationManager;
    .registers 3

    .line 62
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->context:Landroid/content/Context;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    return-object v0
.end method

.method public getSecureSetting(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V
    .registers 5

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "JSONException in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->logDebugMessage(Ljava/lang/String;)V

    return-void
.end method

.method public hasPermission(Ljava/lang/String;)Z
    .registers 4

    .line 66
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_10

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    return p1
.end method

.method public isGooglePlayServicesAvailable()Z
    .registers 3

    .line 74
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public locationToJson(Landroid/location/Location;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 30
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 31
    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->hasAccuracy()Z

    move-result v3

    const-string v4, "accuracy"

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    .line 32
    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v1

    invoke-virtual {p1}, Landroid/location/Location;->hasAltitude()Z

    move-result v3

    const-string v4, "altitude"

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    .line 33
    invoke-virtual {p1}, Landroid/location/Location;->getBearing()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->hasBearing()Z

    move-result v3

    const-string v4, "bearing"

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    .line 34
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    const-string v3, "latitude"

    invoke-virtual {v0, v3, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addDouble(Ljava/lang/String;D)V

    .line 35
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    const-string v3, "longitude"

    invoke-virtual {v0, v3, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addDouble(Ljava/lang/String;D)V

    .line 36
    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    const-string v2, "provider"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->hasSpeed()Z

    move-result v3

    const-string v4, "speed"

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    .line 38
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v1

    const-string v3, "time"

    invoke-virtual {v0, v3, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addLong(Ljava/lang/String;J)V

    .line 39
    invoke-virtual {p1}, Landroid/location/Location;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extras"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 41
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_78

    .line 42
    invoke-virtual {p1}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v1

    const-string v3, "elapsedRealtimeNanos17"

    invoke-virtual {v0, v3, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addLong(Ljava/lang/String;J)V

    .line 45
    :cond_78
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-lt v1, v2, :cond_87

    .line 46
    invoke-virtual {p1}, Landroid/location/Location;->isFromMockProvider()Z

    move-result v1

    const-string v2, "isFromMockProvider18"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBool(Ljava/lang/String;Z)V

    .line 49
    :cond_87
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_b7

    .line 50
    invoke-virtual {p1}, Landroid/location/Location;->getBearingAccuracyDegrees()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->hasBearingAccuracy()Z

    move-result v3

    const-string v4, "bearingAccuracyDegrees26"

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    .line 51
    invoke-virtual {p1}, Landroid/location/Location;->getSpeedAccuracyMetersPerSecond()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->hasSpeedAccuracy()Z

    move-result v3

    const-string v4, "speedAccuracyMetersPerSecond26"

    invoke-virtual {v0, v4, v1, v2, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    .line 52
    invoke-virtual {p1}, Landroid/location/Location;->getVerticalAccuracyMeters()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p1}, Landroid/location/Location;->hasVerticalAccuracy()Z

    move-result p1

    const-string v3, "verticalAccuracyMeters26"

    invoke-virtual {v0, v3, v1, v2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    :cond_b7
    return-object v0
.end method

.method public logDebugMessage(Ljava/lang/String;)V
    .registers 3

    .line 144
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->consumer:Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;

    if-eqz v0, :cond_7

    .line 145
    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;->LogDebugMessage(Ljava/lang/String;)V

    :cond_7
    return-void
.end method

.method public sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    .registers 6

    .line 79
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 80
    iget-object p2, p2, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->obj:Lorg/json/JSONObject;

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "javaTick"

    .line 81
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    .line 83
    iget-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->consumer:Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;

    if-eqz p2, :cond_29

    .line 84
    invoke-interface {p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;->JsonDataArrived(Ljava/lang/String;)V
    :try_end_22
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_22} :catch_23

    goto :goto_29

    :catch_23
    move-exception p1

    const-string p2, "sendJson"

    .line 86
    invoke-virtual {p0, p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :cond_29
    :goto_29
    return-void
.end method

.method public sendRegisterMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 106
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "result"

    .line 107
    invoke-virtual {v0, v1, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_11

    const-string p2, "message"

    .line 109
    invoke-virtual {v0, p2, p3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    const-string p2, "provider"

    .line 110
    invoke-virtual {v0, p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "register"

    .line 111
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_1b
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_1b} :catch_1c

    goto :goto_22

    :catch_1c
    move-exception p1

    const-string p2, "sendRegisterMessage"

    .line 113
    invoke-virtual {p0, p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_22
    return-void
.end method

.method public sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 101
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "exception"

    invoke-virtual {p0, p1, v0, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendRegisterMessage(Ljava/lang/String;Z)V
    .registers 4

    if-eqz p2, :cond_5

    const-string p2, "success"

    goto :goto_7

    :cond_5
    const-string p2, "fail"

    :goto_7
    const/4 v0, 0x0

    .line 97
    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendUnregisterMessage(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x1

    .line 118
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;Z)V

    return-void
.end method

.method public sendUnregisterMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 132
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "result"

    .line 133
    invoke-virtual {v0, v1, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_11

    const-string p2, "message"

    .line 135
    invoke-virtual {v0, p2, p3}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    const-string p2, "provider"

    .line 136
    invoke-virtual {v0, p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "unregister"

    .line 137
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_1b
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_1b} :catch_1c

    goto :goto_22

    :catch_1c
    move-exception p1

    const-string p2, "sendUnregisterMessage"

    .line 139
    invoke-virtual {p0, p2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_22
    return-void
.end method

.method public sendUnregisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    .line 127
    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "exception"

    invoke-virtual {p0, p1, v0, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public sendUnregisterMessage(Ljava/lang/String;Z)V
    .registers 4

    if-eqz p2, :cond_5

    const-string p2, "success"

    goto :goto_7

    :cond_5
    const-string p2, "fail"

    :goto_7
    const/4 v0, 0x0

    .line 123
    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
