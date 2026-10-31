###### Class com.navngo.igo.javaclient.bluetooth.CommunicationThread (com.navngo.igo.javaclient.bluetooth.CommunicationThread)
.class public Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;
.super Ljava/lang/Thread;
.source "CommunicationThread.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

.field private final mInStream:Ljava/io/InputStream;

.field private final mOutStream:Ljava/io/OutputStream;

.field private final mSocket:Landroid/bluetooth/BluetoothSocket;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;Landroid/bluetooth/BluetoothSocket;Ljava/lang/String;)V
    .registers 8

    .line 21
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Create ConnectedThread: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    iput-object p2, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mSocket:Landroid/bluetooth/BluetoothSocket;

    .line 24
    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    const/4 p1, 0x0

    .line 30
    :try_start_26
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object p3
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2a} :catch_3a

    .line 31
    :try_start_2a
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    const-string p2, "Temporary socket streams are created"

    .line 32
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_33} :catch_34

    goto :goto_59

    :catch_34
    move-exception p2

    move-object v3, p2

    move-object p2, p1

    move-object p1, p3

    move-object p3, v3

    goto :goto_3d

    :catch_3a
    move-exception p2

    move-object p3, p2

    move-object p2, p1

    .line 34
    :goto_3d
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Temporary socket stream Exception! "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    move-object p3, p1

    move-object p1, p2

    .line 37
    :goto_59
    iput-object p3, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mInStream:Ljava/io/InputStream;

    .line 38
    iput-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mOutStream:Ljava/io/OutputStream;

    .line 39
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->updateState(I)V

    .line 40
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    const-string p2, "State is now connected."

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 5

    .line 76
    :try_start_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_21

    :catch_6
    move-exception v0

    .line 78
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "close() of connect socket failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_21
    return-void
.end method

.method public run()V
    .registers 5

    .line 44
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    const-string v1, "ConnectedThread - run"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x400

    new-array v0, v0, [B

    .line 49
    :goto_b
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->getState()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_46

    .line 51
    :try_start_14
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mInStream:Ljava/io/InputStream;

    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    .line 52
    sget-object v1, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->INSTANCE:Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;

    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothServiceHandler;->receiveMessage(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_25} :catch_26

    goto :goto_b

    :catch_26
    move-exception v0

    .line 54
    iget-object v1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Disconnected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mBluetoothService:Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/bluetooth/BluetoothService;->connectionLost()V

    :cond_46
    return-void
.end method

.method public write([B)V
    .registers 5

    .line 62
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    const-string v1, "ConnectedThread write"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    :try_start_7
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mOutStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 66
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->mOutStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 67
    new-instance v0, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 68
    iget-object p1, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Buffer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_2e} :catch_2f

    goto :goto_4a

    :catch_2f
    move-exception p1

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/bluetooth/CommunicationThread;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception during ConnectedThread write! "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4a
    return-void
.end method
