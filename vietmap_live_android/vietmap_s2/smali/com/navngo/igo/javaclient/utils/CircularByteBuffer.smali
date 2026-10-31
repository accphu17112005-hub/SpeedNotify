###### Class com.navngo.igo.javaclient.utils.CircularByteBuffer (com.navngo.igo.javaclient.utils.CircularByteBuffer)
.class public Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;
.super Ljava/lang/Object;
.source "CircularByteBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;,
        Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;
    }
.end annotation


# static fields
.field private static final DEFAULT_BUFFER_CAPACITY:I = 0x400


# instance fields
.field private mBuffer:[B

.field protected final mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

.field protected volatile mInfinite:Z

.field protected final mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

.field protected volatile mReadPos:I

.field protected volatile mWritePos:I


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x400

    .line 29
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    const/4 v0, 0x0

    .line 37
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .registers 4

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;-><init>(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    .line 18
    new-instance v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;-><init>(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    .line 24
    iput v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    .line 26
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInfinite:Z

    .line 41
    new-array p1, p1, [B

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    .line 42
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInfinite:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3

    const/16 v0, 0x400

    .line 33
    invoke-direct {p0, v0, p1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;-><init>(IZ)V

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B
    .registers 1

    .line 13
    iget-object p0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)V
    .registers 1

    .line 13
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->growBuffer()V

    return-void
.end method

.method private growBuffer()V
    .registers 7

    .line 54
    monitor-enter p0

    .line 55
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    new-array v1, v0, [B

    .line 57
    iget v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget v3, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    const/4 v4, 0x0

    if-gt v2, v3, :cond_26

    .line 59
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    iget v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    array-length v3, v3

    iget v5, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v3, v5

    invoke-static {v0, v2, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    iget v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    iget v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v0, v2

    iput v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    .line 61
    iput v4, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    goto :goto_43

    .line 65
    :cond_26
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    iget v3, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    array-length v2, v2

    iget v3, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v2, v3

    sub-int/2addr v0, v2

    .line 68
    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    iget v3, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    array-length v4, v4

    iget v5, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v4, v5

    invoke-static {v2, v3, v1, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 69
    iput v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    .line 72
    :goto_43
    iput-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 74
    monitor-exit p0

    return-void

    :catchall_4a
    move-exception v0

    monitor-exit p0
    :try_end_4c
    .catchall {:try_start_1 .. :try_end_4c} :catchall_4a

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 46
    monitor-enter p0

    .line 47
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 50
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public getBufferSize()I
    .registers 2

    .line 78
    monitor-enter p0

    .line 79
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mBuffer:[B

    array-length v0, v0

    monitor-exit p0

    return v0

    :catchall_6
    move-exception v0

    .line 80
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_6

    throw v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2

    .line 92
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2

    .line 96
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    return-object v0
.end method

.method public isInputClosed()Z
    .registers 2

    .line 88
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    return v0
.end method

.method public isOutputClosed()Z
    .registers 2

    .line 84
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    return v0
.end method

###### Class com.navngo.igo.javaclient.utils.CircularByteBuffer.CircularByteBufferInputStream (com.navngo.igo.javaclient.utils.CircularByteBuffer$CircularByteBufferInputStream)
.class public Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;
.super Ljava/io/InputStream;
.source "CircularByteBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CircularByteBufferInputStream"
.end annotation


# instance fields
.field protected isClosed:Z

.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;


# direct methods
.method protected constructor <init>(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)V
    .registers 2

    .line 99
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 p1, 0x0

    .line 100
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    return-void
.end method

.method private advanceReadPos(J)V
    .registers 7

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 137
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    int-to-long v2, v2

    add-long/2addr v2, p1

    long-to-int p1, v2

    iput p1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    .line 138
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget p1, p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget-object p2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object p2

    array-length p2, p2

    if-lt p1, p2, :cond_1e

    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    const/4 p2, 0x0

    iput p2, p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    .line 139
    :cond_1e
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 140
    monitor-exit v0

    return-void

    :catchall_25
    move-exception p1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw p1
.end method

.method private ensureDataToRead()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 124
    :try_start_3
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->available()I

    move-result v1

    if-lez v1, :cond_b

    monitor-exit v0
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_26

    return-void

    .line 127
    :cond_b
    :try_start_b
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 128
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_12} :catch_1e
    .catchall {:try_start_b .. :try_end_12} :catchall_26

    if-nez v1, :cond_16

    .line 132
    :try_start_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_14 .. :try_end_15} :catchall_26

    return-void

    .line 128
    :cond_16
    :try_start_16
    new-instance v1, Ljava/io/IOException;

    const-string v2, "OutputStream is closed."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_16 .. :try_end_1e} :catch_1e
    .catchall {:try_start_16 .. :try_end_1e} :catchall_26

    .line 130
    :catch_1e
    :try_start_1e
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Blocked read was interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_26
    move-exception v1

    .line 132
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_1e .. :try_end_28} :catchall_26

    throw v1
.end method


# virtual methods
.method public available()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 117
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v2, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    if-gt v1, v2, :cond_18

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v2, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v1, v2

    monitor-exit v0

    return v1

    .line 118
    :cond_18
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v2

    array-length v2, v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v2, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v1, v2

    monitor-exit v0

    return v1

    :catchall_2b
    move-exception v1

    .line 119
    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_3 .. :try_end_2d} :catchall_2b

    throw v1
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    const/4 v1, 0x1

    .line 105
    :try_start_4
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    .line 106
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 107
    monitor-exit v0

    return-void

    :catchall_d
    move-exception v1

    monitor-exit v0
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_d

    throw v1
.end method

.method public markSupported()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    if-nez v0, :cond_36

    .line 146
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 147
    :try_start_7
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->available()I

    move-result v1

    if-lez v1, :cond_22

    .line 149
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v1

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v2, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    const-wide/16 v2, 0x1

    .line 150
    invoke-direct {p0, v2, v3}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->advanceReadPos(J)V

    .line 151
    monitor-exit v0

    return v1

    .line 153
    :cond_22
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-eqz v1, :cond_2d

    const/4 v1, -0x1

    .line 154
    monitor-exit v0

    return v1

    .line 156
    :cond_2d
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->ensureDataToRead()V

    .line 157
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    :catchall_33
    move-exception v1

    monitor-exit v0
    :try_end_35
    .catchall {:try_start_7 .. :try_end_35} :catchall_33

    throw v1

    .line 145
    :cond_36
    new-instance v0, Ljava/io/IOException;

    const-string v1, "InputStream is closed."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public read([B)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 164
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    if-nez v0, :cond_53

    .line 172
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    const/4 v1, 0x0

    move v2, p3

    :goto_9
    if-lez v2, :cond_4e

    .line 174
    :try_start_b
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->available()I

    move-result v3

    if-nez v3, :cond_20

    .line 176
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    iget-boolean p1, p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-eqz p1, :cond_1e

    if-nez v1, :cond_1e

    const/4 p1, -0x1

    .line 177
    monitor-exit v0

    return p1

    .line 179
    :cond_1e
    monitor-exit v0

    return v1

    .line 182
    :cond_20
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->ensureDataToRead()V

    if-ge v3, v2, :cond_26

    goto :goto_27

    :cond_26
    move v3, v2

    .line 184
    :goto_27
    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v4}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v4

    array-length v4, v4

    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v5, v5, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v4, v5

    if-ge v3, v4, :cond_36

    goto :goto_37

    :cond_36
    move v3, v4

    .line 186
    :goto_37
    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v4}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v4

    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v5, v5, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    add-int v6, p2, p3

    sub-int/2addr v6, v2

    invoke-static {v4, v5, p1, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sub-int/2addr v2, v3

    add-int/2addr v1, v3

    int-to-long v3, v3

    .line 189
    invoke-direct {p0, v3, v4}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->advanceReadPos(J)V

    goto :goto_9

    .line 191
    :cond_4e
    monitor-exit v0

    return v1

    :catchall_50
    move-exception p1

    monitor-exit v0
    :try_end_52
    .catchall {:try_start_b .. :try_end_52} :catchall_50

    throw p1

    .line 171
    :cond_53
    new-instance p1, Ljava/io/IOException;

    const-string p2, "InputStream is closed."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public skip(J)J
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    if-nez v0, :cond_43

    .line 200
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    move-wide v1, p1

    :goto_8
    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_34

    .line 202
    :try_start_e
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->available()I

    move-result v5

    if-nez v5, :cond_15

    goto :goto_34

    :cond_15
    int-to-long v3, v5

    cmp-long v5, v3, v1

    if-gez v5, :cond_1b

    goto :goto_1c

    :cond_1b
    move-wide v3, v1

    .line 207
    :goto_1c
    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v5}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v5

    array-length v5, v5

    iget-object v6, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v6, v6, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    cmp-long v7, v3, v5

    if-gez v7, :cond_2e

    goto :goto_2f

    :cond_2e
    move-wide v3, v5

    :goto_2f
    sub-long/2addr v1, v3

    .line 210
    invoke-direct {p0, v3, v4}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->advanceReadPos(J)V

    goto :goto_8

    .line 212
    :cond_34
    :goto_34
    monitor-exit v0
    :try_end_35
    .catchall {:try_start_e .. :try_end_35} :catchall_40

    .line 214
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mOutStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;

    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-eqz v0, :cond_3e

    return-wide v3

    :cond_3e
    sub-long/2addr p1, v1

    return-wide p1

    :catchall_40
    move-exception p1

    .line 212
    :try_start_41
    monitor-exit v0
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_40

    throw p1

    .line 199
    :cond_43
    new-instance p1, Ljava/io/IOException;

    const-string p2, "InputStream is closed."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

###### Class com.navngo.igo.javaclient.utils.CircularByteBuffer.CircularByteBufferOutputStream (com.navngo.igo.javaclient.utils.CircularByteBuffer$CircularByteBufferOutputStream)
.class public Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;
.super Ljava/io/OutputStream;
.source "CircularByteBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CircularByteBufferOutputStream"
.end annotation


# instance fields
.field protected isClosed:Z

.field final synthetic this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;


# direct methods
.method protected constructor <init>(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)V
    .registers 2

    .line 221
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 p1, 0x0

    .line 222
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    return-void
.end method

.method private advanceWritePos(J)V
    .registers 7

    .line 283
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 284
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    int-to-long v2, v2

    add-long/2addr v2, p1

    long-to-int p1, v2

    iput p1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    .line 285
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget p1, p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    iget-object p2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object p2

    array-length p2, p2

    if-lt p1, p2, :cond_1e

    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    const/4 p2, 0x0

    iput p2, p1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    .line 286
    :cond_1e
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 287
    monitor-exit v0

    return-void

    :catchall_25
    move-exception p1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw p1
.end method

.method private availableToWrite()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 294
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    if-lt v0, v1, :cond_1e

    .line 295
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v1

    array-length v1, v1

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    sub-int/2addr v0, v1

    goto :goto_29

    .line 297
    :cond_1e
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mReadPos:I

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    :goto_29
    return v0
.end method

.method private ensureSpaceToWrite()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 304
    :try_start_3
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->availableToWrite()I

    move-result v1

    if-nez v1, :cond_2f

    .line 305
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInfinite:Z

    if-eqz v1, :cond_15

    .line 306
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$100(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)V
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_31

    goto :goto_2f

    .line 309
    :cond_15
    :try_start_15
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 310
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-nez v1, :cond_1f

    goto :goto_2f

    :cond_1f
    new-instance v1, Ljava/io/IOException;

    const-string v2, "OutputStream is closed."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_27
    .catch Ljava/lang/InterruptedException; {:try_start_15 .. :try_end_27} :catch_27
    .catchall {:try_start_15 .. :try_end_27} :catchall_31

    .line 312
    :catch_27
    :try_start_27
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Blocked write was interrupted"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 316
    :cond_2f
    :goto_2f
    monitor-exit v0

    return-void

    :catchall_31
    move-exception v1

    monitor-exit v0
    :try_end_33
    .catchall {:try_start_27 .. :try_end_33} :catchall_31

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 226
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 227
    :try_start_3
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-nez v1, :cond_12

    .line 228
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->flush()V

    const/4 v1, 0x1

    .line 229
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    .line 230
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 232
    :cond_12
    monitor-exit v0

    return-void

    :catchall_14
    move-exception v1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public flush()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 238
    :try_start_3
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-nez v1, :cond_19

    .line 239
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    if-nez v1, :cond_11

    .line 242
    monitor-exit v0

    return-void

    .line 239
    :cond_11
    new-instance v1, Ljava/io/IOException;

    const-string v2, "InputStream is closed."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 238
    :cond_19
    new-instance v1, Ljava/io/IOException;

    const-string v2, "OutputStream is closed."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_21
    move-exception v1

    .line 242
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw v1
.end method

.method public write(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 248
    :try_start_3
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-nez v1, :cond_30

    .line 249
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    if-nez v1, :cond_28

    .line 250
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->ensureSpaceToWrite()V

    .line 251
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v1

    iget-object v2, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v2, v2, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    aput-byte p1, v1, v2

    const-wide/16 v1, 0x1

    .line 252
    invoke-direct {p0, v1, v2}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->advanceWritePos(J)V

    .line 253
    monitor-exit v0

    return-void

    .line 249
    :cond_28
    new-instance p1, Ljava/io/IOException;

    const-string v1, "InputStream is closed."

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 248
    :cond_30
    new-instance p1, Ljava/io/IOException;

    const-string v1, "OutputStream is closed."

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_38
    move-exception p1

    .line 253
    monitor-exit v0
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_38

    throw p1
.end method

.method public write([B)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 259
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 265
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    monitor-enter v0

    .line 266
    :try_start_3
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->isClosed:Z

    if-nez v1, :cond_4f

    .line 267
    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mInStream:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferInputStream;->isClosed:Z

    if-nez v1, :cond_47

    move v1, p3

    :goto_10
    if-lez v1, :cond_45

    .line 269
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->availableToWrite()I

    move-result v2

    if-nez v2, :cond_1b

    .line 270
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->ensureSpaceToWrite()V

    :cond_1b
    if-ge v2, v1, :cond_1e

    goto :goto_1f

    :cond_1e
    move v2, v1

    .line 273
    :goto_1f
    iget-object v3, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v3

    array-length v3, v3

    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v4, v4, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    sub-int/2addr v3, v4

    if-ge v2, v3, :cond_2e

    goto :goto_2f

    :cond_2e
    move v2, v3

    :goto_2f
    add-int v3, p2, p3

    sub-int/2addr v3, v1

    .line 275
    iget-object v4, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    invoke-static {v4}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->access$000(Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;)[B

    move-result-object v4

    iget-object v5, p0, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->this$0:Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;

    iget v5, v5, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer;->mWritePos:I

    invoke-static {p1, v3, v4, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sub-int/2addr v1, v2

    int-to-long v2, v2

    .line 277
    invoke-direct {p0, v2, v3}, Lcom/navngo/igo/javaclient/utils/CircularByteBuffer$CircularByteBufferOutputStream;->advanceWritePos(J)V

    goto :goto_10

    .line 279
    :cond_45
    monitor-exit v0

    return-void

    .line 267
    :cond_47
    new-instance p1, Ljava/io/IOException;

    const-string p2, "InputStream is closed."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 266
    :cond_4f
    new-instance p1, Ljava/io/IOException;

    const-string p2, "OutputStream is closed."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_57
    move-exception p1

    .line 279
    monitor-exit v0
    :try_end_59
    .catchall {:try_start_3 .. :try_end_59} :catchall_57

    throw p1
.end method
