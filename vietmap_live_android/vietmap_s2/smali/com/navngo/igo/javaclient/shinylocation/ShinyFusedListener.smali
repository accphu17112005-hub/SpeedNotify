###### Class com.navngo.igo.javaclient.shinylocation.ShinyFusedListener (com.navngo.igo.javaclient.shinylocation.ShinyFusedListener)
.class Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;
.super Lcom/google/android/gms/location/LocationCallback;
.source "ShinyLocationListener.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyListener;


# instance fields
.field private fusedLocationProviderClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field private utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;)V
    .registers 2

    .line 437
    invoke-direct {p0}, Lcom/google/android/gms/location/LocationCallback;-><init>()V

    .line 438
    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    .line 439
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/content/Context;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->fusedLocationProviderClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    return-void
.end method


# virtual methods
.method public getProviderName()Ljava/lang/String;
    .registers 2

    const-string v0, "NNG!Fused"

    return-object v0
.end method

.method synthetic lambda$startListening$0$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener(Ljava/lang/Exception;)V
    .registers 3

    .line 461
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v0, "Location settings are not good enough for FusedLocation"

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->logDebugMessage(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$startListening$1$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener(Ljava/lang/Void;)V
    .registers 4

    .line 467
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->getProviderName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$startListening$2$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener(Ljava/lang/Exception;)V
    .registers 4

    .line 470
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendRegisterMessage(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public onLocationAvailability(Lcom/google/android/gms/location/LocationAvailability;)V
    .registers 4

    .line 488
    :try_start_0
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v1, "isLocationAvailable"

    .line 489
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationAvailability;->isLocationAvailable()Z

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBool(Ljava/lang/String;Z)V

    .line 490
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "fusedAvailable"

    invoke-virtual {p1, v1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_15
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_15} :catch_16

    goto :goto_1e

    :catch_16
    move-exception p1

    .line 492
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onLocationAvailability"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :goto_1e
    return-void
.end method

.method public onLocationResult(Lcom/google/android/gms/location/LocationResult;)V
    .registers 8

    .line 498
    invoke-virtual {p1}, Lcom/google/android/gms/location/LocationResult;->getLocations()Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 500
    :goto_6
    :try_start_6
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_43

    .line 501
    new-instance v2, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    const-string v3, "location"

    .line 502
    iget-object v4, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/location/Location;

    invoke-virtual {v4, v5}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->locationToJson(Landroid/location/Location;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addObject(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V

    const-string v3, "isLast"

    .line 503
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    if-ne v1, v4, :cond_2d

    goto :goto_2e

    :cond_2d
    const/4 v5, 0x0

    :goto_2e
    invoke-virtual {v2, v3, v5}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBool(Ljava/lang/String;Z)V

    .line 504
    iget-object v3, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v4, "fused"

    invoke-virtual {v3, v4, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendJson(Ljava/lang/String;Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;)V
    :try_end_38
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_38} :catch_3b

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :catch_3b
    move-exception p1

    .line 507
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    const-string v1, "onLocationResult"

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->handleJsonException(Ljava/lang/String;Lorg/json/JSONException;)V

    :cond_43
    return-void
.end method

.method public startListening()V
    .registers 4

    .line 446
    invoke-static {}, Lcom/google/android/gms/location/LocationRequest;->create()Lcom/google/android/gms/location/LocationRequest;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    .line 447
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setInterval(J)Lcom/google/android/gms/location/LocationRequest;

    .line 448
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/location/LocationRequest;->setFastestInterval(J)Lcom/google/android/gms/location/LocationRequest;

    const/16 v1, 0x64

    .line 449
    invoke-virtual {v0, v1}, Lcom/google/android/gms/location/LocationRequest;->setPriority(I)Lcom/google/android/gms/location/LocationRequest;

    .line 453
    new-instance v1, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;-><init>()V

    .line 454
    invoke-virtual {v1, v0}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->addLocationRequest(Lcom/google/android/gms/location/LocationRequest;)Lcom/google/android/gms/location/LocationSettingsRequest$Builder;

    move-result-object v1

    .line 456
    iget-object v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/location/LocationServices;->getSettingsClient(Landroid/content/Context;)Lcom/google/android/gms/location/SettingsClient;

    move-result-object v2

    .line 457
    invoke-virtual {v1}, Lcom/google/android/gms/location/LocationSettingsRequest$Builder;->build()Lcom/google/android/gms/location/LocationSettingsRequest;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/google/android/gms/location/SettingsClient;->checkLocationSettings(Lcom/google/android/gms/location/LocationSettingsRequest;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;)V

    .line 458
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    .line 465
    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->fusedLocationProviderClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p0, v2}, Lcom/google/android/gms/location/FusedLocationProviderClient;->requestLocationUpdates(Lcom/google/android/gms/location/LocationRequest;Lcom/google/android/gms/location/LocationCallback;Landroid/os/Looper;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda2;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;)V

    .line 466
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda1;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;)V

    .line 469
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public stopListening()V
    .registers 3

    .line 476
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->fusedLocationProviderClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/location/FusedLocationProviderClient;->removeLocationUpdates(Lcom/google/android/gms/location/LocationCallback;)Lcom/google/android/gms/tasks/Task;

    .line 477
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->utils:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationUtils;->sendUnregisterMessage(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->lambda$startListening$0$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener(Ljava/lang/Exception;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda1 (com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda1)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->lambda$startListening$2$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener(Ljava/lang/Exception;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda2 (com.navngo.igo.javaclient.shinylocation.ShinyFusedListener$$ExternalSyntheticLambda2)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda2;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener$$ExternalSyntheticLambda2;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyFusedListener;->lambda$startListening$1$com-navngo-igo-javaclient-shinylocation-ShinyFusedListener(Ljava/lang/Void;)V

    return-void
.end method
