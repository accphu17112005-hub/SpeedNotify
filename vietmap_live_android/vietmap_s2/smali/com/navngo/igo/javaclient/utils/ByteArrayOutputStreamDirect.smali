###### Class com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect (com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect)
.class public Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;
.super Ljava/io/ByteArrayOutputStream;
.source "ByteArrayOutputStreamDirect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    .line 20
    invoke-direct {p0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    return-void
.end method


# virtual methods
.method public declared-synchronized getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 4

    monitor-enter p0

    .line 47
    :try_start_1
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->buf:[B

    iget v2, p0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->count:I

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;-><init>([BI)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    monitor-exit p0

    return-object v0

    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

###### Class com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect.ByteArrayRegion (com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect$ByteArrayRegion)
.class public Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
.super Ljava/lang/Object;
.source "ByteArrayOutputStreamDirect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ByteArrayRegion"
.end annotation


# instance fields
.field public buffer:[B

.field public size:I


# direct methods
.method public constructor <init>([BI)V
    .registers 3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    .line 31
    iput p2, p0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    return-void
.end method
