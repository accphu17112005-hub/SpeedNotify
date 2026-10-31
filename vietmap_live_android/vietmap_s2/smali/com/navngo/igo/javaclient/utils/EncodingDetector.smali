###### Class com.navngo.igo.javaclient.utils.EncodingDetector (com.navngo.igo.javaclient.utils.EncodingDetector)
.class public final Lcom/navngo/igo/javaclient/utils/EncodingDetector;
.super Ljava/lang/Object;
.source "EncodingDetector.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x4

.field private static final logname:Ljava/lang/String; = "EncodingDetector"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detect(Ljava/io/BufferedInputStream;)Ljava/lang/String;
    .registers 16

    const-string v0, "EncodingDetector  InputStream does not support reset()"

    const-string v1, "EncodingDetector: "

    const-string v2, "EncodingDetector"

    const-string v3, "ASCII"

    const/4 v4, 0x4

    new-array v5, v4, [B

    .line 24
    fill-array-data v5, :array_1a4

    const/4 v6, 0x0

    .line 29
    :try_start_f
    invoke-virtual {p0, v4}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 30
    invoke-virtual {p0, v5, v6, v4}, Ljava/io/BufferedInputStream;->read([BII)I
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_15} :catch_16

    goto :goto_1b

    :catch_16
    const-string v7, "EncodingDetector can not read 4bytes from InputStream"

    .line 34
    invoke-static {v2, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1b
    const/4 v7, 0x3

    const/4 v8, 0x2

    :try_start_1d
    aget-byte v9, v5, v6
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1f} :catch_14a
    .catchall {:try_start_1d .. :try_end_1f} :catchall_147

    const/16 v10, -0x11

    const-string v11, "UTF-16BE"

    const-string v12, "UTF-16LE"

    const/4 v13, 0x1

    if-eq v9, v10, :cond_ec

    const/4 v10, -0x1

    const/4 v14, -0x2

    if-eq v9, v14, :cond_c3

    if-eq v9, v10, :cond_68

    if-eqz v9, :cond_32

    goto/16 :goto_125

    :cond_32
    :try_start_32
    aget-byte v9, v5, v13

    if-nez v9, :cond_65

    aget-byte v8, v5, v8

    if-ne v8, v14, :cond_65

    aget-byte v7, v5, v7
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_3c} :catch_14a
    .catchall {:try_start_32 .. :try_end_3c} :catchall_147

    if-ne v7, v10, :cond_65

    :try_start_3e
    const-string v3, "UTF-32BE"
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_40} :catch_9b
    .catchall {:try_start_3e .. :try_end_40} :catchall_17d

    .line 106
    :try_start_40
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v5

    if-eqz v5, :cond_53

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_49
    add-int/lit8 v0, v4, -0x1

    int-to-byte v0, v0

    if-lez v4, :cond_64

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v4, v0

    goto :goto_49

    .line 117
    :cond_53
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_56} :catch_57

    goto :goto_64

    :catch_57
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_64
    :goto_64
    return-object v3

    :cond_65
    move-object v3, v11

    goto/16 :goto_125

    :cond_68
    :try_start_68
    aget-byte v9, v5, v13

    if-ne v9, v14, :cond_125

    aget-byte v9, v5, v8

    if-nez v9, :cond_9e

    aget-byte v5, v5, v7
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_72} :catch_14a
    .catchall {:try_start_68 .. :try_end_72} :catchall_147

    if-nez v5, :cond_9e

    :try_start_74
    const-string v3, "UTF-32LE"
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_74 .. :try_end_76} :catch_9b
    .catchall {:try_start_74 .. :try_end_76} :catchall_17d

    .line 106
    :try_start_76
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v5

    if-eqz v5, :cond_89

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_7f
    add-int/lit8 v0, v4, -0x1

    int-to-byte v0, v0

    if-lez v4, :cond_9a

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v4, v0

    goto :goto_7f

    .line 117
    :cond_89
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8c
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_8c} :catch_8d

    goto :goto_9a

    :catch_8d
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9a
    :goto_9a
    return-object v3

    :catch_9b
    move-exception v5

    goto/16 :goto_14c

    .line 106
    :cond_9e
    :try_start_9e
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v3

    if-eqz v3, :cond_b1

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_a7
    add-int/lit8 v0, v8, -0x1

    int-to-byte v0, v0

    if-lez v8, :cond_c2

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v8, v0

    goto :goto_a7

    .line 117
    :cond_b1
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_b4} :catch_b5

    goto :goto_c2

    :catch_b5
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_c2
    :goto_c2
    return-object v12

    :cond_c3
    :try_start_c3
    aget-byte v4, v5, v13
    :try_end_c5
    .catch Ljava/lang/Exception; {:try_start_c3 .. :try_end_c5} :catch_14a
    .catchall {:try_start_c3 .. :try_end_c5} :catchall_147

    if-ne v4, v10, :cond_125

    .line 106
    :try_start_c7
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v3

    if-eqz v3, :cond_da

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_d0
    add-int/lit8 v0, v8, -0x1

    int-to-byte v0, v0

    if-lez v8, :cond_eb

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v8, v0

    goto :goto_d0

    .line 117
    :cond_da
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_dd
    .catch Ljava/lang/Exception; {:try_start_c7 .. :try_end_dd} :catch_de

    goto :goto_eb

    :catch_de
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_eb
    :goto_eb
    return-object v11

    :cond_ec
    :try_start_ec
    aget-byte v4, v5, v13

    const/16 v9, -0x45

    if-ne v4, v9, :cond_125

    aget-byte v4, v5, v8
    :try_end_f4
    .catch Ljava/lang/Exception; {:try_start_ec .. :try_end_f4} :catch_14a
    .catchall {:try_start_ec .. :try_end_f4} :catchall_147

    const/16 v8, -0x41

    if-ne v4, v8, :cond_125

    :try_start_f8
    const-string v3, "UTF-8"
    :try_end_fa
    .catch Ljava/lang/Exception; {:try_start_f8 .. :try_end_fa} :catch_122
    .catchall {:try_start_f8 .. :try_end_fa} :catchall_11f

    .line 106
    :try_start_fa
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v4

    if-eqz v4, :cond_10d

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_103
    add-int/lit8 v0, v7, -0x1

    int-to-byte v0, v0

    if-lez v7, :cond_11e

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v7, v0

    goto :goto_103

    .line 117
    :cond_10d
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_110
    .catch Ljava/lang/Exception; {:try_start_fa .. :try_end_110} :catch_111

    goto :goto_11e

    :catch_111
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_11e
    :goto_11e
    return-object v3

    :catchall_11f
    move-exception v3

    const/4 v4, 0x3

    goto :goto_17e

    :catch_122
    move-exception v5

    const/4 v4, 0x3

    goto :goto_14c

    :cond_125
    :goto_125
    :try_start_125
    aget-byte v4, v5, v13
    :try_end_127
    .catch Ljava/lang/Exception; {:try_start_125 .. :try_end_127} :catch_14a
    .catchall {:try_start_125 .. :try_end_127} :catchall_147

    if-nez v4, :cond_12a

    goto :goto_12b

    :cond_12a
    move-object v12, v3

    .line 106
    :goto_12b
    :try_start_12b
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v3

    if-eqz v3, :cond_135

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    goto :goto_146

    .line 117
    :cond_135
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_138
    .catch Ljava/lang/Exception; {:try_start_12b .. :try_end_138} :catch_139

    goto :goto_146

    :catch_139
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_146
    return-object v12

    :catchall_147
    move-exception v3

    const/4 v4, 0x0

    goto :goto_17e

    :catch_14a
    move-exception v5

    const/4 v4, 0x0

    .line 100
    :goto_14c
    :try_start_14c
    new-instance v6, Ljava/io/IOException;

    invoke-virtual {v5}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_158
    .catchall {:try_start_14c .. :try_end_158} :catchall_17d

    .line 106
    :try_start_158
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v5

    if-eqz v5, :cond_16b

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_161
    add-int/lit8 v0, v4, -0x1

    int-to-byte v0, v0

    if-lez v4, :cond_17c

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v4, v0

    goto :goto_161

    .line 117
    :cond_16b
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_16e
    .catch Ljava/lang/Exception; {:try_start_158 .. :try_end_16e} :catch_16f

    goto :goto_17c

    :catch_16f
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_17c
    :goto_17c
    return-object v3

    :catchall_17d
    move-exception v3

    .line 106
    :goto_17e
    :try_start_17e
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->markSupported()Z

    move-result v5

    if-eqz v5, :cond_191

    .line 108
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    :goto_187
    add-int/lit8 v0, v4, -0x1

    int-to-byte v0, v0

    if-lez v4, :cond_1a2

    .line 112
    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->read()I

    move v4, v0

    goto :goto_187

    .line 117
    :cond_191
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_194
    .catch Ljava/lang/Exception; {:try_start_17e .. :try_end_194} :catch_195

    goto :goto_1a2

    :catch_195
    move-exception p0

    .line 122
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    :cond_1a2
    :goto_1a2
    throw v3

    nop

    :array_1a4
    .array-data 1
        -0x22t
        -0x53t
        -0x42t
        -0x51t
    .end array-data
.end method
