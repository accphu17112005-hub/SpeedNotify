###### Class com.navngo.igo.javaclient.utils.gps.LocationListenerLogPlayer (com.navngo.igo.javaclient.utils.gps.LocationListenerLogPlayer)
.class public Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;
.super Ljava/lang/Thread;
.source "LocationListenerLogPlayer.java"


# static fields
.field private static final logname:Ljava/lang/String; = "LocationListenerLogPlayer"


# instance fields
.field autoRepeat:Z

.field private volatile doStop:Z

.field private volatile dropRecords:Z

.field listener:Landroid/location/LocationListener;

.field sourceFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Landroid/location/LocationListener;Ljava/io/File;Z)V
    .registers 5

    .line 64
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->doStop:Z

    .line 83
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->dropRecords:Z

    .line 66
    :try_start_8
    iput-object p2, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->sourceFile:Ljava/io/File;

    .line 67
    iput-boolean p3, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->autoRepeat:Z

    .line 68
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->listener:Landroid/location/LocationListener;

    .line 69
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->start()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_11} :catch_12

    return-void

    :catch_12
    move-exception p1

    .line 71
    new-instance p2, Ljava/lang/Error;

    invoke-direct {p2, p1}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method


# virtual methods
.method public StopPlayer()V
    .registers 2

    const/4 v0, 0x1

    .line 76
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->doStop:Z

    .line 77
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->interrupt()V

    return-void
.end method

.method public enable(Z)V
    .registers 2

    xor-int/lit8 p1, p1, 0x1

    .line 81
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->dropRecords:Z

    return-void
.end method

.method public run()V
    .registers 19

    move-object/from16 v1, p0

    const-string v2, "LocationListenerLogPlayer"

    const-string v0, "Starting log playback."

    .line 25
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    :cond_9
    :try_start_9
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v3, v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->sourceFile:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 29
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-direct {v3, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 30
    new-instance v0, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;

    iget-object v4, v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->listener:Landroid/location/LocationListener;

    invoke-direct {v0, v4, v3}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;-><init>(Landroid/location/LocationListener;Ljava/io/ObjectInputStream;)V

    const-wide/16 v3, 0x0

    move-wide v5, v3

    move-wide v7, v5

    .line 33
    :goto_20
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->isEOF()Z

    move-result v9

    if-nez v9, :cond_73

    iget-boolean v9, v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->doStop:Z

    if-nez v9, :cond_73

    .line 34
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->readNextTimestamp()J

    move-result-wide v9

    .line 35
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    sub-long v13, v9, v5

    const-wide/32 v15, 0xf4240

    .line 36
    div-long/2addr v13, v15

    sub-long v15, v11, v7

    cmp-long v17, v5, v3

    if-nez v17, :cond_40

    move-wide v5, v3

    goto :goto_42

    :cond_40
    sub-long v5, v13, v15

    :goto_42
    cmp-long v15, v5, v3

    if-lez v15, :cond_48

    add-long/2addr v7, v13

    goto :goto_4a

    :cond_48
    move-wide v5, v3

    move-wide v7, v11

    :goto_4a
    const-wide/16 v11, 0x7d0

    cmp-long v13, v5, v11

    if-lez v13, :cond_69

    .line 49
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Waiting before next command "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v12, " ms"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    :cond_69
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 51
    iget-boolean v5, v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->dropRecords:Z

    invoke-virtual {v0, v5}, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogReader;->readNextRecord(Z)V

    move-wide v5, v9

    goto :goto_20

    .line 53
    :cond_73
    iget-boolean v0, v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->autoRepeat:Z

    if-eqz v0, :cond_91

    iget-boolean v0, v1, Lcom/navngo/igo/javaclient/utils/gps/LocationListenerLogPlayer;->doStop:Z
    :try_end_79
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_79} :catch_7c

    if-eqz v0, :cond_9

    goto :goto_91

    :catch_7c
    move-exception v0

    .line 55
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception during log playback:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_91
    :goto_91
    const-string v0, "Log playback finished."

    .line 57
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
