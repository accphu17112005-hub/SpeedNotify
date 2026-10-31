###### Class com.navngo.igo.javaclient.bluetooth.BluetoothServiceHandler (com.navngo.igo.javaclient.bluetooth.BluetoothServiceHandler)
.class public final enum Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;
.super Ljava/lang/Enum;
.source "BluetoothServiceHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

.field public static final MESSAGE_CONNECTION_ESTABLISHED:I = 0x1

.field public static final MESSAGE_CONNECTION_PROBLEM:I = 0x2


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

.field private mConnectedDeviceName:Ljava/lang/String;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 13
    new-instance v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    aput-object v0, v1, v2

    .line 12
    sput-object v1, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->$VALUES:[Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    .line 27
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mContext:Landroid/content/Context;

    .line 28
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const-string p2, "android.bluetooth.send_message"

    const-string v0, "sendMessage"

    invoke-virtual {p1, p2, p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public static startBluetoothService()V
    .registers 1

    .line 32
    sget-object v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->start()V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;
    .registers 2

    .line 12
    const-class v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;
    .registers 1

    .line 12
    sget-object v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->$VALUES:[Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    return-object v0
.end method


# virtual methods
.method public handleConnectionStatus(ILjava/lang/String;)V
    .registers 8

    const/4 v0, 0x0

    const-string v1, "android.bluetooth.set_device_connected"

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v3, :cond_3b

    const/4 v4, 0x2

    if-eq p1, v4, :cond_b

    goto :goto_62

    .line 47
    :cond_b
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-virtual {p1, v1, v0, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    .line 48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Connection problem occured with device "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mConnectedDeviceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_62

    .line 42
    :cond_3b
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v3, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, p2, v2

    invoke-virtual {p1, v1, v0, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    .line 43
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Connection established with device "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mConnectedDeviceName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_62
    return-void
.end method

.method public receiveMessage(Ljava/lang/String;)V
    .registers 5

    .line 122
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "android.bluetooth.message_received"

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public sendMessage(Ljava/lang/String;)V
    .registers 4

    .line 110
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getState()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_11

    .line 111
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v0, "Bluetooth is not connected!"

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 115
    :cond_11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_20

    .line 116
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 117
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->write([B)V

    :cond_20
    return-void
.end method

.method public setConnectedDeviceName(Ljava/lang/String;)V
    .registers 2

    .line 36
    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mConnectedDeviceName:Ljava/lang/String;

    return-void
.end method

.method public start()V
    .registers 5

    .line 54
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 57
    :try_start_6
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Bluetooth initialization..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_1a

    .line 60
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "BluetoothAdapter is not available!"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_d8

    .line 63
    :cond_1a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BluetoothAdapter is enabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_5d

    .line 66
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Request enable Bluetooth before start..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    move-result v0

    if-nez v0, :cond_55

    .line 69
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Error Bluetooth can not enabled!"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_64

    .line 71
    :cond_55
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Bluetooth successfully enabled!"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_64

    .line 75
    :cond_5d
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Bluetooth is already enabled!"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    :goto_64
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Setting up Bluetooth Service..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    if-nez v0, :cond_a2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_a2

    .line 81
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Start new Bluetooth Service"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    new-instance v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    .line 84
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getState()I

    move-result v0

    if-nez v0, :cond_9a

    .line 85
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "mBluetoothService.start();"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->start()V

    goto :goto_b5

    .line 89
    :cond_9a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "mBluetoothService is NOT in BluetoothService.STATE_NONE"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b5

    .line 92
    :cond_a2
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    if-eqz v0, :cond_ae

    .line 93
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Bluetooth Service already started"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b5

    .line 96
    :cond_ae
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Error: Bluetooth is NOT Enabled"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    :goto_b5
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    const-string v1, "Bluetooth initialization is done!"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_bc
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_bc} :catch_bd

    goto :goto_d8

    :catch_bd
    move-exception v0

    .line 101
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bluetooth initialization Exception"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_d8
    return-void
.end method

.method public stop()V
    .registers 2

    .line 106
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->stop()V

    return-void
.end method
