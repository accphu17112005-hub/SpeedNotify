###### Class com.navngo.igo.javaclient.bluetooth.BluetoothService (com.navngo.igo.javaclient.bluetooth.BluetoothService)
.class public Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;
.super Ljava/lang/Object;
.source "BluetoothService.java"


# static fields
.field public static final STATE_CONNECTED:I = 0x2

.field public static final STATE_LISTEN:I = 0x1

.field public static final STATE_NONE:I


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final mAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

.field private mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

.field private mState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    .line 36
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    const/4 v1, 0x0

    .line 37
    iput v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mState:I

    if-eqz v0, :cond_31

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BluetoothAdapter is enabled : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_36

    :cond_31
    const-string v0, "BluetoothAdapter is null"

    .line 42
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_36
    return-void
.end method

.method private connectionFailed()V
    .registers 4

    .line 132
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    const-string v1, "Connection Failed !"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    sget-object v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    const/4 v1, 0x2

    const-string v2, "Unable to connect device"

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->handleConnectionStatus(ILjava/lang/String;)V

    const/4 v0, 0x0

    .line 135
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->updateState(I)V

    .line 138
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->start()V

    return-void
.end method


# virtual methods
.method public declared-synchronized connected(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
    .registers 6

    monitor-enter p0

    .line 81
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    .line 82
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->cancel()V

    .line 83
    iput-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    .line 87
    :cond_b
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    if-eqz v0, :cond_14

    .line 88
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->cancel()V

    .line 89
    iput-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    .line 93
    :cond_14
    new-instance v0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    invoke-direct {v0, p0, p1, p3}, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;-><init>(Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;Landroid/bluetooth/BluetoothSocket;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    .line 94
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->start()V

    .line 96
    sget-object p1, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->setConnectedDeviceName(Ljava/lang/String;)V
    :try_end_27
    .catchall {:try_start_1 .. :try_end_27} :catchall_29

    .line 97
    monitor-exit p0

    return-void

    :catchall_29
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public connectionLost()V
    .registers 4

    .line 142
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    const-string v1, "Connection Lost !"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    sget-object v0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    const/4 v1, 0x2

    const-string v2, "Device connection was lost"

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->handleConnectionStatus(ILjava/lang/String;)V

    const/4 v0, 0x0

    .line 145
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->updateState(I)V

    .line 148
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->start()V

    return-void
.end method

.method public getAdapter()Landroid/bluetooth/BluetoothAdapter;
    .registers 2

    .line 47
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method public declared-synchronized getState()I
    .registers 2

    monitor-enter p0

    .line 60
    :try_start_1
    iget v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mState:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start()V
    .registers 3

    monitor-enter p0

    .line 64
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    const-string v1, "Start bluetooth service..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    if-eqz v0, :cond_12

    .line 68
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->cancel()V

    const/4 v0, 0x0

    .line 69
    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    .line 73
    :cond_12
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    if-nez v0, :cond_20

    .line 74
    new-instance v0, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;-><init>(Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    .line 75
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->start()V
    :try_end_20
    .catchall {:try_start_1 .. :try_end_20} :catchall_22

    .line 77
    :cond_20
    monitor-exit p0

    return-void

    :catchall_22
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stop()V
    .registers 3

    monitor-enter p0

    .line 100
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    const-string v1, "Stop all threads..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    .line 103
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->cancel()V

    .line 104
    iput-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    .line 107
    :cond_12
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    if-eqz v0, :cond_1b

    .line 108
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;->cancel()V

    .line 109
    iput-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mConnectionThread:Lcom/navngo/igo/javaclient/bluetooth/ConnectionThread;

    :cond_1b
    const/4 v0, 0x0

    .line 112
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->updateState(I)V
    :try_end_1f
    .catchall {:try_start_1 .. :try_end_1f} :catchall_21

    .line 113
    monitor-exit p0

    return-void

    :catchall_21
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized updateState(I)V
    .registers 5

    monitor-enter p0

    .line 51
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "State updated: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mState:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iput p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mState:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2e

    .line 55
    sget-object p1, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    const/4 v0, 0x1

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->handleConnectionStatus(ILjava/lang/String;)V
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_30

    .line 57
    :cond_2e
    monitor-exit p0

    return-void

    :catchall_30
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public write([B)V
    .registers 4

    .line 116
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    const-string v1, "CommunicationThread write..."

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    monitor-enter p0

    .line 121
    :try_start_8
    iget v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_16

    .line 122
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->TAG:Ljava/lang/String;

    const-string v0, "Error - Not connected !!!"

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    monitor-exit p0

    return-void

    .line 125
    :cond_16
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->mCommunicationThread:Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;

    .line 126
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_8 .. :try_end_19} :catchall_1d

    .line 128
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->write([B)V

    return-void

    :catchall_1d
    move-exception p1

    .line 126
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    throw p1
.end method
