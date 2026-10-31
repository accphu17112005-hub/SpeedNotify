###### Class com.navngo.igo.javaclient.utils.NotificationCreator (com.navngo.igo.javaclient.utils.NotificationCreator)
.class public final Lcom/navngo/igo/javaclient/utils/NotificationCreator;
.super Ljava/lang/Object;
.source "NotificationCreator.java"


# static fields
.field public static final STATUS_BAR_ICON_ID:I

.field private static final defaultChannelId:Ljava/lang/String; = "igo_default_channel_id"

.field private static final defaultchannelDescription:Ljava/lang/String; = "Default Channel"

.field private static final headsUpChannelId:Ljava/lang/String; = "igo_heads_up_channel_id"

.field private static final headsUpchannelDescription:Ljava/lang/String; = "Heads-up Channel"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 24
    sget v0, Lcom/navngo/igo/javaclient/R$drawable;->sbicon:I

    sput v0, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->STATUS_BAR_ICON_ID:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;
    .registers 4

    .line 33
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createBuilder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    return-object p0

    :catch_9
    move-exception p0

    const-string p1, "NotificationCreator"

    const-string p2, "Could not create notification"

    .line 35
    invoke-static {p1, p2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    new-instance p0, Landroid/app/Notification;

    invoke-direct {p0}, Landroid/app/Notification;-><init>()V

    return-object p0
.end method

.method protected static createBuilder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;
    .registers 6

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "title: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " --- content: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NotificationCreator"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 96
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 97
    invoke-virtual {p0, p2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    sget p1, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->STATUS_BAR_ICON_ID:I

    .line 98
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 99
    invoke-virtual {p0, p3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 101
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1a

    if-lt p1, p2, :cond_48

    const/4 p1, 0x2

    const-string p2, "igo_default_channel_id"

    const-string p3, "Default Channel"

    invoke-static {p2, p3, p1}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createNotificationChannel(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object p0

    :cond_48
    return-object p0
.end method

.method public static createForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;
    .registers 6

    .line 68
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;-><init>()V

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/receiver/ShutdownReceiver;->register()V

    .line 70
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 71
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.LAUNCHER"

    .line 72
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const v1, 0x34400004

    .line 73
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v1, 0x0

    const/high16 v2, 0x4000000

    .line 79
    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 80
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.navngo.igo.javaclient.receiver.ShutdownReceiver.SELF_INITIATED_SHUTDOWN"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v3, 0x14000000

    invoke-static {p0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 83
    :try_start_35
    sget v3, Lcom/navngo/igo/javaclient/R$string;->app_name:I

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-static {p0, v3, v4, v0}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createBuilder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 84
    sget v3, Lcom/navngo/igo/javaclient/R$string;->exit:I

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 85
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-ge v3, v4, :cond_52

    invoke-virtual {v0, v1, p0, v2}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    goto :goto_60

    :cond_52
    new-instance v1, Landroid/app/Notification$Action$Builder;

    const/4 v3, 0x0

    invoke-direct {v1, v3, p0, v2}, Landroid/app/Notification$Action$Builder;-><init>(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {v1}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    move-result-object p0

    :goto_60
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_64} :catch_65

    return-object p0

    :catch_65
    move-exception p0

    const-string v0, "NotificationCreator"

    const-string v1, "Could not create notification"

    .line 87
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    new-instance p0, Landroid/app/Notification;

    invoke-direct {p0}, Landroid/app/Notification;-><init>()V

    return-object p0
.end method

.method public static createHeadsUpNotification(Landroid/content/Context;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;
    .registers 4

    .line 54
    :try_start_0
    sget v0, Lcom/navngo/igo/javaclient/R$string;->app_name:I

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1, p2}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createBuilder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 56
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1a

    if-lt p1, p2, :cond_1c

    const-string p1, "igo_heads_up_channel_id"

    const-string p2, "Heads-up Channel"

    const/4 v0, 0x5

    invoke-static {p1, p2, v0}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createNotificationChannel(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setChannelId(Ljava/lang/String;)Landroid/app/Notification$Builder;

    :cond_1c
    const/4 p1, 0x2

    .line 58
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object p0

    const/4 p1, 0x1

    .line 59
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 60
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2b

    return-object p0

    :catch_2b
    move-exception p0

    const-string p1, "NotificationCreator"

    const-string p2, "Could not create notification"

    .line 62
    invoke-static {p1, p2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    new-instance p0, Landroid/app/Notification;

    invoke-direct {p0}, Landroid/app/Notification;-><init>()V

    return-object p0
.end method

.method protected static createNotificationChannel(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .registers 5

    .line 106
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 107
    invoke-virtual {v0, p0}, Landroid/app/NotificationManager;->getNotificationChannel(Ljava/lang/String;)Landroid/app/NotificationChannel;

    move-result-object v1

    if-nez v1, :cond_18

    .line 109
    new-instance v1, Landroid/app/NotificationChannel;

    invoke-direct {v1, p0, p1, p2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 110
    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    :cond_18
    return-object p0
.end method

.method public static createWithProgressBar(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;II)Landroid/app/Notification;
    .registers 6

    .line 42
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/utils/NotificationCreator;->createBuilder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    if-gt p4, p5, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    .line 43
    :goto_9
    invoke-virtual {p0, p4, p5, p1}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    return-object p0

    :catch_12
    move-exception p0

    const-string p1, "NotificationCreator"

    const-string p2, "Could not create notification"

    .line 46
    invoke-static {p1, p2, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 47
    new-instance p0, Landroid/app/Notification;

    invoke-direct {p0}, Landroid/app/Notification;-><init>()V

    return-object p0
.end method
