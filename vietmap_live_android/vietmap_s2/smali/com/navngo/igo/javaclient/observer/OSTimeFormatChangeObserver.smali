###### Class com.navngo.igo.javaclient.observer.OSTimeFormatChangeObserver (com.navngo.igo.javaclient.observer.OSTimeFormatChangeObserver)
.class public Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;
.super Lcom/navngo/igo/javaclient/observer/ObserverBase;
.source "OSTimeFormatChangeObserver.java"


# static fields
.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final TIME_FORMAT_ID_12H:Ljava/lang/Integer;

.field public static final TIME_FORMAT_ID_24H:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x2

    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;->TIME_FORMAT_ID_24H:Ljava/lang/Integer;

    const/4 v0, 0x6

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;->TIME_FORMAT_ID_12H:Ljava/lang/Integer;

    const-string v0, "content://settings/system/time_12_24"

    .line 16
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/observer/ObserverBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentUri()Landroid/net/Uri;
    .registers 2

    .line 26
    sget-object v0, Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;->CONTENT_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .registers 3

    .line 20
    sget-object p1, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->ROOT_MODEL:Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    const-string p2, "regional.timeformat"

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->getIntModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    move-result-object p1

    .line 21
    sget-object p2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_17

    sget-object p2, Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;->TIME_FORMAT_ID_24H:Ljava/lang/Integer;

    goto :goto_19

    :cond_17
    sget-object p2, Lcom/navngo/igo/javaclient/observer/OSTimeFormatChangeObserver;->TIME_FORMAT_ID_12H:Ljava/lang/Integer;

    :goto_19
    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->set(Ljava/lang/Object;)V

    return-void
.end method
