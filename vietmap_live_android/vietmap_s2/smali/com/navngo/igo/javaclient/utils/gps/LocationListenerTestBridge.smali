###### Class com.navngo.igo.javaclient.utils.gps.LocationListenerTestBridge (com.navngo.igo.javaclient.utils.gps.LocationListenerTestBridge)
.class public Lcom/navngo/igo/javaclient/utils/gps/LocationListenerTestBridge;
.super Ljava/lang/Object;
.source "LocationListenerTestBridge.java"

# interfaces
.implements Landroid/location/LocationListener;


# instance fields
.field manager:Landroid/location/LocationManager;


# direct methods
.method public constructor <init>(Landroid/location/LocationManager;)V
    .registers 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerTestBridge;->manager:Landroid/location/LocationManager;

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .registers 4

    .line 20
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerTestBridge;->manager:Landroid/location/LocationManager;

    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/location/LocationManager;->setTestProviderLocation(Ljava/lang/String;Landroid/location/Location;)V

    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 4

    .line 24
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerTestBridge;->manager:Landroid/location/LocationManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/location/LocationManager;->setTestProviderEnabled(Ljava/lang/String;Z)V

    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 4

    .line 28
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerTestBridge;->manager:Landroid/location/LocationManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/location/LocationManager;->setTestProviderEnabled(Ljava/lang/String;Z)V

    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 10

    .line 32
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerTestBridge;->manager:Landroid/location/LocationManager;

    const-wide/16 v4, 0x3e8

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->setTestProviderStatus(Ljava/lang/String;ILandroid/os/Bundle;J)V

    return-void
.end method
