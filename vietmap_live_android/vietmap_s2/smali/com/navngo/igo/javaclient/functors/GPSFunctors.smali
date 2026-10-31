###### Class com.navngo.igo.javaclient.functors.GPSFunctors (com.navngo.igo.javaclient.functors.GPSFunctors)
.class public Lcom/navngo/igo/javaclient/functors/GPSFunctors;
.super Ljava/lang/Object;
.source "GPSFunctors.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# static fields
.field static final logname:Ljava/lang/String; = "GPSFunctors"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isGpsProviderEnabled()Z
    .registers 5

    .line 20
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isGpsDenied()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_11

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->isGpsDenied()Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_11

    :cond_f
    const/4 v0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 v0, 0x1

    :goto_12
    new-array v2, v2, [Ljava/lang/Object;

    .line 21
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v1, "isGpsProviderEnabled = %b"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "GPSFunctors"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public openLocationSettingsDialog()V
    .registers 3

    .line 26
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 27
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public registerFunctors()V
    .registers 4

    .line 31
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.gps.is_gps_enabled"

    const-string v2, "isGpsProviderEnabled"

    .line 32
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.gps.open_location_settings_dialog"

    const-string v2, "openLocationSettingsDialog"

    .line 33
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
