###### Class com.navngo.igo.javaclient.shinylocation.ShinyGnssStatusListener24 (com.navngo.igo.javaclient.shinylocation.ShinyGnssStatusListener24)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;
.super Landroid/location/GnssStatus$Callback;
.source "ShinyLocationListener.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;
    }
.end annotation


# instance fields
.field private prevSatellites:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V
    .registers 4

    .line 351
    invoke-direct {p0}, Landroid/location/GnssStatus$Callback;-><init>()V

    .line 349
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$1;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->prevSatellites:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

    .line 352
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    return-void
.end method


# virtual methods
.method public getProviderName()Ljava/lang/String;
    .registers 2

    const-string v0, "NNG!GnssStatus24"

    return-object v0
.end method

.method public onFirstFix(I)V
    .registers 4

    .line 379
    invoke-super {p0, p1}, Landroid/location/GnssStatus$Callback;->onFirstFix(I)V

    .line 381
    :try_start_3
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "timeToFirstFix"

    .line 382
    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addInt(Ljava/lang/String;I)V

    .line 383
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "gnssFirstFix24"

    invoke-virtual {p1, v1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_14} :catch_15

    goto :goto_1d

    :catch_15
    move-exception p1

    .line 385
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onFirstFix"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_1d
    return-void
.end method

.method public onSatelliteStatusChanged(Landroid/location/GnssStatus;)V
    .registers 9

    .line 391
    invoke-super {p0, p1}, Landroid/location/GnssStatus$Callback;->onSatelliteStatusChanged(Landroid/location/GnssStatus;)V

    .line 393
    :try_start_3
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$1;)V

    .line 394
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    .line 395
    :goto_f
    invoke-virtual {p1}, Landroid/location/GnssStatus;->getSatelliteCount()I

    move-result v3

    if-ge v2, v3, :cond_35

    .line 396
    invoke-virtual {p1, v2}, Landroid/location/GnssStatus;->getConstellationType(I)I

    move-result v3

    .line 397
    invoke-virtual {p1, v2}, Landroid/location/GnssStatus;->getSvid(I)I

    move-result v4

    .line 398
    new-instance v5, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;

    invoke-direct {v5, p1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;-><init>(Landroid/location/GnssStatus;I)V

    .line 399
    invoke-virtual {v0, v3, v4, v5}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->put(IILcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;)V

    .line 401
    iget-object v6, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->prevSatellites:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

    invoke-virtual {v6, v3, v4}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->get(II)Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;

    move-result-object v3

    .line 402
    invoke-virtual {v5, v3}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->getDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 405
    :cond_35
    new-instance p1, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 406
    iget-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->prevSatellites:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_48

    const-string v2, "data"

    .line 407
    invoke-virtual {p1, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addArray(Ljava/lang/String;Ljava/lang/Iterable;)V

    goto :goto_4d

    :cond_48
    const-string v2, "diff"

    .line 409
    invoke-virtual {p1, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addArray(Ljava/lang/String;Ljava/lang/Iterable;)V

    .line 411
    :goto_4d
    iput-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->prevSatellites:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;

    .line 412
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "gnssSatellites24"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_56
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_56} :catch_57

    goto :goto_5f

    :catch_57
    move-exception p1

    .line 414
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onSatelliteStatusChanged"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_5f
    return-void
.end method

.method public onStarted()V
    .registers 4

    .line 420
    invoke-super {p0}, Landroid/location/GnssStatus$Callback;->onStarted()V

    .line 421
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 422
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v2, "gnssStart24"

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    return-void
.end method

.method public onStopped()V
    .registers 4

    .line 427
    invoke-super {p0}, Landroid/location/GnssStatus$Callback;->onStopped()V

    .line 428
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 429
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v2, "gnssStop24"

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    return-void
.end method

.method public startListening()V
    .registers 4

    .line 359
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->registerGnssStatusCallback(Landroid/location/GnssStatus$Callback;)Z

    move-result v0

    .line 360
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_0 .. :try_end_13} :catchall_14

    goto :goto_1e

    :catchall_14
    move-exception v0

    .line 362
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->getProviderName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1e
    return-void
.end method

.method public stopListening()V
    .registers 3

    .line 368
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->unregisterGnssStatusCallback(Landroid/location/GnssStatus$Callback;)V

    .line 369
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyGnssStatusListener24.AnonymousClass1 (com.navngo.igo.javaclient.shinylocation.ShinyGnssStatusListener24$1)
.class synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$1;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation

###### Class com.navngo.igo.javaclient.shinylocation.ShinyGnssStatusListener24.SatelliteMap (com.navngo.igo.javaclient.shinylocation.ShinyGnssStatusListener24$SatelliteMap)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;
.super Ljava/lang/Object;
.source "ShinyLocationListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SatelliteMap"
.end annotation


# instance fields
.field private satellites:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;)V
    .registers 2

    .line 327
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->this$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->satellites:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$1;)V
    .registers 3

    .line 327
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24;)V

    return-void
.end method


# virtual methods
.method public get(II)Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;
    .registers 4

    .line 337
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->satellites:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    if-nez p1, :cond_10

    const/4 p1, 0x0

    return-object p1

    .line 340
    :cond_10
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;

    return-object p1
.end method

.method public isEmpty()Z
    .registers 2

    .line 344
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->satellites:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public put(IILcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;)V
    .registers 7

    .line 331
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->satellites:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 332
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->satellites:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    :cond_1a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyGnssStatusListener24$SatelliteMap;->satellites:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
