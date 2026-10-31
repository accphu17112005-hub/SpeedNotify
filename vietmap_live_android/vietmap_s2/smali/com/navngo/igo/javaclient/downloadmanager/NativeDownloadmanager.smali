###### Class com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager (com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager)
.class public Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;
.super Ljava/lang/Object;
.source "NativeDownloadmanager.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$SingletonHelper;
    }
.end annotation


# static fields
.field public static final ACTION_OPEN_SHOP:Ljava/lang/String; = "com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.ACTION_OPEN_SHOP"

.field public static final DESTINATION:Ljava/lang/String; = "dest"

.field public static final DESTINATION_TEMPORARY:Ljava/lang/String; = "destTmp"

.field public static final DOWNLOADED_PACKAGE_SIZE:Ljava/lang/String; = "downloadedPackageSize"

.field public static final DOWNLOADER_RECORDS:Ljava/lang/String; = "downloaderRecords"

.field public static final DOWNLOAD_ID:Ljava/lang/String; = "downloadId"

.field public static final DOWNLOAD_QUEUE:Ljava/lang/String; = "downloadQueue"

.field private static final INTERVAL:I = 0x3e8

.field public static final INVALID_VALUE:I = -0x1

.field public static final IN_PROGRESS_ID:Ljava/lang/String; = "inProgressId"

.field public static final IN_PROGRESS_OBJ:Ljava/lang/String; = "inProgressObj"

.field public static final NOTIFICATION_ID:I = 0x1

.field public static final PACKAGES:Ljava/lang/String; = "packages"

.field public static final PACKAGE_SIZE:Ljava/lang/String; = "packageSize"

.field public static final QUEUE:Ljava/lang/String; = "queue"

.field public static final REFERENCE_ID:Ljava/lang/String; = "referenceId"

.field public static final SIZE:Ljava/lang/String; = "size"

.field public static final TITLE:Ljava/lang/String; = "title"

.field public static final URL_CSTR:Ljava/lang/String; = "url"

.field public static final WIFI_ONLY:Ljava/lang/String; = "wifiOnly"

.field private static final logname:Ljava/lang/String; = "NativeDownloadmanager"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mHandlerTask:Ljava/lang/Runnable;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->initStatusSenderHandler()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;)V
    .registers 2

    .line 68
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)J
    .registers 3

    .line 68
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->sendProgressStatus()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;J)Z
    .registers 3

    .line 68
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->updateNotification(J)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)Ljava/lang/Runnable;
    .registers 1

    .line 68
    iget-object p0, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandlerTask:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$500(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)Landroid/os/Handler;
    .registers 1

    .line 68
    iget-object p0, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method private addSizeToPackage(Ljava/lang/String;JLorg/json/JSONArray;)Lorg/json/JSONArray;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 528
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "addSizeToPackage() title:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "size:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NativeDownloadmanager"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 531
    :goto_25
    invoke-virtual {p4}, Lorg/json/JSONArray;->length()I

    move-result v3

    const-string v4, "title"

    const-string v5, "packageSize"

    if-ge v1, v3, :cond_4c

    .line 532
    invoke-virtual {p4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 533
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 534
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_46

    .line 535
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    add-long/2addr v6, p2

    .line 536
    invoke-virtual {v3, v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const/4 v2, 0x1

    .line 539
    :cond_46
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    :cond_4c
    if-nez v2, :cond_5c

    .line 543
    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    .line 544
    invoke-virtual {p4, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 545
    invoke-virtual {p4, v5, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 546
    invoke-virtual {v0, p4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_5c
    return-object v0
.end method

.method private checkDownload()V
    .registers 8

    .line 294
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "downloaderRecords"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "referenceId"

    const-wide/16 v3, -0x1

    .line 295
    invoke-interface {v0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 296
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CheckDownload() savedReferenceId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "NativeDownloadmanager"

    invoke-static {v4, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v5, 0x0

    cmp-long v3, v0, v5

    if-gez v3, :cond_74

    .line 299
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->stopReportSending()V

    .line 300
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->next()Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_3f

    const-string v1, "CheckDownload() next is not null"

    .line 302
    invoke-static {v4, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->startDownload(Lorg/json/JSONObject;)V

    goto :goto_74

    .line 305
    :cond_3f
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/4 v1, 0x1

    .line 306
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 308
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->getMainActivityIntentWithShopExtra()Landroid/content/Intent;

    move-result-object v3

    if-eqz v3, :cond_74

    .line 310
    sget-object v4, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const/high16 v5, 0xc000000

    invoke-static {v4, v2, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 311
    sget-object v3, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    sget v5, Lcom/navngo/igo/javaclient/R$string;->content_download_finished:I

    invoke-virtual {v4, v5}, Lcom/navngo/igo/javaclient/Application;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createHeadsUpNotification(Landroid/content/Context;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_74
    :goto_74
    return-void
.end method

.method private declared-synchronized clearDownloadQueue()V
    .registers 4

    monitor-enter p0

    :try_start_1
    const-string v0, "NativeDownloadmanager"

    const-string v1, "clearDownloadQueue"

    .line 179
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->stopReportSending()V

    .line 181
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->clearOSQueue()V

    .line 182
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "downloaderRecords"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 183
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 184
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 185
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 186
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/4 v1, 0x1

    .line 187
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_2f
    .catchall {:try_start_1 .. :try_end_2f} :catchall_31

    .line 188
    monitor-exit p0

    return-void

    :catchall_31
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private clearOSQueue()V
    .registers 9

    const-string v0, "NativeDownloadmanager"

    const-string v1, "clearOSQueue"

    .line 157
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "download"

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    .line 159
    new-instance v2, Landroid/app/DownloadManager$Query;

    invoke-direct {v2}, Landroid/app/DownloadManager$Query;-><init>()V

    const/16 v3, 0x1f

    invoke-virtual {v2, v3}, Landroid/app/DownloadManager$Query;->setFilterByStatus(I)Landroid/app/DownloadManager$Query;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v2

    .line 165
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "clearOSQueue, count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_70

    .line 167
    :goto_3e
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_70

    const-string v3, "_id"

    .line 168
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 169
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "clearOSQueue, dropping download, id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x1

    new-array v4, v4, [J

    const/4 v5, 0x0

    int-to-long v6, v3

    aput-wide v6, v4, v5

    .line 170
    invoke-virtual {v1, v4}, Landroid/app/DownloadManager;->remove([J)I

    .line 171
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_3e

    .line 174
    :cond_70
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;
    .registers 1

    .line 115
    invoke-static {}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$SingletonHelper;->access$100()Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    move-result-object v0

    return-object v0
.end method

.method private getMainActivityIntentWithShopExtra()Landroid/content/Intent;
    .registers 4

    .line 681
    invoke-static {}, Lcom/navngo/igo/javaclient/IgoActivity;->getMainActivityIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v1, 0x1

    const-string v2, "com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.ACTION_OPEN_SHOP"

    .line 683
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_c
    return-object v0
.end method

.method private static getRealPath(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GetRealPath input: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NativeDownloadmanager"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 99
    :try_start_1b
    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p0
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_1f} :catch_1f

    .line 101
    :catch_1f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GetRealPath output: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method private getSizeOfPackage(Ljava/lang/String;Lorg/json/JSONArray;)J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 578
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getSizeOfPackage() pkgName:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NativeDownloadmanager"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 579
    :goto_17
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_37

    .line 580
    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "title"

    .line 581
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 582
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    const-string p1, "packageSize"

    .line 583
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide p1

    return-wide p1

    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    :cond_37
    const-wide/16 p1, 0x0

    return-wide p1
.end method

.method private initStatusSenderHandler()V
    .registers 4

    const-string v0, "NativeDownloadmanager"

    const-string v1, "initStatusSenderHandler()"

    .line 119
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    :try_start_7
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandler:Landroid/os/Handler;

    .line 122
    new-instance v1, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;-><init>(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandlerTask:Ljava/lang/Runnable;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_19} :catch_1a

    goto :goto_1e

    :catch_1a
    move-exception v1

    .line 131
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1e
    const-string v1, "initStatusSenderHandler() done"

    .line 133
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private next()Lorg/json/JSONObject;
    .registers 16

    const-string v0, "queue"

    const-string v1, "inProgressId"

    const-string v2, "downloadQueue"

    const-string v3, "NativeDownloadmanager"

    const-string v4, "Next()"

    .line 419
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x0

    .line 422
    :try_start_e
    sget-object v5, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v6, "downloaderRecords"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 423
    invoke-interface {v5, v2, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_1e

    return-object v4

    :cond_1e
    const/4 v8, -0x1

    .line 428
    invoke-interface {v5, v1, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 429
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 430
    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 432
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V
    :try_end_31
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_31} :catch_7f

    move-object v12, v4

    const/4 v11, 0x0

    .line 434
    :goto_33
    :try_start_33
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v13
    :try_end_37
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_37} :catch_7c

    const-string v14, "downloadId"

    if-ge v11, v13, :cond_4b

    .line 435
    :try_start_3b
    invoke-virtual {v6, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 436
    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    if-eq v13, v8, :cond_48

    .line 439
    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_48
    add-int/lit8 v11, v11, 0x1

    goto :goto_33

    .line 443
    :cond_4b
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 444
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/4 v8, 0x1

    if-ge v6, v8, :cond_5a

    .line 445
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    goto :goto_78

    .line 448
    :cond_5a
    invoke-virtual {v10, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_5e
    .catch Lorg/json/JSONException; {:try_start_3b .. :try_end_5e} :catch_7c

    .line 449
    :try_start_5e
    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 451
    invoke-interface {v5, v1, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v1, "inProgressObj"

    .line 452
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v1, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 453
    invoke-virtual {v9, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 454
    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 456
    :goto_78
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_7b
    .catch Lorg/json/JSONException; {:try_start_5e .. :try_end_7b} :catch_7f

    goto :goto_98

    :catch_7c
    move-exception v0

    move-object v4, v12

    goto :goto_80

    :catch_7f
    move-exception v0

    .line 458
    :goto_80
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JSONException:exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_98
    const-string v0, "Next() finished"

    .line 461
    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-object v4
.end method

.method private onNotificationClicked()V
    .registers 5

    const-string v0, "NativeDownloadmanager"

    const-string v1, "onNotificationClicked"

    .line 689
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->startMainActivityInForeground()V

    .line 692
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 694
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    sget-object v1, Lcom/navngo/program/ProgramPhases$Phase;->RUNNING:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v2, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$2;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$2;-><init>(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)V

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    return-void
.end method

.method private sendProgressStatus()J
    .registers 13

    const-string v0, "NativeDownloadmanager"

    const-string v1, "sendProgressStatus()"

    .line 591
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "downloaderRecords"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "referenceId"

    const-wide/16 v4, -0x1

    .line 594
    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-string v2, "inProgressObj"

    const/4 v6, 0x0

    .line 597
    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "inProgressId"

    const/4 v8, -0x1

    .line 598
    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-wide/16 v7, 0x0

    cmp-long v9, v4, v7

    if-ltz v9, :cond_ec

    if-ltz v1, :cond_ec

    if-nez v2, :cond_32

    goto/16 :goto_ec

    .line 605
    :cond_32
    :try_start_32
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 606
    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    move-result v2

    if-nez v2, :cond_3e

    return-wide v7

    .line 610
    :cond_3e
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v9, "download"

    invoke-virtual {v2, v9}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/DownloadManager;

    .line 611
    new-instance v9, Landroid/app/DownloadManager$Query;

    invoke-direct {v9}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v10, 0x1

    new-array v11, v10, [J

    aput-wide v4, v11, v3

    invoke-virtual {v9, v11}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_5a} :catch_c2
    .catchall {:try_start_32 .. :try_end_5a} :catchall_c0

    .line 613
    :try_start_5a
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_af

    const-string v4, "bytes_so_far"

    .line 615
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    const-string v4, "total_size"

    .line 616
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 618
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, " sendProgressStatus() downloadedBytes:"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v11, "; totalBytes:"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v4

    const-string v5, "android.ndm.download_progress"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const-string v11, "downloadId"

    .line 621
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v9, v3

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v9, v10

    invoke-virtual {v4, v5, v6, v9}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_b4

    :cond_af
    const-string v1, "sendProgressStatus() move to first failed"

    .line 624
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_b4} :catch_bd
    .catchall {:try_start_5a .. :try_end_b4} :catchall_ba

    :goto_b4
    if-eqz v2, :cond_e0

    .line 630
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_e0

    :catchall_ba
    move-exception v0

    move-object v6, v2

    goto :goto_e6

    :catch_bd
    move-exception v1

    move-object v6, v2

    goto :goto_c3

    :catchall_c0
    move-exception v0

    goto :goto_e6

    :catch_c2
    move-exception v1

    .line 627
    :goto_c3
    :try_start_c3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSONException:exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_db
    .catchall {:try_start_c3 .. :try_end_db} :catchall_c0

    if-eqz v6, :cond_e0

    .line 630
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_e0
    :goto_e0
    const-string v1, "sendProgressStatus() done"

    .line 634
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v7

    :goto_e6
    if-eqz v6, :cond_eb

    .line 630
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 632
    :cond_eb
    throw v0

    :cond_ec
    :goto_ec
    return-wide v7
.end method

.method private startDownload(Lorg/json/JSONObject;)V
    .registers 13

    const-string v0, "download"

    const-string v1, "NativeDownloadmanager"

    const-string v2, "startDownload()"

    .line 368
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_9
    const-string v2, "size"

    .line 370
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v4, "url"

    .line 371
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "destTmp"

    .line 372
    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "wifiOnly"

    .line 373
    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    .line 376
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "startDownload() size: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, "; url:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "; dest:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "; servicestring:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    sget-object v6, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v6, v0}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    .line 379
    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 380
    new-instance v7, Landroid/app/DownloadManager$Request;

    invoke-direct {v7, v6}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 382
    sget-object v6, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v6}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    sget-object v8, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v6, v8}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 383
    invoke-virtual {v6}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_ae

    .line 384
    invoke-virtual {v6}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    add-int/2addr v8, v9

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 385
    sget-object v8, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v8}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    sget-object v10, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v7, v8, v10, v5}, Landroid/app/DownloadManager$Request;->setDestinationInExternalFilesDir(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 386
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "startDownload() temp file directory:"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " subpath:"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ce

    .line 388
    :cond_ae
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "startDownload() temp file :"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 391
    :goto_ce
    invoke-virtual {v7, v9}, Landroid/app/DownloadManager$Request;->setVisibleInDownloadsUi(Z)Landroid/app/DownloadManager$Request;

    const/4 v5, 0x2

    .line 392
    invoke-virtual {v7, v5}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    if-eqz p1, :cond_da

    .line 395
    invoke-virtual {v7, v5}, Landroid/app/DownloadManager$Request;->setAllowedNetworkTypes(I)Landroid/app/DownloadManager$Request;

    .line 397
    :cond_da
    invoke-virtual {v0, v7}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    move-result-wide v5

    .line 400
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v0, "downloaderRecords"

    const/4 v7, 0x0

    invoke-virtual {p1, v0, v7}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 401
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "referenceId"

    .line 402
    invoke-interface {p1, v0, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 403
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 405
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->startReportSending()V

    .line 407
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "File downloading. refid:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " size:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " byte, url: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11a
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_11a} :catch_135
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_11a} :catch_11b

    goto :goto_14e

    :catch_11b
    move-exception p1

    .line 412
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IOException:exception: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_14e

    :catch_135
    move-exception p1

    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "JSONException:exception: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_14e
    const-string p1, "startDownload() done"

    .line 415
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private startReportSending()V
    .registers 3

    const-string v0, "NativeDownloadmanager"

    const-string v1, "startReportSending()"

    .line 137
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandlerTask:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private stopReportSending()V
    .registers 3

    .line 142
    iget-object v0, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->mHandlerTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private subtractSizeFromPackage(Ljava/lang/String;JLorg/json/JSONArray;)Lorg/json/JSONArray;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "subtractSizeFromPackage() title:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "size:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NativeDownloadmanager"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 555
    :goto_25
    invoke-virtual {p4}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_57

    .line 556
    invoke-virtual {p4, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "title"

    .line 557
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 559
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    const-string v4, "packageSize"

    .line 560
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    sub-long/2addr v5, p2

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_4c

    .line 563
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    goto :goto_4e

    :cond_4c
    const/4 v4, 0x0

    goto :goto_4f

    :cond_4e
    :goto_4e
    const/4 v4, 0x1

    :goto_4f
    if-eqz v4, :cond_54

    .line 570
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_54
    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    :cond_57
    return-object v0
.end method

.method private updateNotification(J)Z
    .registers 21

    const-string v1, "NativeDownloadmanager"

    const-string v0, "updateNotification()"

    .line 640
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, ""

    .line 645
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v3, "downloaderRecords"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v3, "downloadQueue"

    const/4 v5, 0x0

    .line 646
    invoke-interface {v0, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "inProgressObj"

    .line 647
    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_e6

    if-nez v3, :cond_25

    goto/16 :goto_e6

    :cond_25
    const-wide/16 v6, 0x0

    .line 653
    :try_start_27
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 654
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "packages"

    .line 655
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const-string v5, "title"

    .line 656
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_3d
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_3d} :catch_78

    move-object/from16 v5, p0

    .line 657
    :try_start_3f
    invoke-direct {v5, v2, v3}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->getSizeOfPackage(Ljava/lang/String;Lorg/json/JSONArray;)J

    move-result-wide v8
    :try_end_43
    .catch Lorg/json/JSONException; {:try_start_3f .. :try_end_43} :catch_76

    :try_start_43
    const-string v3, "downloadedPackageSize"

    .line 658
    invoke-interface {v0, v3, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v10
    :try_end_49
    .catch Lorg/json/JSONException; {:try_start_43 .. :try_end_49} :catch_72

    add-long v10, p1, v10

    .line 659
    :try_start_4b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateNotification() title:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " -- fullSize:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " -- progressCurrent:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6f
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_6f} :catch_70

    goto :goto_96

    :catch_70
    move-exception v0

    goto :goto_7e

    :catch_72
    move-exception v0

    move-wide/from16 v10, p1

    goto :goto_7e

    :catch_76
    move-exception v0

    goto :goto_7b

    :catch_78
    move-exception v0

    move-object/from16 v5, p0

    :goto_7b
    move-wide/from16 v10, p1

    move-wide v8, v6

    .line 661
    :goto_7e
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "JSONException:exception: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_96
    move-object v14, v2

    .line 664
    new-instance v0, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;-><init>()V

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;->register()V

    cmp-long v0, v8, v6

    if-lez v0, :cond_ac

    const-wide/16 v0, 0x64

    mul-long v0, v0, v10

    .line 668
    div-long/2addr v0, v8

    long-to-int v1, v0

    move/from16 v17, v1

    goto :goto_ae

    :cond_ac
    const/16 v17, 0x0

    .line 671
    :goto_ae
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->getMainActivityIntentWithShopExtra()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_e0

    .line 673
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/high16 v3, 0xc000000

    invoke-static {v2, v4, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v15

    .line 674
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "notification"

    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 675
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    const-string v2, "Downloading content"

    invoke-static {v2}, Lcom/navngo/igo/javaclient/I18N;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const/16 v16, 0x64

    invoke-static/range {v12 .. v17}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createWithProgressBar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;II)Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_e0
    cmp-long v0, v8, v10

    if-lez v0, :cond_e5

    const/4 v4, 0x1

    :cond_e5
    return v4

    :cond_e6
    :goto_e6
    move-object/from16 v5, p0

    const-string v0, "updateNotification() No json data found"

    .line 649
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v4
.end method


# virtual methods
.method public declared-synchronized download(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;JZ)V
    .registers 16

    monitor-enter p0

    .line 318
    :try_start_1
    invoke-static {p2}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->getRealPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 319
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".tmp"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NativeDownloadmanager"

    .line 320
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "download url:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " dest:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " downloadId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " title:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " size:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "downloaderRecords"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "downloadQueue"

    const/4 v3, 0x0

    .line 322
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_5c
    .catchall {:try_start_1 .. :try_end_5c} :catchall_111

    if-nez v2, :cond_6e

    .line 330
    :try_start_5e
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 331
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 332
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    goto :goto_82

    .line 334
    :cond_6e
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "queue"

    .line 335
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const-string v4, "packages"

    .line 336
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    move-object v7, v3

    move-object v3, v2

    move-object v2, v7

    .line 339
    :goto_82
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "url"

    .line 340
    invoke-virtual {v5, v6, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "size"

    .line 341
    invoke-virtual {v5, v6, p5, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v6, "dest"

    .line 342
    invoke-virtual {v5, v6, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "destTmp"

    .line 343
    invoke-virtual {v5, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "downloadId"

    .line 344
    invoke-virtual {v5, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p2, "title"

    .line 345
    invoke-virtual {v5, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "wifiOnly"

    .line 346
    invoke-virtual {v5, p2, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 347
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 349
    invoke-direct {p0, p4, p5, p6, v4}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->addSizeToPackage(Ljava/lang/String;JLorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p2

    const-string p3, "queue"

    .line 350
    invoke-virtual {v2, p3, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p3, "packages"

    .line 351
    invoke-virtual {v2, p3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 353
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    const-string p3, "downloadQueue"

    .line 354
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-interface {p2, p3, p4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 356
    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    const-string p2, "NativeDownloadmanager"

    .line 358
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "File added to queue. size:"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p4, " bytes, URL: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_e9
    .catch Lorg/json/JSONException; {:try_start_5e .. :try_end_e9} :catch_ea
    .catchall {:try_start_5e .. :try_end_e9} :catchall_111

    goto :goto_105

    :catch_ea
    move-exception p1

    :try_start_eb
    const-string p2, "NativeDownloadmanager"

    .line 360
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "JSONException:exception: "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    :goto_105
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->checkDownload()V

    const-string p1, "NativeDownloadmanager"

    const-string p2, "download() finished"

    .line 364
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10f
    .catchall {:try_start_eb .. :try_end_10f} :catchall_111

    .line 365
    monitor-exit p0

    return-void

    :catchall_111
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized drop(I)V
    .registers 19

    move-object/from16 v1, p0

    move/from16 v0, p1

    monitor-enter p0

    :try_start_5
    const-string v2, "NativeDownloadmanager"

    .line 467
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "drop(), downloadId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v3, "downloaderRecords"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 469
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v5, "downloadQueue"

    const/4 v6, 0x0

    .line 470
    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3d

    const-string v0, "NativeDownloadmanager"

    const-string v2, "download queue cannot be found"

    .line 472
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->checkDownload()V
    :try_end_3b
    .catchall {:try_start_5 .. :try_end_3b} :catchall_167

    .line 474
    monitor-exit p0

    return-void

    :cond_3d
    :try_start_3d
    const-string v6, "inProgressId"

    const/4 v7, -0x1

    .line 476
    invoke-interface {v2, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6
    :try_end_44
    .catchall {:try_start_3d .. :try_end_44} :catchall_167

    .line 478
    :try_start_44
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v5, "queue"

    .line 479
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const-string v9, "packages"

    .line 480
    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 482
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10}, Lorg/json/JSONArray;-><init>()V

    const/4 v11, 0x0

    .line 484
    :goto_5b
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v12

    const/4 v13, 0x1

    if-ge v11, v12, :cond_e6

    .line 485
    invoke-virtual {v5, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    const-string v14, "downloadId"

    .line 486
    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    if-ne v14, v0, :cond_da

    const-string v15, "size"

    move-object/from16 v16, v8

    .line 489
    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v7

    const-string v15, "title"

    .line 490
    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 491
    invoke-direct {v1, v12, v7, v8, v9}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->subtractSizeFromPackage(Ljava/lang/String;JLorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v7

    if-ne v0, v6, :cond_bd

    const-string v6, "NativeDownloadmanager"

    .line 493
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ".drop savedDownloadId:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " - stop the running download task"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    sget-object v6, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v8, "download"

    invoke-virtual {v6, v8}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/DownloadManager;

    const-string v8, "referenceId"

    const-wide/16 v14, -0x1

    .line 495
    invoke-interface {v2, v8, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    new-array v12, v13, [J

    aput-wide v8, v12, v4

    .line 496
    invoke-virtual {v6, v12}, Landroid/app/DownloadManager;->remove([J)I

    const-string v6, "referenceId"

    .line 498
    invoke-interface {v3, v6, v14, v15}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    const/4 v6, -0x1

    goto :goto_d8

    :cond_bd
    const-string v8, "NativeDownloadmanager"

    .line 500
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, ".drop savedDownloadId:"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " - this task has been removed"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_d8
    move-object v9, v7

    goto :goto_df

    :cond_da
    move-object/from16 v16, v8

    .line 503
    invoke-virtual {v10, v12}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_df
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v8, v16

    const/4 v7, -0x1

    goto/16 :goto_5b

    :cond_e6
    move-object/from16 v16, v8

    .line 507
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v0, v13, :cond_f9

    const-string v0, "NativeDownloadmanager"

    const-string v2, "drop() preferences cleared"

    .line 508
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    goto :goto_113

    :cond_f9
    const-string v0, "queue"

    move-object/from16 v2, v16

    .line 511
    invoke-virtual {v2, v0, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "packages"

    .line 512
    invoke-virtual {v2, v0, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "inProgressId"

    .line 514
    invoke-interface {v3, v0, v6}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string v0, "downloadQueue"

    .line 515
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 517
    :goto_113
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    const-string v0, "NativeDownloadmanager"

    .line 518
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "drop() after - inProgressId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "NativeDownloadmanager"

    .line 519
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "drop() DOWNLOAD_QUEUE jsonString after:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_146
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_146} :catch_147
    .catchall {:try_start_44 .. :try_end_146} :catchall_167

    goto :goto_162

    :catch_147
    move-exception v0

    :try_start_148
    const-string v2, "NativeDownloadmanager"

    .line 521
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "drop() JSONException:exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    :goto_162
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->checkDownload()V
    :try_end_165
    .catchall {:try_start_148 .. :try_end_165} :catchall_167

    .line 525
    monitor-exit p0

    return-void

    :catchall_167
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p1, :cond_d

    const-string v1, "com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.ACTION_OPEN_SHOP"

    .line 704
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_d

    const/4 p1, 0x1

    return p1

    :cond_d
    return v0
.end method

.method public declared-synchronized onDownloadFailed(JI)V
    .registers 10

    monitor-enter p0

    :try_start_1
    const-string v0, "NativeDownloadmanager"

    .line 265
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDownloadFailed referenceId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "download"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    const/4 v1, 0x1

    new-array v2, v1, [J

    const/4 v3, 0x0

    aput-wide p1, v2, v3

    .line 268
    invoke-virtual {v0, v2}, Landroid/app/DownloadManager;->remove([J)I

    .line 269
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string p2, "downloaderRecords"

    invoke-virtual {p1, p2, v3}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string p2, "inProgressObj"

    const/4 v0, 0x0

    .line 270
    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v2, "inProgressId"

    const/4 v4, -0x1

    .line 271
    invoke-interface {p1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2
    :try_end_40
    .catchall {:try_start_1 .. :try_end_40} :catchall_b4

    if-ltz v2, :cond_a1

    if-eqz p2, :cond_a1

    .line 274
    :try_start_44
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 275
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result p2

    if-lez p2, :cond_a1

    const-string p2, "downloadId"

    .line 276
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p2

    const-string v2, "NativeDownloadmanager"

    .line 277
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onDownloadFailed downloadId:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_a1

    .line 279
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v2

    const-string v4, "android.ndm.download_failed"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 280
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v5, v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v5, v1

    invoke-virtual {v2, v4, v0, v5}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V
    :try_end_85
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_85} :catch_86
    .catchall {:try_start_44 .. :try_end_85} :catchall_b4

    goto :goto_a1

    :catch_86
    move-exception p2

    :try_start_87
    const-string p3, "NativeDownloadmanager"

    .line 284
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "JSONException:exception: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    :cond_a1
    :goto_a1
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "referenceId"

    const-wide/16 v0, -0x1

    .line 288
    invoke-interface {p1, p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 289
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 290
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->checkDownload()V
    :try_end_b2
    .catchall {:try_start_87 .. :try_end_b2} :catchall_b4

    .line 291
    monitor-exit p0

    return-void

    :catchall_b4
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onDownloadSuccess(J)V
    .registers 16

    monitor-enter p0

    :try_start_1
    const-string v0, "NativeDownloadmanager"

    .line 199
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnDownloadSuccess referenceId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "downloaderRecords"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "inProgressObj"

    const/4 v3, 0x0

    .line 202
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "inProgressId"

    const/4 v5, -0x1

    .line 203
    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_1a0

    const-wide/16 v5, -0x1

    const/4 v7, 0x1

    if-ltz v4, :cond_168

    if-eqz v1, :cond_168

    .line 206
    :try_start_35
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v8}, Lorg/json/JSONObject;->length()I

    move-result v1

    if-lez v1, :cond_119

    const-string v1, "downloadId"

    .line 208
    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v4, "destTmp"

    .line 209
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v9, "dest"

    .line 210
    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 212
    sget-object v10, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v10}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v10

    sget-object v11, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 214
    invoke-virtual {v10}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_84

    .line 215
    new-instance v11, Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v12, v7

    invoke-virtual {v4, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v10, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v10}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v10

    goto :goto_92

    .line 216
    :cond_84
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v11}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v10

    :goto_92
    if-nez v10, :cond_bc

    const-string v1, "NativeDownloadmanager"

    .line 218
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "OnDownloadSuccess failed to move downloaded file destTmp:\'"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\' destReal:\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    invoke-virtual {p0, p1, p2, v7}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->onDownloadFailed(JI)V
    :try_end_ba
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_ba} :catch_14c
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_ba} :catch_130
    .catchall {:try_start_35 .. :try_end_ba} :catchall_1a0

    .line 220
    monitor-exit p0

    return-void

    :cond_bc
    :try_start_bc
    const-string v4, "NativeDownloadmanager"

    .line 223
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "OnDownloadSuccess downloadId:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v4, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_e5

    .line 225
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v4

    const-string v9, "android.ndm.download_finished"

    new-array v10, v7, [Ljava/lang/Object;

    .line 226
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v10, v2

    invoke-virtual {v4, v9, v3, v10}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :cond_e5
    const-string v1, "size"

    .line 230
    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 231
    invoke-direct {p0, v3, v4}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->updateNotification(J)Z

    move-result v1

    if-nez v1, :cond_ff

    .line 233
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "downloadedPackageSize"

    .line 234
    invoke-interface {v1, v3, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 235
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_17e

    :cond_ff
    const-wide/16 v8, 0x0

    cmp-long v1, v3, v8

    if-lez v1, :cond_17e

    const-string v1, "downloadedPackageSize"

    .line 237
    invoke-interface {v0, v1, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 238
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v10, "downloadedPackageSize"

    add-long/2addr v8, v3

    .line 239
    invoke-interface {v1, v10, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 240
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_17e

    :cond_119
    const-string v1, "NativeDownloadmanager"

    .line 245
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No process in progress"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12f
    .catch Lorg/json/JSONException; {:try_start_bc .. :try_end_12f} :catch_14c
    .catch Ljava/io/IOException; {:try_start_bc .. :try_end_12f} :catch_130
    .catchall {:try_start_bc .. :try_end_12f} :catchall_1a0

    goto :goto_17e

    :catch_130
    move-exception v1

    :try_start_131
    const-string v3, "NativeDownloadmanager"

    .line 250
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "IOException:exception: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_17e

    :catch_14c
    move-exception v1

    const-string v3, "NativeDownloadmanager"

    .line 248
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "JSONException:exception: "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_17e

    :cond_168
    const-string v1, "NativeDownloadmanager"

    .line 253
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " cannot send progress for progressid:"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    :cond_17e
    :goto_17e
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v3, "download"

    invoke-virtual {v1, v3}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/DownloadManager;

    new-array v3, v7, [J

    aput-wide p1, v3, v2

    .line 257
    invoke-virtual {v1, v3}, Landroid/app/DownloadManager;->remove([J)I

    .line 258
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "referenceId"

    .line 259
    invoke-interface {p1, p2, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 260
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 261
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->checkDownload()V
    :try_end_19e
    .catchall {:try_start_131 .. :try_end_19e} :catchall_1a0

    .line 262
    monitor-exit p0

    return-void

    :catchall_1a0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onEngineClose(Z)V
    .registers 2

    .line 195
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->clearDownloadQueue()V

    return-void
.end method

.method public onEngineStart(Z)V
    .registers 2

    .line 191
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->clearDownloadQueue()V

    return-void
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 2

    .line 711
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->matchesIntent(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 712
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->onNotificationClicked()V

    const/4 p1, 0x1

    return p1

    :cond_b
    const/4 p1, 0x0

    return p1
.end method

.method public registerFunctors()V
    .registers 4

    const-string v0, "NativeDownloadmanager"

    const-string v1, "registerFunctors"

    .line 147
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.ndm.download"

    const-string v2, "download"

    .line 149
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.ndm.drop"

    const-string v2, "drop"

    .line 150
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.ndm.fetch_size"

    const-string v2, "fetchSizeIgo"

    .line 151
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.ndm.on_engine_start"

    const-string v2, "onEngineStart"

    .line 152
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.ndm.on_engine_close"

    const-string v2, "onEngineClose"

    .line 153
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.AnonymousClass1 (com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager$1)
.class Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;
.super Ljava/lang/Object;
.source "NativeDownloadmanager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->initStatusSenderHandler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)V
    .registers 2

    .line 122
    iput-object p1, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;->this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 125
    iget-object v0, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;->this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->access$200(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)J

    move-result-wide v0

    .line 126
    iget-object v2, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;->this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    invoke-static {v2, v0, v1}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->access$300(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;J)Z

    .line 127
    iget-object v0, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;->this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->access$500(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;->this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->access$400(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.AnonymousClass2 (com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager$2)
.class Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$2;
.super Ljava/lang/Object;
.source "NativeDownloadmanager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->onNotificationClicked()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;)V
    .registers 2

    .line 694
    iput-object p1, p0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$2;->this$0:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 697
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "sc_GoTo_Shop"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager.SingletonHelper (com.navngo.igo.javaclient.downloadmanager.NativeDownloadmanager$SingletonHelper)
.class Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$SingletonHelper;
.super Ljava/lang/Object;
.source "NativeDownloadmanager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonHelper"
.end annotation


# static fields
.field private static final instance:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 111
    new-instance v0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;-><init>(Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$1;)V

    sput-object v0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$SingletonHelper;->instance:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;
    .registers 1

    .line 109
    sget-object v0, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager$SingletonHelper;->instance:Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    return-object v0
.end method
