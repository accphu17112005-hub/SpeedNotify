###### Class com.navngo.igo.javaclient.NmeaListenerImpl (com.navngo.igo.javaclient.NmeaListenerImpl)
.class public Lcom/navngo/igo/javaclient/NmeaListenerImpl;
.super Ljava/lang/Object;
.source "NmeaListenerImpl.java"

# interfaces
.implements Landroid/location/GpsStatus$NmeaListener;
.implements Landroid/location/GpsStatus$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/NmeaListenerImpl$NmeaMessageListenerImpl;
    }
.end annotation


# static fields
.field private static locationListener:Landroid/location/LocationListener; = null

.field private static final logname:Ljava/lang/String; = "NmeaListenerImpl"

.field private static nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl; = null

.field private static nmeaListener_registered:Z = false


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;)V
    .registers 2

    .line 24
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;-><init>()V

    return-void
.end method

.method public static getLocationManager()Landroid/location/LocationManager;
    .registers 2

    .line 148
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    return-object v0
.end method

.method public static isGpsDenied()Z
    .registers 4

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "p_gps_enabled = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->p_gps_enabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NmeaListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    if-eqz v0, :cond_27

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->p_gps_enabled()Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_27

    :cond_25
    const/4 v0, 0x0

    goto :goto_28

    :cond_27
    :goto_27
    const/4 v0, 0x1

    .line 154
    :goto_28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isGpsDenied: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_37

    const-string v3, "true"

    goto :goto_39

    :cond_37
    const-string v3, "false"

    :goto_39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public static isListening()Z
    .registers 1

    .line 37
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    if-eqz v0, :cond_b

    sget-boolean v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener_registered:Z

    if-eqz v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 v0, 0x1

    :goto_c
    return v0
.end method

.method static p_gps_enabled()Z
    .registers 4

    .line 75
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 79
    :cond_6
    :try_start_6
    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    const-string v2, "gps"

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_10} :catch_11

    return v0

    :catch_11
    move-exception v0

    const-string v2, "NmeaListenerImpl"

    const-string v3, "p_gps_enabled: "

    .line 81
    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method public static setNmeaListener(Z)V
    .registers 3

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setNmeaListener: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NmeaListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    if-nez v0, :cond_1b

    return-void

    .line 66
    :cond_1b
    new-instance v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;-><init>(Z)V

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->runOnHandlerThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setNmeaListenerBody(Z)V
    .registers 11

    .line 88
    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v6

    .line 89
    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->isGpsDenied()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v7, 0x1

    if-nez v0, :cond_11

    if-nez p0, :cond_f

    goto :goto_11

    :cond_f
    const/4 v8, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 v8, 0x1

    :goto_12
    const-string v9, "NmeaListenerImpl"

    if-eqz p0, :cond_97

    .line 92
    :try_start_16
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_nmea:Z

    if-eqz v0, :cond_b1

    sget-boolean v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener_registered:Z

    if-nez v0, :cond_b1

    .line 93
    sget-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    if-nez v0, :cond_3e

    .line 94
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_30

    .line 95
    new-instance v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl$NmeaMessageListenerImpl;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl$NmeaMessageListenerImpl;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    goto :goto_37

    .line 97
    :cond_30
    new-instance v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    .line 100
    :goto_37
    new-instance v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl$2;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl$2;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->locationListener:Landroid/location/LocationListener;

    :cond_3e
    const-string v0, "NmeaListener: on"

    .line 108
    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_55

    const-string v0, "Missing ACCESS_FINE_LOCATION permission"

    .line 110
    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 113
    :cond_55
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isListening()Z

    move-result v0
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_59} :catch_7d

    if-nez v0, :cond_6d

    :try_start_5b
    const-string v1, "gps"

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    .line 115
    sget-object v5, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->locationListener:Landroid/location/LocationListener;

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_66} :catch_67

    goto :goto_6d

    :catch_67
    move-exception v0

    :try_start_68
    const-string v1, "setNmeaListenerBody: exception"

    .line 117
    invoke-static {v9, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 121
    :cond_6d
    :goto_6d
    sget-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    invoke-virtual {v6, v0}, Landroid/location/LocationManager;->addGpsStatusListener(Landroid/location/GpsStatus$Listener;)Z

    move-result v0

    .line 122
    sget-object v1, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/NmeaListenerHandler;->addNmeaListener(Lcom/navngo/igo/javaclient/NmeaListenerImpl;)Z

    move-result v1

    and-int/2addr v0, v1

    .line 123
    sput-boolean v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener_registered:Z
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_7c} :catch_7d

    goto :goto_b1

    :catch_7d
    move-exception v0

    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setNmeaListener: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b1

    .line 129
    :cond_97
    sget-boolean v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener_registered:Z

    if-eqz v0, :cond_b1

    const-string v0, "NmeaListener: remove"

    .line 130
    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    sput-boolean v1, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener_registered:Z

    .line 132
    sget-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/NmeaListenerHandler;->removeNmeaListener(Lcom/navngo/igo/javaclient/NmeaListenerImpl;)V

    .line 133
    sget-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->nmeaListener:Lcom/navngo/igo/javaclient/NmeaListenerImpl;

    invoke-virtual {v6, v0}, Landroid/location/LocationManager;->removeGpsStatusListener(Landroid/location/GpsStatus$Listener;)V

    .line 134
    sget-object v0, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->locationListener:Landroid/location/LocationListener;

    invoke-virtual {v6, v0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    :cond_b1
    :goto_b1
    if-eqz v8, :cond_da

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GPS (NMEA) is not enabled (provider denied: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->isGpsDenied()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " UI denied: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    xor-int/2addr p0, v7

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v9, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_df

    :cond_da
    const-string p0, "GPS (NMEA) is enabled"

    .line 143
    invoke-static {v9, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :goto_df
    return-void
.end method


# virtual methods
.method public onGpsStatusChanged(I)V
    .registers 3

    const/4 v0, 0x1

    if-eq p1, v0, :cond_c

    const/4 v0, 0x2

    if-eq p1, v0, :cond_7

    goto :goto_10

    :cond_7
    const/4 p1, 0x3

    .line 56
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    goto :goto_10

    :cond_c
    const/4 p1, 0x4

    .line 53
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    :goto_10
    return-void
.end method

.method public onNmeaReceived(JLjava/lang/String;)V
    .registers 6

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NMEA: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NmeaListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    if-eqz v0, :cond_1d

    .line 45
    invoke-static {p3}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->ovrAccuracyNmea(Ljava/lang/String;)Z

    .line 47
    :cond_1d
    invoke-static {p1, p2, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->onNmeaReceived(JLjava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.NmeaListenerImpl.AnonymousClass1 (com.navngo.igo.javaclient.NmeaListenerImpl$1)
.class Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;
.super Ljava/lang/Object;
.source "NmeaListenerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/NmeaListenerImpl;->setNmeaListener(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$gpslistenerwanted:Z


# direct methods
.method constructor <init>(Z)V
    .registers 2

    .line 66
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;->val$gpslistenerwanted:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 69
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;->val$gpslistenerwanted:Z

    invoke-static {v0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->setNmeaListenerBody(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.NmeaListenerImpl.AnonymousClass2 (com.navngo.igo.javaclient.NmeaListenerImpl$2)
.class Lcom/navngo/igo/javaclient/NmeaListenerImpl$2;
.super Ljava/lang/Object;
.source "NmeaListenerImpl.java"

# interfaces
.implements Landroid/location/LocationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/NmeaListenerImpl;->setNmeaListenerBody(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .registers 3

    .line 102
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->onLocationChanged(Landroid/location/Location;)V

    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 2

    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 2

    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 4

    return-void
.end method

###### Class com.navngo.igo.javaclient.NmeaListenerImpl.NmeaMessageListenerImpl (com.navngo.igo.javaclient.NmeaListenerImpl$NmeaMessageListenerImpl)
.class public final Lcom/navngo/igo/javaclient/NmeaListenerImpl$NmeaMessageListenerImpl;
.super Lcom/navngo/igo/javaclient/NmeaListenerImpl;
.source "NmeaListenerImpl.java"

# interfaces
.implements Landroid/location/OnNmeaMessageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/NmeaListenerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NmeaMessageListenerImpl"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 160
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;-><init>(Lcom/navngo/igo/javaclient/NmeaListenerImpl$1;)V

    return-void
.end method


# virtual methods
.method public onNmeaMessage(Ljava/lang/String;J)V
    .registers 4

    .line 163
    invoke-virtual {p0, p2, p3, p1}, Lcom/navngo/igo/javaclient/NmeaListenerImpl$NmeaMessageListenerImpl;->onNmeaReceived(JLjava/lang/String;)V

    return-void
.end method
