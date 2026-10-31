###### Class com.navngo.igo.javaclient.bluetooth.ConnectionThread (com.navngo.igo.javaclient.bluetooth.ConnectionThread)
.class public Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;
.super Ljava/lang/Thread;
.source "ConnectionThread.java"


# static fields
.field private static final MY_UUID_SECURE:Ljava/util/UUID;

.field private static final NAME_SECURE:Ljava/lang/String; = "BluetoothSecure"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

.field public mInitSuccess:Z

.field private mServerSocket:Landroid/bluetooth/BluetoothServerSocket;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "36227d3a-61b2-4012-a9f2-b752390a761a"

    .line 19
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->MY_UUID_SECURE:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;)V
    .registers 10

    .line 25
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mInitSuccess:Z

    .line 26
    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    const/4 p1, 0x0

    .line 29
    :goto_13
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mInitSuccess:Z

    const/4 v2, 0x1

    if-nez v1, :cond_d6

    .line 31
    :try_start_18
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v3, "Get Bluetooth socket"

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "listenUsingRfcommWithServiceRecord"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v0

    const-class v6, Ljava/util/UUID;

    aput-object v6, v5, v2

    invoke-virtual {v1, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 33
    iget-object v3, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "BluetoothSecure"

    aput-object v5, v4, v0

    sget-object v5, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->MY_UUID_SECURE:Ljava/util/UUID;

    aput-object v5, v4, v2

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothServerSocket;
    :try_end_50
    .catch Ljava/lang/NoSuchMethodException; {:try_start_18 .. :try_end_50} :catch_b2
    .catch Ljava/lang/IllegalAccessException; {:try_start_18 .. :try_end_50} :catch_90
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_18 .. :try_end_50} :catch_6e

    if-eqz v1, :cond_5d

    .line 36
    :try_start_52
    iput-boolean v2, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mInitSuccess:Z

    .line 37
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v2, "Successfully Initialized ConnectionThread."

    invoke-static {p1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_d3

    .line 40
    :cond_5d
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mInitSuccess:Z

    .line 41
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v2, "ConnectionThread Initialization Failed."

    invoke-static {p1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_66
    .catch Ljava/lang/NoSuchMethodException; {:try_start_52 .. :try_end_66} :catch_6c
    .catch Ljava/lang/IllegalAccessException; {:try_start_52 .. :try_end_66} :catch_6a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_52 .. :try_end_66} :catch_68

    goto/16 :goto_d3

    :catch_68
    move-exception p1

    goto :goto_72

    :catch_6a
    move-exception p1

    goto :goto_94

    :catch_6c
    move-exception p1

    goto :goto_b6

    :catch_6e
    move-exception v1

    move-object v7, v1

    move-object v1, p1

    move-object p1, v7

    .line 50
    :goto_72
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    .line 51
    iget-object v2, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed InvocationTargetException. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d3

    :catch_90
    move-exception v1

    move-object v7, v1

    move-object v1, p1

    move-object p1, v7

    .line 47
    :goto_94
    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 48
    iget-object v2, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed IllegalAccessException. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d3

    :catch_b2
    move-exception v1

    move-object v7, v1

    move-object v1, p1

    move-object p1, v7

    .line 44
    :goto_b6
    invoke-virtual {p1}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 45
    iget-object v2, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NoSuchMethodException. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/NoSuchMethodException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_d3
    move-object p1, v1

    goto/16 :goto_13

    .line 55
    :cond_d6
    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    .line 56
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {p1, v2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->updateState(I)V

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 5

    .line 101
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v1, "connection canceled!"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    :try_start_7
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothServerSocket;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_d

    goto :goto_28

    :catch_d
    move-exception v0

    .line 106
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to close server socket : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_28
    return-void
.end method

.method public run()V
    .registers 6

    .line 60
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v1, "ConnectionThread is running..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ConnectionThread"

    .line 62
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->setName(Ljava/lang/String;)V

    .line 66
    :cond_c
    :goto_c
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getState()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_8c

    .line 68
    :try_start_15
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mServerSocket:Landroid/bluetooth/BluetoothServerSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothServerSocket;->accept()Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    .line 69
    iget-object v2, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v3, "ConnectionThread -  Successful Connection !"

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_22} :catch_71

    if-eqz v0, :cond_c

    .line 77
    iget-object v2, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    monitor-enter v2

    .line 78
    :try_start_27
    iget-object v3, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getState()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_5a

    if-eq v3, v1, :cond_33

    goto :goto_6c

    .line 87
    :cond_33
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v3, "ConnectionThread close socket"

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3a
    .catchall {:try_start_27 .. :try_end_3a} :catchall_6e

    .line 89
    :try_start_3a
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_3e
    .catchall {:try_start_3a .. :try_end_3d} :catchall_6e

    goto :goto_6c

    :catch_3e
    move-exception v0

    .line 91
    :try_start_3f
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not close unwanted socket. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6c

    .line 81
    :cond_5a
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    const-string v3, "ConnectionThread connected"

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->mBlueToothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getRemoteDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v3

    const-string v4, "secure"

    invoke-virtual {v1, v0, v3, v4}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->connected(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V

    .line 95
    :goto_6c
    monitor-exit v2

    goto :goto_c

    :catchall_6e
    move-exception v0

    monitor-exit v2
    :try_end_70
    .catchall {:try_start_3f .. :try_end_70} :catchall_6e

    throw v0

    :catch_71
    move-exception v0

    .line 71
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Socket accept() failed. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8c
    return-void
.end method
