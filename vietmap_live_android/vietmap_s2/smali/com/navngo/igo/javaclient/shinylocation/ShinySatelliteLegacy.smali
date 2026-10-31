###### Class com.navngo.igo.javaclient.shinylocation.ShinySatelliteLegacy (com.navngo.igo.javaclient.shinylocation.ShinySatelliteLegacy)
.class final Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;
.super Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;
.source "ShinySatellite.java"


# instance fields
.field public prn:I

.field public snr:D


# direct methods
.method public constructor <init>(Landroid/location/GpsSatellite;)V
    .registers 4

    .line 40
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;-><init>()V

    .line 42
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->getAzimuth()F

    move-result v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->azimuth:D

    .line 43
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->getElevation()F

    move-result v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->elevation:D

    .line 44
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->hasAlmanac()Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->hasAlmanac:Z

    .line 45
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->hasEphemeris()Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->hasEpheremis:Z

    .line 46
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->usedInFix()Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->usedInFix:Z

    .line 49
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->getPrn()I

    move-result v0

    iput v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->prn:I

    .line 50
    invoke-virtual {p1}, Landroid/location/GpsSatellite;->getSnr()F

    move-result p1

    float-to-double v0, p1

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->snr:D

    return-void
.end method


# virtual methods
.method public getDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 54
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 56
    iget v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->prn:I

    const-string v2, "prn"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addInt(Ljava/lang/String;I)V

    .line 58
    invoke-virtual {p0, v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->addDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    if-eqz p1, :cond_19

    .line 60
    iget-wide v1, p1, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->snr:D

    iget-wide v3, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->snr:D

    cmpl-double p1, v1, v3

    if-eqz p1, :cond_20

    .line 61
    :cond_19
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteLegacy;->snr:D

    const-string p1, "snr"

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addDouble(Ljava/lang/String;D)V

    :cond_20
    return-object v0
.end method
