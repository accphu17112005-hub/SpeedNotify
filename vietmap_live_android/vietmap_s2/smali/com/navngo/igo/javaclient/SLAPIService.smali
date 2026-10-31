###### Class com.navngo.igo.javaclient.SLAPIService (com.navngo.igo.javaclient.SLAPIService)
.class public Lcom/navngo/igo/javaclient/SLAPIService;
.super Landroid/app/Service;
.source "SLAPIService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;
    }
.end annotation


# static fields
.field public static final BYE_INTENT:Ljava/lang/String; = "com.navngo.igo.javaclient.SLAPI_SERVER_BYE"

.field public static final HELLO_INTENT:Ljava/lang/String; = "com.navngo.igo.javaclient.SLAPI_SERVER_HELLO"

.field public static final MSGBOX_INTENT:Ljava/lang/String; = "com.navngo.igo.javaclient.SLAPI_MESSAGE_BOX_PRESSED"

.field public static instance:Lcom/navngo/igo/javaclient/SLAPIService; = null

.field private static final logname:Ljava/lang/String; = "SLAPIService"


# instance fields
.field mClients:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/os/Messenger;",
            ">;"
        }
    .end annotation
.end field

.field private mLock:Ljava/lang/Object;

.field protected mMessenger:Landroid/os/Messenger;

.field msgBoxBroadcastReceiver:Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mLock:Ljava/lang/Object;

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mClients:Ljava/util/Map;

    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->msgBoxBroadcastReceiver:Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;

    return-void
.end method

.method private _sendBytesMessage2SLAPIClient(II[B)Z
    .registers 12

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.sendBytesMessage2SLAPIClient()"

    .line 450
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 452
    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v2

    const/16 v3, 0x143

    const/4 v4, 0x1

    if-ne p2, v3, :cond_1b

    .line 456
    invoke-direct {p0, p3}, Lcom/navngo/igo/javaclient/SLAPIService;->processASRCallback([B)Z

    move-result v5

    if-eqz v5, :cond_1b

    return v4

    :cond_1b
    const/16 v5, 0x144

    const/4 v6, 0x0

    if-nez v2, :cond_80

    .line 461
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const v2, -0x4f5235a9

    if-ne p3, v2, :cond_43

    .line 462
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Broadcast is not allowed for "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_cb

    :cond_43
    const/16 p3, 0x309

    if-ne p1, p3, :cond_6b

    if-eq p2, v3, :cond_65

    if-eq p2, v5, :cond_64

    .line 473
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "ASR client mustn\'t receive message "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v6

    :cond_64
    return v4

    :cond_65
    const-string p1, "ASR client received invalid callback "

    .line 468
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v6

    .line 478
    :cond_6b
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Invalid client id:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_cb

    :cond_80
    const/4 p1, 0x0

    .line 483
    invoke-static {p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object p1

    .line 484
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v7

    if-eq p2, v3, :cond_a7

    if-eq p2, v5, :cond_a7

    .line 491
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(byte[]) is wrong signature for message "

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x0

    goto :goto_ac

    :cond_a7
    const-string p2, "Bytes"

    .line 488
    invoke-virtual {v7, p2, p3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    :goto_ac
    if-eqz v4, :cond_ca

    .line 495
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "sendMessage("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    invoke-direct {p0, v1, v2, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    :cond_ca
    move v6, v4

    :goto_cb
    return v6
.end method

.method private _sendErrorMessage2SLAPIClient(IIIILjava/lang/String;)Z
    .registers 12

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.sendErrorMessage2SLAPIClient()"

    .line 399
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 401
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_49

    .line 405
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const p4, -0x4f5235a9

    if-ne p3, p4, :cond_34

    .line 406
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Broadcast is not allowed for "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_85

    .line 410
    :cond_34
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid client id:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_85

    :cond_49
    const/4 v3, 0x0

    .line 415
    invoke-static {v3, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    .line 416
    invoke-virtual {v3}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    const/16 v5, 0x13e

    if-eq p2, v5, :cond_6f

    .line 424
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "(int, int, String) is wrong signature for message "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7f

    :cond_6f
    const-string p2, "OriginalMessage"

    .line 419
    invoke-virtual {v4, p2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "ErrorCode"

    .line 420
    invoke-virtual {v4, p2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "ErrorMessage"

    .line 421
    invoke-virtual {v4, p2, p5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    :goto_7f
    if-eqz v2, :cond_85

    .line 428
    invoke-direct {p0, p1, v1, v3}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    move-result v2

    :cond_85
    :goto_85
    return v2
.end method

.method private _sendGPSStatusMessage2SLAPIClient(IIIIIFIIIIIIIIFFIII)Z
    .registers 29

    move-object v0, p0

    move v1, p2

    const-string v2, "SLAPIService"

    const-string v3, "SLAPIService.sendGPSStatusMessage2SLAPIClient()"

    .line 332
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 335
    invoke-virtual {p0, v3}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_4d

    .line 339
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v6, -0x4f5235a9

    if-ne v4, v6, :cond_37

    .line 340
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Broadcast is not allowed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_ee

    .line 344
    :cond_37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid client id:"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_ee

    :cond_4d
    const/4 v6, 0x0

    .line 349
    invoke-static {v6, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v6

    .line 350
    invoke-virtual {v6}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v7

    const/16 v8, 0x13f

    if-eq v1, v8, :cond_74

    .line 372
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "(UTCTime) is wrong signature for message "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_e8

    :cond_74
    const-string v1, "Year"

    move/from16 v2, p7

    .line 353
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Month"

    move/from16 v2, p8

    .line 354
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "DayOfWeek"

    move/from16 v2, p9

    .line 355
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Day"

    move/from16 v2, p10

    .line 356
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Hour"

    move/from16 v2, p11

    .line 357
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Minute"

    move/from16 v2, p12

    .line 358
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Second"

    move/from16 v2, p13

    .line 359
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Milliseconds"

    move/from16 v2, p14

    .line 360
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "GPSFix"

    move v2, p3

    .line 361
    invoke-virtual {v7, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "NofSatellitesTracked"

    move v2, p4

    .line 362
    invoke-virtual {v7, v1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "NofSatellitesinView"

    move v2, p5

    .line 363
    invoke-virtual {v7, v1, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "HDOP"

    move v2, p6

    .line 364
    invoke-virtual {v7, v1, p6}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    const-string v1, "Latitude"

    move/from16 v2, p15

    .line 365
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    const-string v1, "Longitude"

    move/from16 v2, p16

    .line 366
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    const-string v1, "Altitude"

    move/from16 v2, p17

    .line 367
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Course"

    move/from16 v2, p18

    .line 368
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Speed"

    move/from16 v2, p19

    .line 369
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v5, 0x1

    :goto_e8
    if-eqz v5, :cond_ee

    .line 376
    invoke-direct {p0, v3, v4, v6}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    move-result v5

    :cond_ee
    :goto_ee
    return v5
.end method

.method private _sendRouteGuidanceData2SLAPIClient(IIIIILjava/lang/String;Ljava/lang/String;II[B)Z
    .registers 16

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.sendRouteGuidanceData2SLAPIClient()"

    .line 647
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 648
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 649
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x141

    if-nez v1, :cond_4b

    .line 654
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const p3, -0x4f5235a9

    if-ne p2, p3, :cond_36

    .line 655
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Broadcast is not allowed for "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9e

    .line 659
    :cond_36
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid client id:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9e

    :cond_4b
    const/4 v2, 0x0

    .line 664
    invoke-static {v2, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 665
    invoke-virtual {v2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "DirIcon"

    .line 666
    invoke-virtual {v3, v4, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "ExitIndex"

    .line 667
    invoke-virtual {v3, p2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "Distance"

    .line 668
    invoke-virtual {v3, p2, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "ManouvreID"

    .line 669
    invoke-virtual {v3, p2, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "DistanceString"

    .line 670
    invoke-virtual {v3, p2, p6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "StreetName"

    .line 671
    invoke-virtual {v3, p2, p7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "ProgressPercent"

    .line 672
    invoke-virtual {v3, p2, p8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "RoundaboutArrowIndex"

    .line 673
    invoke-virtual {v3, p2, p9}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "RoundaboutExits"

    .line 674
    invoke-virtual {v3, p2, p10}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 675
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "sendMessage("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 676
    invoke-direct {p0, p1, v1, v2}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    const/4 v2, 0x1

    :goto_9e
    return v2
.end method

.method private _sendRouteInfo2SLAPIClient(III[F)Z
    .registers 11

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.sendRouteInfo2SLAPIClient()"

    .line 602
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 604
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x142

    if-nez v1, :cond_4b

    .line 608
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const p3, -0x4f5235a9

    if-ne p2, p3, :cond_36

    .line 609
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Broadcast is not allowed for "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 613
    :cond_36
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid client id:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 617
    :cond_4b
    array-length v4, p4

    mul-int/lit8 v5, p3, 0x4

    if-eq v4, v5, :cond_6e

    .line 618
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Invalid number of waypoints: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p2, p4

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " vs. "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_6e
    const/4 p3, 0x0

    .line 622
    invoke-static {p3, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object p3

    .line 623
    invoke-virtual {p3}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "PlanMode"

    .line 624
    invoke-virtual {v2, v3, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "WayPoints"

    .line 625
    invoke-virtual {v2, p2, p4}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    .line 626
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "sendMessage("

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p4, ")"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    invoke-direct {p0, p1, v1, p3}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    const/4 p1, 0x1

    return p1
.end method

.method private _sendSimpleMessage2SLAPIClient(IIII)Z
    .registers 12

    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SLAPIService.sendSimpleMessage2SLAPIClient("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SLAPIService"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v0

    const/4 v2, 0x4

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-nez v0, :cond_a7

    .line 135
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const p4, -0x4f5235a9

    if-ne p3, p4, :cond_92

    if-ne p2, v3, :cond_52

    .line 139
    new-instance v4, Landroid/content/Intent;

    const-string p1, "com.navngo.igo.javaclient.SLAPI_SERVER_HELLO"

    invoke-direct {v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_50
    const/4 v5, 0x1

    goto :goto_74

    :cond_52
    if-ne p2, v2, :cond_5c

    .line 141
    new-instance v4, Landroid/content/Intent;

    const-string p1, "com.navngo.igo.javaclient.SLAPI_SERVER_BYE"

    invoke-direct {v4, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_50

    .line 144
    :cond_5c
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Broadcast is not allowed for "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :goto_74
    if-eqz v4, :cond_f5

    .line 148
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Broadcasting "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    invoke-virtual {p0, v4}, Lcom/navngo/igo/javaclient/SLAPIService;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_f5

    .line 153
    :cond_92
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid client id:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f5

    .line 158
    :cond_a7
    invoke-static {v4, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v4

    if-eq p2, v3, :cond_ea

    if-eq p2, v2, :cond_ea

    const/16 v2, 0x147

    if-eq p2, v2, :cond_ea

    packed-switch p2, :pswitch_data_f6

    .line 184
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "(int,int) is wrong signature for message "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ef

    .line 180
    :pswitch_cf
    invoke-virtual {v4}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    const-string v1, "Latitude"

    invoke-virtual {p2, v1, p3}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 181
    invoke-virtual {v4}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p2

    invoke-static {p4}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    const-string p4, "Longitude"

    invoke-virtual {p2, p4, p3}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    goto :goto_ee

    .line 175
    :cond_ea
    :pswitch_ea
    iput p3, v4, Landroid/os/Message;->arg1:I

    .line 176
    iput p4, v4, Landroid/os/Message;->arg2:I

    :goto_ee
    const/4 v5, 0x1

    :goto_ef
    if-eqz v5, :cond_f5

    .line 188
    invoke-direct {p0, p1, v0, v4}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    move-result v5

    :cond_f5
    :goto_f5
    return v5

    :pswitch_data_f6
    .packed-switch 0x12c
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_cf
        :pswitch_cf
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
        :pswitch_ea
    .end packed-switch
.end method

.method private _sendStringMessage2SLAPIClient(IILjava/lang/String;)Z
    .registers 9

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.sendStringMessage2SLAPIClient()"

    .line 209
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 211
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_49

    .line 215
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const v1, -0x4f5235a9

    if-ne p3, v1, :cond_34

    .line 216
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Broadcast is not allowed for "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8d

    .line 220
    :cond_34
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Invalid client id:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8d

    :cond_49
    const/4 v3, 0x0

    .line 225
    invoke-static {v3, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    const/16 v4, 0x13a

    if-eq p2, v4, :cond_7d

    const/16 v4, 0x13b

    if-eq p2, v4, :cond_7d

    const/16 v4, 0x145

    if-eq p2, v4, :cond_73

    .line 235
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(String) is wrong signature for message "

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_87

    .line 232
    :cond_73
    invoke-virtual {v3}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "Version"

    invoke-virtual {p2, v0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_86

    .line 229
    :cond_7d
    invoke-virtual {v3}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "Address"

    invoke-virtual {p2, v0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :goto_86
    const/4 v2, 0x1

    :goto_87
    if-eqz v2, :cond_8d

    .line 239
    invoke-direct {p0, p1, v1, v3}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    move-result v2

    :cond_8d
    :goto_8d
    return v2
.end method

.method private _sendUTCTimeMessage2SLAPIClient(IIIIIIIIII)Z
    .registers 20

    move-object v0, p0

    move v1, p2

    const-string v2, "SLAPIService"

    const-string v3, "SLAPIService.sendUTCTimeMessage2SLAPIClient()"

    .line 263
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 265
    invoke-virtual {p0, v3}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v4

    const/4 v5, 0x0

    if-nez v4, :cond_4c

    .line 269
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v6, -0x4f5235a9

    if-ne v4, v6, :cond_37

    .line 270
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Broadcast is not allowed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_ad

    .line 274
    :cond_37
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid client id:"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ad

    :cond_4c
    const/4 v6, 0x0

    .line 279
    invoke-static {v6, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v6

    .line 280
    invoke-virtual {v6}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v7

    const/16 v8, 0x140

    if-eq v1, v8, :cond_72

    .line 293
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "(UTCTime) is wrong signature for message "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a7

    :cond_72
    const-string v1, "Year"

    move v2, p3

    .line 283
    invoke-virtual {v7, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Month"

    move v2, p4

    .line 284
    invoke-virtual {v7, v1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "DayOfWeek"

    move v2, p5

    .line 285
    invoke-virtual {v7, v1, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Day"

    move v2, p6

    .line 286
    invoke-virtual {v7, v1, p6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Hour"

    move/from16 v2, p7

    .line 287
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Minute"

    move/from16 v2, p8

    .line 288
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Second"

    move/from16 v2, p9

    .line 289
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "Milliseconds"

    move/from16 v2, p10

    .line 290
    invoke-virtual {v7, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v5, 0x1

    :goto_a7
    if-eqz v5, :cond_ad

    .line 297
    invoke-direct {p0, v3, v4, v6}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    move-result v5

    :cond_ad
    :goto_ad
    return v5
.end method

.method private _showHMI(Z)Z
    .registers 4

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.showHMI()"

    .line 693
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    if-eqz p1, :cond_f

    const/4 p1, 0x0

    .line 696
    invoke-static {p1}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForeground(I)V

    goto :goto_16

    .line 698
    :cond_f
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->moveTaskToBack(Z)Z

    :goto_16
    return v0
.end method

.method private processASRCallback([B)Z
    .registers 8

    .line 504
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 511
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    const/4 v1, 0x0

    const-string v2, "SLAPIService"

    const/16 v3, 0xb

    if-eq v0, v3, :cond_30

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    const/16 v3, 0x15

    if-eq v0, v3, :cond_30

    .line 512
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Incorrect capacity: it cannot be ASR callback "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 515
    :cond_30
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v0, v4, :cond_4f

    if-eq v0, v3, :cond_4f

    .line 517
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Incorrect req type "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 520
    :cond_4f
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    const/4 v5, 0x6

    if-ne v0, v4, :cond_9d

    .line 522
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v4, :cond_97

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v4, :cond_97

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v4, :cond_69

    goto :goto_97

    .line 526
    :cond_69
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eqz v0, :cond_75

    const-string p1, "Missing empty byte: it cannot be cb_ASRListen()"

    .line 527
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 530
    :cond_75
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v5, :cond_91

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result p1

    if-eqz p1, :cond_82

    goto :goto_91

    :cond_82
    const-string p1, "cb_ASRListen recognized"

    .line 534
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getASRRecognizer()Lcom/navngo/igo/javaclient/ASRRecognizer;

    move-result-object p1

    if-eqz p1, :cond_15e

    .line 537
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/ASRRecognizer;->listen()V

    return v4

    :cond_91
    :goto_91
    const-string p1, "Invalid num of args: it cannot be cb_ASRListen()"

    .line 531
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_97
    :goto_97
    const-string p1, "Invalid req id: it cannot be cb_ASRListen()"

    .line 523
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_9d
    if-ne v0, v3, :cond_15e

    .line 544
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v3, :cond_159

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v3, :cond_159

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v3, :cond_b3

    goto/16 :goto_159

    .line 548
    :cond_b3
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eqz v0, :cond_bf

    const-string p1, "Missing empty byte: it cannot be cb_messageProcessed()"

    .line 549
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 552
    :cond_bf
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v5, :cond_153

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-ne v0, v3, :cond_153

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-nez v0, :cond_153

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-nez v0, :cond_153

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eqz v0, :cond_df

    goto/16 :goto_153

    .line 556
    :cond_df
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v4, :cond_fc

    if-eq v0, v3, :cond_fc

    .line 558
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid arg type 1: it cannot be cb_messageProcessed() "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 561
    :cond_fc
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 562
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    if-nez v5, :cond_14d

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    if-nez v5, :cond_14d

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    if-eqz v5, :cond_113

    goto :goto_14d

    .line 566
    :cond_113
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    if-eq v5, v4, :cond_121

    if-eq v5, v3, :cond_121

    const-string p1, "Invalid arg type 2: it cannot be cb_messageProcessed()"

    .line 568
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 571
    :cond_121
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    .line 572
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    if-nez v5, :cond_147

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    if-nez v5, :cond_147

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result p1

    if-eqz p1, :cond_138

    goto :goto_147

    :cond_138
    const-string p1, "cb_messageProcessed recognized"

    .line 576
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getASRRecognizer()Lcom/navngo/igo/javaclient/ASRRecognizer;

    move-result-object p1

    if-eqz p1, :cond_15e

    .line 579
    invoke-virtual {p1, v0, v3}, Lcom/navngo/igo/javaclient/ASRRecognizer;->messageProcessed(II)V

    return v4

    :cond_147
    :goto_147
    const-string p1, "Arg 2 is too big: it cannot be cb_messageProcessed()"

    .line 573
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_14d
    :goto_14d
    const-string p1, "Arg 1 is too big: it cannot be cb_messageProcessed()"

    .line 563
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_153
    :goto_153
    const-string p1, "Invalid num of args: it cannot be cb_messageProcessed()"

    .line 553
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_159
    :goto_159
    const-string p1, "Invalid req id: it cannot be cb_messageProcessed()"

    .line 545
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_15e
    return v1
.end method

.method public static sendBytesMessage2SLAPIClient(II[BI)Z
    .registers 6

    .line 439
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendBytesMessage2SLAPIClient("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",,"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "SLAPIService"

    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    sget-object p3, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz p3, :cond_34

    .line 441
    invoke-direct {p3, p0, p1, p2}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendBytesMessage2SLAPIClient(II[B)Z

    move-result p0

    return p0

    :cond_34
    const-string p0, "SLAPIService is down"

    .line 444
    invoke-static {v0, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static sendErrorMessage2SLAPIClient(IIIILjava/lang/String;)Z
    .registers 11

    .line 388
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_e

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    .line 389
    invoke-direct/range {v0 .. v5}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendErrorMessage2SLAPIClient(IIIILjava/lang/String;)Z

    move-result p0

    return p0

    :cond_e
    const-string p0, "SLAPIService"

    const-string p1, "SLAPIService is down"

    .line 392
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static sendGPSStatusMessage2SLAPIClient(IIIIIFIIIIIIIIFFIII)Z
    .registers 41

    const-string v0, "SLAPIService"

    const-string v1, "sendGPSStatusMessage2SLAPIClient"

    .line 313
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    sget-object v2, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v2, :cond_36

    move/from16 v3, p0

    move/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    move/from16 v14, p11

    move/from16 v15, p12

    move/from16 v16, p13

    move/from16 v17, p14

    move/from16 v18, p15

    move/from16 v19, p16

    move/from16 v20, p17

    move/from16 v21, p18

    .line 317
    invoke-direct/range {v2 .. v21}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendGPSStatusMessage2SLAPIClient(IIIIIFIIIIIIIIFFIII)Z

    move-result v0

    return v0

    :cond_36
    const-string v1, "SLAPIService is down"

    .line 323
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method private sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z
    .registers 6

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Sending message to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SLAPIService"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    :try_start_16
    invoke-virtual {p2, p3}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_19
    .catch Landroid/os/RemoteException; {:try_start_16 .. :try_end_19} :catch_1b

    const/4 p1, 0x1

    goto :goto_35

    .line 107
    :catch_1b
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Removing dead client with Id "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    iget-object p2, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mClients:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    :goto_35
    return p1
.end method

.method public static sendRouteGuidanceData2SLAPIClient(IIIIILjava/lang/String;Ljava/lang/String;II[B)Z
    .registers 23

    .line 634
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendRouteGuidanceData2SLAPIClient("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", ...)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "SLAPIService"

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_37

    move-object v2, v0

    move v3, p0

    move v4, p1

    move v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move-object/from16 v12, p9

    .line 636
    invoke-direct/range {v2 .. v12}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendRouteGuidanceData2SLAPIClient(IIIIILjava/lang/String;Ljava/lang/String;II[B)Z

    move-result v0

    return v0

    :cond_37
    const-string v0, "SLAPIService is down"

    .line 640
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public static sendRouteInfo2SLAPIClient(III[F)Z
    .registers 6

    .line 591
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sendRouteInfo2SLAPIClient("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SLAPIService"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 592
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_32

    .line 593
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendRouteInfo2SLAPIClient(III[F)Z

    move-result p0

    return p0

    :cond_32
    const-string p0, "SLAPIService is down"

    .line 596
    invoke-static {v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static sendSimpleMessage2SLAPIClient(IIII)Z
    .registers 5

    .line 119
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_9

    .line 120
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendSimpleMessage2SLAPIClient(IIII)Z

    move-result p0

    return p0

    :cond_9
    const-string p0, "SLAPIService"

    const-string p1, "SLAPIService is down"

    .line 123
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static sendStringMessage2SLAPIClient(IILjava/lang/String;)Z
    .registers 4

    .line 199
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_9

    .line 200
    invoke-direct {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendStringMessage2SLAPIClient(IILjava/lang/String;)Z

    move-result p0

    return p0

    :cond_9
    const-string p0, "SLAPIService"

    const-string p1, "SLAPIService is down"

    .line 203
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public static sendUTCTimeMessage2SLAPIClient(IIIIIIIIII)Z
    .registers 21

    .line 251
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_18

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    .line 252
    invoke-direct/range {v0 .. v10}, Lcom/navngo/igo/javaclient/SLAPIService;->_sendUTCTimeMessage2SLAPIClient(IIIIIIIIII)Z

    move-result v0

    return v0

    :cond_18
    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService is down"

    .line 256
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public static showHMI(Z)Z
    .registers 2

    .line 683
    sget-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    if-eqz v0, :cond_9

    .line 684
    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/SLAPIService;->_showHMI(Z)Z

    move-result p0

    return p0

    :cond_9
    const-string p0, "SLAPIService"

    const-string v0, "SLAPIService is down"

    .line 687
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public addClient(Ljava/lang/Integer;Landroid/os/Messenger;)V
    .registers 4

    .line 751
    iget-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mClients:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected createMessenger()V
    .registers 3

    .line 96
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/navngo/igo/javaclient/IncomingHandler;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/IncomingHandler;-><init>(Lcom/navngo/igo/javaclient/SLAPIService;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mMessenger:Landroid/os/Messenger;

    return-void
.end method

.method public getClient(Ljava/lang/Integer;)Landroid/os/Messenger;
    .registers 3

    .line 747
    iget-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mClients:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Messenger;

    return-object p1
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3

    const-string p1, "SLAPIService"

    const-string v0, "SLAPIService.onBind()"

    .line 82
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    iget-object p1, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mLock:Ljava/lang/Object;

    monitor-enter p1

    .line 84
    :try_start_a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mMessenger:Landroid/os/Messenger;

    if-nez v0, :cond_11

    .line 85
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/SLAPIService;->createMessenger()V

    .line 87
    :cond_11
    monitor-exit p1
    :try_end_12
    .catchall {:try_start_a .. :try_end_12} :catchall_19

    .line 88
    iget-object p1, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mMessenger:Landroid/os/Messenger;

    invoke-virtual {p1}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object p1

    return-object p1

    :catchall_19
    move-exception v0

    .line 87
    :try_start_1a
    monitor-exit p1
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw v0
.end method

.method public onCreate()V
    .registers 4

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.onCreate()"

    .line 52
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    sput-object p0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    .line 54
    new-instance v0, Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;-><init>(Lcom/navngo/igo/javaclient/SLAPIService;Lcom/navngo/igo/javaclient/SLAPIService$1;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->msgBoxBroadcastReceiver:Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;

    .line 55
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.navngo.igo.javaclient.SLAPI_MESSAGE_BOX_PRESSED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/SLAPIService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public onDestroy()V
    .registers 3

    const-string v0, "SLAPIService"

    const-string v1, "SLAPIService.onDestroy()"

    .line 64
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 65
    sput-object v0, Lcom/navngo/igo/javaclient/SLAPIService;->instance:Lcom/navngo/igo/javaclient/SLAPIService;

    .line 66
    iget-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->msgBoxBroadcastReceiver:Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;

    if-eqz v0, :cond_11

    .line 67
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/SLAPIService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_11
    return-void
.end method

.method public removeClient(Ljava/lang/Integer;)V
    .registers 3

    .line 755
    iget-object v0, p0, Lcom/navngo/igo/javaclient/SLAPIService;->mClients:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public sendMessageBoxPressed(II)V
    .registers 9

    .line 721
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 723
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v0

    const-string v1, "SLAPIService"

    const/16 v2, 0x146

    if-nez v0, :cond_45

    .line 727
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const v0, -0x4f5235a9

    if-ne p2, v0, :cond_30

    .line 728
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Broadcast is not allowed for "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7b

    .line 731
    :cond_30
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid client id:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7b

    :cond_45
    const/4 v3, 0x0

    .line 735
    invoke-static {v3, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    .line 736
    invoke-virtual {v3}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "Button"

    .line 737
    invoke-virtual {v4, v5, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 738
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sendMessage("

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    invoke-direct {p0, p1, v0, v3}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessage(Ljava/lang/Integer;Landroid/os/Messenger;Landroid/os/Message;)Z

    :goto_7b
    return-void
.end method

###### Class com.navngo.igo.javaclient.SLAPIService.AnonymousClass1 (com.navngo.igo.javaclient.SLAPIService$1)
.class synthetic Lcom/navngo/igo/javaclient/SLAPIService$1;
.super Ljava/lang/Object;
.source "SLAPIService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/SLAPIService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation

###### Class com.navngo.igo.javaclient.SLAPIService.MsgBoxBroadcastReceiver (com.navngo.igo.javaclient.SLAPIService$MsgBoxBroadcastReceiver)
.class Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SLAPIService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/SLAPIService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MsgBoxBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/SLAPIService;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/SLAPIService;)V
    .registers 2

    .line 703
    iput-object p1, p0, Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;->this$0:Lcom/navngo/igo/javaclient/SLAPIService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/SLAPIService;Lcom/navngo/igo/javaclient/SLAPIService$1;)V
    .registers 3

    .line 703
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;-><init>(Lcom/navngo/igo/javaclient/SLAPIService;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 6

    const-string p1, "SLAPIService"

    const-string v0, "onReceive"

    .line 706
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ClientId"

    .line 707
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 708
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 709
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const/4 v1, 0x1

    const-string v2, "Button"

    invoke-virtual {p2, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    .line 710
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "clientId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " buttonId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    iget-object p1, p0, Lcom/navngo/igo/javaclient/SLAPIService$MsgBoxBroadcastReceiver;->this$0:Lcom/navngo/igo/javaclient/SLAPIService;

    invoke-virtual {p1, v0, p2}, Lcom/navngo/igo/javaclient/SLAPIService;->sendMessageBoxPressed(II)V

    :cond_44
    return-void
.end method
