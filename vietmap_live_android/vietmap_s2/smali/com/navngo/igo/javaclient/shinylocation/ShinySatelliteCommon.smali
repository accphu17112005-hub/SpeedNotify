###### Class com.navngo.igo.javaclient.shinylocation.ShinySatelliteCommon (com.navngo.igo.javaclient.shinylocation.ShinySatelliteCommon)
.class abstract Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;
.super Ljava/lang/Object;
.source "ShinySatellite.java"


# instance fields
.field public azimuth:D

.field public elevation:D

.field public hasAlmanac:Z

.field public hasEpheremis:Z

.field public usedInFix:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addDifference(Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;)Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-eqz p2, :cond_a

    .line 22
    iget-wide v0, p2, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->azimuth:D

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->azimuth:D

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_11

    .line 23
    :cond_a
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->azimuth:D

    const-string v2, "azimuth"

    invoke-virtual {p1, v2, v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addDouble(Ljava/lang/String;D)V

    :cond_11
    if-eqz p2, :cond_1b

    .line 24
    iget-wide v0, p2, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->elevation:D

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->elevation:D

    cmpl-double v4, v0, v2

    if-eqz v4, :cond_22

    .line 25
    :cond_1b
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->elevation:D

    const-string v2, "elevation"

    invoke-virtual {p1, v2, v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addDouble(Ljava/lang/String;D)V

    :cond_22
    if-eqz p2, :cond_2a

    .line 26
    iget-boolean v0, p2, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->hasAlmanac:Z

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->hasAlmanac:Z

    if-eq v0, v1, :cond_31

    .line 27
    :cond_2a
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->hasAlmanac:Z

    const-string v1, "hasAlmanac"

    invoke-virtual {p1, v1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBool(Ljava/lang/String;Z)V

    :cond_31
    if-eqz p2, :cond_39

    .line 28
    iget-boolean v0, p2, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->hasEpheremis:Z

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->hasEpheremis:Z

    if-eq v0, v1, :cond_40

    .line 29
    :cond_39
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->hasEpheremis:Z

    const-string v1, "hasEphemeris"

    invoke-virtual {p1, v1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBool(Ljava/lang/String;Z)V

    :cond_40
    if-eqz p2, :cond_48

    .line 30
    iget-boolean p2, p2, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->usedInFix:Z

    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->usedInFix:Z

    if-eq p2, v0, :cond_4f

    .line 31
    :cond_48
    iget-boolean p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinySatelliteCommon;->usedInFix:Z

    const-string v0, "usedInFix"

    invoke-virtual {p1, v0, p2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyJsonObject;->addBool(Ljava/lang/String;Z)V

    :cond_4f
    return-object p1
.end method
