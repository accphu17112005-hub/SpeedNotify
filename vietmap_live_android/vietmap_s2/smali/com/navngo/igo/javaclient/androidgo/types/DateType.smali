###### Class com.navngo.igo.javaclient.androidgo.types.DateType (com.navngo.igo.javaclient.androidgo.types.DateType)
.class public Lcom/navngo/igo/javaclient/androidgo/types/DateType;
.super Ljava/lang/Object;
.source "DateType.java"


# instance fields
.field private mCalendar:Ljava/util/Calendar;

.field private mDay:B

.field private mMonth:B

.field private mYear:I


# direct methods
.method public constructor <init>(III)V
    .registers 5

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 144
    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mCalendar:Ljava/util/Calendar;

    .line 51
    invoke-virtual {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->setDate(III)V

    return-void
.end method

.method public constructor <init>(Lcom/navngo/igo/javaclient/androidgo/types/DateType;)V
    .registers 3

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 144
    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mCalendar:Ljava/util/Calendar;

    .line 55
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->setDate(Lcom/navngo/igo/javaclient/androidgo/types/DateType;)V

    return-void
.end method

.method public static createFromCurrentDate()Lcom/navngo/igo/javaclient/androidgo/types/DateType;
    .registers 5

    .line 23
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 24
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/4 v4, 0x5

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-direct {v1, v2, v3, v0}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;-><init>(III)V

    return-object v1
.end method

.method public static createFromIgoInt(I)Lcom/navngo/igo/javaclient/androidgo/types/DateType;
    .registers 4

    .line 34
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_f

    ushr-int/lit8 v0, p0, 0x10

    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    goto :goto_19

    :cond_f
    const v0, 0xffff

    and-int/2addr v0, p0

    ushr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    ushr-int/lit8 p0, p0, 0x18

    :goto_19
    and-int/lit16 p0, p0, 0xff

    .line 47
    new-instance v2, Lcom/navngo/igo/javaclient/androidgo/types/DateType;

    invoke-direct {v2, v0, v1, p0}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;-><init>(III)V

    return-object v2
.end method

.method private getCalendar()Ljava/util/Calendar;
    .registers 2

    .line 149
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mCalendar:Ljava/util/Calendar;

    if-nez v0, :cond_b

    .line 150
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mCalendar:Ljava/util/Calendar;

    .line 154
    :cond_b
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->updateCalendar()V

    .line 155
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mCalendar:Ljava/util/Calendar;

    return-object v0
.end method

.method private updateCalendar()V
    .registers 5

    .line 159
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mCalendar:Ljava/util/Calendar;

    iget v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    iget-byte v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    iget-byte v3, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Calendar;->set(III)V

    return-void
.end method


# virtual methods
.method public add(III)V
    .registers 6

    .line 65
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x1

    .line 66
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->add(II)V

    const/4 p1, 0x2

    .line 67
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->add(II)V

    const/4 p2, 0x5

    .line 68
    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->add(II)V

    .line 70
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result p3

    iput p3, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    .line 71
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    .line 72
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p1

    int-to-byte p1, p1

    iput-byte p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    return-void
.end method

.method public getDay()I
    .registers 2

    .line 105
    iget-byte v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    return v0
.end method

.method public getDayOfWeek()I
    .registers 3

    .line 114
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x7

    .line 115
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    return v0
.end method

.method public getMonth()I
    .registers 2

    .line 101
    iget-byte v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    return v0
.end method

.method public getYear()I
    .registers 2

    .line 97
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    return v0
.end method

.method public setDate(III)V
    .registers 4

    .line 85
    iput p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    int-to-byte p1, p2

    .line 86
    iput-byte p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    int-to-byte p1, p3

    .line 87
    iput-byte p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    return-void
.end method

.method public setDate(Lcom/navngo/igo/javaclient/androidgo/types/DateType;)V
    .registers 3

    .line 91
    iget v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    iput v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    .line 92
    iget-byte v0, p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    iput-byte v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    .line 93
    iget-byte p1, p1, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    iput-byte p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    return-void
.end method

.method public toIgoInt()I
    .registers 4

    .line 127
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v0, v1, :cond_14

    .line 128
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    shl-int/lit8 v0, v0, 0x10

    iget-byte v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    iget-byte v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    goto :goto_23

    .line 130
    :cond_14
    iget-byte v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    shl-int/lit8 v0, v0, 0x18

    iget-byte v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    const v2, 0xffff

    and-int/2addr v1, v2

    :goto_23
    or-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    .line 164
    move-object v1, v0

    check-cast v1, Ljava/util/Locale;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mYear:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-byte v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mMonth:B

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-byte v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/DateType;->mDay:B

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const-string v2, "Year: %d, Month: %d, Day: %d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
