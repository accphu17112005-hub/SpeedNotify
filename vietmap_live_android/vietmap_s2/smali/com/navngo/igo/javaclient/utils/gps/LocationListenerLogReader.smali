###### Class com.navngo.igo.javaclient.utils.gps.LocationListenerLogReader (com.navngo.igo.javaclient.utils.gps.LocationListenerLogReader)
.class public Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;
.super Ljava/lang/Object;
.source "LocationListenerLogReader.java"


# static fields
.field private static final logname:Ljava/lang/String; = "LocationListenerLogReader"


# instance fields
.field in:Ljava/io/ObjectInputStream;

.field isValid:Z

.field listener:Landroid/location/LocationListener;


# direct methods
.method public constructor <init>(Landroid/location/LocationListener;Ljava/io/ObjectInputStream;)V
    .registers 4

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->isValid:Z

    .line 23
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->listener:Landroid/location/LocationListener;

    .line 24
    iput-object p2, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    :try_start_a
    const-string p1, "LocationListener log v1.0"

    .line 26
    invoke-virtual {p2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_14} :catch_17

    if-eqz p1, :cond_17

    return-void

    :catch_17
    :cond_17
    const/4 p1, 0x0

    .line 33
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->isValid:Z

    const-string p1, "LocationListenerLogReader"

    const-string p2, "Bad log file version!"

    .line 34
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public isEOF()Z
    .registers 3

    const/4 v0, 0x1

    .line 39
    :try_start_1
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->isValid:Z

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->available()I

    move-result v1
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_f

    if-nez v1, :cond_e

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :catch_f
    :cond_f
    :goto_f
    return v0
.end method

.method public readBundle()Landroid/os/Bundle;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 112
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 113
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v1

    :goto_b
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_1e

    .line 115
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 116
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move v1, v2

    goto :goto_b

    :cond_1e
    return-object v0
.end method

.method public readNextRecord(Z)V
    .registers 5

    .line 54
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->isValid:Z

    if-nez v0, :cond_5

    return-void

    .line 56
    :cond_5
    :try_start_5
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    if-eqz v0, :cond_5e

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4a

    const/4 v1, 0x2

    if-eq v0, v1, :cond_36

    const/4 v1, 0x3

    if-eq v0, v1, :cond_18

    goto/16 :goto_e7

    .line 96
    :cond_18
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 97
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v1

    .line 98
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->readBundle()Landroid/os/Bundle;

    move-result-object v2

    if-nez p1, :cond_e7

    .line 100
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 101
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->listener:Landroid/location/LocationListener;

    invoke-interface {p1, v0, v1, v2}, Landroid/location/LocationListener;->onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    goto/16 :goto_e7

    .line 87
    :cond_36
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez p1, :cond_e7

    .line 89
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onProviderDisabled(Ljava/lang/String;)V

    .line 90
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->listener:Landroid/location/LocationListener;

    invoke-interface {p1, v0}, Landroid/location/LocationListener;->onProviderDisabled(Ljava/lang/String;)V

    goto/16 :goto_e7

    .line 78
    :cond_4a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez p1, :cond_e7

    .line 80
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onProviderEnabled(Ljava/lang/String;)V

    .line 81
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->listener:Landroid/location/LocationListener;

    invoke-interface {p1, v0}, Landroid/location/LocationListener;->onProviderEnabled(Ljava/lang/String;)V

    goto/16 :goto_e7

    .line 58
    :cond_5e
    new-instance v0, Landroid/location/Location;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 59
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readFloat()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/location/Location;->setAccuracy(F)V

    .line 60
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readDouble()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setAltitude(D)V

    .line 61
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readFloat()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/location/Location;->setBearing(F)V

    .line 62
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->readBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/location/Location;->setExtras(Landroid/os/Bundle;)V

    .line 63
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readDouble()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setLatitude(D)V

    .line 64
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readDouble()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setLongitude(D)V

    .line 65
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readFloat()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/location/Location;->setSpeed(F)V

    .line 66
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/location/Location;->setTime(J)V

    .line 67
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v1

    if-nez v1, :cond_bc

    invoke-virtual {v0}, Landroid/location/Location;->removeAccuracy()V

    .line 68
    :cond_bc
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v1

    if-nez v1, :cond_c7

    invoke-virtual {v0}, Landroid/location/Location;->removeAltitude()V

    .line 69
    :cond_c7
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v1

    if-nez v1, :cond_d2

    invoke-virtual {v0}, Landroid/location/Location;->removeBearing()V

    .line 70
    :cond_d2
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v1

    if-nez v1, :cond_dd

    invoke-virtual {v0}, Landroid/location/Location;->removeSpeed()V

    :cond_dd
    if-nez p1, :cond_e7

    .line 72
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onLocationChanged(Landroid/location/Location;)V

    .line 73
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->listener:Landroid/location/LocationListener;

    invoke-interface {p1, v0}, Landroid/location/LocationListener;->onLocationChanged(Landroid/location/Location;)V
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_e7} :catch_e8

    :cond_e7
    :goto_e7
    return-void

    :catch_e8
    move-exception p1

    .line 107
    new-instance v0, Ljava/lang/Error;

    invoke-direct {v0, p1}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public readNextTimestamp()J
    .registers 3

    .line 46
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->isValid:Z

    if-nez v0, :cond_7

    const-wide/16 v0, -0x1

    return-wide v0

    .line 48
    :cond_7
    :try_start_7
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->in:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_d} :catch_e

    return-wide v0

    :catch_e
    move-exception v0

    .line 50
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
