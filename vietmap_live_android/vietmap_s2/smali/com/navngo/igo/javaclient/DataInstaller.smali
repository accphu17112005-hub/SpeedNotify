###### Class com.navngo.igo.javaclient.DataInstaller (com.navngo.igo.javaclient.DataInstaller)
.class public Lcom/navngo/igo/javaclient/DataInstaller;
.super Ljava/lang/Object;
.source "DataInstaller.java"


# static fields
.field private static final logname:Ljava/lang/String; = "DataInstaller"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static RebuildDataDir(Landroid/content/res/Resources;Z)Ljava/lang/Exception;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "DataInstaller"

    const-string v1, "entering RebuildDataDir()"

    .line 93
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    sget-boolean v1, Lcom/navngo/igo/javaclient/Config;->check_for_dead_links:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_f

    .line 96
    invoke-static {p0, v2}, Lcom/navngo/igo/javaclient/DataInstaller;->recreateSoftLinks(Landroid/content/res/Resources;Z)V

    :cond_f
    if-nez p1, :cond_2c

    const-string p1, "folders"

    const-string v1, "zero_check_filter_list"

    const-string v3, "sys.txt"

    .line 99
    invoke-static {p1, v1, v3}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 100
    new-instance v1, Ljava/io/File;

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v3, "\\s+"

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v2}, Lcom/navngo/igo/javaclient/DataInstaller;->hasZeroSizeFile(Ljava/io/File;[Ljava/lang/String;Z)Z

    move-result p1

    :cond_2c
    move v4, p1

    if-eqz v4, :cond_37

    .line 104
    sget-object p1, Lcom/navngo/igo/javaclient/NNG;->intParams:[I

    const/4 v1, 0x1

    aput v1, p1, v2

    .line 105
    invoke-static {p0}, Lcom/navngo/igo/javaclient/DataInstaller;->RebuildDataDir_serverFolder(Landroid/content/res/Resources;)V

    .line 109
    :cond_37
    new-instance p1, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "license"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 110
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "content/lang"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 111
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "content/voice"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    new-instance v8, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v9, 0x0

    move-object v3, p0

    move-object v5, p1

    move-object v6, v1

    move-object v7, v2

    .line 116
    :try_start_9c
    invoke-static/range {v3 .. v8}, Lcom/navngo/igo/javaclient/DataInstaller;->RebuildDataDir_SDCard(Landroid/content/res/Resources;ZLjava/io/File;Ljava/io/File;Ljava/io/File;Ljava/io/File;)V
    :try_end_9f
    .catch Ljava/io/IOException; {:try_start_9c .. :try_end_9f} :catch_a0

    goto :goto_a1

    :catch_a0
    move-exception v9

    .line 127
    :goto_a1
    :try_start_a1
    sget-boolean p0, Lcom/navngo/igo/javaclient/Config;->check_folders_after_rebuild:Z

    if-eqz p0, :cond_b4

    .line 128
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->extlist_license:[Ljava/lang/String;

    invoke-static {p1, p0}, Lcom/navngo/igo/javaclient/DataInstaller;->checkFolderContent(Ljava/io/File;[Ljava/lang/String;)V

    .line 129
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->extlist_lang:[Ljava/lang/String;

    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DataInstaller;->checkFolderContent(Ljava/io/File;[Ljava/lang/String;)V

    .line 130
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->extlist_voice:[Ljava/lang/String;

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DataInstaller;->checkFolderContent(Ljava/io/File;[Ljava/lang/String;)V
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_b4} :catch_ba

    :cond_b4
    const-string p0, "exiting RebuildDataDir()"

    .line 137
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-object v9

    :catch_ba
    move-exception p0

    if-eqz v9, :cond_be

    .line 133
    throw v9

    .line 134
    :cond_be
    throw p0
.end method

.method private static RebuildDataDir_SDCard(Landroid/content/res/Resources;ZLjava/io/File;Ljava/io/File;Ljava/io/File;Ljava/io/File;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 316
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->assets_to_install:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_5
    const-string v4, "DataInstaller"

    if-ge v3, v1, :cond_51

    aget-object v5, v0, v3

    .line 317
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x2e

    const/16 v8, 0x5f

    .line 318
    invoke-virtual {v5, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    if-nez p1, :cond_31

    .line 319
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_4e

    :cond_31
    invoke-static {p0, v5, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I

    move-result v7

    if-eqz v7, :cond_4e

    .line 320
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "creating "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    invoke-static {p0, v5, v6}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_51
    const-string v0, "license_zip"

    .line 327
    invoke-static {p0, v0, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I

    move-result v1

    const-string v3, ""

    if-eqz v1, :cond_cd

    if-nez p1, :cond_66

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->extlist_license:[Ljava/lang/String;

    .line 329
    invoke-static {p2, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p2

    array-length p2, p2

    if-nez p2, :cond_cd

    :cond_66
    const-string p2, "creating license/"

    .line 330
    invoke-static {v4, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "license.zip"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 332
    invoke-static {p0, v0, p2}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    :try_start_81
    const-string v0, "folders"

    const-string v1, "license"

    .line 334
    invoke-static {v0, v1, v3}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0
    :try_end_8d
    .catchall {:try_start_81 .. :try_end_8d} :catchall_c3

    const-string v1, "license/"

    if-nez v0, :cond_a6

    .line 335
    :try_start_91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v3, v0}, Lcom/navngo/igo/javaclient/utils/ZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ba

    .line 337
    :cond_a6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v3, v0}, Lcom/navngo/igo/javaclient/utils/ZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_ba
    .catchall {:try_start_91 .. :try_end_ba} :catchall_c3

    .line 340
    :goto_ba
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_cd

    :catchall_c3
    move-exception p0

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 341
    throw p0

    :cond_cd
    :goto_cd
    const-string p2, "content_zip"

    .line 345
    invoke-static {p0, p2, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I

    move-result v0

    const-string v1, "android"

    if-eqz v0, :cond_151

    if-nez p1, :cond_eb

    sget-object v0, Lcom/navngo/igo/javaclient/Config;->extlist_lang:[Ljava/lang/String;

    .line 347
    invoke-static {p3, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p3

    array-length p3, p3

    if-eqz p3, :cond_eb

    sget-object p3, Lcom/navngo/igo/javaclient/Config;->extlist_voice:[Ljava/lang/String;

    .line 348
    invoke-static {p4, p3}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p3

    array-length p3, p3

    if-nez p3, :cond_151

    :cond_eb
    const-string p3, "creating content/"

    .line 350
    invoke-static {v4, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "copy_content_to_data_dir"

    .line 351
    invoke-static {v1, p3, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_fb

    sget-object p3, Lcom/navngo/igo/javaclient/Config;->dataDir:Ljava/lang/String;

    goto :goto_fd

    :cond_fb
    sget-object p3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    .line 352
    :goto_fd
    sget-object p4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_116

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 353
    :cond_116
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "content.zip"

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 354
    invoke-static {p0, p2, p4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    :try_start_12a
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "content/"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p4, v3, p2}, Lcom/navngo/igo/javaclient/utils/ZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13e
    .catchall {:try_start_12a .. :try_end_13e} :catchall_147

    .line 362
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    goto :goto_151

    :catchall_147
    move-exception p0

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 363
    throw p0

    .line 367
    :cond_151
    :goto_151
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "/"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "ui_plugins_zip"

    .line 368
    invoke-static {p0, p3, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I

    move-result p4

    if-eqz p4, :cond_225

    if-nez p1, :cond_17c

    sget-object p4, Lcom/navngo/igo/javaclient/Config;->extlist_plugins:[Ljava/lang/String;

    .line 370
    invoke-static {p5, p4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p4

    array-length p4, p4

    if-nez p4, :cond_225

    :cond_17c
    const-string p4, "creating ui plugins"

    .line 372
    invoke-static {v4, p4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "temp_files_in_server_folder"

    invoke-static {v1, p5, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p5

    if-eqz p5, :cond_191

    sget-object p5, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    goto :goto_193

    :cond_191
    sget-object p5, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    :goto_193
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p5, "ui_plugins.zip"

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    const-string p5, "clear_ux_folder_before_install"

    const/4 v0, 0x1

    .line 375
    invoke-static {v1, p5, v0}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p5

    .line 376
    invoke-static {p0, p3, p4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    new-instance p3, Ljava/io/File;

    invoke-direct {p3, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_225

    .line 381
    :try_start_1b4
    new-instance p3, Ljava/io/File;

    invoke-direct {p3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 382
    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1c0

    goto :goto_20a

    .line 384
    :cond_1c0
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1db

    .line 385
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Non-directory: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v4, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_20a

    .line 386
    :cond_1db
    invoke-virtual {p3}, Ljava/io/File;->mkdirs()Z

    move-result p3

    if-eqz p3, :cond_1f6

    .line 387
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Directory created: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v4, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_20a

    .line 389
    :cond_1f6
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Directory creation failed: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v4, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_20a
    if-eqz p5, :cond_20f

    .line 392
    invoke-static {p2}, Lcom/navngo/igo/javaclient/DataInstaller;->deleteFolderContent(Ljava/lang/String;)V

    .line 394
    :cond_20f
    invoke-static {p4, v3, p2}, Lcom/navngo/igo/javaclient/utils/ZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_212
    .catchall {:try_start_1b4 .. :try_end_212} :catchall_21b

    .line 396
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    goto :goto_225

    :catchall_21b
    move-exception p0

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 397
    throw p0

    .line 406
    :cond_225
    :goto_225
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p3, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "tts_nua_ve1/"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "tts_zip"

    .line 408
    invoke-static {p0, p3, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I

    move-result p4

    if-eqz p4, :cond_280

    if-nez p1, :cond_24f

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p4, 0x0

    .line 410
    invoke-static {p1, p4}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p1

    array-length p1, p1

    if-nez p1, :cond_280

    :cond_24f
    const-string p1, "creating tts_nua_ve1/"

    .line 412
    invoke-static {v4, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p4, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "tts.zip"

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 414
    invoke-static {p0, p3, p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    :try_start_26a
    invoke-static {p1, v3, p2}, Lcom/navngo/igo/javaclient/utils/ZipUtility;->unzip(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_26d
    .catchall {:try_start_26a .. :try_end_26d} :catchall_276

    .line 418
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_280

    :catchall_276
    move-exception p0

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 419
    throw p0

    :cond_280
    :goto_280
    return-void
.end method

.method private static RebuildDataDir_serverFolder(Landroid/content/res/Resources;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 194
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/DataInstaller;->recreateSoftLinks(Landroid/content/res/Resources;Z)V

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "audiodirpath: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "DataInstaller"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 200
    invoke-static {v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->deleteRecursive(Ljava/io/File;)V

    .line 203
    sget v0, Lcom/navngo/igo/javaclient/R$raw;->sys:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "sys.txt"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyRawResource(Landroid/content/res/Resources;ILjava/lang/String;)V

    .line 213
    sget v0, Lcom/navngo/igo/javaclient/R$raw;->icudt64l:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "icudt64l.dat"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyRawResource(Landroid/content/res/Resources;ILjava/lang/String;)V

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "tahoma.ttf"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "deleting tahoma"

    .line 220
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    const-string v4, "deleted "

    if-eqz v3, :cond_ad

    .line 222
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    :cond_ad
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_ca

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    :cond_ca
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "FrutigerOTS.ttf"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 235
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "FrutigerNextCom-Regular.ttf"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "deleting frutti"

    .line 237
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_112

    .line 239
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    :cond_112
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_12f

    .line 241
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_12f
    const-string v0, "creating kuka_logger, monkey"

    .line 251
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    sget v0, Lcom/navngo/igo/javaclient/R$raw;->kuka_logger:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "kuka_logger.txt"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyRawResource(Landroid/content/res/Resources;ILjava/lang/String;)V

    .line 253
    sget v0, Lcom/navngo/igo/javaclient/R$raw;->monkey:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "monkey.txt"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyRawResource(Landroid/content/res/Resources;ILjava/lang/String;)V

    const-string v0, "interface"

    const-string v1, "vfont_enabled"

    const/4 v3, 0x0

    .line 256
    invoke-static {v0, v1, v3}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1a4

    const-string v0, "creating vfonts"

    .line 258
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "tahoma.vfont"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "tahoma_vfont"

    invoke-static {p0, v1, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "tahomabd.vfont"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "tahomabd_vfont"

    invoke-static {p0, v1, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    :cond_1a4
    :try_start_1a4
    const-class v0, Lcom/navngo/igo/javaclient/R$raw;

    const-string v1, "release"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    .line 267
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "release.txt"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyRawResource(Landroid/content/res/Resources;ILjava/lang/String;)V

    const-string v0, "Extracted release.txt from package"

    .line 268
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1cc
    .catch Ljava/lang/Exception; {:try_start_1a4 .. :try_end_1cc} :catch_1cd

    goto :goto_1d2

    :catch_1cd
    const-string v0, "No release.txt found in package"

    .line 272
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1d2
    const-string v0, "android"

    const-string v1, "additional_assets"

    const-string v4, ""

    .line 275
    invoke-static {v0, v1, v4}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 276
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_220

    const-string v1, ","

    .line 278
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 279
    array-length v1, v0

    :goto_1e9
    if-ge v3, v1, :cond_220

    aget-object v4, v0, v3

    .line 280
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x2e

    const/16 v7, 0x5f

    .line 281
    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 282
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "creating"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    invoke-static {p0, v4, v5}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1e9

    :cond_220
    return-void
.end method

.method public static RebuildLibDir(Landroid/content/res/Resources;Z)V
    .registers 4

    if-eqz p1, :cond_36

    const-string p0, "libigo_jni.so"

    .line 58
    new-instance p1, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_36

    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Deleted old version of "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DataInstaller"

    invoke-static {p1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_36
    return-void
.end method

.method public static SyncDirs(Ljava/io/File;Ljava/io/File;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 467
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    const-string v1, "SyncDirs: "

    const-string v2, "DataInstaller"

    if-nez v0, :cond_29

    .line 468
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->deleteRecursive(Ljava/io/File;)V

    .line 469
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " removed"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 472
    :cond_29
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_60

    .line 473
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_39

    .line 474
    invoke-virtual {p1}, Ljava/io/File;->mkdir()Z

    goto :goto_60

    .line 477
    :cond_39
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " added"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 482
    :cond_60
    :goto_60
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_a6

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_a6

    .line 483
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 484
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 485
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 486
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 487
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DataInstaller;->SyncDirs(Ljava/io/File;Ljava/io/File;)V

    goto :goto_8b

    :cond_a5
    return-void

    .line 491
    :cond_a6
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-eqz v0, :cond_e2

    .line 492
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 493
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->copyFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/io/File;->setLastModified(J)Z

    .line 495
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " rewritten"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_e2
    return-void
.end method

.method public static checkFactoryReset(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 4

    .line 501
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->def_factory_reset:Ljava/lang/String;

    const-string v1, "android"

    const-string v2, "factory_reset"

    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_59

    .line 502
    new-instance v1, Ljava/io/File;

    .line 503
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Config;->translatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_59

    if-eqz p0, :cond_25

    .line 505
    new-instance v2, Lcom/navngo/igo/javaclient/DataInstaller$1;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/DataInstaller$1;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 509
    :cond_25
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "iGO factory reset by "

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "DataInstaller"

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 511
    new-instance p0, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "save"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->deleteRecursive(Ljava/io/File;)V

    :cond_59
    return-void
.end method

.method private static checkFolderContent(Ljava/io/File;[Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/navngo/igo/javaclient/NNG$ImproperContent;
        }
    .end annotation

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    :goto_a
    if-ge v4, v1, :cond_1d

    aget-object v6, p1, v4

    if-eqz v5, :cond_12

    const/4 v5, 0x0

    goto :goto_17

    :cond_12
    const-string v7, ","

    .line 43
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    :goto_17
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_1d
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v2

    aput-object v0, v1, v3

    const-string v0, "checkFolderContent(%s, [%s])"

    .line 46
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "DataInstaller"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->getFileList(Ljava/io/File;[Ljava/lang/String;)[Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_3a

    .line 48
    array-length p1, p1

    if-nez p1, :cond_39

    goto :goto_3a

    :cond_39
    return-void

    .line 49
    :cond_3a
    :goto_3a
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    const-string v0, "iGO"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    .line 50
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    if-ltz p1, :cond_4e

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 51
    :cond_4e
    new-instance p1, Lcom/navngo/igo/javaclient/NNG$ImproperContent;

    invoke-direct {p1, p0}, Lcom/navngo/igo/javaclient/NNG$ImproperContent;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static checkLink(Ljava/lang/String;)Z
    .registers 2

    .line 143
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    return p0
.end method

.method private static createFolder(Ljava/lang/String;)V
    .registers 4

    .line 445
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 446
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_20

    :catch_9
    move-exception v0

    .line 448
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to create folder: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "DataInstaller"

    invoke-static {v1, p0, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_20
    return-void
.end method

.method private static deleteFolderContent(Ljava/lang/String;)V
    .registers 4

    .line 454
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 455
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_c

    return-void

    .line 460
    :cond_c
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x0

    :goto_12
    if-ge v1, v0, :cond_1c

    aget-object v2, p0, v1

    .line 462
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_1c
    return-void
.end method

.method private static getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 293
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "ASSET_LIST_LENGTH_CACHE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    if-nez p2, :cond_13

    const/4 p2, -0x1

    .line 298
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-le v1, p2, :cond_13

    return v1

    .line 305
    :cond_13
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    .line 306
    invoke-virtual {p0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length p0, p0

    .line 307
    invoke-interface {p2, p1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 308
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return p0
.end method

.method public static hasZeroSizeFile(Ljava/io/File;[Ljava/lang/String;Z)Z
    .registers 13

    .line 68
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 69
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3f

    .line 70
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_3f

    .line 72
    array-length v1, p0

    const/4 v3, 0x0

    :goto_13
    if-ge v2, v1, :cond_3e

    aget-object v4, p0, v2

    if-nez p2, :cond_23

    .line 73
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 74
    :cond_23
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_30

    .line 75
    invoke-static {v4, p1, v6}, Lcom/navngo/igo/javaclient/DataInstaller;->hasZeroSizeFile(Ljava/io/File;[Ljava/lang/String;Z)Z

    move-result v4

    or-int/2addr v3, v4

    goto :goto_3b

    .line 76
    :cond_30
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    const-wide/16 v7, 0x0

    cmp-long v9, v4, v7

    if-nez v9, :cond_3b

    return v6

    :cond_3b
    :goto_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_3e
    move v2, v3

    :cond_3f
    return v2
.end method

.method private static recreateSoftLinks(Landroid/content/res/Resources;Z)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "recreateSoftlink("

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "android_linked_root"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "DataInstaller"

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-static {p0, v1, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->recreateSoftlink(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_c3

    const/4 p0, 0x3

    const-string v0, "content"

    const-string v1, "license"

    const-string v2, "debug"

    .line 165
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_42
    const-string v3, "folders"

    if-ge v2, p0, :cond_6c

    .line 166
    aget-object v4, v0, v2

    .line 167
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 168
    invoke-static {v3, v4, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->recreateSoftlink(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_66

    add-int/lit8 v2, v2, 0x1

    goto :goto_42

    .line 169
    :cond_66
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 173
    :cond_6c
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ui_plugins"

    invoke-static {v3, v0, p0}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 174
    sget-object v0, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/NNG;->RecreateSoftlink(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_bb

    .line 178
    sget-object p0, Lcom/navngo/igo/javaclient/Config;->assets_to_install:[Ljava/lang/String;

    array-length v0, p0

    :goto_90
    if-ge v1, v0, :cond_ba

    aget-object v2, p0, v1

    const/16 v4, 0x2e

    const/16 v5, 0x5f

    .line 179
    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 181
    sget-object v5, Lcom/navngo/igo/javaclient/Config;->sdcardDir:Ljava/lang/String;

    invoke-static {v3, v4, v5}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 182
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2, p1}, Lcom/navngo/igo/javaclient/DataInstaller;->recreateSoftlink(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_b4

    add-int/lit8 v1, v1, 0x1

    goto :goto_90

    .line 183
    :cond_b4
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_ba
    return-void

    .line 175
    :cond_bb
    new-instance p0, Ljava/io/IOException;

    sget-object p1, Lcom/navngo/igo/javaclient/Config;->ux_plugin_folder:Ljava/lang/String;

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 161
    :cond_c3
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static recreateSoftlink(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 3

    if-nez p2, :cond_16

    .line 148
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_14

    invoke-static {p1}, Lcom/navngo/igo/javaclient/DataInstaller;->checkLink(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_14

    goto :goto_16

    :cond_14
    const/4 p0, 0x1

    return p0

    .line 149
    :cond_16
    :goto_16
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/NNG;->RecreateSoftlink(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static unpackDebugger(Landroid/content/res/Resources;)V
    .registers 7

    const-string v0, "DataInstaller"

    .line 522
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/navngo/igo/javaclient/Config;->serverFolder:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "gdbserver"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 523
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    .line 525
    :try_start_1b
    invoke-static {p0, v2, v4}, Lcom/navngo/igo/javaclient/DataInstaller;->getCachedAssetListLength(Landroid/content/res/Resources;Ljava/lang/String;Z)I

    move-result v5

    if-eqz v5, :cond_53

    .line 526
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "creating "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 527
    invoke-static {p0, v2, v1}, Lcom/navngo/igo/javaclient/utils/StreamUtility;->unsplitAsset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object p0

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "chmod"

    aput-object v5, v2, v3

    const-string v3, "755"

    aput-object v3, v2, v4

    const/4 v3, 0x2

    aput-object v1, v2, v3

    invoke-virtual {p0, v2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Process;->waitFor()I

    goto :goto_77

    .line 529
    :cond_53
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_77

    .line 530
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deleting "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_70} :catch_71

    goto :goto_77

    :catch_71
    move-exception p0

    const-string v1, "unpackDebugger"

    .line 534
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_77
    :goto_77
    return-void
.end method

###### Class com.navngo.igo.javaclient.DataInstaller.AnonymousClass1 (com.navngo.igo.javaclient.DataInstaller$1)
.class Lcom/navngo/igo/javaclient/DataInstaller$1;
.super Ljava/lang/Object;
.source "DataInstaller.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/DataInstaller;->checkFactoryReset(Lcom/navngo/igo/javaclient/IgoActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$ma:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 505
    iput-object p1, p0, Lcom/navngo/igo/javaclient/DataInstaller$1;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 506
    iget-object v0, p0, Lcom/navngo/igo/javaclient/DataInstaller$1;->val$ma:Lcom/navngo/igo/javaclient/IgoActivity;

    sget v1, Lcom/navngo/igo/javaclient/R$string;->factory_reset:I

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
