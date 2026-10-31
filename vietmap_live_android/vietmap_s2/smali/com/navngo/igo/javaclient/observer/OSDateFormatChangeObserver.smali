###### Class com.navngo.igo.javaclient.observer.OSDateFormatChangeObserver (com.navngo.igo.javaclient.observer.OSDateFormatChangeObserver)
.class public Lcom/navngo/igo/javaclient/observer/OSDateFormatChangeObserver;
.super Lcom/navngo/igo/javaclient/observer/ObserverBase;
.source "OSDateFormatChangeObserver.java"


# static fields
.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "content://settings/system/date_format"

    .line 18
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/observer/OSDateFormatChangeObserver;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/observer/ObserverBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentUri()Landroid/net/Uri;
    .registers 2

    .line 22
    sget-object v0, Lcom/navngo/igo/javaclient/observer/OSDateFormatChangeObserver;->CONTENT_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public getCurrentDateFormatAsIGOCode()I
    .registers 9

    const/4 v0, 0x0

    .line 35
    :try_start_1
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 36
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    const/4 v3, 0x3

    .line 37
    invoke-static {v3, v2}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 38
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v2

    .line 39
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "date_format"

    invoke-static {v1, v4}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 40
    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "-"

    .line 57
    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_32} :catch_ee

    const-string v5, "y"

    const-string v6, "d"

    const-string v7, "m"

    if-ltz v4, :cond_72

    .line 58
    :try_start_3a
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4c

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ge v2, v4, :cond_4c

    goto/16 :goto_f2

    .line 61
    :cond_4c
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5f

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-le v2, v4, :cond_5f

    const/4 v0, 0x3

    goto/16 :goto_f2

    .line 64
    :cond_5f
    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_68

    const/4 v0, 0x6

    goto/16 :goto_f2

    .line 67
    :cond_68
    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f2

    const/16 v0, 0x9

    goto/16 :goto_f2

    :cond_72
    const-string v3, "/"

    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_b1

    .line 72
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8d

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ge v2, v3, :cond_8d

    const/4 v0, 0x2

    goto/16 :goto_f2

    .line 75
    :cond_8d
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9f

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-le v2, v3, :cond_9f

    const/4 v0, 0x5

    goto :goto_f2

    .line 78
    :cond_9f
    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a8

    const/16 v0, 0x8

    goto :goto_f2

    .line 81
    :cond_a8
    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f2

    const/16 v0, 0xb

    goto :goto_f2

    :cond_b1
    const-string v3, "."

    .line 85
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_f2

    .line 86
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_cb

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-ge v2, v3, :cond_cb

    const/4 v0, 0x1

    goto :goto_f2

    .line 89
    :cond_cb
    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_dd

    invoke-virtual {v1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-le v2, v3, :cond_dd

    const/4 v0, 0x4

    goto :goto_f2

    .line 92
    :cond_dd
    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e5

    const/4 v0, 0x7

    goto :goto_f2

    .line 95
    :cond_e5
    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1
    :try_end_e9
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_e9} :catch_ee

    if-eqz v1, :cond_f2

    const/16 v0, 0xa

    goto :goto_f2

    :catch_ee
    move-exception v1

    .line 101
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_f2
    :goto_f2
    return v0
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .registers 3

    .line 26
    sget-object p1, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->ROOT_MODEL:Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    const-string p2, "regional.dateformat"

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->getIntModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    move-result-object p1

    .line 27
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/observer/OSDateFormatChangeObserver;->getCurrentDateFormatAsIGOCode()I

    move-result p2

    .line 28
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->set(Ljava/lang/Object;)V

    return-void
.end method
