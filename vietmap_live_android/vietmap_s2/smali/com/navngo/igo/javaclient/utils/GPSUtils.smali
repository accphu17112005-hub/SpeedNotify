###### Class com.navngo.igo.javaclient.utils.GPSUtils (com.navngo.igo.javaclient.utils.GPSUtils)
.class public Lcom/navngo/igo/javaclient/utils/GPSUtils;
.super Ljava/lang/Object;
.source "GPSUtils.java"


# static fields
.field private static final logname:Ljava/lang/String; = "GPSUtils"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decodeGPSCoord(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 4

    .line 82
    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseGPS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 83
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>()V

    if-eqz p0, :cond_27

    const-string v1, ","

    .line 86
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 87
    array-length v1, p0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_27

    const/4 v1, 0x0

    .line 88
    aget-object v1, p0, v1

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    const/4 v1, 0x1

    .line 89
    aget-object p0, p0, v1

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    :cond_27
    return-object v0
.end method

.method public static encodeGPSCoord(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)Ljava/lang/String;
    .registers 4

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GPS["

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ","

    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p0, "]"

    .line 76
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPositionFromAddress(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 5

    .line 310
    :try_start_0
    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->googleAddressDecoder(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_4} :catch_1b

    if-nez v0, :cond_26

    :try_start_6
    const-string v1, "GPS["

    .line 313
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_26

    const/4 v2, 0x0

    .line 315
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->googleAddressDecoder(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v0
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_18} :catch_19

    goto :goto_26

    :catch_19
    move-exception v1

    goto :goto_1d

    :catch_1b
    move-exception v1

    const/4 v0, 0x0

    .line 319
    :goto_1d
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "iGO"

    invoke-static {v3, v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_26
    :goto_26
    if-nez v0, :cond_2c

    .line 322
    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseGCoorFromString(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v0

    :cond_2c
    return-object v0
.end method

.method private static googleAddressDecoder(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public static isRelevantCoord(Ljava/lang/String;)Z
    .registers 2

    .line 299
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_10

    const-string v0, " x "

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    return p0
.end method

.method public static normalizeGPSCoords(Ljava/lang/String;)Ljava/lang/String;
    .registers 12

    const-string v0, " represents no double value"

    const-string v1, "GPSUtils"

    const-string v2, " x "

    .line 22
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 25
    array-length v3, v2

    const/4 v4, 0x2

    if-eq v3, v4, :cond_f

    return-object p0

    :cond_f
    const/4 v3, 0x0

    .line 28
    aget-object v5, v2, v3

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 29
    array-length v7, v5

    if-eq v7, v4, :cond_1c

    return-object p0

    :cond_1c
    const/4 v7, 0x1

    .line 33
    :try_start_1d
    aget-object v8, v5, v3

    invoke-virtual {v8, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v3

    .line 34
    aget-object v8, v5, v7

    aget-object v9, v5, v7

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v7

    invoke-virtual {v8, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    .line 35
    aget-object v8, v5, v7

    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8
    :try_end_3a
    .catch Ljava/lang/NumberFormatException; {:try_start_1d .. :try_end_3a} :catch_99

    .line 40
    aget-object v5, v5, v3

    const-string v10, "S"

    invoke-virtual {v5, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_45

    neg-double v8, v8

    .line 43
    :cond_45
    aget-object v2, v2, v7

    invoke-virtual {v2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 44
    array-length v5, v2

    if-eq v5, v4, :cond_4f

    return-object p0

    .line 48
    :cond_4f
    :try_start_4f
    aget-object v5, v2, v7

    aget-object v6, v2, v7

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v7

    .line 49
    aget-object v4, v2, v7

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0
    :try_end_64
    .catch Ljava/lang/NumberFormatException; {:try_start_4f .. :try_end_64} :catch_84

    .line 54
    aget-object p0, v2, v3

    const-string v2, "W"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6f

    neg-double v0, v0

    .line 57
    :cond_6f
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 51
    :catch_84
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v2, v2, v7

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    .line 37
    :catch_99
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, v5, v7

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public static normalizeGPSFormatted(Ljava/lang/String;I)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1e

    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "GPS["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->normalizeGPSCoords(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 64
    :cond_1e
    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->normalizeGPSCoords(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static parseDegree(Ljava/lang/String;)Ljava/lang/Double;
    .registers 20

    move-object/from16 v0, p0

    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    .line 245
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 251
    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v2

    const-wide/high16 v3, 0x404e000000000000L    # 60.0

    const-wide/16 v5, 0x0

    const-string v7, "."

    const/4 v8, 0x1

    const-string v9, "-"

    const/4 v10, 0x2

    const/4 v11, 0x3

    if-eqz v2, :cond_89

    const-string v2, "^[^-\\d.]*(-?) *([\\d]+) +([\\d]+) +(\\d*\\.\\d*) *$"

    .line 252
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 253
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v12

    if-eqz v12, :cond_89

    .line 255
    :try_start_29
    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    .line 256
    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    const/4 v14, 0x4

    .line 257
    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4e

    move-wide v14, v5

    goto :goto_56

    :cond_4e
    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    :goto_56
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    .line 258
    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v15

    invoke-virtual {v13}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    div-double/2addr v12, v3

    add-double/2addr v15, v12

    invoke-virtual {v14}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    const-wide v17, 0x40ac200000000000L    # 3600.0

    div-double v12, v12, v17

    add-double/2addr v15, v12

    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 259
    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_89

    .line 260
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    neg-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1
    :try_end_87
    .catch Ljava/lang/NumberFormatException; {:try_start_29 .. :try_end_87} :catch_88

    goto :goto_89

    :catch_88
    nop

    .line 266
    :cond_89
    :goto_89
    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v2

    if-eqz v2, :cond_e5

    const-string v2, "^[^-\\d.]*(-?) *([\\d]+) +(\\d*\\.\\d*) *$"

    .line 267
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 268
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v12

    if-eqz v12, :cond_e5

    .line 270
    :try_start_9f
    invoke-virtual {v2, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    .line 271
    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_b6

    goto :goto_be

    :cond_b6
    invoke-virtual {v2, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    :goto_be
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    .line 272
    invoke-virtual {v12}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    div-double/2addr v5, v3

    add-double/2addr v12, v5

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 273
    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e5

    .line 274
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    neg-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1
    :try_end_e3
    .catch Ljava/lang/NumberFormatException; {:try_start_9f .. :try_end_e3} :catch_e4

    goto :goto_e5

    :catch_e4
    nop

    .line 280
    :cond_e5
    :goto_e5
    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v2

    if-eqz v2, :cond_15a

    const-string v2, " *(-?) *([\\d]*)\\.([\\d]*) *$"

    .line 281
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 282
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_15a

    .line 284
    :try_start_fb
    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_103
    .catch Ljava/lang/NumberFormatException; {:try_start_fb .. :try_end_103} :catch_15a

    const-string v3, ""

    if-eqz v2, :cond_108

    goto :goto_109

    :cond_108
    move-object v9, v3

    .line 285
    :goto_109
    :try_start_109
    invoke-virtual {v0, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_126

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 286
    :cond_126
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 287
    invoke-virtual {v0, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_152

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 289
    :cond_152
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1
    :try_end_15a
    .catch Ljava/lang/NumberFormatException; {:try_start_109 .. :try_end_15a} :catch_15a

    :catch_15a
    :cond_15a
    return-object v1
.end method

.method public static parseGCoorFromString(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 18

    move-object/from16 v0, p0

    const-string v1, ".*\\[.*?([NnSsWwEe]).*?(-?\\d+(?:\\.\\d+)?).*?([NnSsWwEe]).*?(-?\\d+(?:\\.\\d+)?).*?]"

    .line 124
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 129
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const-string v5, "MatchingA: \'%s\'"

    .line 130
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "parseGCoor:"

    invoke-static {v5, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    const/4 v6, 0x0

    const/4 v7, 0x2

    if-eqz v3, :cond_f2

    .line 135
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    const-string v3, " "

    if-eqz v0, :cond_34

    .line 136
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v8}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_35

    :cond_34
    move-object v0, v3

    :goto_35
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 138
    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 141
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v10, 0x3

    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v11, v12}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/4 v9, 0x4

    .line 142
    invoke-virtual {v1, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 145
    new-instance v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v11}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>()V

    const/16 v12, 0x4e

    const/16 v13, 0x57

    const/16 v14, 0x53

    const-wide/16 v15, 0x0

    if-eq v0, v12, :cond_9f

    if-ne v0, v14, :cond_72

    goto :goto_9f

    :cond_72
    if-eq v0, v13, :cond_78

    const/16 v12, 0x45

    if-ne v0, v12, :cond_c5

    .line 158
    :cond_78
    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    .line 159
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    if-ne v3, v14, :cond_91

    .line 161
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    cmpl-double v1, v7, v15

    if-lez v1, :cond_91

    .line 162
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    neg-double v7, v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    :cond_91
    if-ne v0, v13, :cond_c5

    .line 165
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    cmpl-double v1, v7, v15

    if-lez v1, :cond_c5

    .line 166
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    neg-double v7, v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    goto :goto_c5

    .line 147
    :cond_9f
    :goto_9f
    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 148
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    if-ne v0, v14, :cond_b8

    .line 149
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    cmpl-double v1, v7, v15

    if-lez v1, :cond_b8

    .line 150
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    neg-double v7, v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    :cond_b8
    if-ne v3, v13, :cond_c5

    .line 153
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    cmpl-double v1, v7, v15

    if-lez v1, :cond_c5

    .line 154
    iget-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    neg-double v7, v7

    iput-wide v7, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    .line 170
    :cond_c5
    :goto_c5
    move-object v1, v6

    check-cast v1, Ljava/util/Locale;

    new-array v1, v9, [Ljava/lang/Object;

    .line 171
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    aput-object v0, v1, v4

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    aput-object v0, v1, v2

    iget-wide v2, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    iget-wide v2, v11, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    aput-object v0, v1, v10

    const-string v0, "Match found A: \'%c\' \'%c\' \'%f\' \'%f\'"

    .line 170
    invoke-static {v6, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    move-object v6, v11

    goto :goto_148

    :cond_f2
    const-string v1, ".*\\[.*?(-?\\d+(?:\\.\\d+)?).*?(-?\\d+(?:\\.\\d+)?).*?]"

    .line 174
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 179
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v4

    const-string v0, "MatchingB: \'%s\'"

    .line 180
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_148

    .line 183
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>()V

    .line 184
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    iput-wide v7, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    const/4 v3, 0x2

    .line 185
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    iput-wide v7, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    .line 187
    move-object v1, v6

    check-cast v1, Ljava/util/Locale;

    new-array v1, v3, [Ljava/lang/Object;

    iget-wide v7, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 188
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v4

    iget-wide v3, v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "Match found B: \'%f\' \'%f\' "

    .line 187
    invoke-static {v6, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    move-object v6, v0

    :cond_148
    :goto_148
    return-object v6
.end method

.method public static parseGPS(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, "GPS["

    .line 98
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1d

    add-int/lit8 v0, v0, 0x4

    .line 101
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x5d

    .line 102
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v1, :cond_1e

    const/4 v1, 0x0

    .line 104
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1e

    :cond_1d
    const/4 p0, 0x0

    :cond_1e
    :goto_1e
    return-object p0
.end method

.method public static parseGoogleCoordsFromString(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;
    .registers 8

    const-string v0, "([-+\\d\\. ]+)([NnSs]?) *, *([-+\\d\\. ]+)([EeWw]?)"

    .line 208
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 210
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 212
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_8a

    const/4 v0, 0x1

    .line 215
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseDegree(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x3

    .line 216
    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseDegree(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    .line 218
    invoke-virtual {v0}, Ljava/lang/Double;->isNaN()Z

    move-result v2

    if-nez v2, :cond_8a

    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v2

    if-nez v2, :cond_8a

    .line 219
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpl-double v6, v2, v4

    if-lez v6, :cond_54

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "S"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_54

    .line 220
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    neg-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 223
    :cond_54
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    cmpl-double v6, v2, v4

    if-lez v6, :cond_78

    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "W"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_78

    .line 224
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    neg-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 226
    :cond_78
    new-instance p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>()V

    .line 227
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    .line 228
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    goto :goto_8b

    :cond_8a
    const/4 p0, 0x0

    :goto_8b
    return-object p0
.end method
