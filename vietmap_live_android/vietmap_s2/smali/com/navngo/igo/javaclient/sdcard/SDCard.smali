###### Class com.navngo.igo.javaclient.sdcard.SDCard (com.navngo.igo.javaclient.sdcard.SDCard)
.class public Lcom/navngo/igo/javaclient/sdcard/SDCard;
.super Ljava/lang/Object;
.source "SDCard.java"


# static fields
.field private static final logname:Ljava/lang/String; = "SDCard"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCids()Lcom/navngo/igo/javaclient/sdcard/Kartonok;
    .registers 22

    const-string v1, ""

    const-string v2, "0"

    const-string v3, "SDCard"

    .line 20
    new-instance v4, Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    invoke-direct {v4}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;-><init>()V

    const-string v0, ".*"

    .line 21
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v5, "/sys/block/"

    .line 24
    invoke-static {v5, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v6

    const-string v7, "/sys/dev/block/"

    .line 25
    invoke-static {v7, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/lang/String;Ljava/util/regex/Pattern;)[Ljava/lang/String;

    move-result-object v0

    .line 26
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 28
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v8, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v8, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_34
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const-string v8, "cid_major"

    const-string v9, "cid_minor"

    const-string v10, "cid_path"

    const-string v11, "cid_type"

    const-string v12, "cid_name"

    const-string v13, "cid_value"

    if-eqz v0, :cond_1cb

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ljava/lang/String;

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "/dev"

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v16, v2

    .line 35
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_80

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 39
    :cond_80
    :try_start_80
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v2, ":.*"

    .line 40
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_8e
    .catch Ljava/io/IOException; {:try_start_80 .. :try_end_8e} :catch_97

    :try_start_8e
    const-string v15, ".*:"

    .line 41
    invoke-virtual {v0, v15, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_94
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_94} :catch_95

    goto :goto_a1

    :catch_95
    move-exception v0

    goto :goto_9a

    :catch_97
    move-exception v0

    move-object/from16 v2, v16

    :goto_9a
    const-string v15, "device/major:minor"

    .line 43
    invoke-static {v3, v15, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object/from16 v0, v16

    .line 46
    :goto_a1
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v17, v1

    const-string v1, ":"

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v18, v6

    const-string v6, "/device"

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v19, v4

    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v20, v15

    const-string v15, "/cid"

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v21, v13

    .line 50
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_107

    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 53
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v20, v4

    move-object v4, v6

    .line 57
    :cond_107
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_13c

    .line 59
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/../device"

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 60
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_13e

    :cond_13c
    move-object/from16 v1, v20

    .line 63
    :goto_13e
    new-instance v6, Lcom/navngo/igo/javaclient/sdcard/Karton;

    invoke-direct {v6}, Lcom/navngo/igo/javaclient/sdcard/Karton;-><init>()V

    const-string v13, "blockdir"

    .line 64
    invoke-virtual {v6, v13, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-virtual {v6, v8, v2}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    invoke-virtual {v6, v9, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1bd

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/name"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/type"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 71
    invoke-virtual {v6, v10, v4}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :try_start_17e
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v12, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_189
    .catch Ljava/io/IOException; {:try_start_17e .. :try_end_189} :catch_18a

    goto :goto_190

    :catch_18a
    move-exception v0

    const-string v2, "device/name"

    .line 75
    invoke-static {v3, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    :goto_190
    :try_start_190
    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v11, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19b
    .catch Ljava/io/IOException; {:try_start_190 .. :try_end_19b} :catch_19c

    goto :goto_1a2

    :catch_19c
    move-exception v0

    const-string v1, "device/type"

    .line 80
    invoke-static {v3, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 83
    :goto_1a2
    :try_start_1a2
    invoke-static {v4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v1, v21

    invoke-virtual {v6, v1, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1af
    .catch Ljava/io/IOException; {:try_start_1a2 .. :try_end_1af} :catch_1b0

    goto :goto_1b6

    :catch_1b0
    move-exception v0

    const-string v1, "device/cid"

    .line 85
    invoke-static {v3, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1b6
    const-string v0, "cid_sdscore"

    const-string v1, "10"

    .line 87
    invoke-virtual {v6, v0, v1}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1bd
    move-object/from16 v2, v19

    .line 92
    invoke-virtual {v2, v6}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->add(Ljava/lang/Object;)Z

    move-object v4, v2

    move-object/from16 v2, v16

    move-object/from16 v1, v17

    move-object/from16 v6, v18

    goto/16 :goto_34

    :cond_1cb
    move-object v2, v4

    move-object v1, v13

    .line 96
    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1d1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/navngo/igo/javaclient/sdcard/Karton;

    .line 98
    invoke-virtual {v3, v1}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_280

    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 102
    invoke-virtual {v3, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 103
    invoke-virtual {v3, v8}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 104
    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1fd
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    const-string v15, "cid_copied"

    if-eqz v14, :cond_23e

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/navngo/igo/javaclient/sdcard/Karton;

    .line 106
    invoke-virtual {v14, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 107
    invoke-virtual {v14, v8}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    move-object/from16 v18, v8

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    if-ne v7, v8, :cond_239

    if-le v6, v0, :cond_239

    .line 108
    invoke-virtual {v14, v1}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_239

    invoke-virtual {v14, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_239

    if-eqz v4, :cond_237

    if-ge v5, v0, :cond_239

    :cond_237
    move v5, v0

    move-object v4, v14

    :cond_239
    move-object/from16 v0, v17

    move-object/from16 v8, v18

    goto :goto_1fd

    :cond_23e
    move-object/from16 v17, v0

    move-object/from16 v18, v8

    if-eqz v4, :cond_284

    .line 119
    invoke-virtual {v4, v1}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v1, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {v3, v12}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_25c

    .line 121
    invoke-virtual {v4, v12}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v12, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_25c
    invoke-virtual {v3, v11}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_26b

    .line 123
    invoke-virtual {v4, v11}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v11, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    :cond_26b
    invoke-virtual {v3, v10}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_27a

    .line 125
    invoke-virtual {v4, v10}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v10, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27a
    const-string v0, "true"

    .line 126
    invoke-virtual {v3, v15, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_284

    :cond_280
    move-object/from16 v17, v0

    move-object/from16 v18, v8

    :cond_284
    :goto_284
    move-object/from16 v0, v17

    move-object/from16 v8, v18

    goto/16 :goto_1d1

    :cond_28a
    return-object v2
.end method
