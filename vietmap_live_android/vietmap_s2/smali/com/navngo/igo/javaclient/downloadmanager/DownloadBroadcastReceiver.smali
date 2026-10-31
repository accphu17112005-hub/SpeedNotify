###### Class com.navngo.igo.javaclient.downloadmanager.DownloadBroadcastReceiver (com.navngo.igo.javaclient.downloadmanager.DownloadBroadcastReceiver)
.class public Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadBroadcastReceiver.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/receiver/IReceiver;


# static fields
.field public static final DLM_ERROR_DISK_IS_FULL:I = 0x2

.field public static final DLM_ERROR_FILESYSTEM:I = 0x1

.field public static final DLM_ERROR_FILE_INCONSISTENT:I = 0x3

.field public static final DLM_ERROR_INTERNAL:I = 0x5

.field public static final DLM_ERROR_NETWORK:I = 0x4

.field public static final DLM_ERROR_NO_ERROR:I = 0x0

.field private static final logname:Ljava/lang/String; = "DownloadBroadcastReceiver"

.field private static mRegistered:Z = false


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private onDownloadComplete(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 12

    const-string v0, "downloaderRecords"

    const/4 v1, 0x0

    .line 44
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "referenceId"

    const-wide/16 v3, -0x1

    .line 45
    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 46
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "extra_download_id"

    .line 47
    invoke-virtual {p2, v0, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 49
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "savedReferenceId: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "; referenceId: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "DownloadBroadcastReceiver"

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    cmp-long p2, v5, v7

    if-nez p2, :cond_e0

    cmp-long p2, v5, v3

    if-eqz p2, :cond_e0

    const-string p2, "download"

    .line 52
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/DownloadManager;

    .line 53
    new-instance p2, Landroid/app/DownloadManager$Query;

    invoke-direct {p2}, Landroid/app/DownloadManager$Query;-><init>()V

    const/4 v2, 0x1

    new-array v3, v2, [J

    aput-wide v7, v3, v1

    invoke-virtual {p2, v3}, Landroid/app/DownloadManager$Query;->setFilterById([J)Landroid/app/DownloadManager$Query;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/app/DownloadManager;->query(Landroid/app/DownloadManager$Query;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_db

    .line 54
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_db

    const-string p2, "status"

    .line 56
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "status: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eq p2, v2, :cond_d6

    const/4 v1, 0x2

    if-eq p2, v1, :cond_d6

    const/4 v3, 0x4

    if-eq p2, v3, :cond_d6

    const/16 v4, 0x8

    if-eq p2, v4, :cond_c9

    const/16 v4, 0x10

    if-eq p2, v4, :cond_90

    goto :goto_db

    :cond_90
    const-string p2, "reason"

    .line 74
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    .line 75
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error: Download Failed, reason="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x3e9

    if-eq p2, v0, :cond_c1

    const/16 v0, 0x3f1

    if-eq p2, v0, :cond_c1

    const/16 v0, 0x3ee

    if-eq p2, v0, :cond_c0

    const/16 v0, 0x3ef

    if-eq p2, v0, :cond_c1

    const/4 v2, 0x4

    goto :goto_c1

    :cond_c0
    const/4 v2, 0x2

    .line 97
    :cond_c1
    :goto_c1
    invoke-static {}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->getInstance()Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    move-result-object p2

    invoke-virtual {p2, v7, v8, v2}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->onDownloadFailed(JI)V

    goto :goto_db

    :cond_c9
    const-string p2, "STATUS_SUCCESSFUL"

    .line 68
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    invoke-static {}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->getInstance()Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;

    move-result-object p2

    invoke-virtual {p2, v7, v8}, Lcom/navngo/igo/javaclient/downloadmanager/NativeDownloadmanager;->onDownloadSuccess(J)V

    goto :goto_db

    :cond_d6
    const-string p2, "Not finished"

    .line 64
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_db
    :goto_db
    if-eqz p1, :cond_e0

    .line 102
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_e0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6

    .line 35
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceive intent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "DownloadBroadcastReceiver"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "android.intent.action.DOWNLOAD_COMPLETE"

    .line 38
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;->onDownloadComplete(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_25
    return-void
.end method

.method public register()V
    .registers 3

    .line 109
    sget-boolean v0, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;->mRegistered:Z

    if-nez v0, :cond_13

    .line 111
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 112
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, p0, v0}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 113
    sput-boolean v0, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;->mRegistered:Z

    :cond_13
    return-void
.end method

.method public unregister()V
    .registers 2

    .line 120
    sget-boolean v0, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;->mRegistered:Z

    if-eqz v0, :cond_c

    .line 122
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/Application;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 123
    sput-boolean v0, Lcom/navngo/igo/javaclient/downloadmanager/DownloadBroadcastReceiver;->mRegistered:Z

    :cond_c
    return-void
.end method
