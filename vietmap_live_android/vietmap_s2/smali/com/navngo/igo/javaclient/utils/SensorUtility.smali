###### Class com.navngo.igo.javaclient.utils.SensorUtility (com.navngo.igo.javaclient.utils.SensorUtility)
.class public Lcom/navngo/igo/javaclient/utils/SensorUtility;
.super Ljava/lang/Object;
.source "SensorUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/utils/SensorUtility$CompassListener;,
        Lcom/navngo/igo/javaclient/utils/SensorUtility$AccelerometerListener;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "SensorUtility"


# instance fields
.field private accelerometerListener:Landroid/hardware/SensorEventListener;

.field private accelerometerListener_registered:Z

.field private compassListener:Landroid/hardware/SensorEventListener;

.field private compassListener_registered:Z

.field private sensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x0

    .line 25
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener_registered:Z

    .line 26
    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener:Landroid/hardware/SensorEventListener;

    .line 27
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener_registered:Z

    .line 28
    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener:Landroid/hardware/SensorEventListener;

    return-void
.end method


# virtual methods
.method public declared-synchronized startSensors()V
    .registers 6

    monitor-enter p0

    :try_start_1
    const-string v0, "SensorUtility"

    const-string v1, "startSensors"

    .line 32
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    if-nez v0, :cond_18

    .line 34
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    .line 35
    :cond_18
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_60

    .line 38
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener_registered:Z

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-nez v0, :cond_3e

    .line 39
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener:Landroid/hardware/SensorEventListener;

    if-nez v0, :cond_2d

    .line 40
    new-instance v0, Lcom/navngo/igo/javaclient/utils/SensorUtility$AccelerometerListener;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/utils/SensorUtility$AccelerometerListener;-><init>(Lcom/navngo/igo/javaclient/utils/SensorUtility;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener:Landroid/hardware/SensorEventListener;

    .line 41
    :cond_2d
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_3e

    .line 43
    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v3, v4, v0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 44
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener_registered:Z

    .line 48
    :cond_3e
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener_registered:Z

    if-nez v0, :cond_67

    .line 49
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener:Landroid/hardware/SensorEventListener;

    if-nez v0, :cond_4d

    .line 50
    new-instance v0, Lcom/navngo/igo/javaclient/utils/SensorUtility$CompassListener;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/utils/SensorUtility$CompassListener;-><init>(Lcom/navngo/igo/javaclient/utils/SensorUtility;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener:Landroid/hardware/SensorEventListener;

    .line 51
    :cond_4d
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_67

    .line 53
    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v3, v4, v0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 54
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener_registered:Z

    goto :goto_67

    :cond_60
    const-string v0, "SensorUtility"

    const-string v1, "startSensors: no SENSOR_SERVICE"

    .line 58
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_67
    .catchall {:try_start_1 .. :try_end_67} :catchall_69

    .line 60
    :cond_67
    :goto_67
    monitor-exit p0

    return-void

    :catchall_69
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopSensors()V
    .registers 4

    monitor-enter p0

    :try_start_1
    const-string v0, "SensorUtility"

    const-string v1, "stopSensors"

    .line 64
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener_registered:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    .line 66
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener_registered:Z

    .line 67
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->accelerometerListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 69
    :cond_16
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener_registered:Z

    if-eqz v0, :cond_23

    .line 70
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener_registered:Z

    .line 71
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->compassListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    :cond_23
    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility;->sensorManager:Landroid/hardware/SensorManager;
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_28

    .line 74
    monitor-exit p0

    return-void

    :catchall_28
    move-exception v0

    monitor-exit p0

    throw v0
.end method

###### Class com.navngo.igo.javaclient.utils.SensorUtility.AccelerometerListener (com.navngo.igo.javaclient.utils.SensorUtility$AccelerometerListener)
.class final Lcom/navngo/igo/javaclient/utils/SensorUtility$AccelerometerListener;
.super Ljava/lang/Object;
.source "SensorUtility.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/SensorUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "AccelerometerListener"
.end annotation


# static fields
.field static final logname:Ljava/lang/String; = "SensorUtility.AccelerometerListener"


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/SensorUtility;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/utils/SensorUtility;)V
    .registers 2

    .line 77
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility$AccelerometerListener;->this$0:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 5

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged: sensor("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ") accuracy ("

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "SensorUtility.AccelerometerListener"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 5

    .line 86
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSensorChanged: X: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " Y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " Z: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x2

    aget p1, p1, v1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SensorUtility.AccelerometerListener"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.utils.SensorUtility.CompassListener (com.navngo.igo.javaclient.utils.SensorUtility$CompassListener)
.class final Lcom/navngo/igo/javaclient/utils/SensorUtility$CompassListener;
.super Ljava/lang/Object;
.source "SensorUtility.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/SensorUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CompassListener"
.end annotation


# static fields
.field static final logname:Ljava/lang/String; = "SensorUtility.CompassListener"


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/SensorUtility;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/utils/SensorUtility;)V
    .registers 2

    .line 93
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/SensorUtility$CompassListener;->this$0:Lcom/navngo/igo/javaclient/utils/SensorUtility;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 5

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onAccuracyChanged: sensor("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ") accuracy ("

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "SensorUtility.CompassListener"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 5

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSensorChanged: X: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " Y: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " Z: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x2

    aget p1, p1, v1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "SensorUtility.CompassListener"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
