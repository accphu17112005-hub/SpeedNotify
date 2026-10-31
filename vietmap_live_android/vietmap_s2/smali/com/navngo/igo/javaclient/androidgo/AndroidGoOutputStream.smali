###### Class com.navngo.igo.javaclient.androidgo.AndroidGoOutputStream (com.navngo.igo.javaclient.androidgo.AndroidGoOutputStream)
.class public Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;
.super Ljava/io/DataOutputStream;
.source "AndroidGoOutputStream.java"


# static fields
.field private static final logname:Ljava/lang/String; = "com.navngo.igo.javaclient.androidgo.AndroidGoOutputStream"


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2

    .line 23
    invoke-direct {p0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public writeCString(Lcom/navngo/igo/javaclient/androidgo/types/CString;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeShort(I)V

    const/4 v0, 0x0

    .line 33
    :goto_8
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;->length()I

    move-result v1

    if-ge v0, v1, :cond_1a

    .line 34
    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/androidgo/types/CString;->charAt(I)C

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_1a
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeShort(I)V

    const/4 v0, 0x0

    .line 45
    :goto_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1a

    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_1a
    return-void
.end method

.method public writeSupportedObject(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_18

    .line 69
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 70
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    goto/16 :goto_12a

    .line 71
    :cond_18
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_30

    .line 72
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 73
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeBoolean(Z)V

    goto/16 :goto_12a

    .line 74
    :cond_30
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_44

    .line 75
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 76
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    goto/16 :goto_12a

    .line 77
    :cond_44
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    if-eqz v0, :cond_58

    .line 78
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 79
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeCString(Lcom/navngo/igo/javaclient/androidgo/types/CString;)V

    goto/16 :goto_12a

    .line 80
    :cond_58
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_70

    .line 81
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 82
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeLong(J)V

    goto/16 :goto_12a

    .line 83
    :cond_70
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    if-eqz v0, :cond_84

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 85
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-virtual {p1, p0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->writeOut(Ljava/io/DataOutputStream;)V

    goto/16 :goto_12a

    .line 86
    :cond_84
    instance-of v0, p1, [B

    if-eqz v0, :cond_9c

    .line 87
    check-cast p1, [B

    .line 88
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 89
    array-length v0, p1

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    .line 90
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->write([B)V

    goto/16 :goto_12a

    .line 91
    :cond_9c
    instance-of v0, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    if-eqz v0, :cond_b9

    .line 92
    check-cast p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    .line 93
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BUFFER:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 94
    iget v0, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    .line 95
    iget-object v0, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    const/4 v1, 0x0

    iget p1, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->write([BII)V

    goto :goto_12a

    .line 96
    :cond_b9
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    if-eqz v0, :cond_d0

    .line 97
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 98
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->getMillisecFromMidnight()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    goto :goto_12a

    .line 99
    :cond_d0
    instance-of v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    if-eqz v0, :cond_f5

    .line 100
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 101
    check-cast p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    .line 103
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getYear()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeShort(I)V

    .line 104
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getMonth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 105
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getDay()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    goto :goto_12a

    .line 106
    :cond_f5
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_10c

    .line 107
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DOUBLE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    .line 108
    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeDouble(D)V

    goto :goto_12a

    .line 110
    :cond_10c
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported argument type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_12a
    return-void
.end method

.method public writeSupportedObjectType(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    invoke-static {p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->getSupportedObjectType(Ljava/lang/Object;)Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    move-result-object v0

    .line 117
    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    if-eq v0, v1, :cond_10

    .line 118
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeByte(I)V

    goto :goto_2e

    .line 120
    :cond_10
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported argument type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2e
    return-void
.end method

.method public writeUtf8(Ljava/lang/String;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    invoke-static {p1, p0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->writeUtf8(Ljava/lang/String;Ljava/io/DataOutputStream;)V

    return-void
.end method
