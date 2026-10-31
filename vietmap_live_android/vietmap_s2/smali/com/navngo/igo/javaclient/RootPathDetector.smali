###### Class com.navngo.igo.javaclient.RootPathDetector (com.navngo.igo.javaclient.RootPathDetector)
.class public final Lcom/navngo/igo/javaclient/RootPathDetector;
.super Ljava/lang/Object;
.source "RootPathDetector.java"


# static fields
.field private static logname:Ljava/lang/String; = "RootPathDetector"


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detect()V
    .registers 14

    const-string v0, "folders"

    const-string v1, "sdcardRoot= "

    const-string v2, " sdcardDir= "

    .line 24
    :try_start_6
    sget-object v3, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->isDirectory(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->isDirectory(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 26
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    const-string v3, "detectRootPaths: first guess matches"

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_1d} :catch_146
    .catchall {:try_start_6 .. :try_end_1d} :catchall_144

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :goto_24
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 29
    :cond_3c
    :try_start_3c
    sget-object v3, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "detectRootPaths: searching better than: sdcardRoot= "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "use_external_files_dir"

    const/4 v4, 0x1

    .line 30
    invoke-static {v0, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-eqz v3, :cond_b7

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x13

    if-lt v3, v7, :cond_b7

    .line 31
    sget-object v3, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v3, v5}, Lcom/navngo/igo/javaclient/Application;->getExternalFilesDirs(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v3

    .line 34
    new-instance v7, Lcom/navngo/igo/javaclient/RootPathDetector$1;

    invoke-direct {v7}, Lcom/navngo/igo/javaclient/RootPathDetector$1;-><init>()V

    invoke-static {v3, v7}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 46
    array-length v7, v3

    const/4 v8, 0x0

    :goto_7d
    if-ge v8, v7, :cond_b7

    aget-object v9, v3, v8

    if-nez v9, :cond_8b

    .line 49
    sget-object v9, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    const-string v10, "detectRootPaths: unavailable external files dir found"

    invoke-static {v9, v10}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b4

    .line 52
    :cond_8b
    invoke-static {v9}, Lcom/navngo/igo/javaclient/RootPathDetector;->try_sdcardDir(Ljava/io/File;)Z

    move-result v10

    if-eqz v10, :cond_b4

    .line 53
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "detectRootPaths: found external files dir="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_ab
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_ab} :catch_146
    .catchall {:try_start_3c .. :try_end_ab} :catchall_144

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    goto/16 :goto_24

    :cond_b4
    :goto_b4
    add-int/lit8 v8, v8, 0x1

    goto :goto_7d

    :cond_b7
    :try_start_b7
    const-string v3, "data_folder_name"

    .line 58
    sget-object v7, Lcom/navngo/igo/javaclient/Config;->packageName:Ljava/lang/String;

    invoke-static {v0, v3, v7}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v7, "linked_root_list"

    .line 59
    sget-object v8, Lcom/navngo/igo/javaclient/Config;->def_linked_root_list:Ljava/lang/String;

    invoke-static {v0, v7, v8}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_c7
    .catch Ljava/lang/Exception; {:try_start_b7 .. :try_end_c7} :catch_146
    .catchall {:try_start_b7 .. :try_end_c7} :catchall_144

    const-string v7, "\\s+"

    if-eqz v0, :cond_e5

    .line 60
    :try_start_cb
    invoke-virtual {v0, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/RootPathDetector;->try_sdcard_dirlist([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e5

    .line 61
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    const-string v3, "detectRootPaths: found on linked_root_list"

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_cb .. :try_end_dc} :catch_146
    .catchall {:try_start_cb .. :try_end_dc} :catchall_144

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    goto/16 :goto_24

    :cond_e5
    :try_start_e5
    const-string v0, "/proc/mounts"

    .line 65
    invoke-static {v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v8, "(?s)\\n"

    invoke-virtual {v0, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 66
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 67
    array-length v9, v0

    const/4 v10, 0x0

    :goto_f8
    if-ge v10, v9, :cond_113

    aget-object v11, v0, v10

    .line 68
    invoke-virtual {v11, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 70
    array-length v12, v11

    if-le v12, v4, :cond_110

    .line 71
    aget-object v11, v11, v4

    const-string v12, "/*$"

    const-string v13, "/"

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_110
    add-int/lit8 v10, v10, 0x1

    goto :goto_f8

    :cond_113
    new-array v0, v6, [Ljava/lang/String;

    .line 74
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/RootPathDetector;->try_sdcard_dirlist([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_131

    .line 75
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    const-string v3, "detectRootPaths: found in /proc/mounts"

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_e5 .. :try_end_128} :catch_146
    .catchall {:try_start_e5 .. :try_end_128} :catchall_144

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    goto/16 :goto_24

    .line 79
    :cond_131
    :try_start_131
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    const-string v3, "detectRootPaths: data folder not found"

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    sput-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    sput-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;
    :try_end_13c
    .catch Ljava/lang/Exception; {:try_start_131 .. :try_end_13c} :catch_146
    .catchall {:try_start_131 .. :try_end_13c} :catchall_144

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_155

    :catchall_144
    move-exception v0

    goto :goto_16d

    :catch_146
    move-exception v0

    .line 82
    :try_start_147
    sget-object v3, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    const-string v4, "detectRootPaths"

    invoke-static {v3, v4, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_14e
    .catchall {:try_start_147 .. :try_end_14e} :catchall_144

    .line 84
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :goto_155
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :goto_16d
    sget-object v3, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    throw v0
.end method

.method private static try_sdcardDir(Ljava/io/File;)Z
    .registers 4

    .line 89
    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->silent_startup:Z

    if-nez v0, :cond_1e

    .line 91
    sget-object v0, Lcom/navngo/igo/javaclient/RootPathDetector;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "trying "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    :cond_1e
    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->isDirectory(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_28

    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->check_folders_after_rebuild:Z

    if-eqz v0, :cond_30

    :cond_28
    const/4 v0, 0x0

    .line 94
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_62

    .line 95
    :cond_30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardRoot:Ljava/lang/String;

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    const/4 p0, 0x1

    return p0

    :cond_62
    const/4 p0, 0x0

    return p0
.end method

.method private static try_sdcard_dirlist([Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9

    .line 103
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v0, :cond_48

    aget-object v3, p0, v2

    .line 104
    new-instance v4, Ljava/io/File;

    const-string v5, "iGO"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/navngo/igo/javaclient/RootPathDetector;->try_sdcardDir(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_46

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/navngo/igo/javaclient/RootPathDetector;->try_sdcardDir(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_46

    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Android/data/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Lcom/navngo/igo/javaclient/Config;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/files"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/navngo/igo/javaclient/RootPathDetector;->try_sdcardDir(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_43

    goto :goto_46

    :cond_43
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_46
    :goto_46
    const/4 p0, 0x1

    return p0

    :cond_48
    return v1
.end method

###### Class com.navngo.igo.javaclient.RootPathDetector.AnonymousClass1 (com.navngo.igo.javaclient.RootPathDetector$1)
.class Lcom/navngo/igo/javaclient/RootPathDetector$1;
.super Ljava/lang/Object;
.source "RootPathDetector.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/RootPathDetector;->detect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/io/File;Ljava/io/File;)I
    .registers 4

    const/4 v0, 0x0

    .line 37
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p1

    array-length p1, p1

    .line 38
    invoke-static {p2, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p2

    array-length p2, p2

    if-ge p1, p2, :cond_f

    const/4 p1, 0x1

    return p1

    :cond_f
    if-le p1, p2, :cond_13

    const/4 p1, -0x1

    return p1

    :cond_13
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 34
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/RootPathDetector$1;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result p1

    return p1
.end method
