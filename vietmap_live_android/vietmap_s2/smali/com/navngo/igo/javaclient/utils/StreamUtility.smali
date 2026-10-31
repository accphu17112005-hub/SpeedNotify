###### Class com.navngo.igo.javaclient.utils.StreamUtility (com.navngo.igo.javaclient.utils.StreamUtility)
.class public final Lcom/navngo/igo/javaclient/utils/StreamUtility;
.super Ljava/lang/Object;
.source "StreamUtility.java"


# static fields
.field private static final logname:Ljava/lang/String; = "StreamUtility"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    :try_start_2
    new-array v0, v0, [B

    .line 67
    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_f

    .line 72
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    return-void

    :cond_f
    const/4 v2, 0x0

    .line 70
    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_13} :catch_14

    goto :goto_4

    :catch_14
    move-exception p0

    const-string p1, "StreamUtility"

    const-string v0, "appendFile:"

    .line 74
    invoke-static {p1, v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    throw p0
.end method

.method public static canReadFile(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 181
    :cond_4
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 182
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result p0

    if-eqz p0, :cond_1c

    const/4 v0, 0x1

    :cond_1c
    return v0
.end method

.method public static compareFiles(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    new-array v1, v0, [B

    new-array v0, v0, [B

    .line 97
    :cond_6
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 98
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, 0x0

    if-eq v2, v3, :cond_12

    return v4

    :cond_12
    const/4 v3, -0x1

    if-ne v2, v3, :cond_17

    const/4 p0, 0x1

    return p0

    :cond_17
    :goto_17
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_6

    .line 105
    aget-byte v2, v1, v3

    aget-byte v5, v0, v3

    if-eq v2, v5, :cond_22

    return v4

    :cond_22
    move v2, v3

    goto :goto_17
.end method

.method public static copyAllAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    const-string v0, "/"

    .line 296
    :try_start_2
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 297
    array-length v2, v1

    const/4 v3, 0x0

    :goto_8
    if-ge v3, v2, :cond_af

    aget-object v4, v1, v3
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_c} :catch_a5

    .line 299
    :try_start_c
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 300
    array-length v5, v5

    if-nez v5, :cond_44

    .line 301
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v5, v4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyAsset(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a1

    .line 303
    :cond_44
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_75

    .line 304
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 306
    :cond_75
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v5, v4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyAllAssets(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_9c} :catch_9d

    goto :goto_a1

    :catch_9d
    move-exception v4

    .line 309
    :try_start_9e
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_a1} :catch_a5

    :goto_a1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_8

    :catch_a5
    move-exception p0

    .line 313
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string p2, "StreamUtility"

    invoke-static {p2, p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_af
    return-void
.end method

.method public static copyAsset(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Attempting to copy "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " into "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "StreamUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    :try_start_1e
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    .line 321
    invoke-static {p0, p2}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyFile(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_25} :catch_26

    goto :goto_2e

    :catch_26
    move-exception p0

    .line 323
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2e
    return-void
.end method

.method public static copyFile(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 52
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_13

    .line 53
    :try_start_6
    invoke-static {p0, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->appendFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 54
    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V
    :try_end_c
    .catchall {:try_start_6 .. :try_end_c} :catchall_10

    .line 57
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    return-void

    :catchall_10
    move-exception p0

    move-object v0, v1

    goto :goto_14

    :catchall_13
    move-exception p0

    :goto_14
    if-eqz v0, :cond_19

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 58
    :cond_19
    throw p0
.end method

.method public static copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 83
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_10

    .line 84
    :try_start_6
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyFile(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_d

    .line 87
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    return-void

    :catchall_d
    move-exception p0

    move-object v0, v1

    goto :goto_11

    :catchall_10
    move-exception p0

    :goto_11
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 88
    :cond_16
    throw p0
.end method

.method public static copyRawResource(Landroid/content/res/Resources;ILjava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 329
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installing "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "StreamUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    :try_start_16
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p0
    :try_end_1a
    .catchall {:try_start_16 .. :try_end_1a} :catchall_25

    .line 333
    :try_start_1a
    invoke-static {p0, p2}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyFile(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_23

    if-eqz p0, :cond_22

    .line 336
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_22
    return-void

    :catchall_23
    move-exception p1

    goto :goto_27

    :catchall_25
    move-exception p1

    const/4 p0, 0x0

    :goto_27
    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 337
    :cond_2c
    throw p1
.end method

.method public static deleteRecursive(Ljava/io/File;)V
    .registers 5

    .line 236
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 238
    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    .line 239
    invoke-static {v3}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->deleteRecursive(Ljava/io/File;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 241
    :cond_12
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    const-string v1, "StreamUtility"

    if-eqz v0, :cond_33

    .line 242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteRecursive: deleted: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4b

    .line 244
    :cond_33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteRecursive: Cannot delete: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4b
    return-void
.end method

.method public static getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;
    .registers 4

    .line 132
    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->isDirectory(Ljava/io/File;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    if-eqz p1, :cond_15

    .line 134
    :try_start_9
    array-length v0, p1

    if-nez v0, :cond_d

    goto :goto_15

    .line 136
    :cond_d
    new-instance v0, Lcom/navngo/igo/javaclient/utils/StreamUtility$1ExtensionFilter;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility$1ExtensionFilter;-><init>([Ljava/lang/String;)V

    goto :goto_16

    :catch_13
    nop

    goto :goto_1a

    :cond_15
    :goto_15
    move-object v0, v1

    .line 137
    :goto_16
    invoke-virtual {p0, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_1a} :catch_13

    :cond_1a
    :goto_1a
    if-nez v1, :cond_1f

    const/4 p0, 0x0

    new-array v1, p0, [Ljava/io/File;

    :cond_1f
    return-object v1
.end method

.method public static getFileList(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;
    .registers 7

    .line 149
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_f

    new-array p0, v0, [Ljava/lang/String;

    return-object p0

    .line 152
    :cond_f
    array-length v1, p0

    move v2, v1

    move v3, v2

    :goto_12
    add-int/lit8 v4, v2, -0x1

    if-lez v2, :cond_2a

    .line 155
    aget-object v2, p0, v4

    invoke-virtual {p1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 156
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_28

    add-int/lit8 v3, v3, -0x1

    .line 158
    aget-object v2, p0, v3

    aput-object v2, p0, v4

    :cond_28
    move v2, v4

    goto :goto_12

    :cond_2a
    if-ne v3, v1, :cond_2d

    return-object p0

    .line 162
    :cond_2d
    new-array p1, v3, [Ljava/lang/String;

    .line 163
    invoke-static {p0, v0, p1, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static isDirectory(Ljava/io/File;)Z
    .registers 1

    if-eqz p0, :cond_a

    .line 168
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static isDirectory(Ljava/lang/String;)Z
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    .line 174
    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 175
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->isDirectory(Ljava/io/File;)Z

    move-result p0

    return p0
.end method

.method public static readFile(Landroid/content/Context;I)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "StreamUtility"

    const/4 v1, 0x0

    .line 188
    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 189
    new-instance p0, Ljava/lang/String;

    const/16 p1, 0x1000

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readInputStream(Ljava/io/InputStream;I)[B

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([B)V
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_25

    if-eqz v1, :cond_24

    .line 193
    :try_start_18
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1b} :catch_1c

    goto :goto_24

    :catch_1c
    move-exception p1

    .line 195
    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_24
    :goto_24
    return-object p0

    :catchall_25
    move-exception p0

    if-eqz v1, :cond_34

    .line 193
    :try_start_28
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_2b} :catch_2c

    goto :goto_34

    :catch_2c
    move-exception p1

    .line 195
    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    :cond_34
    :goto_34
    throw p0
.end method

.method public static readFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "StreamUtility"

    const/4 v1, 0x0

    .line 203
    :try_start_3
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_23

    .line 204
    :try_start_8
    new-instance p0, Ljava/lang/String;

    const/16 v1, 0x1000

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readInputStream(Ljava/io/InputStream;I)[B

    move-result-object v1

    invoke-direct {p0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_13
    .catchall {:try_start_8 .. :try_end_13} :catchall_20

    .line 208
    :try_start_13
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_1f

    :catch_17
    move-exception v1

    .line 210
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1f
    return-object p0

    :catchall_20
    move-exception p0

    move-object v1, v2

    goto :goto_24

    :catchall_23
    move-exception p0

    :goto_24
    if-eqz v1, :cond_32

    .line 208
    :try_start_26
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_29} :catch_2a

    goto :goto_32

    :catch_2a
    move-exception v1

    .line 210
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    :cond_32
    :goto_32
    throw p0
.end method

.method public static readInputStream(Ljava/io/InputStream;I)[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 38
    :try_start_5
    new-array p1, p1, [B

    .line 40
    :goto_7
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_13

    const/4 v2, 0x0

    .line 41
    invoke-virtual {v0, p1, v2, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_1b

    goto :goto_7

    .line 43
    :cond_13
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 45
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    :catchall_1b
    move-exception p0

    .line 43
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 44
    throw p0
.end method

.method public static unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 251
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installing "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "StreamUtility"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 256
    :try_start_1c
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_65

    .line 257
    array-length v4, v3

    if-lez v4, :cond_65

    .line 258
    invoke-static {v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 260
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_31} :catch_78
    .catchall {:try_start_1c .. :try_end_31} :catchall_74

    .line 262
    :try_start_31
    array-length v5, v3

    const/4 v6, 0x0

    :goto_33
    if-ge v6, v5, :cond_66

    aget-object v7, v3, v6

    .line 263
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 265
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    const/4 v9, 0x2

    invoke-virtual {v8, v7, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v7
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_54} :catch_62
    .catchall {:try_start_31 .. :try_end_54} :catchall_5f

    .line 266
    :try_start_54
    invoke-static {v7, v4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->appendFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 267
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_5a} :catch_5d
    .catchall {:try_start_54 .. :try_end_5a} :catchall_ad

    add-int/lit8 v6, v6, 0x1

    goto :goto_33

    :catch_5d
    move-exception p0

    goto :goto_7b

    :catchall_5f
    move-exception p0

    move-object v7, v2

    goto :goto_ae

    :catch_62
    move-exception p0

    move-object v7, v2

    goto :goto_7b

    :cond_65
    move-object v4, v2

    :cond_66
    if-eqz v4, :cond_6d

    .line 283
    :try_start_68
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_68 .. :try_end_6b} :catch_6c

    goto :goto_6d

    :catch_6c
    move-exception v2

    :cond_6d
    :goto_6d
    if-nez v2, :cond_70

    return-void

    .line 288
    :cond_70
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 289
    throw v2

    :catchall_74
    move-exception p0

    move-object v4, v2

    move-object v7, v4

    goto :goto_ae

    :catch_78
    move-exception p0

    move-object v4, v2

    move-object v7, v4

    :goto_7b
    :try_start_7b
    const-string p1, "unsplitAsset"

    .line 272
    invoke-static {v1, p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 273
    new-instance p1, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_9d
    .catchall {:try_start_7b .. :try_end_9d} :catchall_ad

    if-eqz v7, :cond_a4

    .line 277
    :try_start_9f
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_a2
    .catch Ljava/io/IOException; {:try_start_9f .. :try_end_a2} :catch_a3

    goto :goto_a4

    :catch_a3
    nop

    :cond_a4
    :goto_a4
    if-eqz v4, :cond_a9

    .line 283
    :try_start_a6
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a6 .. :try_end_a9} :catch_a9

    .line 288
    :catch_a9
    :cond_a9
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 289
    throw p1

    :catchall_ad
    move-exception p0

    :goto_ae
    if-eqz v7, :cond_b5

    .line 277
    :try_start_b0
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_b3} :catch_b4

    goto :goto_b5

    :catch_b4
    move-exception v2

    :cond_b5
    :goto_b5
    if-eqz v4, :cond_c0

    .line 283
    :try_start_b7
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_ba
    .catch Ljava/io/IOException; {:try_start_b7 .. :try_end_ba} :catch_bb

    goto :goto_c0

    :catch_bb
    move-exception p1

    if-eqz v2, :cond_bf

    goto :goto_c0

    :cond_bf
    move-object v2, p1

    :cond_c0
    :goto_c0
    if-eqz v2, :cond_c6

    .line 288
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 289
    throw v2

    .line 291
    :cond_c6
    throw p0
.end method

.method public static writeUtf8(Ljava/lang/String;Ljava/io/DataOutputStream;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "UTF-8"

    .line 222
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 224
    invoke-virtual {v0, p0}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 225
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    .line 227
    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    const/4 v1, 0x0

    :goto_12
    if-ge v1, v0, :cond_1e

    .line 230
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    invoke-virtual {p1, v2}, Ljava/io/DataOutputStream;->writeByte(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_1e
    return-void
.end method

###### Class com.navngo.igo.javaclient.utils.StreamUtility.C1ExtensionFilter (com.navngo.igo.javaclient.utils.StreamUtility$1ExtensionFilter)
.class Lcom/navngo/igo/javaclient/utils/StreamUtility$1ExtensionFilter;
.super Ljava/lang/Object;
.source "StreamUtility.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ExtensionFilter"
.end annotation


# instance fields
.field final mExtensions:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .registers 2

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/StreamUtility$1ExtensionFilter;->mExtensions:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 7

    .line 124
    iget-object p1, p0, Lcom/navngo/igo/javaclient/utils/StreamUtility$1ExtensionFilter;->mExtensions:[Ljava/lang/String;

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_14

    aget-object v3, p1, v2

    .line 125
    invoke-virtual {p2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    const/4 p1, 0x1

    return p1

    :cond_11
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_14
    return v1
.end method
