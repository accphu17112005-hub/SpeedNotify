###### Class com.navngo.igo.javaclient.NmeaListenerHandler (com.navngo.igo.javaclient.NmeaListenerHandler)
.class Lcom/navngo/igo/javaclient/NmeaListenerHandler;
.super Ljava/lang/Object;
.source "NmeaListenerHandler.java"


# static fields
.field private static final logname:Ljava/lang/String; = "NmeaListenerHandler"


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addNmeaListener(Lcom/navngo/igo/javaclient/NmeaListenerImpl;)Z
    .registers 5

    const/4 v0, 0x0

    .line 26
    :try_start_1
    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v1

    const-string v2, "addNmeaListener"

    .line 27
    invoke-static {v2}, Lcom/navngo/igo/javaclient/NmeaListenerHandler;->getNmeaListenerMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p0, v3, v0

    .line 28
    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1a} :catch_1b

    return p0

    :catch_1b
    move-exception p0

    .line 31
    sget-object v1, Lcom/navngo/igo/javaclient/NmeaListenerHandler;->logname:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Register nmea listener exception : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method private static getNmeaListenerMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 20
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_9

    const-class v0, Landroid/location/GpsStatus$NmeaListener;

    goto :goto_b

    :cond_9
    const-class v0, Landroid/location/OnNmeaMessageListener;

    .line 21
    :goto_b
    const-class v1, Landroid/location/LocationManager;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    return-object p0
.end method

.method public static removeNmeaListener(Lcom/navngo/igo/javaclient/NmeaListenerImpl;)V
    .registers 5

    .line 38
    :try_start_0
    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->getLocationManager()Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "removeNmeaListener"

    .line 39
    invoke-static {v1}, Lcom/navngo/igo/javaclient/NmeaListenerHandler;->getNmeaListenerMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    .line 40
    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_14

    goto :goto_2f

    :catch_14
    move-exception p0

    .line 42
    sget-object v0, Lcom/navngo/igo/javaclient/NmeaListenerHandler;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remove nmea listener exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2f
    return-void
.end method
