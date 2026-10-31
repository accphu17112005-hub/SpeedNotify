###### Class com.navngo.igo.javaclient.utils.gps.LocationListenerExtender (com.navngo.igo.javaclient.utils.gps.LocationListenerExtender)
.class public Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;
.super Ljava/lang/Object;
.source "LocationListenerExtender.java"

# interfaces
.implements Landroid/location/LocationListener;


# instance fields
.field private delegateList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/location/LocationListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/location/LocationListener;)V
    .registers 3

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    .line 18
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->addDelegate(Landroid/location/LocationListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/location/LocationListener;Landroid/location/LocationListener;)V
    .registers 4

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    .line 22
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->addDelegate(Landroid/location/LocationListener;)V

    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->addDelegate(Landroid/location/LocationListener;)V

    return-void
.end method


# virtual methods
.method public addDelegate(Landroid/location/LocationListener;)V
    .registers 3

    if-eqz p1, :cond_7

    .line 26
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .registers 4

    .line 30
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationListener;

    invoke-interface {v1, p1}, Landroid/location/LocationListener;->onLocationChanged(Landroid/location/Location;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 4

    .line 34
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationListener;

    invoke-interface {v1, p1}, Landroid/location/LocationListener;->onProviderDisabled(Ljava/lang/String;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 4

    .line 38
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationListener;

    invoke-interface {v1, p1}, Landroid/location/LocationListener;->onProviderEnabled(Ljava/lang/String;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 6

    .line 42
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;->delegateList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/LocationListener;

    invoke-interface {v1, p1, p2, p3}, Landroid/location/LocationListener;->onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    goto :goto_6

    :cond_16
    return-void
.end method
