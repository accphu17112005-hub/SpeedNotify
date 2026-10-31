###### Class com.navngo.igo.javaclient.matek.GeoArea (com.navngo.igo.javaclient.matek.GeoArea)
.class public Lcom/navngo/igo/javaclient/matek/GeoArea;
.super Ljava/lang/Object;
.source "GeoArea.java"


# static fields
.field private static metric_R:D = 6366197.7236758135


# instance fields
.field private maxDistance:F

.field private metric_origo:[F

.field private origo:Landroid/location/Location;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroid/location/Location;)V
    .registers 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->origo:Landroid/location/Location;

    if-eqz p1, :cond_d

    .line 20
    invoke-static {p1}, Lcom/navngo/igo/javaclient/matek/GeoArea;->getMetricLocation(Landroid/location/Location;)[F

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->metric_origo:[F

    :cond_d
    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->maxDistance:F

    return-void
.end method

.method public static getMetricLocation(Landroid/location/Location;)[F
    .registers 11

    .line 50
    sget-wide v0, Lcom/navngo/igo/javaclient/matek/GeoArea;->metric_R:D

    invoke-virtual {p0}, Landroid/location/Location;->getAltitude()D

    move-result-wide v2

    add-double/2addr v0, v2

    .line 51
    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    mul-double v2, v2, v4

    const-wide v6, 0x4066800000000000L    # 180.0

    div-double/2addr v2, v6

    .line 52
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    mul-double v8, v8, v0

    .line 53
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double v2, v2, v0

    .line 54
    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v0

    mul-double v0, v0, v4

    div-double/2addr v0, v6

    .line 55
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    mul-double v4, v4, v8

    .line 56
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    mul-double v0, v0, v8

    const/4 p0, 0x3

    new-array p0, p0, [F

    double-to-float v0, v0

    const/4 v1, 0x0

    aput v0, p0, v1

    double-to-float v0, v4

    const/4 v1, 0x1

    aput v0, p0, v1

    double-to-float v0, v2

    const/4 v1, 0x2

    aput v0, p0, v1

    return-object p0
.end method

.method public static metricLocationDiff([F[F)F
    .registers 5

    const/4 v0, 0x0

    .line 37
    aget v1, p0, v0

    aget v0, p1, v0

    sub-float/2addr v1, v0

    const/4 v0, 0x1

    .line 38
    aget v2, p0, v0

    aget v0, p1, v0

    sub-float/2addr v2, v0

    const/4 v0, 0x2

    .line 39
    aget p0, p0, v0

    aget p1, p1, v0

    sub-float/2addr p0, p1

    mul-float v1, v1, v1

    mul-float v2, v2, v2

    add-float/2addr v1, v2

    mul-float p0, p0, p0

    add-float/2addr v1, p0

    float-to-double p0, v1

    .line 40
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method


# virtual methods
.method public extend(Landroid/location/Location;)V
    .registers 4

    .line 25
    iget-object v0, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->origo:Landroid/location/Location;

    if-nez v0, :cond_f

    .line 26
    iput-object p1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->origo:Landroid/location/Location;

    if-eqz p1, :cond_23

    .line 28
    invoke-static {p1}, Lcom/navngo/igo/javaclient/matek/GeoArea;->getMetricLocation(Landroid/location/Location;)[F

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->metric_origo:[F

    goto :goto_23

    :cond_f
    if-eqz p1, :cond_23

    .line 30
    invoke-static {p1}, Lcom/navngo/igo/javaclient/matek/GeoArea;->getMetricLocation(Landroid/location/Location;)[F

    move-result-object p1

    .line 31
    iget v0, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->maxDistance:F

    iget-object v1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->metric_origo:[F

    invoke-static {p1, v1}, Lcom/navngo/igo/javaclient/matek/GeoArea;->metricLocationDiff([F[F)F

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->maxDistance:F

    :cond_23
    :goto_23
    return-void
.end method

.method public metricRadius()D
    .registers 3

    .line 45
    iget v0, p0, Lcom/navngo/igo/javaclient/matek/GeoArea;->maxDistance:F

    float-to-double v0, v0

    return-wide v0
.end method
