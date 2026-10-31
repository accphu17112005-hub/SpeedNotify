###### Class com.navngo.igo.javaclient.gps.GpsHacks (com.navngo.igo.javaclient.gps.GpsHacks)
.class public final Lcom/navngo/igo/javaclient/gps/GpsHacks;
.super Ljava/lang/Object;
.source "GpsHacks.java"


# static fields
.field public static final DOP_AVERAGE_VALUE:D = 3.0

.field public static final DOP_BAD_VALUE:D = 6.0

.field private static final NMEA_GPGGA_ACC:I = 0x8

.field private static final NMEA_GPGGA_FIX:I = 0x6

.field private static final NMEA_GPGGA_MINLEN:I = 0xa

.field private static hasNmea:Z = false

.field private static ovrFlAccuracy:F = 0.0f

.field private static ovrHasAccuracy:Z = false


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertHdopToMeters(F)F
    .registers 5

    .line 105
    sget v0, Lcom/navngo/igo/javaclient/Config;->horizontal_accuracy_treshold:I

    int-to-float v0, v0

    mul-float p0, p0, v0

    float-to-double v0, p0

    const-wide/high16 v2, 0x4018000000000000L    # 6.0

    div-double/2addr v0, v2

    double-to-float p0, v0

    return p0
.end method

.method public static getOvrFlAccuracy()F
    .registers 1

    .line 19
    sget v0, Lcom/navngo/igo/javaclient/gps/GpsHacks;->ovrFlAccuracy:F

    return v0
.end method

.method public static getOvrHasAccuracy()Z
    .registers 1

    .line 18
    sget-boolean v0, Lcom/navngo/igo/javaclient/gps/GpsHacks;->ovrHasAccuracy:Z

    return v0
.end method

.method public static guessAccuracy(Ljava/lang/Iterable;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Landroid/location/GpsSatellite;",
            ">;)V"
        }
    .end annotation

    .line 41
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :cond_6
    :goto_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/GpsSatellite;

    .line 43
    invoke-virtual {v2}, Landroid/location/GpsSatellite;->usedInFix()Z

    move-result v2

    if-eqz v2, :cond_6

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_1b
    const/4 p0, 0x5

    const/4 v2, 0x1

    if-lt v1, p0, :cond_27

    const/high16 p0, 0x41c80000    # 25.0f

    const/4 v3, 0x6

    if-lt v1, v3, :cond_29

    const/high16 p0, 0x40a00000    # 5.0f

    goto :goto_29

    :cond_27
    const/4 p0, 0x0

    const/4 v2, 0x0

    .line 67
    :cond_29
    :goto_29
    invoke-static {v2, p0, v0}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->overrideAccuracy(ZFZ)V

    return-void
.end method

.method public static overrideAccuracy(ZFZ)V
    .registers 5

    if-eqz p2, :cond_10

    .line 25
    sget-boolean v0, Lcom/navngo/igo/javaclient/gps/GpsHacks;->hasNmea:Z

    if-nez v0, :cond_d

    const-string v0, "accuracy_workaround"

    const-string v1, "NMEA works and sends GPGGA messages."

    .line 26
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    const/4 v0, 0x1

    .line 27
    sput-boolean v0, Lcom/navngo/igo/javaclient/gps/GpsHacks;->hasNmea:Z

    :cond_10
    if-nez p2, :cond_16

    .line 29
    sget-boolean p2, Lcom/navngo/igo/javaclient/gps/GpsHacks;->hasNmea:Z

    if-nez p2, :cond_1a

    .line 31
    :cond_16
    sput-boolean p0, Lcom/navngo/igo/javaclient/gps/GpsHacks;->ovrHasAccuracy:Z

    .line 32
    sput p1, Lcom/navngo/igo/javaclient/gps/GpsHacks;->ovrFlAccuracy:F

    :cond_1a
    return-void
.end method

.method public static ovrAccuracyNmea(Ljava/lang/String;)Z
    .registers 5

    const-string v0, "$GPGGA,"

    .line 83
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    :cond_a
    const-string v0, ","

    .line 86
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 87
    array-length v2, v0

    const/16 v3, 0xa

    if-ge v2, v3, :cond_35

    .line 89
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Malformed NMEA message, $GPGAA has "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v0, v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " fields: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "accuracy_workaround"

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_35
    const/4 p0, 0x6

    .line 93
    aget-object p0, v0, p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    const/4 v2, 0x1

    if-eqz p0, :cond_40

    const/4 v1, 0x1

    :cond_40
    if-eqz v1, :cond_4b

    const/16 p0, 0x8

    .line 96
    aget-object p0, v0, p0

    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    goto :goto_4c

    :cond_4b
    const/4 p0, 0x0

    .line 98
    :goto_4c
    invoke-static {p0}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->convertHdopToMeters(F)F

    move-result p0

    invoke-static {v1, p0, v2}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->overrideAccuracy(ZFZ)V

    return v2
.end method
