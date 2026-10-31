###### Class com.navngo.igo.javaclient.sdcard.Mount (com.navngo.igo.javaclient.sdcard.Mount)
.class public Lcom/navngo/igo/javaclient/sdcard/Mount;
.super Ljava/lang/Object;
.source "Mount.java"


# static fields
.field private static final logname:Ljava/lang/String; = "Mount"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCIDs(Z)Ljava/util/Set;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "Mount"

    .line 31
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    const-string v2, "android"

    const-string v3, "sd_mount_path"

    const-string v4, ""

    .line 34
    invoke-static {v2, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "sd_exclude_mounts"

    .line 36
    invoke-static {v2, v5, v4}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "\\s+"

    invoke-virtual {v2, v5, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, ","

    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 39
    :try_start_27
    invoke-static {}, Lcom/navngo/igo/javaclient/sdcard/Mount;->getSDList()Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    move-result-object v5
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2b} :catch_e1

    .line 45
    invoke-virtual {v5}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2f
    :goto_2f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_e0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/navngo/igo/javaclient/sdcard/Karton;

    const-string v7, "mount_fstype"

    .line 46
    invoke-virtual {v6, v7}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_2f

    const-string v8, "vfat"

    .line 47
    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5d

    const-string v8, "ext."

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5d

    const-string v8, "sdfat"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2f

    :cond_5d
    const-string v7, "is_sd"

    .line 48
    invoke-virtual {v6, v7}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string v8, "mount_dir"

    .line 49
    invoke-virtual {v6, v8}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v9, "cid_value"

    .line 50
    invoke-virtual {v6, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    if-eqz v6, :cond_2f

    .line 51
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2f

    if-eqz v8, :cond_2f

    if-eqz v7, :cond_2f

    .line 52
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "found CID (is_sd="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ") on "

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " CID="

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_b3

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b3

    goto/16 :goto_2f

    .line 55
    :cond_b3
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_c1

    invoke-interface {v2, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c1

    goto/16 :goto_2f

    .line 58
    :cond_c1
    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    .line 59
    invoke-interface {v1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 60
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Stored CID= "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p0, :cond_2f

    :cond_e0
    return-object v1

    :catch_e1
    move-exception p0

    const-string v1, "getSDId():"

    .line 41
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method protected static getMajMin(Ljava/lang/String;)[Ljava/lang/String;
    .registers 4

    const-string v0, "n/a"

    .line 238
    filled-new-array {v0, v0}, [Ljava/lang/String;

    move-result-object v0

    .line 240
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->GetBlockDeviceMajMin(Ljava/lang/String;)Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;

    move-result-object p0

    .line 241
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;->valid:Z

    if-eqz v1, :cond_20

    const/4 v1, 0x0

    .line 243
    iget v2, p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;->major:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 244
    iget p0, p0, Lcom/navngo/igo/javaclient/NNG$MajMinNumbers;->minor:I

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v1

    :cond_20
    return-object v0
.end method

.method public static getMounts()Lcom/navngo/igo/javaclient/sdcard/Kartonok;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    new-instance v0, Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;-><init>()V

    const-string v1, "/proc/mounts"

    .line 176
    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "(?s)\\n"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_14
    if-ge v4, v2, :cond_9e

    aget-object v5, v1, v4

    const-string v6, "\\s+"

    .line 177
    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 178
    new-instance v7, Lcom/navngo/igo/javaclient/sdcard/Karton;

    invoke-direct {v7}, Lcom/navngo/igo/javaclient/sdcard/Karton;-><init>()V

    .line 179
    array-length v8, v6

    const/4 v9, 0x4

    const-string v10, "Mount"

    if-ge v8, v9, :cond_3e

    .line 180
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getMounts: unrecognised mount entry: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v10, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9a

    .line 183
    :cond_3e
    aget-object v8, v6, v3

    const-string v9, "mount_dev"

    invoke-virtual {v7, v9, v8}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v8, 0x1

    .line 184
    aget-object v9, v6, v8

    const-string v11, "mount_dir"

    invoke-virtual {v7, v11, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v9, 0x2

    .line 185
    aget-object v9, v6, v9

    const-string v11, "mount_fstype"

    invoke-virtual {v7, v11, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v9, 0x3

    .line 186
    aget-object v9, v6, v9

    const-string v11, "mount_opt"

    invoke-virtual {v7, v11, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    aget-object v6, v6, v3

    invoke-static {v6}, Lcom/navngo/igo/javaclient/sdcard/Mount;->getMajMin(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 190
    aget-object v9, v6, v3

    const-string v11, "mount_major"

    invoke-virtual {v7, v11, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    aget-object v9, v6, v8

    const-string v11, "mount_minor"

    invoke-virtual {v7, v11, v9}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    invoke-virtual {v0, v7}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v11, v6, v3

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ":"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v6, v8

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v10, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :goto_9a
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_14

    :cond_9e
    return-object v0
.end method

.method public static getSDList()Lcom/navngo/igo/javaclient/sdcard/Kartonok;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-static {}, Lcom/navngo/igo/javaclient/sdcard/Mount;->getMounts()Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/sdcard/Karton;

    .line 76
    invoke-static {v2}, Lcom/navngo/igo/javaclient/sdcard/Mount;->guessIsSD(Lcom/navngo/igo/javaclient/sdcard/Karton;)Z

    goto :goto_8

    .line 78
    :cond_18
    invoke-static {}, Lcom/navngo/igo/javaclient/sdcard/SDCard;->getCids()Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    move-result-object v1

    .line 79
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/sdcard/Mount;->mergeMountAndCid(Lcom/navngo/igo/javaclient/sdcard/Kartonok;Lcom/navngo/igo/javaclient/sdcard/Kartonok;)Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    move-result-object v0

    .line 80
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "sdscore"

    if-eqz v2, :cond_83

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/sdcard/Karton;

    const-string v4, "mount_sdscore"

    .line 82
    invoke-virtual {v2, v4}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "0"

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/sdcard/Mount;->nvl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v6, 0x0

    add-int/2addr v4, v6

    const-string v7, "cid_sdscore"

    .line 83
    invoke-virtual {v2, v7}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7, v5}, Lcom/navngo/igo/javaclient/sdcard/Mount;->nvl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    const/4 v7, 0x0

    .line 85
    move-object v8, v7

    check-cast v8, Ljava/util/Locale;

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v6

    const-string v6, "%020d"

    invoke-static {v7, v6, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v3, v6}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "yes"

    const-string v6, "is_sd"

    if-lez v5, :cond_77

    .line 87
    invoke-virtual {v2, v6, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    :cond_77
    if-gez v4, :cond_7f

    const-string v3, "not"

    .line 89
    invoke-virtual {v2, v6, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    .line 91
    :cond_7f
    invoke-virtual {v2, v6, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_24

    .line 94
    :cond_83
    invoke-virtual {v0, v3}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->sort(Ljava/lang/String;)V

    .line 95
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->reverse()V

    return-object v0
.end method

.method public static guessIsSD(Lcom/navngo/igo/javaclient/sdcard/Karton;)Z
    .registers 8

    const-string v0, "mount_dir"

    .line 205
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_19

    const-string v3, ".*/(sd|xtern).*"

    .line 207
    invoke-virtual {v0, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "(.*ntern.*)|/cache|/data|/system|.*usb.*"

    .line 208
    invoke-virtual {v0, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    goto :goto_1b

    :cond_19
    const/4 v0, 0x1

    const/4 v3, 0x0

    :goto_1b
    const-string v4, "mount_dev"

    .line 211
    invoke-virtual {p0, v4}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_2c

    const-string v5, "/dev/.*"

    .line 213
    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    goto :goto_2d

    :cond_2c
    const/4 v4, 0x0

    :goto_2d
    const-string v5, "mount_fstype"

    .line 216
    invoke-virtual {p0, v5}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_3e

    const-string v6, "(root|tmp|dev|proc|sys|cgroup).*"

    .line 218
    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    goto :goto_3f

    :cond_3e
    const/4 v5, 0x1

    :goto_3f
    if-eqz v3, :cond_50

    const-string v3, "android"

    const-string v6, "lock_to_external_sd"

    .line 223
    invoke-static {v3, v6, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4e

    const/16 v3, 0xb

    goto :goto_51

    :cond_4e
    const/4 v3, 0x1

    goto :goto_51

    :cond_50
    const/4 v3, 0x0

    :goto_51
    if-eqz v0, :cond_55

    add-int/lit8 v3, v3, -0xa

    :cond_55
    if-eqz v4, :cond_59

    add-int/lit8 v3, v3, 0x1

    :cond_59
    if-eqz v5, :cond_5d

    add-int/lit8 v3, v3, -0xa

    .line 230
    :cond_5d
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v4, "mount_sdscore"

    invoke-virtual {p0, v4, v0}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-lez v3, :cond_69

    goto :goto_6a

    :cond_69
    const/4 v1, 0x0

    :goto_6a
    return v1
.end method

.method private static isBetterCIDMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5

    .line 103
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 104
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 105
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_c
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_c} :catch_12

    if-ge p0, v1, :cond_38

    if-gt v1, v0, :cond_38

    const/4 p0, 0x1

    return p0

    .line 112
    :catch_12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid minor number among these: mount_minor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " prev_cid_minor="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " cid_minor="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Mount"

    invoke-static {p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_38
    const/4 p0, 0x0

    return p0
.end method

.method private static mergeMountAndCid(Lcom/navngo/igo/javaclient/sdcard/Kartonok;Lcom/navngo/igo/javaclient/sdcard/Kartonok;)Lcom/navngo/igo/javaclient/sdcard/Kartonok;
    .registers 21

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    .line 119
    invoke-virtual/range {p1 .. p1}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/sdcard/Kartonok;

    const/4 v2, 0x1

    :goto_d
    const/4 v3, 0x3

    if-gt v2, v3, :cond_1cd

    .line 125
    invoke-virtual/range {p0 .. p0}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->size()I

    move-result v4

    :goto_14
    add-int/lit8 v5, v4, -0x1

    if-lez v4, :cond_1c9

    move-object/from16 v4, p0

    .line 126
    invoke-virtual {v4, v5}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/navngo/igo/javaclient/sdcard/Karton;

    const-string v7, "mount_dev"

    .line 128
    invoke-virtual {v6, v7}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 129
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "mount_major"

    invoke-virtual {v6, v10}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "mount_minor"

    invoke-virtual {v6, v11}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 131
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_55
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1c5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/navngo/igo/javaclient/sdcard/Karton;

    .line 132
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "cid_major"

    invoke-virtual {v12, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "cid_minor"

    invoke-virtual {v12, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v3, v16

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 134
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v3

    const-string v3, "/public:"

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v4, v17

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 135
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v8

    move-object/from16 v8, v17

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 136
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v13, 0x2

    if-ne v2, v13, :cond_114

    .line 139
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "blockdir"

    invoke-virtual {v12, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_132

    :cond_114
    const/4 v13, 0x3

    if-ne v2, v13, :cond_130

    .line 141
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto :goto_132

    :cond_130
    move-object/from16 v13, v16

    .line 143
    :goto_132
    invoke-virtual {v7, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_1bc

    invoke-virtual {v7, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1bc

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1bc

    invoke-virtual {v7, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1bc

    invoke-virtual {v6, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_151

    goto :goto_1bc

    :cond_151
    const/4 v3, 0x3

    if-ne v2, v3, :cond_1b5

    .line 150
    invoke-virtual {v6, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1b5

    const-string v4, "cid_value"

    invoke-virtual {v12, v4}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1b5

    .line 152
    invoke-virtual {v0, v5}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/navngo/igo/javaclient/sdcard/Karton;

    .line 153
    invoke-virtual {v8, v11}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v8, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v12, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v3, v16

    check-cast v3, Ljava/lang/String;

    invoke-static {v13, v14, v3}, Lcom/navngo/igo/javaclient/sdcard/Mount;->isBetterCIDMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b5

    const-string v3, "cid_name"

    .line 155
    invoke-virtual {v12, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v8, v3, v13}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "cid_type"

    .line 156
    invoke-virtual {v12, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v8, v3, v13}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    invoke-virtual {v12, v4}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v8, v4, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "cid_path"

    .line 158
    invoke-virtual {v12, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v8, v3, v4}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    invoke-virtual {v12, v15}, Lcom/navngo/igo/javaclient/sdcard/Karton;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v8, v15, v3}, Lcom/navngo/igo/javaclient/sdcard/Karton;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1b5
    move-object/from16 v4, p0

    move-object/from16 v8, v18

    const/4 v3, 0x3

    goto/16 :goto_55

    .line 145
    :cond_1bc
    :goto_1bc
    invoke-virtual {v0, v5}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/navngo/igo/javaclient/sdcard/Karton;

    invoke-virtual {v3, v12}, Lcom/navngo/igo/javaclient/sdcard/Karton;->putAll(Ljava/util/Map;)V

    :cond_1c5
    move v4, v5

    const/4 v3, 0x3

    goto/16 :goto_14

    :cond_1c9
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_d

    .line 170
    :cond_1cd
    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/sdcard/Kartonok;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method private static nvl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_3

    goto :goto_4

    :cond_3
    move-object p0, p1

    :goto_4
    return-object p0
.end method
