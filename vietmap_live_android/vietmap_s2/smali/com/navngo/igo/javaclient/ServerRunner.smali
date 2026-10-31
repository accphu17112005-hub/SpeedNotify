###### Class com.navngo.igo.javaclient.ServerRunner (com.navngo.igo.javaclient.ServerRunner)
.class public final Lcom/navngo/igo/javaclient/ServerRunner;
.super Ljava/lang/Object;
.source "ServerRunner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;,
        Lcom/navngo/igo/javaclient/ServerRunner$KeyState;,
        Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;,
        Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;,
        Lcom/navngo/igo/javaclient/ServerRunner$Current;,
        Lcom/navngo/igo/javaclient/ServerRunner$Wanted;,
        Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;
    }
.end annotation


# static fields
.field public static final GPS_CONNECTED:I = 0x1

.field public static final GPS_DENIED:I = 0x3

.field public static final GPS_DISCONNECTED:I = 0x0

.field public static final GPS_ENABLED:I = 0x4

.field public static final GPS_LOST:I = 0x2

.field public static volatile background_navigation:Z = false

.field private static volatile engineIndex:I = 0x0

.field private static forwardedNmeaListeners:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;",
            ">;"
        }
    .end annotation
.end field

.field private static final logname:Ljava/lang/String; = "ServerRunner"

.field public static final postStartEngineHooks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static sEngineStoppedCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->postStartEngineHooks:Ljava/util/List;

    .line 164
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->sEngineStoppedCallbacks:Ljava/util/List;

    .line 344
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->forwardedNmeaListeners:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static AddForwardedNmeaListener(Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;)V
    .registers 2

    .line 346
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->forwardedNmeaListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private static CID2SDId(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    if-eqz p0, :cond_26

    .line 1535
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_26

    .line 1536
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x12

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_27

    :cond_26
    const/4 p0, 0x0

    :goto_27
    return-object p0
.end method

.method public static EngineStatus(I)V
    .registers 2

    .line 1730
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatus(I)V

    return-void
.end method

.method public static EngineStatusName(I)Ljava/lang/String;
    .registers 1

    .line 1419
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static GetOrientation()I
    .registers 1

    .line 1675
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$1100(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    move-result-object v0

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    return v0
.end method

.method public static Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V
    .registers 3

    .line 1692
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    if-nez v0, :cond_5

    return-void

    .line 1694
    :cond_5
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p1, v0, :cond_d

    .line 1695
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->KeyDown(I)V

    goto :goto_10

    .line 1697
    :cond_d
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->KeyUp(I)V

    .line 1699
    :goto_10
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->notifyStatusThread()V

    return-void
.end method

.method private static OrientationChanged(I)V
    .registers 2

    .line 1670
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantOrientation(I)V

    return-void
.end method

.method public static RemoveForwardedNmeaListener(Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;)V
    .registers 2

    .line 349
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->forwardedNmeaListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public static SendTouch(IILcom/navngo/igo/javaclient/ServerRunner$TouchAction;IIJ)V
    .registers 15

    .line 1719
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    if-nez v0, :cond_5

    return-void

    .line 1722
    :cond_5
    iget v3, p2, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->actionCode:I

    move v1, p0

    move v2, p1

    move v4, p3

    move v5, p4

    move-wide v6, p5

    invoke-static/range {v1 .. v7}, Lcom/navngo/igo/javaclient/NNG;->SendTouch(IIIIIJ)V

    return-void
.end method

.method static synthetic access$1000()I
    .registers 1

    .line 54
    sget v0, Lcom/navngo/igo/javaclient/ServerRunner;->engineIndex:I

    return v0
.end method

.method static synthetic access$1008()I
    .registers 2

    .line 54
    sget v0, Lcom/navngo/igo/javaclient/ServerRunner;->engineIndex:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/navngo/igo/javaclient/ServerRunner;->engineIndex:I

    return v0
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V
    .registers 1

    .line 54
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->setStatusThread(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    return-void
.end method

.method static synthetic access$500(I)Ljava/lang/String;
    .registers 1

    .line 54
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->gpsStatusText(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Z)Ljava/lang/String;
    .registers 1

    .line 54
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->getSDID(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700()Ljava/lang/String;
    .registers 1

    .line 54
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getCpuSerial()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800()Ljava/util/List;
    .registers 1

    .line 54
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->sEngineStoppedCallbacks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$900()Ljava/util/ArrayList;
    .registers 1

    .line 54
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->forwardedNmeaListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static addEngineStoppedCallback(Ljava/lang/Runnable;)V
    .registers 2

    .line 167
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->sEngineStoppedCallbacks:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static callNNG(Ljava/lang/Runnable;I)V
    .registers 3

    .line 1583
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->callNNG(Ljava/lang/Runnable;I)V

    return-void
.end method

.method public static getAndroidId(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;
    .registers 5

    .line 1544
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getLockedTo()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ServerRunner"

    const-string v2, "android_id"

    if-eqz v0, :cond_26

    .line 1545
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_26

    .line 1546
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "android_id: null, locked_to: "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_26
    if-eqz p0, :cond_2d

    .line 1551
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    goto :goto_33

    :cond_2d
    sget-object p0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 1550
    :goto_33
    invoke-static {p0, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1555
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "androidId: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p0, :cond_46

    const-string v2, "null"

    goto :goto_47

    :cond_46
    move-object v2, p0

    :goto_47
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method private static getCpuSerial()Ljava/lang/String;
    .registers 6

    const-string v0, "ServerRunner"

    const/4 v1, 0x0

    .line 1563
    :try_start_3
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/FileReader;

    new-instance v4, Ljava/io/File;

    const-string v5, "/proc/cpuinfo"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 1564
    :cond_14
    :goto_14
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_39

    const-string v4, "Serial"

    .line 1565
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_14

    const-string v4, ":"

    .line 1566
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 1567
    array-length v4, v3

    const/4 v5, 0x1

    if-le v4, v5, :cond_14

    .line 1568
    aget-object v3, v3, v5

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_32} :catch_33

    goto :goto_14

    :catch_33
    move-exception v2

    const-string v3, "/proc/cpuinfo reading failed, returning with null"

    .line 1573
    invoke-static {v0, v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1575
    :cond_39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cpu_serial: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4f

    const-string v2, "null"

    goto :goto_50

    :cond_4f
    move-object v2, v1

    :goto_50
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public static getDeviceIDs()Ljava/lang/String;
    .registers 6

    .line 1791
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1794
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    .line 1796
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->getImei(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ","

    const-string v4, ""

    if-eqz v2, :cond_2c

    .line 1797
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2c

    .line 1798
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v4, v3

    .line 1801
    :cond_2c
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->getAndroidId(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4b

    .line 1802
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4b

    .line 1803
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4c

    :cond_4b
    move-object v3, v4

    :goto_4c
    const/4 v1, 0x1

    .line 1806
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->getSDID(Z)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6b

    .line 1807
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6b

    .line 1808
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1810
    :cond_6b
    invoke-static {}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->getInstace()Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    move-result-object v1

    .line 1811
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->isValid()Z

    move-result v2

    if-eqz v2, :cond_8b

    .line 1812
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1815
    :cond_8b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1816
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Device ids: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_a2

    const-string v2, "null"

    goto :goto_a3

    :cond_a2
    move-object v2, v0

    :goto_a3
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ServerRunner"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getEngineIndex()I
    .registers 1

    .line 1590
    sget v0, Lcom/navngo/igo/javaclient/ServerRunner;->engineIndex:I

    return v0
.end method

.method public static getEngineStatusName()Ljava/lang/String;
    .registers 1

    .line 1750
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$1200(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v0

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getImei(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;
    .registers 16

    .line 1425
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getLockedTo()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "ServerRunner"

    if-eqz v0, :cond_26

    const-string v3, "imei"

    .line 1426
    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_26

    .line 1427
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "imei: null, locked to: "

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 1432
    :cond_26
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v3, "phone"

    invoke-virtual {v0, v3}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    const/4 v3, 0x5

    const-string v4, "android"

    const-string v5, "getdeviceid_trycount"

    .line 1434
    invoke-static {v4, v5, v3}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    .line 1437
    sget-boolean v4, Lcom/navngo/igo/javaclient/Config;->getdeviceid_gemini:Z

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_56

    .line 1440
    :try_start_3f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v7, "getDeviceIdGemini"

    new-array v8, v5, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v8, v6

    invoke-virtual {v4, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4
    :try_end_4f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3f .. :try_end_4f} :catch_50

    goto :goto_57

    :catch_50
    move-exception v4

    const-string v7, "no getDeviceIdGemini method"

    .line 1442
    invoke-static {v2, v7, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_56
    move-object v4, v1

    :goto_57
    move-object v8, v1

    const/4 v7, 0x0

    const/4 v9, 0x0

    :goto_5a
    const-string v10, "null"

    if-ge v7, v3, :cond_fd

    if-eqz v4, :cond_95

    :try_start_60
    new-array v11, v5, [Ljava/lang/Object;

    .line 1451
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v6

    invoke-virtual {v4, v0, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_6e} :catch_8a

    .line 1452
    :try_start_6e
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getDeviceIdGemini(0) = "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v11, :cond_7c

    move-object v12, v10

    goto :goto_7d

    :cond_7c
    move-object v12, v11

    :goto_7d
    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v2, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_87} :catch_88

    goto :goto_93

    :catch_88
    move-exception v8

    goto :goto_8e

    :catch_8a
    move-exception v11

    move-object v14, v11

    move-object v11, v8

    move-object v8, v14

    :goto_8e
    const-string v12, "getDeviceIdGemini() invoke exception"

    .line 1454
    invoke-static {v2, v12, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_93
    move-object v8, v11

    goto :goto_d8

    .line 1457
    :cond_95
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v11

    const-string v12, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v11, v12}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_f7

    .line 1459
    :try_start_a1
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v8
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_a5} :catch_a6

    goto :goto_bf

    :catch_a6
    move-exception v11

    .line 1461
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Failed getDeviceId() call, exception = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1464
    :goto_bf
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getDeviceId() = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v8, :cond_cd

    move-object v12, v10

    goto :goto_ce

    :cond_cd
    move-object v12, v8

    :goto_ce
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v2, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :goto_d8
    if-eqz v8, :cond_df

    .line 1473
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    goto :goto_fd

    :cond_df
    const-string v11, "do_startengine: Retrying getDeviceId"

    .line 1476
    invoke-static {v2, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v9, :cond_ec

    if-eqz p0, :cond_ec

    .line 1479
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->showToast(Lcom/navngo/igo/javaclient/IgoActivity;)V

    const/4 v9, 0x1

    :cond_ec
    const-wide/16 v11, 0x3e8

    .line 1482
    :try_start_ee
    invoke-static {v11, v12}, Ljava/lang/Thread;->sleep(J)V
    :try_end_f1
    .catch Ljava/lang/InterruptedException; {:try_start_ee .. :try_end_f1} :catch_f5

    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_5a

    :catch_f5
    nop

    goto :goto_fd

    :cond_f7
    const-string p0, "No permission (READ_PHONE_STATE), to read imei"

    .line 1467
    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_fd
    :goto_fd
    if-eqz v8, :cond_108

    const-string p0, "0000000"

    .line 1488
    invoke-virtual {v8, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_108

    goto :goto_109

    :cond_108
    move-object v1, v8

    .line 1491
    :goto_109
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "imei: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v1, :cond_116

    goto :goto_12a

    :cond_116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    :goto_12a
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public static getLockedTo()Ljava/lang/String;
    .registers 1

    const-string v0, "android_id"

    return-object v0
.end method

.method private static getSDID(Z)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x1

    .line 1504
    invoke-static {v0}, Lcom/navngo/igo/javaclient/sdcard/Mount;->getCIDs(Z)Ljava/util/Set;

    move-result-object v1

    .line 1505
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1508
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1509
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 1510
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, ","

    if-eqz v0, :cond_20

    const/4 v0, 0x0

    goto :goto_23

    .line 1514
    :cond_20
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1515
    :goto_23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :cond_e

    .line 1517
    invoke-static {v3}, Lcom/navngo/igo/javaclient/ServerRunner;->CID2SDId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_e

    .line 1519
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1520
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e

    .line 1525
    :cond_35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1526
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SD ID list: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_4c

    const-string v1, "null"

    goto :goto_4d

    :cond_4c
    move-object v1, p0

    :goto_4d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ServerRunner"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 1527
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_60

    const/4 p0, 0x0

    :cond_60
    return-object p0
.end method

.method public static declared-synchronized getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;
    .registers 3

    const-class v0, Lcom/navngo/igo/javaclient/ServerRunner;

    monitor-enter v0

    .line 70
    :try_start_3
    sget-object v1, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    if-nez v1, :cond_27

    const-string v1, "ServerRunner"

    const-string v2, "Creating status thread"

    .line 71
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    new-instance v1, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;-><init>()V

    sput-object v1, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    .line 73
    sget-object v1, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->start()V

    .line 74
    sget-object v1, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    monitor-enter v1
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_2b

    .line 75
    :try_start_1d
    sget-object v2, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$000(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    .line 76
    monitor-exit v1

    goto :goto_27

    :catchall_24
    move-exception v2

    monitor-exit v1
    :try_end_26
    .catchall {:try_start_1d .. :try_end_26} :catchall_24

    :try_start_26
    throw v2

    .line 78
    :cond_27
    :goto_27
    sget-object v1, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;
    :try_end_29
    .catchall {:try_start_26 .. :try_end_29} :catchall_2b

    monitor-exit v0

    return-object v1

    :catchall_2b
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static gpsStatusText(I)Ljava/lang/String;
    .registers 3

    if-eqz p0, :cond_2c

    const/4 v0, 0x1

    if-eq p0, v0, :cond_29

    const/4 v0, 0x2

    if-eq p0, v0, :cond_26

    const/4 v0, 0x3

    if-eq p0, v0, :cond_23

    const/4 v0, 0x4

    if-eq p0, v0, :cond_20

    .line 1636
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_2e

    :cond_20
    const-string p0, "GPS_ENABLED"

    goto :goto_2e

    :cond_23
    const-string p0, "GPS_DENIED"

    goto :goto_2e

    :cond_26
    const-string p0, "GPS_LOST"

    goto :goto_2e

    :cond_29
    const-string p0, "GPS_CONNECTED"

    goto :goto_2e

    :cond_2c
    const-string p0, "GPS_DISCONNECTED"

    :goto_2e
    return-object p0
.end method

.method public static isEngineCallable()Z
    .registers 1

    .line 1739
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 1740
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$1200(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isCallable()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public static isEngineRunning()Z
    .registers 1

    .line 1745
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 1746
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$1200(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public static isEngineStarting()Z
    .registers 1

    .line 1734
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 1735
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$1200(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isStarting()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public static isEngineStopping()Z
    .registers 1

    .line 101
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    if-eqz v0, :cond_d

    .line 102
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isShuttingDown()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method

.method public static notifyStatusThread()V
    .registers 2

    .line 1679
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    .line 1680
    monitor-enter v0

    .line 1681
    :try_start_5
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$000(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    .line 1682
    monitor-exit v0

    return-void

    :catchall_a
    move-exception v1

    monitor-exit v0
    :try_end_c
    .catchall {:try_start_5 .. :try_end_c} :catchall_a

    throw v1
.end method

.method public static onLocationChanged(Landroid/location/Location;)V
    .registers 2

    .line 1612
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->onLocationChanged(Landroid/location/Location;)V

    return-void
.end method

.method public static onLowMemory()V
    .registers 1

    .line 1647
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->onLowMemory()V

    return-void
.end method

.method public static onNmeaReceived(JLjava/lang/String;)V
    .registers 4

    .line 1620
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->onNmeaReceived(JLjava/lang/String;)V

    return-void
.end method

.method public static onSatellitesChanged()V
    .registers 1

    .line 1616
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->onSatellitesChanged()V

    return-void
.end method

.method public static requestTimeChange()V
    .registers 1

    .line 1754
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->requestTimeChange()V

    return-void
.end method

.method public static resumeServer()V
    .registers 2

    .line 1608
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    const/16 v1, 0x898

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->want(I)V

    return-void
.end method

.method public static runOnHandlerThread(Ljava/lang/Runnable;)V
    .registers 2

    .line 1821
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->runOnHandlerThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setGpsListener(Z)V
    .registers 2

    .line 1779
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->setGpsListener(Z)V

    return-void
.end method

.method public static setOrientation(I)V
    .registers 3

    .line 1657
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setOrientation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ServerRunner"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1e

    const/4 p0, 0x0

    .line 1661
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->OrientationChanged(I)V

    goto :goto_22

    :cond_1e
    const/4 p0, 0x1

    .line 1664
    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->OrientationChanged(I)V

    :goto_22
    return-void
.end method

.method private static declared-synchronized setStatusThread(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V
    .registers 2

    const-class v0, Lcom/navngo/igo/javaclient/ServerRunner;

    monitor-enter v0

    .line 82
    :try_start_3
    sput-object p0, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    .line 83
    monitor-exit v0

    return-void

    :catchall_7
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static showToast(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1496
    new-instance v0, Lcom/navngo/igo/javaclient/ServerRunner$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$1;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static startServer()V
    .registers 2

    const-string v0, "ServerRunner"

    const-string v1, "startServer"

    .line 1594
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 1595
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    const/16 v1, 0x1f4

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->want(I)V

    return-void
.end method

.method public static startServerAfterMediaScan(Z)V
    .registers 3

    .line 1758
    new-instance v0, Lcom/navngo/igo/javaclient/ServerRunner$2;

    const-string v1, "ServerRunner.startServerAfterMediaScan"

    invoke-direct {v0, v1, p0}, Lcom/navngo/igo/javaclient/ServerRunner$2;-><init>(Ljava/lang/String;Z)V

    .line 1775
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$2;->start()V

    return-void
.end method

.method public static stopServer()V
    .registers 2

    const-string v0, "ServerRunner"

    const-string v1, "stopServer"

    .line 1599
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 1600
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    const/16 v1, 0x320

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->want(I)V

    return-void
.end method

.method public static suspendServer()V
    .registers 2

    .line 1604
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    const/16 v1, 0x960

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->want(I)V

    return-void
.end method

.method public static tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;
    .registers 1

    .line 66
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner;->statusThread:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    return-object v0
.end method

.method public static uiWantGpsListener(Z)V
    .registers 3

    .line 1642
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "uiWantGpsListener: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ServerRunner"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1643
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->uiWantGpsListener(Z)V

    return-void
.end method

.method public static waitForClosingIgo()V
    .registers 3

    .line 86
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 87
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isStopping()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 89
    :try_start_c
    monitor-enter v0
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_d} :catch_1e

    .line 90
    :goto_d
    :try_start_d
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isStopping()Z

    move-result v1

    if-eqz v1, :cond_19

    const-wide/16 v1, 0xa

    .line 91
    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V

    goto :goto_d

    .line 92
    :cond_19
    monitor-exit v0

    goto :goto_22

    :catchall_1b
    move-exception v1

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_d .. :try_end_1d} :catchall_1b

    :try_start_1d
    throw v1
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_1d .. :try_end_1e} :catch_1e

    :catch_1e
    move-exception v0

    .line 95
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_22
    :goto_22
    return-void
.end method

.method public static waitForEngineStatus(IJ)Z
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 108
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_10

    const/16 v2, 0x320

    if-eq p0, v2, :cond_f

    const/16 v2, 0x384

    if-ne p0, v2, :cond_10

    :cond_f
    return v1

    :cond_10
    const-wide/16 v2, 0x0

    cmp-long v4, p1, v2

    if-gtz v4, :cond_1c

    const-wide p1, 0x7fffffffffffffffL

    goto :goto_21

    .line 114
    :cond_1c
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    add-long/2addr p1, v2

    :goto_21
    const/4 v2, 0x0

    if-nez v0, :cond_47

    const-string v3, "ServerRunner"

    const-string v4, "Waiting for status thread to be created"

    .line 117
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2b
    if-nez v0, :cond_40

    const-wide/16 v3, 0xa

    .line 119
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 121
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    cmp-long v0, p1, v3

    if-gez v0, :cond_3b

    return v2

    .line 124
    :cond_3b
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->tryGetStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    goto :goto_2b

    :cond_40
    const-string v3, "ServerRunner"

    const-string v4, "Status thread to be created"

    .line 126
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :cond_47
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$100(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v3

    iget v3, v3, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    if-eq v3, p0, :cond_ac

    const-string v3, "ServerRunner"

    .line 130
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Waiting to reach status: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    monitor-enter v0

    .line 132
    :cond_6a
    :try_start_6a
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$100(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v3

    iget v3, v3, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    if-eq v3, p0, :cond_8d

    .line 133
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long v3, p1, v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 135
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->access$100(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v3

    iget v3, v3, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    if-eq v3, p0, :cond_6a

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    cmp-long v5, p1, v3

    if-gez v5, :cond_6a

    .line 136
    monitor-exit v0

    return v2

    .line 138
    :cond_8d
    monitor-exit v0
    :try_end_8e
    .catchall {:try_start_6a .. :try_end_8e} :catchall_a9

    const-string p1, "ServerRunner"

    .line 139
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Status reached: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->EngineStatusName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ac

    :catchall_a9
    move-exception p0

    .line 138
    :try_start_aa
    monitor-exit v0
    :try_end_ab
    .catchall {:try_start_aa .. :try_end_ab} :catchall_a9

    throw p0

    :cond_ac
    :goto_ac
    return v1
.end method

.method public static waitForWait(J)V
    .registers 3

    .line 1726
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->waitForWait(J)V

    return-void
.end method

.method public static wantGpsStatus(I)V
    .registers 3

    .line 1624
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "wantGpsStatus("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/navngo/igo/javaclient/ServerRunner;->gpsStatusText(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ") called"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ServerRunner"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1625
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getStatusThread()Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantGpsStatus(I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.AnonymousClass1 (com.navngo.igo.javaclient.ServerRunner$1)
.class Lcom/navngo/igo/javaclient/ServerRunner$1;
.super Ljava/lang/Object;
.source "ServerRunner.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ServerRunner;->showToast(Lcom/navngo/igo/javaclient/IgoActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ma:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1496
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$1;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1497
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$1;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    sget v1, Lcom/navngo/igo/javaclient/R$string;->querying_device_id:I

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.AnonymousClass2 (com.navngo.igo.javaclient.ServerRunner$2)
.class Lcom/navngo/igo/javaclient/ServerRunner$2;
.super Ljava/lang/Thread;
.source "ServerRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ServerRunner;->startServerAfterMediaScan(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$background:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    .line 1758
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/ServerRunner$2;->val$background:Z

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    const/4 v0, 0x6

    .line 1761
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    .line 1762
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->waitMediaScanning()V

    const/4 v0, 0x7

    .line 1763
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    const/4 v0, 0x0

    .line 1764
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    move-result v0

    if-nez v0, :cond_13

    return-void

    .line 1766
    :cond_13
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->startServer()V

    .line 1767
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$2;->val$background:Z

    if-eqz v0, :cond_2f

    const-wide/16 v0, 0x7530

    .line 1768
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner;->waitForWait(J)V

    .line 1769
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-nez v0, :cond_2f

    const-string v0, "ServerRunner"

    const-string v1, "We are still in background: calling suspendServer"

    .line 1770
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 1771
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->suspendServer()V

    :cond_2f
    return-void
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.Current (com.navngo.igo.javaclient.ServerRunner$Current)
.class final Lcom/navngo/igo/javaclient/ServerRunner$Current;
.super Ljava/lang/Object;
.source "ServerRunner.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Current"
.end annotation


# instance fields
.field gpsStatus:I

.field status:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x64

    .line 210
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/4 v0, 0x0

    .line 211
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/ServerRunner$1;)V
    .registers 2

    .line 208
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;-><init>()V

    return-void
.end method


# virtual methods
.method public copy()Lcom/navngo/igo/javaclient/ServerRunner$Current;
    .registers 4

    .line 221
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "ServerRunner"

    const-string v2, "should not ever happen"

    .line 223
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 224
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public isCallable()Z
    .registers 3

    .line 230
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x1c2

    if-eq v0, v1, :cond_20

    const/16 v1, 0x1f4

    if-eq v0, v1, :cond_20

    const/16 v1, 0x258

    if-eq v0, v1, :cond_20

    const/16 v1, 0x834

    if-eq v0, v1, :cond_20

    const/16 v1, 0x898

    if-eq v0, v1, :cond_20

    const/16 v1, 0x8fc

    if-eq v0, v1, :cond_20

    const/16 v1, 0x960

    if-eq v0, v1, :cond_20

    const/4 v0, 0x0

    return v0

    :cond_20
    const/4 v0, 0x1

    return v0
.end method

.method public isChanging()Z
    .registers 3

    .line 318
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_20

    const/16 v1, 0x1c2

    if-eq v0, v1, :cond_20

    const/16 v1, 0x1f4

    if-eq v0, v1, :cond_20

    const/16 v1, 0x320

    if-eq v0, v1, :cond_20

    const/16 v1, 0x384

    if-eq v0, v1, :cond_20

    const/16 v1, 0x898

    if-eq v0, v1, :cond_20

    const/16 v1, 0x960

    if-eq v0, v1, :cond_20

    const/4 v0, 0x1

    return v0

    :cond_20
    const/4 v0, 0x0

    return v0
.end method

.method public isInForeground()Z
    .registers 3

    .line 296
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x1c2

    if-eq v0, v1, :cond_10

    const/16 v1, 0x1f4

    if-eq v0, v1, :cond_10

    const/16 v1, 0x898

    if-eq v0, v1, :cond_10

    const/4 v0, 0x0

    return v0

    :cond_10
    const/4 v0, 0x1

    return v0
.end method

.method public isListening()Z
    .registers 2

    .line 216
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isListening()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->isListening()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public isRunning()Z
    .registers 3

    .line 252
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x1c2

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x1f4

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x834

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x898

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x8fc

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x960

    if-eq v0, v1, :cond_1c

    const/4 v0, 0x0

    return v0

    :cond_1c
    const/4 v0, 0x1

    return v0
.end method

.method public isStarting()Z
    .registers 3

    .line 274
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x64

    if-eq v0, v1, :cond_18

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_18

    const/16 v1, 0x12c

    if-eq v0, v1, :cond_18

    const/16 v1, 0x190

    if-eq v0, v1, :cond_18

    const/16 v1, 0x1c2

    if-eq v0, v1, :cond_18

    const/4 v0, 0x0

    return v0

    :cond_18
    const/4 v0, 0x1

    return v0
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.IForwardedNmeaListener (com.navngo.igo.javaclient.ServerRunner$IForwardedNmeaListener)
.class interface abstract Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;
.super Ljava/lang/Object;
.source "ServerRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "IForwardedNmeaListener"
.end annotation


# virtual methods
.method public abstract onNmeaForwardedToEngine(JLjava/lang/String;)V
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.KeyState (com.navngo.igo.javaclient.ServerRunner$KeyState)
.class public final enum Lcom/navngo/igo/javaclient/ServerRunner$KeyState;
.super Ljava/lang/Enum;
.source "ServerRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "KeyState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/ServerRunner$KeyState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

.field public static final enum DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

.field public static final enum UP:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 1686
    new-instance v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    const-string v1, "DOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    .line 1687
    new-instance v1, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    const-string v3, "UP"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->UP:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 1685
    sput-object v3, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->$VALUES:[Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1685
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/ServerRunner$KeyState;
    .registers 2

    .line 1685
    const-class v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/ServerRunner$KeyState;
    .registers 1

    .line 1685
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->$VALUES:[Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.NmeaEvent (com.navngo.igo.javaclient.ServerRunner$NmeaEvent)
.class Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;
.super Ljava/lang/Object;
.source "ServerRunner.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NmeaEvent"
.end annotation


# instance fields
.field received:J

.field sentence:Ljava/lang/String;

.field timestamp:J


# direct methods
.method constructor <init>(JJLjava/lang/String;)V
    .registers 6

    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->received:J

    .line 159
    iput-wide p3, p0, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->timestamp:J

    .line 160
    iput-object p5, p0, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->sentence:Ljava/lang/String;

    return-void
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.StatusThread (com.navngo.igo.javaclient.ServerRunner$StatusThread)
.class final Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;
.super Ljava/lang/Thread;
.source "ServerRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StatusThread"
.end annotation


# static fields
.field private static final DO_ANDROIDGO:I = 0x17

.field private static final DO_ASSUME_GPS_CONNECTED:I = 0x10

.field private static final DO_CALLNNG:I = 0x15

.field private static final DO_ENGINESTATUS_TIMEOUT:I = 0x9

.field private static final DO_GARBAGECOLLECT:I = 0x16

.field private static final DO_GPSSTATUS:I = 0xf

.field private static final DO_INTERRUPTED:I = 0x18

.field private static final DO_LOCCHANGED_GPS:I = 0x12

.field private static final DO_LOCCHANGED_NETWORK:I = 0x11

.field private static final DO_LOWMEMORY:I = 0x1

.field private static final DO_ORIENTATIONCHANGED:I = 0x13

.field private static final DO_POLL_GPS_ENABLED:I = 0x19

.field private static final DO_RESUMEENGINE:I = 0x6

.field private static final DO_RUNCYCLE:I = 0xc

.field private static final DO_SATSCHANGED_GPS:I = 0x1a

.field private static final DO_SETLOCATIONLISTENER:I = 0xd

.field private static final DO_SLEEP:I = 0x8

.field private static final DO_STARTENGINE:I = 0x3

.field private static final DO_STOPENGINE:I = 0x5

.field private static final DO_SUSPENDENGINE:I = 0x7

.field private static final DO_TIMECHANGE:I = 0x14

.field private static final min_setlistener_timeout:I = 0x3e8

.field private static final min_timeout_foreground:I = 0x64


# instance fields
.field private first_position_processed:Z

.field private interrupted:Z

.field private locChanged_processed_at:J

.field private locChanged_valid_processed_at:J

.field private final mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private final mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

.field private max_timeout_foreground:I

.field private memorywatcher_last:J

.field private nmeaReceived_processed_at:J

.field private no_locchanged_yet:Z

.field private notified:Z

.field private ontheroad_was_false_at:J

.field private ontheroad_was_true_at:J

.field private orientation_current:I

.field private resumed_at:J

.field private satsChanged_processed_at:J

.field private setLocationListener_processed_at:J

.field private sleepEvent:[Z

.field sleepIndex:I

.field sleepTestIndex_poll_gps_enabled:I

.field private sleep_well:Z

.field private status_changing_started_at:J

.field private terminateThreadRequested:Z

.field private final wantCallNNG:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 4

    const-string v0, "ServerRunner"

    .line 394
    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 356
    new-instance v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;-><init>(Lcom/navngo/igo/javaclient/ServerRunner$1;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    .line 358
    new-instance v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;-><init>(Lcom/navngo/igo/javaclient/ServerRunner$1;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    .line 360
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantCallNNG:Ljava/util/Queue;

    const/4 v0, 0x0

    .line 362
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notified:Z

    .line 363
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->interrupted:Z

    .line 364
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->terminateThreadRequested:Z

    const-wide/16 v1, 0x0

    .line 369
    iput-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->setLocationListener_processed_at:J

    .line 370
    iput-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->ontheroad_was_true_at:J

    .line 371
    iput-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->ontheroad_was_false_at:J

    .line 372
    iput-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->resumed_at:J

    .line 374
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->max_timeout_foreground:I

    .line 375
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->memorywatcher_last:J

    const/4 v1, 0x1

    .line 376
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->no_locchanged_yet:Z

    .line 382
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepTestIndex_poll_gps_enabled:I

    .line 383
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    new-array v1, v1, [Z

    aput-boolean v0, v1, v0

    .line 388
    iput-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    const/4 v0, -0x1

    .line 395
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->orientation_current:I

    .line 396
    sget v0, Lcom/navngo/igo/javaclient/Config;->update_denied_timeout_foreground:I

    sget v1, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_foreground:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/16 v1, 0x64

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->max_timeout_foreground:I

    .line 397
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->resetGpsStatusVariables()V

    .line 398
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "EmptyHandlerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandlerThread:Landroid/os/HandlerThread;

    .line 399
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 400
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static EngineStatusName(I)Ljava/lang/String;
    .registers 1

    sparse-switch p0, :sswitch_data_30

    const-string p0, "<update this table>"

    goto :goto_2f

    :sswitch_6
    const-string p0, "NNG_ENGINE_LOST_FOCUS"

    goto :goto_2f

    :sswitch_9
    const-string p0, "NNG_ENGINE_LOSING_FOCUS"

    goto :goto_2f

    :sswitch_c
    const-string p0, "NNG_ENGINE_SET_FOCUS"

    goto :goto_2f

    :sswitch_f
    const-string p0, "NNG_ENGINE_SETTING_FOCUS"

    goto :goto_2f

    :sswitch_12
    const-string p0, "NNG_ENGINE_DESTROYED"

    goto :goto_2f

    :sswitch_15
    const-string p0, "NNG_ENGINE_STOPPED"

    goto :goto_2f

    :sswitch_18
    const-string p0, "NNG_ENGINE_STOPPING"

    goto :goto_2f

    :sswitch_1b
    const-string p0, "NNG_ENGINE_JUSTLEAVINGMAINLOOP"

    goto :goto_2f

    :sswitch_1e
    const-string p0, "NNG_ENGINE_STARTED"

    goto :goto_2f

    :sswitch_21
    const-string p0, "NNG_ENGINE_ALMOST_STARTED"

    goto :goto_2f

    :sswitch_24
    const-string p0, "NNG_ENGINE_JUSTENTERINGMAINLOOP"

    goto :goto_2f

    :sswitch_27
    const-string p0, "NNG_ENGINE_RESTARTING"

    goto :goto_2f

    :sswitch_2a
    const-string p0, "NNG_ENGINE_STARTING"

    goto :goto_2f

    :sswitch_2d
    const-string p0, "NNG_ENGINE_CREATED"

    :goto_2f
    return-object p0

    :sswitch_data_30
    .sparse-switch
        0x64 -> :sswitch_2d
        0xc8 -> :sswitch_2a
        0x12c -> :sswitch_27
        0x190 -> :sswitch_24
        0x1c2 -> :sswitch_21
        0x1f4 -> :sswitch_1e
        0x258 -> :sswitch_1b
        0x2bc -> :sswitch_18
        0x320 -> :sswitch_15
        0x384 -> :sswitch_12
        0x834 -> :sswitch_f
        0x898 -> :sswitch_c
        0x8fc -> :sswitch_9
        0x960 -> :sswitch_6
    .end sparse-switch
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V
    .registers 1

    .line 353
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V

    return-void
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;
    .registers 1

    .line 353
    iget-object p0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Wanted;
    .registers 1

    .line 353
    iget-object p0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)Lcom/navngo/igo/javaclient/ServerRunner$Current;
    .registers 1

    .line 353
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->getCurrent()Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object p0

    return-object p0
.end method

.method private checkAbnormalStatus()V
    .registers 2

    .line 550
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->interrupted:Z

    if-eqz v0, :cond_9

    const/16 v0, 0x320

    .line 551
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->want(I)V

    :cond_9
    return-void
.end method

.method private checkSleep(I)I
    .registers 8

    const/4 v0, 0x0

    .line 669
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    const/16 v1, 0x8

    if-ne p1, v1, :cond_52

    .line 671
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isInForeground()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 672
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    goto :goto_3f

    .line 673
    :cond_12
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 674
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    goto :goto_3f

    .line 675
    :cond_1d
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->prechecked_resumedStatus:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    sget-object v3, Lcom/navngo/igo/javaclient/ResumeHandler$State;->FULLY_PAUSED:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    const/4 v4, 0x1

    const-string v5, "ServerRunner"

    if-ne v2, v3, :cond_30

    const-string v2, "...fully paused, sleep well = true"

    .line 676
    invoke-static {v5, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    iput-boolean v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    goto :goto_3f

    .line 678
    :cond_30
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v2

    if-nez v2, :cond_3f

    const-string v2, "...engine is not running, sleep well = true"

    .line 679
    invoke-static {v5, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    iput-boolean v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    .line 683
    :cond_3f
    :goto_3f
    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    if-eqz v2, :cond_52

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isListening()Z

    move-result v2

    if-eqz v2, :cond_52

    .line 684
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-boolean v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    const/16 p1, 0xc

    return p1

    :cond_52
    if-ne p1, v1, :cond_7c

    .line 697
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepTestIndex_poll_gps_enabled:I

    iget v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    if-eq v0, v1, :cond_7c

    .line 698
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    .line 699
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v0

    if-nez v0, :cond_7c

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isListening()Z

    move-result v0

    if-nez v0, :cond_7c

    .line 700
    iget p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    iput p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepTestIndex_poll_gps_enabled:I

    const/16 p1, 0x19

    :cond_7c
    return p1
.end method

.method private checkStatus(Ljava/lang/Runnable;JLcom/navngo/igo/javaclient/view/IMapView;)I
    .registers 18

    move-object v0, p0

    .line 557
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v2, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_11

    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->ui_gpsListener:Z

    if-eqz v2, :cond_11

    const/4 v2, 0x1

    goto :goto_12

    :cond_11
    const/4 v2, 0x0

    :goto_12
    iput-boolean v2, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->combined_gpslistener:Z

    .line 559
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v2, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    if-eqz v2, :cond_2e

    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    .line 560
    invoke-virtual {v2}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2f

    const-string v5, "network"

    .line 561
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f

    const/4 v3, 0x1

    goto :goto_2f

    :cond_2e
    const/4 v2, 0x0

    :cond_2f
    :goto_2f
    iput-boolean v3, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->network_provider:Z

    .line 563
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v1

    const-string v3, "ServerRunner"

    if-eqz v1, :cond_46

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isStopping()Z

    move-result v1

    if-eqz v1, :cond_46

    const-string v1, "StopEngine would not be called now."

    .line 564
    invoke-static {v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    :cond_46
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v1

    if-eqz v1, :cond_64

    iget-wide v5, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->status_changing_started_at:J

    const v1, 0x1d4c0

    const-string v7, "debug"

    const-string v8, "startengine_timeout"

    invoke-static {v7, v8, v1}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    int-to-long v7, v1

    add-long/2addr v5, v7

    cmp-long v1, v5, p2

    if-gez v1, :cond_64

    const/16 v1, 0x9

    return v1

    .line 568
    :cond_64
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v1

    const/16 v5, 0x8

    if-eqz v1, :cond_75

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isStopping()Z

    move-result v1

    if-nez v1, :cond_75

    return v5

    .line 570
    :cond_75
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->lowMemory:Z

    if-eqz v1, :cond_84

    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_84

    return v4

    .line 572
    :cond_84
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->statusQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    const/16 v6, 0x1c2

    if-nez v1, :cond_d7

    .line 573
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->statusQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eq v1, v6, :cond_cb

    const/16 v7, 0x1f4

    if-eq v1, v7, :cond_cb

    const/16 v7, 0x320

    const/4 v8, 0x5

    if-eq v1, v7, :cond_ca

    const/16 v7, 0x384

    if-eq v1, v7, :cond_c0

    const/16 v7, 0x898

    if-eq v1, v7, :cond_cb

    const/16 v7, 0x960

    if-eq v1, v7, :cond_b6

    goto :goto_d7

    .line 592
    :cond_b6
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_d7

    const/4 v1, 0x7

    return v1

    .line 578
    :cond_c0
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_c9

    return v8

    :cond_c9
    return v5

    :cond_ca
    return v8

    .line 586
    :cond_cb
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_d5

    const/4 v1, 0x6

    return v1

    :cond_d5
    const/4 v1, 0x3

    return v1

    .line 599
    :cond_d7
    :goto_d7
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->prechecked_androidgo:Z

    if-eqz v1, :cond_e8

    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isCallable()Z

    move-result v1

    if-eqz v1, :cond_e8

    const/16 v1, 0x17

    return v1

    .line 602
    :cond_e8
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->combined_gpslistener:Z

    iget-object v7, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v7}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isListening()Z

    move-result v7

    if-eq v1, v7, :cond_100

    iget-wide v7, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->setLocationListener_processed_at:J

    const-wide/16 v9, 0x3e8

    add-long/2addr v7, v9

    cmp-long v1, v7, p2

    if-gez v1, :cond_100

    const/16 v1, 0xd

    return v1

    .line 606
    :cond_100
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    const/16 v7, 0xc

    if-nez v1, :cond_123

    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->ui_gpsListener:Z

    if-eqz v1, :cond_123

    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    .line 607
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isListening()Z

    move-result v1

    if-nez v1, :cond_123

    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isInForeground()Z

    move-result v1

    if-eqz v1, :cond_123

    .line 608
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-boolean v4, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    return v7

    .line 611
    :cond_123
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1f0

    .line 615
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    if-eq v1, v6, :cond_19b

    .line 616
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    iget-object v6, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v6, v6, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    if-eq v1, v6, :cond_13e

    const/16 v1, 0xf

    return v1

    .line 618
    :cond_13e
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v8, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    iget-wide v10, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_processed_at:J

    const/16 v1, 0x10

    const/16 v6, 0x12

    cmp-long v12, v8, v10

    if-eqz v12, :cond_16e

    iget-object v8, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v8, v8, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    if-eqz v8, :cond_16e

    if-eqz v2, :cond_165

    .line 620
    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->network_provider:Z

    if-eqz v2, :cond_15e

    iget-boolean v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->no_locchanged_yet:Z

    if-eqz v2, :cond_165

    :cond_15e
    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    if-eq v2, v4, :cond_165

    return v1

    .line 625
    :cond_165
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->network_provider:Z

    if-eqz v1, :cond_16d

    const/16 v6, 0x11

    :cond_16d
    return v6

    .line 629
    :cond_16e
    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v8, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmea_requested_at:J

    iget-wide v10, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->nmeaReceived_processed_at:J

    cmp-long v2, v8, v10

    if-eqz v2, :cond_18e

    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    .line 630
    invoke-interface {v2}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_18e

    .line 631
    iget-boolean v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->no_locchanged_yet:Z

    if-eqz v2, :cond_18d

    iget-object v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    if-eq v2, v4, :cond_18d

    return v1

    :cond_18d
    return v6

    .line 636
    :cond_18e
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->sats_requested_at:J

    iget-wide v8, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->satsChanged_processed_at:J

    cmp-long v6, v1, v8

    if-eqz v6, :cond_19b

    const/16 v1, 0x1a

    return v1

    .line 639
    :cond_19b
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    if-ne v1, v4, :cond_1bf

    iget-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    sget v4, Lcom/navngo/igo/javaclient/Config;->gps_lost_timeout:I

    int-to-long v8, v4

    add-long/2addr v1, v8

    cmp-long v4, v1, p2

    if-gez v4, :cond_1bf

    iget-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->resumed_at:J

    const-wide/16 v8, 0x7530

    add-long/2addr v1, v8

    cmp-long v4, v1, p2

    if-gez v4, :cond_1bf

    .line 642
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    const/4 v2, 0x2

    iput v2, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    const-string v1, "locChanged_valid_processed timed out"

    .line 643
    invoke-static {v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v7

    .line 646
    :cond_1bf
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    iget v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->orientation_current:I

    if-eq v1, v2, :cond_1d4

    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    .line 647
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isInForeground()Z

    move-result v1

    if-eqz v1, :cond_1d4

    if-eqz p4, :cond_1d4

    const/16 v1, 0x13

    return v1

    .line 651
    :cond_1d4
    iget-object v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->timeChange:Z

    if-eqz v1, :cond_1dd

    const/16 v1, 0x14

    return v1

    :cond_1dd
    if-eqz p1, :cond_1e2

    const/16 v1, 0x15

    return v1

    .line 655
    :cond_1e2
    iget-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->memorywatcher_last:J

    sget v3, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_foreground:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    cmp-long v3, v1, p2

    if-gez v3, :cond_1ef

    const/16 v1, 0x16

    return v1

    :cond_1ef
    return v5

    .line 661
    :cond_1f0
    iget-boolean v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->interrupted:Z

    if-eqz v1, :cond_1f7

    const/16 v1, 0x18

    return v1

    :cond_1f7
    return v5
.end method

.method private do_assume_gps_connected(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V
    .registers 4

    const-string v0, "ServerRunner"

    const-string v1, "GPS now assumed connected"

    .line 1015
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1016
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->no_locchanged_yet:Z

    .line 1017
    iget-boolean v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->network_provider:Z

    if-nez v0, :cond_12

    .line 1018
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    :cond_12
    return-void
.end method

.method private do_garbagecollect(J)V
    .registers 11

    .line 1096
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->freeMemory()I

    move-result v0

    .line 1097
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Free memory = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shr-int/lit8 v2, v0, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " KB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ServerRunner"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1099
    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->SetJavaFreeMemory(I)V

    .line 1100
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->freeMemory()I

    move-result v1

    .line 1101
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "After freeing = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shr-int/lit8 v4, v1, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " KB  (Gain: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    int-to-double v4, v1

    const-wide/16 v6, 0x0

    add-double/2addr v4, v6

    int-to-double v0, v0

    sub-double/2addr v4, v0

    const-wide/high16 v0, 0x4090000000000000L    # 1024.0

    div-double/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, " KB)"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1102
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->memorywatcher_last:J

    return-void
.end method

.method private do_gpsstatus(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V
    .registers 4

    .line 980
    iget p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    if-eqz p1, :cond_4a

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3f

    const/4 v1, 0x2

    if-eq p1, v1, :cond_34

    const/4 v1, 0x3

    if-eq p1, v1, :cond_29

    const/4 v1, 0x4

    if-eq p1, v1, :cond_11

    goto :goto_55

    .line 998
    :cond_11
    monitor-enter p0

    .line 999
    :try_start_12
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    .line 1000
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iput v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    .line 1001
    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_12 .. :try_end_1b} :catchall_26

    const-string p1, "ServerRunner"

    const-string v0, "NNG.GpsEnabled"

    .line 1002
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1003
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->GpsEnabled()V

    goto :goto_55

    :catchall_26
    move-exception p1

    .line 1001
    :try_start_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    throw p1

    :cond_29
    const-string p1, "ServerRunner"

    const-string v0, "NNG.GpsDenied"

    .line 994
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 995
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->GpsDenied()V

    goto :goto_55

    :cond_34
    const-string p1, "ServerRunner"

    const-string v0, "NNG.GpsLost"

    .line 990
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 991
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->GpsLost()V

    goto :goto_55

    :cond_3f
    const-string p1, "ServerRunner"

    const-string v1, "NNG.GpsConnect(true)"

    .line 986
    invoke-static {p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 987
    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->GpsConnect(Z)V

    goto :goto_55

    :cond_4a
    const-string p1, "ServerRunner"

    const-string v0, "NNG.GpsConnect(false)"

    .line 982
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 983
    invoke-static {p1}, Lcom/navngo/igo/javaclient/NNG;->GpsConnect(Z)V

    :goto_55
    return-void
.end method

.method private do_locchanged_gps(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;J)V
    .registers 9

    .line 1049
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_processed_at:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_15

    .line 1051
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_processed_at:J

    .line 1052
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    .line 1056
    iget-object v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->onLocationChanged(Landroid/location/Location;)V

    .line 1058
    :cond_15
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmea_requested_at:J

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->nmeaReceived_processed_at:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_4e

    .line 1060
    iget-object p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->element()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;

    .line 1061
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->received:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->nmeaReceived_processed_at:J

    .line 1062
    iput-wide p2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    .line 1063
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$900()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_33
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_47

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;

    .line 1065
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->timestamp:J

    iget-object v2, p1, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->sentence:Ljava/lang/String;

    invoke-interface {p3, v0, v1, v2}, Lcom/navngo/igo/javaclient/ServerRunner$IForwardedNmeaListener;->onNmeaForwardedToEngine(JLjava/lang/String;)V

    goto :goto_33

    .line 1067
    :cond_47
    iget-wide p2, p1, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->timestamp:J

    iget-object p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->sentence:Ljava/lang/String;

    invoke-static {p2, p3, p1}, Lcom/navngo/igo/javaclient/NNG;->onNmeaReceived(JLjava/lang/String;)V

    :cond_4e
    const/4 p1, 0x1

    .line 1069
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->first_position_processed:Z

    return-void
.end method

.method private do_locchanged_network(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;J)V
    .registers 13

    .line 1029
    invoke-direct {p0, p2, p3}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isOnTheRoad(J)Z

    move-result v0

    const-string v1, "ServerRunner"

    if-eqz v0, :cond_e

    const-string p2, "Network position not used for navigation"

    .line 1030
    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6f

    .line 1031
    :cond_e
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->first_position_processed:Z

    if-eqz v0, :cond_22

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    sget v0, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    int-to-long v4, v0

    add-long/2addr v2, v4

    cmp-long v0, v2, p2

    if-lez v0, :cond_22

    const-string p2, "Dropping network position as we have fresh GPS signal"

    .line 1034
    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6f

    .line 1036
    :cond_22
    iget-object v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/location/Location;->setSpeed(F)V

    .line 1037
    iget-object v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->onLocationChanged(Landroid/location/Location;)V

    const-string v0, "network position processed. It will not affect our expiration timer."

    .line 1038
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1039
    move-object v2, v0

    check-cast v2, Ljava/util/Locale;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    sget v6, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 1040
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    iget-wide v5, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    sget v7, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    int-to-long v7, v7

    add-long/2addr v5, v7

    sub-long/2addr v5, p2

    .line 1041
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v2, v3

    const/4 p2, 0x3

    iget-boolean p3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->first_position_processed:Z

    .line 1042
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    aput-object p3, v2, p2

    const-string p2, "proc time: %d, now: %d., delta: %d. First pos processed: %b"

    .line 1039
    invoke-static {v0, p2, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1043
    iput-boolean v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->first_position_processed:Z

    .line 1045
    :goto_6f
    iget-wide p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_processed_at:J

    return-void
.end method

.method private do_orientationchanged(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;Lcom/navngo/igo/javaclient/view/IMapView;)V
    .registers 5

    .line 1081
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "do_orientationchanged: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->orientation_current:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " -> "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "ServerRunner"

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1083
    iget p2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->orientation_current:I

    iget v1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    if-eq p2, v1, :cond_38

    .line 1084
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->IsIntroEnded()Z

    move-result p2

    if-eqz p2, :cond_38

    .line 1085
    iget p2, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    invoke-static {p2}, Lcom/navngo/igo/javaclient/NNG;->OrientationChanged(I)V

    const-string p2, "NNG.OrientationChanged completed"

    .line 1086
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1088
    :cond_38
    iget p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    iput p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->orientation_current:I

    return-void
.end method

.method private do_resumeengine(J)V
    .registers 5

    const-string v0, "ServerRunner"

    const-string v1, "NNG.Resume prepare"

    .line 965
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 966
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->Resume()V

    const-string v1, "NNG.Resume done"

    .line 967
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 968
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 970
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->hideLoadAnimation()V

    .line 971
    :cond_18
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->resumed_at:J

    return-void
.end method

.method private do_satschanged_gps(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V
    .registers 7

    .line 1073
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->sats_requested_at:J

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->satsChanged_processed_at:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_f

    .line 1075
    iget-wide v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->sats_requested_at:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->satsChanged_processed_at:J

    .line 1076
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->onSatellitesChanged()V

    :cond_f
    return-void
.end method

.method private do_setlocationlistener(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V
    .registers 4

    .line 1009
    iget-boolean v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->combined_gpslistener:Z

    invoke-static {v0}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->setLocationListener(Z)V

    .line 1010
    iget-boolean p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->combined_gpslistener:Z

    invoke-static {p1}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->setNmeaListener(Z)V

    .line 1011
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->setLocationListener_processed_at:J

    return-void
.end method

.method private do_sleep()V
    .registers 10

    .line 1108
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    monitor-enter v0

    .line 1109
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput-boolean v2, v1, v3

    .line 1110
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1111
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_67

    .line 1114
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notified:Z

    if-eqz v0, :cond_14

    .line 1115
    iput-boolean v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notified:Z

    return-void

    .line 1122
    :cond_14
    :try_start_14
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep_well:Z

    if-nez v0, :cond_20

    .line 1123
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->max_timeout_foreground:I

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    const/4 v0, 0x0

    goto :goto_40

    .line 1125
    :cond_20
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z
    :try_end_22
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_22} :catch_46
    .catchall {:try_start_14 .. :try_end_22} :catchall_43

    if-eqz v0, :cond_2e

    .line 1128
    :try_start_24
    invoke-static {v2}, Lcom/navngo/igo/javaclient/NNG;->setWaitInfinitely(Z)V
    :try_end_27
    .catch Ljava/lang/InterruptedException; {:try_start_24 .. :try_end_27} :catch_2c
    .catchall {:try_start_24 .. :try_end_27} :catchall_29

    const/4 v0, 0x1

    goto :goto_2f

    :catchall_29
    move-exception v0

    const/4 v1, 0x1

    goto :goto_5a

    :catch_2c
    const/4 v0, 0x1

    goto :goto_47

    :cond_2e
    const/4 v0, 0x0

    .line 1132
    :goto_2f
    :try_start_2f
    sget-wide v4, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-lez v1, :cond_3d

    .line 1133
    sget-wide v4, Lcom/navngo/igo/javaclient/Config;->memorywatcher_timeout_background:J

    invoke-virtual {p0, v4, v5}, Ljava/lang/Object;->wait(J)V

    goto :goto_40

    .line 1135
    :cond_3d
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_40
    .catch Ljava/lang/InterruptedException; {:try_start_2f .. :try_end_40} :catch_47
    .catchall {:try_start_2f .. :try_end_40} :catchall_56

    :goto_40
    if-eqz v0, :cond_4e

    goto :goto_4b

    :catchall_43
    move-exception v0

    const/4 v1, 0x0

    goto :goto_5a

    :catch_46
    const/4 v0, 0x0

    .line 1139
    :catch_47
    :goto_47
    :try_start_47
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->interrupted:Z
    :try_end_49
    .catchall {:try_start_47 .. :try_end_49} :catchall_56

    if-eqz v0, :cond_4e

    .line 1143
    :goto_4b
    invoke-static {v3}, Lcom/navngo/igo/javaclient/NNG;->setWaitInfinitely(Z)V

    .line 1144
    :cond_4e
    iput-boolean v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notified:Z

    .line 1145
    iget v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    return-void

    :catchall_56
    move-exception v1

    move-object v8, v1

    move v1, v0

    move-object v0, v8

    :goto_5a
    if-eqz v1, :cond_5f

    .line 1143
    invoke-static {v3}, Lcom/navngo/igo/javaclient/NNG;->setWaitInfinitely(Z)V

    .line 1144
    :cond_5f
    iput-boolean v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notified:Z

    .line 1145
    iget v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepIndex:I

    .line 1146
    throw v0

    :catchall_67
    move-exception v1

    .line 1111
    :try_start_68
    monitor-exit v0
    :try_end_69
    .catchall {:try_start_68 .. :try_end_69} :catchall_67

    throw v1
.end method

.method private do_startengine(Lcom/navngo/igo/javaclient/ServerRunner$Current;)V
    .registers 10

    .line 818
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    const/4 v1, 0x1

    if-nez v0, :cond_10

    const-string p1, "ServerRunner"

    const-string v0, "Not starting engine as NNG not fully loaded"

    .line 819
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    return-void

    .line 823
    :cond_10
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->setOrientation(I)V

    .line 824
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    .line 825
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->setStartEngineIntParams(Lcom/navngo/igo/javaclient/IgoActivity;)V

    const/4 v2, 0x0

    .line 829
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getLockedTo()Ljava/lang/String;

    move-result-object v3

    const-string v4, "manufactureid"

    .line 831
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_49

    .line 832
    invoke-static {}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->getInstace()Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    move-result-object v3

    .line 833
    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->isValid()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 834
    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->getID()Ljava/lang/String;

    move-result-object v2

    :cond_41
    if-nez v2, :cond_117

    .line 837
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->getAndroidId(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_117

    :cond_49
    const-string v2, "imei"

    .line 839
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5d

    .line 840
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->getImei(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_117

    .line 842
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->getAndroidId(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_117

    :cond_5d
    const-string v2, "android.os.Build.SERIAL"

    .line 844
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b9

    .line 845
    sget-object v2, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 846
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_117

    .line 847
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v3

    const-string v4, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v3, v4}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 849
    :try_start_79
    invoke-static {}, Landroid/os/Build;->getSerial()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ServerRunner"

    .line 850
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getSerial() returned: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_93
    .catch Ljava/lang/SecurityException; {:try_start_79 .. :try_end_93} :catch_95

    goto/16 :goto_117

    :catch_95
    move-exception v3

    const-string v4, "ServerRunner"

    .line 852
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "getSerial() failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_117

    :cond_b1
    const-string v3, "ServerRunner"

    const-string v4, "getSerial(): missing permissions"

    .line 855
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_117

    :cond_b9
    const-string v2, "sdid"

    .line 858
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c6

    .line 859
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->access$600(Z)Ljava/lang/String;

    move-result-object v2

    goto :goto_117

    :cond_c6
    const-string v2, "cid"

    .line 860
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d4

    const/4 v2, 0x0

    .line 861
    invoke-static {v2}, Lcom/navngo/igo/javaclient/ServerRunner;->access$600(Z)Ljava/lang/String;

    move-result-object v2

    goto :goto_117

    :cond_d4
    const-string v2, "device_id"

    .line 862
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e1

    .line 863
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    goto :goto_117

    :cond_e1
    const-string v2, "android_id"

    .line 864
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ee

    .line 865
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->getAndroidId(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    goto :goto_117

    :cond_ee
    const-string v2, "cpu_serial"

    .line 866
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_fb

    .line 867
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$700()Ljava/lang/String;

    move-result-object v2

    goto :goto_117

    .line 871
    :cond_fb
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->getImei(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_107

    .line 873
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_10b

    .line 874
    :cond_107
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->access$600(Z)Ljava/lang/String;

    move-result-object v2

    :cond_10b
    if-eqz v2, :cond_113

    .line 876
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_117

    .line 877
    :cond_113
    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->getAndroidId(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    :cond_117
    :goto_117
    if-nez v2, :cond_12b

    .line 882
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget v0, Lcom/navngo/igo/javaclient/R$string;->imei_error:I

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/Application;->alert(I)V

    const-string p1, "ServerRunner"

    const-string v0, "Not starting engine: neither IMEI nor AndroidId nor SD card id is available"

    .line 883
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 884
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    return-void

    :cond_12b
    const-string v3, "ServerRunner"

    .line 887
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Device ID: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    invoke-static {v2}, Lcom/navngo/igo/javaclient/NNG;->SetDeviceId(Ljava/lang/String;)V

    if-eqz v0, :cond_149

    .line 890
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->SetPlatformID()V

    .line 892
    :cond_149
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->saveCurrentLocale()Z

    .line 894
    invoke-static {v0}, Lcom/navngo/igo/javaclient/DataInstaller;->checkFactoryReset(Lcom/navngo/igo/javaclient/IgoActivity;)V

    .line 896
    iget v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v2, 0x320

    const/16 v3, 0x64

    if-ne v0, v2, :cond_162

    const-string v0, "ServerRunner"

    const-string v2, "Resetting current.status to NNG.NNG_ENGINE_CREATED"

    .line 898
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 899
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iput v3, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    .line 902
    :cond_162
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->registerInterfaces()V

    .line 904
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    .line 906
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 907
    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->CacheAssetManager(Ljava/lang/Object;)V

    const-string v0, "ServerRunner"

    .line 909
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "current.status = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 910
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    .line 911
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->StartEngine()Z

    move-result p1

    if-nez p1, :cond_1ab

    const-string v0, "ServerRunner"

    const-string v2, "Failed to start the navigation engine."

    .line 914
    new-instance v6, Ljava/lang/RuntimeException;

    const-string v7, "Failed to start the navigation engine."

    invoke-direct {v6, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1ab
    :goto_1ab
    if-eqz p1, :cond_1ca

    .line 919
    monitor-enter p0

    .line 921
    :try_start_1ae
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v0

    if-nez v0, :cond_1be

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    if-eq v0, v3, :cond_1be

    .line 922
    monitor-exit p0

    goto :goto_1ca

    .line 923
    :cond_1be
    monitor-exit p0
    :try_end_1bf
    .catchall {:try_start_1ae .. :try_end_1bf} :catchall_1c7

    const-wide/16 v6, 0x64

    .line 926
    :try_start_1c1
    invoke-static {v6, v7}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleep(J)V
    :try_end_1c4
    .catch Ljava/lang/InterruptedException; {:try_start_1c1 .. :try_end_1c4} :catch_1c5

    goto :goto_1ab

    :catch_1c5
    nop

    goto :goto_1ca

    :catchall_1c7
    move-exception p1

    .line 923
    :try_start_1c8
    monitor-exit p0
    :try_end_1c9
    .catchall {:try_start_1c8 .. :try_end_1c9} :catchall_1c7

    throw p1

    .line 934
    :cond_1ca
    :goto_1ca
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-string v0, "ServerRunner"

    .line 935
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "NNG.StartEngine "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_1df

    const-string p1, "OK"

    goto :goto_1e1

    :cond_1df
    const-string p1, "problem"

    :goto_1e1
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ". Elapsed time: "

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-long/2addr v2, v4

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 937
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    if-eqz p1, :cond_1fd

    .line 939
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/IgoActivity;->hideLoadAnimation()V

    .line 941
    :cond_1fd
    monitor-enter p0

    :try_start_1fe
    const-string p1, "ServerRunner"

    .line 942
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mCurrent.status = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    invoke-static {v2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 943
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result p1

    if-nez p1, :cond_236

    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result p1

    if-nez p1, :cond_236

    const-string p1, "ServerRunner"

    const-string v0, "Engine start failed."

    .line 944
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 945
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    .line 947
    :cond_236
    monitor-exit p0

    return-void

    :catchall_238
    move-exception p1

    monitor-exit p0
    :try_end_23a
    .catchall {:try_start_1fe .. :try_end_23a} :catchall_238

    throw p1
.end method

.method private do_stopengine()V
    .registers 3

    .line 951
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->StopEngine()V

    const/4 v0, 0x0

    .line 952
    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->CacheAssetManager(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 953
    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->SetIntroEnded(Z)V

    .line 954
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->unregisterInterfaces()V

    .line 955
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$800()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 956
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_18

    .line 958
    :cond_28
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$800()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const-string v0, "ServerRunner"

    const-string v1, "NNG.StopEngine done"

    .line 960
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 961
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->terminateThreadRequested:Z

    return-void
.end method

.method private do_suspendengine()V
    .registers 3

    .line 975
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->Suspend()V

    .line 976
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NNG.Suspend done: freeMemory = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->freeMemory()I

    move-result v1

    shr-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " KB"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ServerRunner"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private do_timechange()V
    .registers 1

    .line 1092
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->SendTimeChangedEvent()V

    return-void
.end method

.method private declared-synchronized getCurrent()Lcom/navngo/igo/javaclient/ServerRunner$Current;
    .registers 2

    monitor-enter p0

    .line 1351
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->copy()Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private isOnTheRoad(J)Z
    .registers 9

    .line 1172
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->ontheroad_was_true_at:J

    const-wide/16 v2, 0x1388

    add-long/2addr v0, v2

    const-string v4, "ServerRunner"

    cmp-long v5, v0, p1

    if-lez v5, :cond_12

    const/4 p1, 0x1

    const-string p2, "ontheroad cached true"

    .line 1174
    invoke-static {v4, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2c

    .line 1175
    :cond_12
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->ontheroad_was_false_at:J

    add-long/2addr v0, v2

    cmp-long v2, v0, p1

    if-lez v2, :cond_20

    const/4 p1, 0x0

    const-string p2, "ontheroad cached false"

    .line 1177
    invoke-static {v4, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2c

    .line 1179
    :cond_20
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->isOnTheRoad()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 1181
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->ontheroad_was_true_at:J

    goto :goto_2b

    .line 1183
    :cond_29
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->ontheroad_was_false_at:J

    :goto_2b
    move p1, v0

    :goto_2c
    return p1
.end method

.method private static loggingStatus(I)V
    .registers 3

    packed-switch p0, :pswitch_data_58

    :pswitch_3
    const-string p0, "todoName: <update this table>"

    goto :goto_40

    :pswitch_6
    return-void

    :pswitch_7
    const-string p0, "DO_POLL_GPS_ENABLED"

    goto :goto_40

    :pswitch_a
    const-string p0, "DO_INTERRUPTED"

    goto :goto_40

    :pswitch_d
    const-string p0, "DO_ANDROIDGO"

    goto :goto_40

    :pswitch_10
    const-string p0, "DO_GARBAGECOLLECT"

    goto :goto_40

    :pswitch_13
    const-string p0, "DO_CALLNNG"

    goto :goto_40

    :pswitch_16
    const-string p0, "DO_TIMECHANGE"

    goto :goto_40

    :pswitch_19
    const-string p0, "DO_ORIENTATIONCHANGED"

    goto :goto_40

    :pswitch_1c
    const-string p0, "DO_LOCCHANGED_GPS"

    goto :goto_40

    :pswitch_1f
    const-string p0, "DO_LOCCHANGED_NETWORK"

    goto :goto_40

    :pswitch_22
    const-string p0, "DO_ASSUME_GPS_CONNECTED"

    goto :goto_40

    :pswitch_25
    const-string p0, "DO_GPSSTATUS"

    goto :goto_40

    :pswitch_28
    const-string p0, "DO_SETLOCATIONLISTENER"

    goto :goto_40

    :pswitch_2b
    return-void

    :pswitch_2c
    const-string p0, "DO_ENGINESTATUS_TIMEOUT"

    goto :goto_40

    :pswitch_2f
    const-string p0, "DO_SLEEP"

    goto :goto_40

    :pswitch_32
    const-string p0, "DO_SUSPENDENGINE"

    goto :goto_40

    :pswitch_35
    const-string p0, "DO_RESUMEENGINE"

    goto :goto_40

    :pswitch_38
    const-string p0, "DO_STOPENGINE"

    goto :goto_40

    :pswitch_3b
    const-string p0, "DO_STARTENGINE"

    goto :goto_40

    :pswitch_3e
    const-string p0, "DO_LOWMEMORY"

    .line 814
    :goto_40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "todo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ServerRunner"

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_58
    .packed-switch 0x1
        :pswitch_3e
        :pswitch_3
        :pswitch_3b
        :pswitch_3
        :pswitch_38
        :pswitch_35
        :pswitch_32
        :pswitch_2f
        :pswitch_2c
        :pswitch_3
        :pswitch_3
        :pswitch_2b
        :pswitch_28
        :pswitch_3
        :pswitch_25
        :pswitch_22
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method private notifyStatusThread()V
    .registers 2

    const/4 v0, 0x1

    .line 1165
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notified:Z

    .line 1166
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    return-void
.end method

.method private remove_stale_nmea()V
    .registers 6

    .line 746
    :goto_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_24

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->element()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;

    iget-wide v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;->received:J

    iget-wide v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->nmeaReceived_processed_at:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_24

    .line 747
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    goto :goto_0

    :cond_24
    return-void
.end method

.method private resetGpsStatusVariables()V
    .registers 9

    const-string v0, "ServerRunner"

    const-string v1, "resetGpsStatusVariables"

    .line 404
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 406
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    const/4 v3, 0x0

    iput v3, v2, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    .line 407
    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput v3, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    const-wide/16 v4, 0x1

    sub-long v6, v0, v4

    .line 408
    iput-wide v6, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->satsChanged_processed_at:J

    .line 409
    iput-wide v6, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_processed_at:J

    const-wide/16 v6, 0x0

    .line 410
    iput-wide v6, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->nmeaReceived_processed_at:J

    .line 414
    sget v2, Lcom/navngo/igo/javaclient/Config;->network_jelre_fanyalodunk_timeout:I

    int-to-long v6, v2

    sub-long/2addr v0, v6

    sub-long/2addr v0, v4

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_valid_processed_at:J

    .line 415
    iput-boolean v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->first_position_processed:Z

    .line 416
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->locChanged_processed_at:J

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    .line 417
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->nmeaReceived_processed_at:J

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmea_requested_at:J

    .line 418
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 419
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->satsChanged_processed_at:J

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->sats_requested_at:J

    return-void
.end method

.method private runCycle()Z
    .registers 12

    .line 452
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    .line 455
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 461
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isCallable()Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_26

    .line 462
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->IsIntroEnded()Z

    move-result v4

    if-eqz v4, :cond_26

    .line 463
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->hasActionsToProcess()Z

    move-result v4

    if-eqz v4, :cond_26

    const/4 v4, 0x1

    goto :goto_27

    :cond_26
    const/4 v4, 0x0

    :goto_27
    iput-boolean v4, v3, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->prechecked_androidgo:Z

    .line 464
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    sget-object v4, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/ResumeHandler;->getState()Lcom/navngo/igo/javaclient/ResumeHandler$State;

    move-result-object v4

    iput-object v4, v3, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->prechecked_resumedStatus:Lcom/navngo/igo/javaclient/ResumeHandler$State;

    .line 465
    monitor-enter p0

    .line 466
    :try_start_34
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v3, v3, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    .line 467
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->checkAbnormalStatus()V

    .line 468
    iget-object v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantCallNNG:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Runnable;

    .line 469
    invoke-direct {p0, v4, v1, v2, v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->checkStatus(Ljava/lang/Runnable;JLcom/navngo/igo/javaclient/view/IMapView;)I

    move-result v7

    .line 470
    invoke-direct {p0, v7}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->checkSleep(I)I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_54

    .line 472
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_sleep()V

    const/16 v7, 0xc

    .line 475
    :cond_54
    invoke-direct {p0, v7}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->updateStatus(I)V

    .line 476
    iget-object v8, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    invoke-virtual {v8}, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->copy()Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    move-result-object v8

    .line 477
    iget-object v9, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v9}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->copy()Lcom/navngo/igo/javaclient/ServerRunner$Current;

    move-result-object v9

    .line 478
    monitor-exit p0
    :try_end_64
    .catchall {:try_start_34 .. :try_end_64} :catchall_152

    .line 480
    invoke-static {v7}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->loggingStatus(I)V

    if-eq v7, v6, :cond_f4

    const/4 v10, 0x3

    if-eq v7, v10, :cond_f0

    const/16 v9, 0xd

    if-eq v7, v9, :cond_ec

    const/16 v9, 0x1a

    if-eq v7, v9, :cond_e8

    const/4 v9, 0x5

    if-eq v7, v9, :cond_e4

    const/4 v9, 0x6

    if-eq v7, v9, :cond_e0

    const/4 v9, 0x7

    if-eq v7, v9, :cond_dc

    packed-switch v7, :pswitch_data_156

    goto/16 :goto_151

    :pswitch_82
    return v5

    .line 540
    :pswitch_83
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->process()V

    goto/16 :goto_151

    .line 536
    :pswitch_8c
    invoke-direct {p0, v1, v2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_garbagecollect(J)V

    goto/16 :goto_151

    .line 533
    :pswitch_91
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    goto/16 :goto_151

    .line 530
    :pswitch_96
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_timechange()V

    goto/16 :goto_151

    .line 527
    :pswitch_9b
    invoke-direct {p0, v8, v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_orientationchanged(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;Lcom/navngo/igo/javaclient/view/IMapView;)V

    goto/16 :goto_151

    .line 521
    :pswitch_a0
    invoke-direct {p0, v8, v1, v2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_locchanged_gps(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;J)V

    goto/16 :goto_151

    .line 518
    :pswitch_a5
    invoke-direct {p0, v8, v1, v2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_locchanged_network(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;J)V

    goto/16 :goto_151

    .line 515
    :pswitch_aa
    invoke-direct {p0, v8}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_assume_gps_connected(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V

    goto/16 :goto_151

    :pswitch_af
    const-string v0, "ServerRunner"

    .line 509
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "do_gpsstatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    invoke-static {v3}, Lcom/navngo/igo/javaclient/ServerRunner;->access$500(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v8, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    .line 511
    invoke-static {v2}, Lcom/navngo/igo/javaclient/ServerRunner;->access$500(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 509
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    invoke-direct {p0, v8}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_gpsstatus(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V

    goto/16 :goto_151

    .line 501
    :cond_dc
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_suspendengine()V

    goto :goto_151

    .line 498
    :cond_e0
    invoke-direct {p0, v1, v2}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_resumeengine(J)V

    goto :goto_151

    .line 495
    :cond_e4
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_stopengine()V

    goto :goto_151

    .line 524
    :cond_e8
    invoke-direct {p0, v8}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_satschanged_gps(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V

    goto :goto_151

    .line 506
    :cond_ec
    invoke-direct {p0, v8}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_setlocationlistener(Lcom/navngo/igo/javaclient/ServerRunner$Wanted;)V

    goto :goto_151

    .line 492
    :cond_f0
    invoke-direct {p0, v9}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->do_startengine(Lcom/navngo/igo/javaclient/ServerRunner$Current;)V

    goto :goto_151

    .line 483
    :cond_f4
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->freeMemory()I

    move-result v0

    const-string v1, "android"

    const-string v2, "on_low_memory"

    const v3, 0xb71b00

    .line 484
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    const-string v2, "ServerRunner"

    .line 485
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onLowMemory started: freeMemory = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shr-int/lit8 v4, v0, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " KB wanted = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shr-int/lit8 v4, v1, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " KB"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->SetJavaFreeMemory(I)V

    .line 488
    invoke-static {v1, v6}, Lcom/navngo/igo/javaclient/NNG;->garbageCollect(IZ)V

    const-string v0, "ServerRunner"

    .line 489
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLowMemory finished: freeMemory = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->freeMemory()I

    move-result v2

    shr-int/lit8 v2, v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " KB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :goto_151
    return v6

    :catchall_152
    move-exception v0

    .line 478
    :try_start_153
    monitor-exit p0
    :try_end_154
    .catchall {:try_start_153 .. :try_end_154} :catchall_152

    throw v0

    nop

    :pswitch_data_156
    .packed-switch 0xf
        :pswitch_af
        :pswitch_aa
        :pswitch_a5
        :pswitch_a0
        :pswitch_9b
        :pswitch_96
        :pswitch_91
        :pswitch_8c
        :pswitch_83
        :pswitch_82
    .end packed-switch
.end method

.method private setStartEngineIntParams(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 7

    .line 1151
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getScreenSizes()Lcom/navngo/igo/javaclient/Application$ScreenSizes;

    move-result-object p1

    .line 1152
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 1153
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    const-string v2, "debug"

    const-string v3, "startengine_timeout"

    const v4, 0x1d4c0

    invoke-static {v2, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x2

    aput v3, v1, v4

    .line 1154
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    const-string v3, "cache_size"

    const v4, 0x1312d00

    invoke-static {v2, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    const/4 v3, 0x1

    aput v2, v1, v3

    .line 1155
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    iget v2, p1, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x:I

    const/4 v3, 0x4

    aput v2, v1, v3

    .line 1156
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    iget v2, p1, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y:I

    const/4 v3, 0x5

    aput v2, v1, v3

    .line 1157
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    iget v2, p1, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x2:I

    const/4 v3, 0x6

    aput v2, v1, v3

    .line 1158
    sget-object v1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    iget p1, p1, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y2:I

    const/4 v2, 0x7

    aput p1, v1, v2

    .line 1159
    sget-object p1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/16 v1, 0x8

    aput v0, p1, v1

    .line 1160
    sget-object p1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x9

    aput v0, p1, v1

    return-void
.end method

.method private updateStatus(I)V
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_74

    const/4 v2, 0x3

    if-eq p1, v2, :cond_70

    const/4 v2, 0x6

    if-eq p1, v2, :cond_6c

    const/16 v2, 0x9

    if-eq p1, v2, :cond_48

    const/16 v2, 0x12

    if-eq p1, v2, :cond_44

    const/16 v2, 0x19

    if-eq p1, v2, :cond_40

    const/16 v2, 0xf

    if-eq p1, v2, :cond_37

    const/16 v2, 0x10

    if-eq p1, v2, :cond_32

    const/16 v1, 0x14

    if-eq p1, v1, :cond_2d

    const/16 v0, 0x15

    if-eq p1, v0, :cond_27

    goto :goto_78

    .line 734
    :cond_27
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantCallNNG:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    goto :goto_78

    .line 731
    :cond_2d
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-boolean v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->timeChange:Z

    goto :goto_78

    .line 728
    :cond_32
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput v1, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    goto :goto_78

    .line 725
    :cond_37
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    iput v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    goto :goto_78

    .line 737
    :cond_40
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->update_denied()V

    goto :goto_78

    .line 740
    :cond_44
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->remove_stale_nmea()V

    goto :goto_78

    .line 721
    :cond_48
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " TIMEOUT"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ServerRunner"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x64

    .line 722
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatus(I)V

    goto :goto_78

    .line 718
    :cond_6c
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->update_denied()V

    goto :goto_78

    .line 715
    :cond_70
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->update_denied()V

    goto :goto_78

    .line 712
    :cond_74
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-boolean v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->lowMemory:Z

    :goto_78
    return-void
.end method

.method private update_denied()V
    .registers 4

    .line 752
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isGpsDenied()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->isGpsDenied()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    .line 753
    :goto_f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "update_denied: isGpsDenied = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", ui_gpsListener = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->ui_gpsListener:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", gpsStatus = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", mWanted.gpsListener = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-boolean v2, v2, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ServerRunner"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x3

    if-eqz v0, :cond_56

    const-string v0, "user had turned GPS off, while iGO was suspended"

    .line 758
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 759
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    goto :goto_66

    .line 760
    :cond_56
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    if-ne v0, v1, :cond_66

    const-string v0, "user had turned GPS on, while iGO was suspended"

    .line 761
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 762
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    const/4 v1, 0x4

    iput v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    :cond_66
    :goto_66
    return-void
.end method


# virtual methods
.method public declared-synchronized EngineStatus(I)V
    .registers 11

    monitor-enter p0

    .line 1264
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    .line 1265
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v1

    const/16 v2, 0x834

    const/16 v3, 0x2bc

    const/16 v4, 0x258

    const/16 v5, 0x12c

    if-eq p1, v2, :cond_22

    const/16 v2, 0x898

    if-eq p1, v2, :cond_22

    const/16 v2, 0x8fc

    if-eq p1, v2, :cond_22

    const/16 v2, 0x960

    if-eq p1, v2, :cond_22

    goto :goto_30

    :cond_22
    const/16 v2, 0xc8

    if-eq v0, v2, :cond_114

    if-eq v0, v5, :cond_114

    const/16 v2, 0x190

    if-eq v0, v2, :cond_114

    if-eq v0, v4, :cond_114

    if-eq v0, v3, :cond_114

    :goto_30
    const-string v2, "ServerRunner"

    .line 1285
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "EngineStatus: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " -> "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1286
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1285
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 1287
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iput p1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    .line 1291
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v2

    const/4 v6, 0x1

    if-nez v2, :cond_70

    iget-object v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    .line 1292
    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v2

    if-eqz v2, :cond_6e

    goto :goto_70

    :cond_6e
    const/4 v2, 0x0

    goto :goto_71

    :cond_70
    :goto_70
    const/4 v2, 0x1

    :goto_71
    iput-boolean v2, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    .line 1293
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isChanging()Z

    move-result v0

    if-eqz v0, :cond_83

    if-nez v1, :cond_83

    .line 1294
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->status_changing_started_at:J

    :cond_83
    const/16 v0, 0x384

    const/16 v1, 0x64

    const/16 v2, 0x320

    if-eq p1, v1, :cond_c1

    if-eq p1, v5, :cond_c1

    const/16 v7, 0x1f4

    if-eq p1, v7, :cond_96

    if-eq p1, v2, :cond_c1

    if-eq p1, v0, :cond_c1

    goto :goto_c4

    .line 1303
    :cond_96
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->update_denied()V

    const-string v7, "ServerRunner"

    const-string v8, "Starting postStartEngineHooks..."

    .line 1305
    invoke-static {v7, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1306
    sget-object v7, Lcom/navngo/igo/javaclient/ServerRunner;->postStartEngineHooks:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_a6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_b6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Runnable;

    .line 1307
    invoke-interface {v8}, Ljava/lang/Runnable;->run()V

    goto :goto_a6

    .line 1308
    :cond_b6
    sget-object v7, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v8, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$1;

    invoke-direct {v8, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$1;-><init>(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    invoke-virtual {v7, v8}, Lcom/navngo/igo/javaclient/Application;->runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V

    goto :goto_c4

    .line 1300
    :cond_c1
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->resetGpsStatusVariables()V

    :goto_c4
    if-eq p1, v5, :cond_c7

    goto :goto_d4

    .line 1318
    :cond_c7
    sget-object v7, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v8, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$2;

    invoke-direct {v8, p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$2;-><init>(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    invoke-virtual {v7, v8}, Lcom/navngo/igo/javaclient/Application;->runActivityCommand(Lcom/navngo/igo/javaclient/Application$IActivityCommand;)V

    const/4 v7, -0x1

    .line 1324
    iput v7, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->orientation_current:I

    :goto_d4
    if-eq p1, v1, :cond_df

    if-eq p1, v4, :cond_df

    if-eq p1, v3, :cond_df

    if-eq p1, v2, :cond_df

    if-eq p1, v0, :cond_df

    goto :goto_e2

    .line 1333
    :cond_df
    invoke-static {v6}, Lcom/navngo/igo/javaclient/Application;->dropServices(Z)V

    :goto_e2
    if-eq p1, v5, :cond_eb

    if-eq p1, v2, :cond_e7

    goto :goto_10f

    .line 1343
    :cond_e7
    invoke-static {v6}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    goto :goto_10f

    .line 1338
    :cond_eb
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$1008()I

    const-string p1, "ServerRunner"

    .line 1339
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "#wantCallNNG = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantCallNNG:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1340
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantCallNNG:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->clear()V

    .line 1346
    :goto_10f
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_112
    .catchall {:try_start_1 .. :try_end_112} :catchall_144

    .line 1347
    monitor-exit p0

    return-void

    :cond_114
    :try_start_114
    const-string v1, "ServerRunner"

    .line 1277
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EngineStatus: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " -> "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1278
    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " suppressed"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1277
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 1280
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_142
    .catchall {:try_start_114 .. :try_end_142} :catchall_144

    .line 1281
    monitor-exit p0

    return-void

    :catchall_144
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized callNNG(Ljava/lang/Runnable;I)V
    .registers 5

    monitor-enter p0

    .line 1191
    :try_start_1
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$1000()I

    move-result v0

    if-ne p2, v0, :cond_d

    .line 1192
    iget-object p2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->wantCallNNG:Ljava/util/Queue;

    invoke-interface {p2, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_d
    const-string p1, "ServerRunner"

    .line 1194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "callNNG: dropped rotten callback "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " vs. "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->access$1000()I

    move-result p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1196
    :goto_2f
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_32
    .catchall {:try_start_1 .. :try_end_32} :catchall_34

    .line 1197
    monitor-exit p0

    return-void

    :catchall_34
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public isEngineRunning()Z
    .registers 2

    .line 444
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isRunning()Z

    move-result v0

    return v0
.end method

.method public isEngineStarting()Z
    .registers 2

    .line 448
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ServerRunner$Current;->isStarting()Z

    move-result v0

    return v0
.end method

.method public isShuttingDown()Z
    .registers 3

    .line 1414
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->isStopping()Z

    move-result v0

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x320

    if-eq v0, v1, :cond_19

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x384

    if-ne v0, v1, :cond_17

    goto :goto_19

    :cond_17
    const/4 v0, 0x0

    goto :goto_1a

    :cond_19
    :goto_19
    const/4 v0, 0x1

    :goto_1a
    return v0
.end method

.method public isStopping()Z
    .registers 3

    .line 1410
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x1f4

    if-le v0, v1, :cond_12

    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    iget v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Current;->status:I

    const/16 v1, 0x320

    if-ge v0, v1, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public declared-synchronized onLocationChanged(Landroid/location/Location;)V
    .registers 5

    monitor-enter p0

    .line 1208
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc_requested_at:J

    .line 1209
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-object p1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->loc:Landroid/location/Location;

    .line 1210
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 1211
    monitor-exit p0

    return-void

    :catchall_12
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onLowMemory()V
    .registers 3

    monitor-enter p0

    .line 1252
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->lowMemory:Z

    .line 1253
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 1254
    monitor-exit p0

    return-void

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onNmeaReceived(JLjava/lang/String;)V
    .registers 12

    monitor-enter p0

    .line 1221
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    new-instance v7, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-wide v2, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmea_requested_at:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, v1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmea_requested_at:J

    move-object v1, v7

    move-wide v4, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;-><init>(JJLjava/lang/String;)V

    invoke-interface {v0, v7}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 1222
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_1e

    .line 1223
    monitor-exit p0

    return-void

    :catchall_1e
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onSatellitesChanged()V
    .registers 4

    monitor-enter p0

    .line 1215
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->sats_requested_at:J

    .line 1216
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 1217
    monitor-exit p0

    return-void

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized requestTimeChange()V
    .registers 3

    monitor-enter p0

    .line 1356
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->timeChange:Z

    .line 1357
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 1358
    monitor-exit p0

    return-void

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .registers 6

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 425
    :try_start_3
    iget-boolean v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->terminateThreadRequested:Z

    if-nez v3, :cond_d

    .line 426
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->runCycle()Z

    move-result v3
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_2d

    if-nez v3, :cond_0

    .line 430
    :cond_d
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->quit()Z

    .line 431
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->access$400(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    const-string v1, "ServerRunner"

    const-string v3, "Status thread stopped."

    .line 432
    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->terminateThreadRequested:Z

    .line 436
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    monitor-enter v3

    .line 437
    :try_start_21
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    aput-boolean v0, v1, v2

    .line 438
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 439
    monitor-exit v3

    return-void

    :catchall_2a
    move-exception v0

    monitor-exit v3
    :try_end_2c
    .catchall {:try_start_21 .. :try_end_2c} :catchall_2a

    throw v0

    :catchall_2d
    move-exception v3

    .line 430
    iget-object v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->quit()Z

    .line 431
    invoke-static {v1}, Lcom/navngo/igo/javaclient/ServerRunner;->access$400(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V

    const-string v1, "ServerRunner"

    const-string v4, "Status thread stopped."

    .line 432
    invoke-static {v1, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->terminateThreadRequested:Z

    .line 436
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    monitor-enter v1

    .line 437
    :try_start_42
    iget-object v4, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    aput-boolean v0, v4, v2

    .line 438
    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 439
    monitor-exit v1
    :try_end_4a
    .catchall {:try_start_42 .. :try_end_4a} :catchall_4b

    .line 440
    throw v3

    :catchall_4b
    move-exception v0

    .line 439
    :try_start_4c
    monitor-exit v1
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4b

    throw v0
.end method

.method public runOnHandlerThread(Ljava/lang/Runnable;)V
    .registers 4

    .line 1022
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandlerThread:Landroid/os/HandlerThread;

    if-ne v0, v1, :cond_c

    .line 1023
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_11

    .line 1025
    :cond_c
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_11
    return-void
.end method

.method public declared-synchronized setGpsListener(Z)V
    .registers 3

    monitor-enter p0

    .line 1382
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-boolean p1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    .line 1383
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 1384
    monitor-exit p0

    return-void

    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized uiWantGpsListener(Z)V
    .registers 5

    monitor-enter p0

    :try_start_1
    const-string v0, "ServerRunner"

    .line 1233
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uiWantGpsListener("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_35

    .line 1239
    invoke-static {}, Lcom/navngo/igo/javaclient/LocationListenerImpl;->isGpsDenied()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-static {}, Lcom/navngo/igo/javaclient/NmeaListenerImpl;->isGpsDenied()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 1241
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mCurrent:Lcom/navngo/igo/javaclient/ServerRunner$Current;

    const/4 v0, 0x1

    iput v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Current;->gpsStatus:I

    .line 1242
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    const/4 v0, 0x3

    iput v0, p1, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    goto :goto_39

    .line 1245
    :cond_35
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput-boolean p1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->ui_gpsListener:Z

    .line 1247
    :goto_39
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_3c
    .catchall {:try_start_1 .. :try_end_3c} :catchall_3e

    .line 1248
    monitor-exit p0

    return-void

    :catchall_3e
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public waitForWait(J)V
    .registers 8

    .line 1361
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    monitor-enter v0

    .line 1362
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v2

    .line 1363
    :goto_8
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    aget-boolean v1, v1, v2

    if-nez v1, :cond_29

    const-string v1, "ServerRunner"

    const-string v3, "waitForWait begin"

    .line 1364
    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_32

    const-wide/16 v3, 0x0

    cmp-long v1, p1, v3

    if-lez v1, :cond_21

    .line 1367
    :try_start_1b
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    invoke-virtual {v1, p1, p2}, Ljava/lang/Object;->wait(J)V

    goto :goto_29

    .line 1370
    :cond_21
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->sleepEvent:[Z

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_26
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_26} :catch_27
    .catchall {:try_start_1b .. :try_end_26} :catchall_32

    goto :goto_8

    .line 1373
    :catch_27
    :try_start_27
    monitor-exit v0

    return-void

    :cond_29
    :goto_29
    const-string p1, "ServerRunner"

    const-string p2, "waitForWait end"

    .line 1376
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1377
    monitor-exit v0

    return-void

    :catchall_32
    move-exception p1

    monitor-exit v0
    :try_end_34
    .catchall {:try_start_27 .. :try_end_34} :catchall_32

    throw p1
.end method

.method public declared-synchronized want(I)V
    .registers 5

    monitor-enter p0

    :try_start_1
    const-string v0, "ServerRunner"

    .line 1201
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wantedStatus: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatusName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1202
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->statusQueue:Ljava/util/Queue;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 1203
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_2b

    .line 1204
    monitor-exit p0

    return-void

    :catchall_2b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized wantGpsStatus(I)V
    .registers 3

    monitor-enter p0

    .line 1227
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput p1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    .line 1228
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 1229
    monitor-exit p0

    return-void

    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized wantOrientation(I)V
    .registers 3

    monitor-enter p0

    .line 1258
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->mWanted:Lcom/navngo/igo/javaclient/ServerRunner$Wanted;

    iput p1, v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    .line 1259
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->notifyStatusThread()V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 1260
    monitor-exit p0

    return-void

    :catchall_a
    move-exception p1

    monitor-exit p0

    throw p1
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.StatusThread.AnonymousClass1 (com.navngo.igo.javaclient.ServerRunner$StatusThread$1)
.class Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$1;
.super Ljava/lang/Object;
.source "ServerRunner.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Application$IActivityCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatus(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V
    .registers 2

    .line 1308
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$1;->this$0:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1311
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/IgoActivity;->releaseFixedOrientation()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.StatusThread.AnonymousClass2 (com.navngo.igo.javaclient.ServerRunner$StatusThread$2)
.class Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$2;
.super Ljava/lang/Object;
.source "ServerRunner.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Application$IActivityCommand;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;->EngineStatus(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;)V
    .registers 2

    .line 1318
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ServerRunner$StatusThread$2;->this$0:Lcom/navngo/igo/javaclient/ServerRunner$StatusThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1321
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/IgoActivity;->lockCurrentOrientation()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.TouchAction (com.navngo.igo.javaclient.ServerRunner$TouchAction)
.class public final enum Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;
.super Ljava/lang/Enum;
.source "ServerRunner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TouchAction"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

.field public static final enum ACTION_CANCEL:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

.field public static final enum ACTION_DOWN:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

.field public static final enum ACTION_MOVE:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

.field public static final enum ACTION_UP:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;


# instance fields
.field public final actionCode:I


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 1708
    new-instance v0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    const-string v1, "ACTION_DOWN"

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-direct {v0, v1, v2, v3}, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_DOWN:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    .line 1709
    new-instance v1, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    const-string v4, "ACTION_MOVE"

    const/4 v5, 0x1

    const/4 v6, 0x3

    invoke-direct {v1, v4, v5, v6}, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_MOVE:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    .line 1710
    new-instance v4, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    const-string v7, "ACTION_UP"

    const/4 v8, 0x2

    const/4 v9, 0x5

    invoke-direct {v4, v7, v8, v9}, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_UP:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    .line 1711
    new-instance v7, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    const-string v9, "ACTION_CANCEL"

    const/16 v10, 0x9

    invoke-direct {v7, v9, v6, v10}, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_CANCEL:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    new-array v3, v3, [Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    aput-object v0, v3, v2

    aput-object v1, v3, v5

    aput-object v4, v3, v8

    aput-object v7, v3, v6

    .line 1707
    sput-object v3, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->$VALUES:[Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1714
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->actionCode:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;
    .registers 2

    .line 1707
    const-class v0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;
    .registers 1

    .line 1707
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->$VALUES:[Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.ServerRunner.Wanted (com.navngo.igo.javaclient.ServerRunner$Wanted)
.class final Lcom/navngo/igo/javaclient/ServerRunner$Wanted;
.super Ljava/lang/Object;
.source "ServerRunner.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ServerRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Wanted"
.end annotation


# instance fields
.field combined_gpslistener:Z

.field gpsListener:Z

.field gpsStatus:I

.field loc:Landroid/location/Location;

.field loc_requested_at:J

.field lowMemory:Z

.field network_provider:Z

.field nmeaQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/navngo/igo/javaclient/ServerRunner$NmeaEvent;",
            ">;"
        }
    .end annotation
.end field

.field nmea_requested_at:J

.field volatile orientation:I

.field prechecked_androidgo:Z

.field prechecked_resumedStatus:Lcom/navngo/igo/javaclient/ResumeHandler$State;

.field sats_requested_at:J

.field statusQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field timeChange:Z

.field ui_gpsListener:Z


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->statusQueue:Ljava/util/Queue;

    .line 175
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->nmeaQueue:Ljava/util/Queue;

    const/4 v0, 0x0

    .line 180
    iput v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsStatus:I

    .line 181
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->lowMemory:Z

    const/4 v1, -0x1

    .line 182
    iput v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->orientation:I

    .line 183
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->gpsListener:Z

    const/4 v1, 0x1

    .line 184
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->ui_gpsListener:Z

    .line 185
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;->timeChange:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/ServerRunner$1;)V
    .registers 2

    .line 172
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;-><init>()V

    return-void
.end method


# virtual methods
.method public copy()Lcom/navngo/igo/javaclient/ServerRunner$Wanted;
    .registers 4

    .line 189
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/ServerRunner$Wanted;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v0

    :catch_7
    move-exception v0

    const-string v1, "ServerRunner"

    const-string v2, "should not ever happen"

    .line 191
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 192
    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    const/4 v0, 0x0

    return-object v0
.end method
