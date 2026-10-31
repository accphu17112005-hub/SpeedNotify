###### Class com.navngo.igo.javaclient.LocationListenerImpl (com.navngo.igo.javaclient.LocationListenerImpl)
.class public final Lcom/navngo/igo/javaclient/LocationListenerImpl;
.super Ljava/lang/Object;
.source "LocationListenerImpl.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field private static getGpsMinTime:I = 0x0

.field private static gpsListener:Landroid/location/LocationListener; = null

.field private static gpsListener_registered:Z = false

.field private static gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer; = null

.field private static final logname:Ljava/lang/String; = "LocationListenerImpl"

.field private static netListener:Landroid/location/LocationListener; = null

.field private static netListener_registered:Z = false

.field private static statusListener:Landroid/location/GpsStatus$Listener;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const-string v0, "gps"

    const-string v1, "gps_min_time"

    const/16 v2, 0x3e7

    .line 49
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getGpsMinTime:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->name:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Landroid/location/LocationManager;
    .registers 1

    .line 35
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    return-object v0
.end method

.method private static getLocationManager()Landroid/location/LocationManager;
    .registers 2

    .line 289
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    return-object v0
.end method

.method public static isGpsDenied()Z
    .registers 7

    .line 293
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "p_gps_enabled = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->p_gps_enabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ";  p_net_enabled = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->p_net_enabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LocationListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_38

    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->p_gps_enabled()Z

    move-result v0

    if-nez v0, :cond_32

    goto :goto_38

    :cond_32
    const-string v0, "isGpsDenied: false"

    .line 307
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 297
    :cond_38
    :goto_38
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "gps"

    const-string v5, "location_log_filename"

    const-string v6, "LocationManager"

    invoke-static {v4, v5, v6}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".log"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 298
    sget-boolean v3, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_6a

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_6a

    const/4 v3, 0x1

    goto :goto_6b

    :cond_6a
    const/4 v3, 0x0

    :goto_6b
    if-eqz v3, :cond_86

    .line 300
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isGpsDenied: playing back "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_86
    const-string v0, "isGpsDenied: true"

    .line 303
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v4
.end method

.method public static isListening()Z
    .registers 1

    .line 56
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    if-eqz v0, :cond_8

    sget-boolean v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener_registered:Z

    if-eqz v0, :cond_11

    :cond_8
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    if-eqz v0, :cond_13

    sget-boolean v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener_registered:Z

    if-eqz v0, :cond_11

    goto :goto_13

    :cond_11
    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v0, 0x1

    :goto_14
    return v0
.end method

.method static p_gps_enabled()Z
    .registers 4

    .line 121
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 125
    :cond_6
    :try_start_6
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    const-string v2, "gps"

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_10} :catch_11

    return v0

    :catch_11
    move-exception v0

    const-string v2, "LocationListenerImpl"

    const-string v3, "p_gps_enabled: "

    .line 127
    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method static p_net_enabled()Z
    .registers 4

    .line 133
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 137
    :cond_6
    :try_start_6
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    const-string v2, "network"

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v0
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_10} :catch_11

    return v0

    :catch_11
    move-exception v0

    const-string v2, "LocationListenerImpl"

    const-string v3, "p_net_enabled: "

    .line 139
    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method public static setLocationListener(Z)V
    .registers 3

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setLocationListener: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LocationListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    if-nez v0, :cond_1f

    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    if-nez v0, :cond_1f

    return-void

    .line 112
    :cond_1f
    new-instance v0, Lcom/navngo/igo/javaclient/LocationListenerImpl$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/LocationListenerImpl$1;-><init>(Z)V

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->runOnHandlerThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setLocationListenerBody(Z)V
    .registers 17

    .line 146
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v7

    .line 147
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isGpsDenied()Z

    move-result v0

    const/4 v9, 0x1

    if-nez v0, :cond_10

    if-nez p0, :cond_e

    goto :goto_10

    :cond_e
    const/4 v10, 0x0

    goto :goto_11

    :cond_10
    :goto_10
    const/4 v10, 0x1

    :goto_11
    const-string v11, "LocationListenerImpl"

    if-eqz p0, :cond_1df

    const-string v12, "gps"

    const-string v0, "location_log_filename"

    const-string v1, "LocationManager"

    .line 149
    invoke-static {v12, v0, v1}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 150
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".log"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 151
    sget-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    if-eqz v2, :cond_46

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_46

    const/4 v2, 0x1

    goto :goto_47

    :cond_46
    const/4 v2, 0x0

    .line 152
    :goto_47
    sget-boolean v4, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    if-eqz v4, :cond_55

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_55

    if-nez v10, :cond_55

    const/4 v13, 0x1

    goto :goto_56

    :cond_55
    const/4 v13, 0x0

    .line 153
    :goto_56
    sget-boolean v4, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    if-nez v4, :cond_5f

    const-string v4, "GPS logging disabled"

    .line 154
    invoke-static {v11, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5f
    if-eqz v2, :cond_8c

    :try_start_61
    const-string v0, "GPS log playback started"

    .line 157
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    if-nez v0, :cond_80

    .line 159
    new-instance v0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    new-instance v2, Lcom/navngo/igo/javaclient/LocationListenerImpl;

    const-string v3, "PLAYBACK_PROVIDER"

    invoke-direct {v2, v3}, Lcom/navngo/igo/javaclient/LocationListenerImpl;-><init>(Ljava/lang/String;)V

    const-string v3, "location_log_repeat"

    invoke-static {v12, v3, v9}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    invoke-direct {v0, v2, v1, v3}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;-><init>(Landroid/location/LocationListener;Ljava/io/File;Z)V

    sput-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    goto/16 :goto_215

    :cond_80
    const-string v0, "PLAYBACK_PROVIDER: enabled"

    .line 161
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    invoke-virtual {v0, v9}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->enable(Z)V

    goto/16 :goto_215

    :cond_8c
    const/4 v1, 0x0

    if-eqz v13, :cond_106

    .line 166
    sget-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_gps:Z

    if-eqz v2, :cond_97

    sget-boolean v2, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener_registered:Z

    if-eqz v2, :cond_9f

    :cond_97
    sget-boolean v2, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    if-eqz v2, :cond_106

    sget-boolean v2, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener_registered:Z

    if-nez v2, :cond_106

    :cond_9f
    const-string v2, "GPS log recording started"

    .line 168
    invoke-static {v11, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "-"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v4, "yyMMddHHmmss"

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 170
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_e3
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_e3} :catch_1c5

    .line 172
    :try_start_e3
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 173
    new-instance v0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;

    invoke-direct {v0, v2}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogWriter;-><init>(Ljava/io/File;)V
    :try_end_eb
    .catch Ljava/io/IOException; {:try_start_e3 .. :try_end_eb} :catch_ed
    .catch Ljava/lang/Exception; {:try_start_e3 .. :try_end_eb} :catch_1c5

    move-object v14, v0

    goto :goto_107

    :catch_ed
    move-exception v0

    .line 175
    :try_start_ee
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Location logfile creation error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_106
    move-object v14, v1

    .line 178
    :goto_107
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_119

    const-string v0, "Missing ACCESS_FINE_LOCATION permission"

    .line 179
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 182
    :cond_119
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_gps:Z
    :try_end_11b
    .catch Ljava/lang/Exception; {:try_start_ee .. :try_end_11b} :catch_1c5

    const-string v15, "use_last_known_position"

    const-string v6, "setLocationListenerBody exception: "

    if-eqz v0, :cond_179

    :try_start_121
    sget-boolean v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener_registered:Z

    if-nez v0, :cond_179

    .line 183
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;

    if-nez v0, :cond_144

    .line 184
    new-instance v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;

    const-string v1, "GPS_PROVIDER"

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/LocationListenerImpl;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;

    .line 185
    new-instance v0, Lcom/navngo/igo/javaclient/LocationListenerImpl$2;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/LocationListenerImpl$2;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->statusListener:Landroid/location/GpsStatus$Listener;

    if-eqz v13, :cond_144

    .line 211
    new-instance v0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;

    sget-object v1, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;

    invoke-direct {v0, v1, v14}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;-><init>(Landroid/location/LocationListener;Landroid/location/LocationListener;)V

    sput-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;

    :cond_144
    const-string v0, "setLocationListener: GPS_PROVIDER on"

    .line 213
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_149
    .catch Ljava/lang/Exception; {:try_start_121 .. :try_end_149} :catch_1c5

    :try_start_149
    const-string v2, "gps"

    .line 215
    sget v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getGpsMinTime:I

    int-to-long v3, v0

    const/4 v5, 0x0

    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;
    :try_end_151
    .catch Ljava/lang/Exception; {:try_start_149 .. :try_end_151} :catch_15a

    move-object v1, v7

    move-object v8, v6

    move-object v6, v0

    :try_start_154
    invoke-virtual/range {v1 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_157
    .catch Ljava/lang/Exception; {:try_start_154 .. :try_end_157} :catch_158

    goto :goto_15f

    :catch_158
    move-exception v0

    goto :goto_15c

    :catch_15a
    move-exception v0

    move-object v8, v6

    .line 219
    :goto_15c
    :try_start_15c
    invoke-static {v11, v8, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 221
    :goto_15f
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->statusListener:Landroid/location/GpsStatus$Listener;

    invoke-virtual {v7, v0}, Landroid/location/LocationManager;->addGpsStatusListener(Landroid/location/GpsStatus$Listener;)Z

    .line 222
    sput-boolean v9, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener_registered:Z

    const/4 v1, 0x0

    .line 223
    invoke-static {v12, v15, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_17a

    .line 224
    invoke-virtual {v7, v12}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_17a

    .line 226
    sget-object v1, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;

    invoke-interface {v1, v0}, Landroid/location/LocationListener;->onLocationChanged(Landroid/location/Location;)V

    goto :goto_17a

    :cond_179
    move-object v8, v6

    .line 229
    :cond_17a
    :goto_17a
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_net:Z

    if-eqz v0, :cond_215

    sget-boolean v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener_registered:Z

    if-nez v0, :cond_215

    .line 230
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener:Landroid/location/LocationListener;

    if-nez v0, :cond_198

    .line 231
    new-instance v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;

    const-string v1, "NETWORK_PROVIDER"

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/LocationListenerImpl;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener:Landroid/location/LocationListener;

    if-eqz v13, :cond_198

    .line 233
    new-instance v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;

    invoke-direct {v1, v0, v14}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerExtender;-><init>(Landroid/location/LocationListener;Landroid/location/LocationListener;)V

    sput-object v1, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener:Landroid/location/LocationListener;

    :cond_198
    const-string v0, "setLocationListener: NETWORK_PROVIDER on"

    .line 235
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_19d
    .catch Ljava/lang/Exception; {:try_start_15c .. :try_end_19d} :catch_1c5

    :try_start_19d
    const-string v2, "network"

    .line 237
    sget v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->getGpsMinTime:I

    int-to-long v3, v0

    const/4 v5, 0x0

    sget-object v6, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener:Landroid/location/LocationListener;

    move-object v1, v7

    invoke-virtual/range {v1 .. v6}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V
    :try_end_1a9
    .catch Ljava/lang/Exception; {:try_start_19d .. :try_end_1a9} :catch_1aa

    goto :goto_1ae

    :catch_1aa
    move-exception v0

    .line 241
    :try_start_1ab
    invoke-static {v11, v8, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 243
    :goto_1ae
    sput-boolean v9, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener_registered:Z

    const/4 v1, 0x0

    .line 244
    invoke-static {v12, v15, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_215

    const-string v0, "network"

    .line 245
    invoke-virtual {v7, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v0

    if-eqz v0, :cond_215

    .line 247
    sget-object v1, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener:Landroid/location/LocationListener;

    invoke-interface {v1, v0}, Landroid/location/LocationListener;->onLocationChanged(Landroid/location/Location;)V
    :try_end_1c4
    .catch Ljava/lang/Exception; {:try_start_1ab .. :try_end_1c4} :catch_1c5

    goto :goto_215

    :catch_1c5
    move-exception v0

    .line 252
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLocationListener: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_215

    .line 255
    :cond_1df
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    if-eqz v0, :cond_1ef

    const-string v0, "PLAYBACK_PROVIDER: disabled"

    .line 256
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->enable(Z)V

    goto :goto_1f0

    :cond_1ef
    const/4 v1, 0x0

    .line 259
    :goto_1f0
    sget-boolean v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener_registered:Z

    if-eqz v0, :cond_200

    const-string v0, "NETWORK_PROVIDER: remove"

    .line 260
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    sput-boolean v1, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener_registered:Z

    .line 262
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->netListener:Landroid/location/LocationListener;

    invoke-virtual {v7, v0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 264
    :cond_200
    sget-boolean v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener_registered:Z

    if-eqz v0, :cond_215

    const-string v0, "GPS_PROVIDER: remove"

    .line 265
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    sput-boolean v1, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener_registered:Z

    .line 267
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->statusListener:Landroid/location/GpsStatus$Listener;

    invoke-virtual {v7, v0}, Landroid/location/LocationManager;->removeGpsStatusListener(Landroid/location/GpsStatus$Listener;)V

    .line 268
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsListener:Landroid/location/LocationListener;

    invoke-virtual {v7, v0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    :cond_215
    :goto_215
    if-eqz v10, :cond_23f

    .line 274
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GPS is not enabled (provider denied: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isGpsDenied()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " UI denied: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    xor-int/lit8 v1, p0, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_244

    :cond_23f
    const-string v0, "GPS is enabled"

    .line 277
    invoke-static {v11, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :goto_244
    return-void
.end method

.method public static stopGpsLogPlayer()V
    .registers 1

    .line 282
    sget-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    if-eqz v0, :cond_a

    .line 283
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->StopPlayer()V

    const/4 v0, 0x0

    .line 284
    sput-object v0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->gpsLogPlayer:Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;

    :cond_a
    return-void
.end method


# virtual methods
.method public onLocationChanged(Landroid/location/Location;)V
    .registers 7

    .line 60
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    if-eqz v0, :cond_3d

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":onLocationChanged "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/text/SimpleDateFormat;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "yyyy/MM/dd HH:mm:ss"

    invoke-direct {v1, v3, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    .line 63
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LocationListenerImpl"

    .line 61
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :cond_3d
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->onLocationChanged(Landroid/location/Location;)V

    .line 67
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->onLocationChanged(Landroid/location/Location;)V

    return-void
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .registers 4

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " provider disabled"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LocationListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "gps"

    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2c

    const/4 p1, 0x3

    .line 74
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    :cond_2c
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .registers 4

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " provider enabled"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LocationListenerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "gps"

    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2c

    const/4 p1, 0x4

    .line 82
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    :cond_2c
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .registers 6

    .line 87
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->location_log:Z

    if-eqz v0, :cond_2f

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " status changed:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " extras: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "LocationListenerImpl"

    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2f
    const-string p3, "gps"

    .line 89
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    if-eqz p2, :cond_48

    const/4 p1, 0x2

    if-eq p2, p1, :cond_43

    .line 101
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->clearSatellites()V

    .line 102
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    goto :goto_4f

    :cond_43
    const/4 p1, 0x1

    .line 93
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    goto :goto_4f

    .line 96
    :cond_48
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->clearSatellites()V

    const/4 p1, 0x0

    .line 97
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->wantGpsStatus(I)V

    :cond_4f
    :goto_4f
    return-void
.end method

###### Class com.navngo.igo.javaclient.LocationListenerImpl.AnonymousClass1 (com.navngo.igo.javaclient.LocationListenerImpl$1)
.class Lcom/navngo/igo/javaclient/LocationListenerImpl$1;
.super Ljava/lang/Object;
.source "LocationListenerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/LocationListenerImpl;->setLocationListener(Z)V
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

    .line 112
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl$1;->val$gpslistenerwanted:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 115
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/LocationListenerImpl$1;->val$gpslistenerwanted:Z

    invoke-static {v0}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->setLocationListenerBody(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.LocationListenerImpl.AnonymousClass2 (com.navngo.igo.javaclient.LocationListenerImpl$2)
.class Lcom/navngo/igo/javaclient/LocationListenerImpl$2;
.super Ljava/lang/Object;
.source "LocationListenerImpl.java"

# interfaces
.implements Landroid/location/GpsStatus$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/LocationListenerImpl;->setLocationListenerBody(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGpsStatusChanged(I)V
    .registers 11

    const/4 v0, 0x4

    if-ne p1, v0, :cond_79

    .line 188
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->access$000()Landroid/location/LocationManager;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/location/LocationManager;->getGpsStatus(Landroid/location/GpsStatus;)Landroid/location/GpsStatus;

    move-result-object p1

    .line 189
    invoke-virtual {p1}, Landroid/location/GpsStatus;->getSatellites()Ljava/lang/Iterable;

    move-result-object p1

    .line 191
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/GpsSatellite;

    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    :cond_25
    mul-int/lit8 v2, v2, 0x5

    .line 193
    new-array v0, v2, [I

    .line 195
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/GpsSatellite;

    add-int/lit8 v4, v1, 0x0

    .line 197
    invoke-virtual {v3}, Landroid/location/GpsSatellite;->getPrn()I

    move-result v5

    aput v5, v0, v4

    add-int/lit8 v4, v1, 0x1

    .line 198
    invoke-virtual {v3}, Landroid/location/GpsSatellite;->usedInFix()Z

    move-result v5

    aput v5, v0, v4

    add-int/lit8 v4, v1, 0x2

    .line 199
    invoke-virtual {v3}, Landroid/location/GpsSatellite;->getSnr()F

    move-result v5

    float-to-double v5, v5

    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    add-double/2addr v5, v7

    double-to-int v5, v5

    aput v5, v0, v4

    add-int/lit8 v4, v1, 0x3

    .line 200
    invoke-virtual {v3}, Landroid/location/GpsSatellite;->getAzimuth()F

    move-result v5

    float-to-double v5, v5

    add-double/2addr v5, v7

    double-to-int v5, v5

    aput v5, v0, v4

    add-int/lit8 v4, v1, 0x4

    .line 201
    invoke-virtual {v3}, Landroid/location/GpsSatellite;->getElevation()F

    move-result v3

    float-to-double v5, v3

    add-double/2addr v5, v7

    double-to-int v3, v5

    aput v3, v0, v4

    add-int/lit8 v1, v1, 0x5

    goto :goto_2d

    .line 204
    :cond_6f
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->setSatellites([I)V

    .line 205
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->accuracy_workaround:Z

    if-eqz v0, :cond_79

    .line 206
    invoke-static {p1}, Lcom/navngo/igo/javaclient/gps/GpsHacks;->guessAccuracy(Ljava/lang/Iterable;)V

    :cond_79
    return-void
.end method
