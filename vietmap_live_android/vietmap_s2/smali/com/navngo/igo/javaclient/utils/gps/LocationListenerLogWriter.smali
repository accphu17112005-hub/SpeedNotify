###### Class com.navngo.igo.javaclient.utils.gps.LocationListenerLogWriter (com.navngo.igo.javaclient.utils.gps.LocationListenerLogWriter)
.class public Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;
.super Ljava/lang/Object;
.source "LocationListenerLogWriter.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field public static final headerVersion:Ljava/lang/String; = "LocationListener log v1.0"

.field private static final logname:Ljava/lang/String; = "LocationListenerLogWriter"


# instance fields
.field out:Ljava/io/ObjectOutputStream;

.field startTime:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    :try_start_3
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 28
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    const-string v0, "LocationListener log v1.0"

    .line 29
    invoke-virtual {v1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_14} :catch_1b

    .line 35
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->startTime:J

    return-void

    :catch_1b
    move-exception v0

    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error opening file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "LocationListenerLogWriter"

    invoke-static {v1, p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    throw v0
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .registers 5

    .line 39
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onLocationChanged(Landroid/location/Location;)V

    .line 41
    :try_start_3
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->writeTimestamp()V

    .line 42
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 43
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 44
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeFloat(F)V

    .line 45
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/ObjectOutputStream;->writeDouble(D)V

    .line 46
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getBearing()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeFloat(F)V

    .line 47
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->writeBundle(Ljava/io/ObjectOutputStream;Landroid/os/Bundle;)V

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/ObjectOutputStream;->writeDouble(D)V

    .line 49
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/ObjectOutputStream;->writeDouble(D)V

    .line 50
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeFloat(F)V

    .line 51
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 52
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->hasAccuracy()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 53
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->hasAltitude()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 54
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->hasBearing()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 55
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Landroid/location/Location;->hasSpeed()Z

    move-result p1

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 56
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->flush()V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_86} :catch_87

    goto :goto_8e

    :catch_87
    const-string p1, "LocationListenerLogWriter"

    const-string v0, "Error during location logging"

    .line 58
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_8e
    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 4

    .line 63
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onProviderDisabled(Ljava/lang/String;)V

    .line 65
    :try_start_3
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->writeTimestamp()V

    .line 66
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 67
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 68
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->flush()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_16} :catch_17

    goto :goto_1e

    :catch_17
    const-string p1, "LocationListenerLogWriter"

    const-string v0, "Error during location logging"

    .line 70
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1e
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 4

    .line 75
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onProviderEnabled(Ljava/lang/String;)V

    .line 77
    :try_start_3
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->writeTimestamp()V

    .line 78
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 79
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 80
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->flush()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_16} :catch_17

    goto :goto_1e

    :catch_17
    const-string p1, "LocationListenerLogWriter"

    const-string v0, "Error during location logging"

    .line 82
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1e
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 6

    .line 87
    invoke-static {p1, p2, p3}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogger;->onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 89
    :try_start_3
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->writeTimestamp()V

    .line 90
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 91
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 92
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1, p2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 93
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p0, p1, p3}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->writeBundle(Ljava/io/ObjectOutputStream;Landroid/os/Bundle;)V

    .line 94
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->flush()V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_20} :catch_21

    goto :goto_28

    :catch_21
    const-string p1, "LocationListenerLogWriter"

    const-string p2, "Error during location logging"

    .line 96
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_28
    return-void
.end method

.method protected writeBundle(Ljava/io/ObjectOutputStream;Landroid/os/Bundle;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p2, 0x0

    .line 105
    invoke-virtual {p1, p2}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    return-void
.end method

.method protected writeTimestamp()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->out:Ljava/io/ObjectOutputStream;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;->startTime:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    return-void
.end method
