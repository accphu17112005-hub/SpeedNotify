###### Class com.navngo.igo.javaclient.androidgo.types.TimeType (com.navngo.igo.javaclient.androidgo.types.TimeType)
.class public Lcom/navngo/igo/javaclient/androidgo/types/TimeType;
.super Ljava/lang/Object;
.source "TimeType.java"


# static fields
.field private static final MILLISECONDS_IN_AN_HOUR:I = 0x36ee80

.field private static final MILLISECONDS_IN_A_DAY:I = 0x5265c00

.field private static final MILLISECONDS_IN_A_MINUTE:I = 0xea60


# instance fields
.field private mMilliseconds:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->setTime(I)V

    return-void
.end method

.method public constructor <init>(III)V
    .registers 4

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->setTime(III)V

    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 5

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->setTime(IIII)V

    return-void
.end method


# virtual methods
.method public getHour()I
    .registers 3

    .line 61
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    const v1, 0x36ee80

    div-int/2addr v0, v1

    return v0
.end method

.method public getMillisec()I
    .registers 2

    .line 73
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    rem-int/lit16 v0, v0, 0x3e8

    return v0
.end method

.method public getMillisecFromMidnight()I
    .registers 2

    .line 77
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    return v0
.end method

.method public getMin()I
    .registers 3

    .line 65
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    const v1, 0xea60

    div-int/2addr v0, v1

    rem-int/lit8 v0, v0, 0x3c

    return v0
.end method

.method public getSec()I
    .registers 2

    .line 69
    iget v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    div-int/lit16 v0, v0, 0x3e8

    rem-int/lit8 v0, v0, 0x3c

    return v0
.end method

.method public setTime(I)V
    .registers 3

    const v0, 0x5265c00

    .line 57
    rem-int/2addr p1, v0

    add-int/2addr p1, v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    return-void
.end method

.method public setTime(III)V
    .registers 5

    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->setTime(IIII)V

    return-void
.end method

.method public setTime(IIII)V
    .registers 5

    mul-int/lit8 p1, p1, 0x3c

    add-int/2addr p1, p2

    mul-int/lit8 p1, p1, 0x3c

    add-int/2addr p1, p3

    mul-int/lit16 p1, p1, 0x3e8

    add-int/2addr p1, p4

    .line 49
    iput p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    return-void
.end method

.method public setTime(Lcom/navngo/igo/javaclient/androidgo/types/TimeType;)V
    .registers 2

    .line 53
    iget p1, p1, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    iput p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->mMilliseconds:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    .line 82
    move-object v1, v0

    check-cast v1, Ljava/util/Locale;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->getHour()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->getMin()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->getSec()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/androidgo/types/TimeType;->getMillisec()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    const-string v2, "Time: %2d:%2d:%2d.%3d"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
