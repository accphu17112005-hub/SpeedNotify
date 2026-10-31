###### Class com.navngo.igo.javaclient.shinylocation.ShinySatellite24 (com.navngo.igo.javaclient.shinylocation.ShinySatellite24)
.class final Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;
.super Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;
.source "ShinySatellite.java"


# instance fields
.field public carrierFrequency26:Ljava/util/OptionalDouble;

.field public cnzero:D

.field public constellation:I

.field public svid:I


# direct methods
.method public constructor <init>(Landroid/location/GnssStatus;I)V
    .registers 5

    .line 73
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;-><init>()V

    .line 75
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->getAzimuthDegrees(I)F

    move-result v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->azimuth:D

    .line 76
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->getElevationDegrees(I)F

    move-result v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->elevation:D

    .line 77
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->hasAlmanacData(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->hasAlmanac:Z

    .line 78
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->hasEphemerisData(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->hasEpheremis:Z

    .line 79
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->usedInFix(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->usedInFix:Z

    .line 82
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->getConstellationType(I)I

    move-result v0

    iput v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->constellation:I

    .line 83
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->getSvid(I)I

    move-result v0

    iput v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->svid:I

    .line 84
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->getCn0DbHz(I)F

    move-result v0

    float-to-double v0, v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->cnzero:D

    .line 85
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_4e

    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->hasCarrierFrequencyHz(I)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 86
    invoke-virtual {p1, p2}, Landroid/location/GnssStatus;->getCarrierFrequencyHz(I)F

    move-result p1

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/util/OptionalDouble;->of(D)Ljava/util/OptionalDouble;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->carrierFrequency26:Ljava/util/OptionalDouble;

    goto :goto_54

    .line 88
    :cond_4e
    invoke-static {}, Ljava/util/OptionalDouble;->empty()Ljava/util/OptionalDouble;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->carrierFrequency26:Ljava/util/OptionalDouble;

    :goto_54
    return-void
.end method

.method private constellationToString(I)Ljava/lang/String;
    .registers 2

    packed-switch p1, :pswitch_data_1c

    const-string p1, "unmapped"

    return-object p1

    :pswitch_6
    const-string p1, "galileo"

    return-object p1

    :pswitch_9
    const-string p1, "beidou"

    return-object p1

    :pswitch_c
    const-string p1, "qzss"

    return-object p1

    :pswitch_f
    const-string p1, "glonass"

    return-object p1

    :pswitch_12
    const-string p1, "sbas"

    return-object p1

    :pswitch_15
    const-string p1, "gps"

    return-object p1

    :pswitch_18
    const-string p1, "unknown"

    return-object p1

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_18
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public getDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 93
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;-><init>()V

    .line 95
    iget v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->constellation:I

    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->constellationToString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "constellation"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addString(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    iget v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->svid:I

    const-string v2, "svid"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addInt(Ljava/lang/String;I)V

    .line 98
    invoke-virtual {p0, v0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->addDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;

    if-eqz p1, :cond_24

    .line 101
    iget-wide v1, p1, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->cnzero:D

    iget-wide v3, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->cnzero:D

    cmpl-double v5, v1, v3

    if-eqz v5, :cond_2b

    .line 102
    :cond_24
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->cnzero:D

    const-string v3, "cnzero"

    invoke-virtual {v0, v3, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addDouble(Ljava/lang/String;D)V

    .line 103
    :cond_2b
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_50

    if-eqz p1, :cond_3d

    iget-object p1, p1, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->carrierFrequency26:Ljava/util/OptionalDouble;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->carrierFrequency26:Ljava/util/OptionalDouble;

    invoke-virtual {p1, v1}, Ljava/util/OptionalDouble;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_50

    .line 104
    :cond_3d
    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->carrierFrequency26:Ljava/util/OptionalDouble;

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v1, v2}, Ljava/util/OptionalDouble;->orElse(D)D

    move-result-wide v1

    iget-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatellite24;->carrierFrequency26:Ljava/util/OptionalDouble;

    invoke-virtual {p1}, Ljava/util/OptionalDouble;->isPresent()Z

    move-result p1

    const-string v3, "carrierFrequency26"

    invoke-virtual {v0, v3, v1, v2, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addOptionalDouble(Ljava/lang/String;DZ)V

    :cond_50
    return-object v0
.end method
