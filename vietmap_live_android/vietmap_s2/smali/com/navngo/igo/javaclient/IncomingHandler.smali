###### Class com.navngo.igo.javaclient.IncomingHandler (com.navngo.igo.javaclient.IncomingHandler)
.class public Lcom/navngo/igo/javaclient/IncomingHandler;
.super Landroid/os/Handler;
.source "IncomingHandler.java"


# static fields
.field private static final logname:Ljava/lang/String; = "IncomingHandler"


# instance fields
.field protected mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/navngo/igo/javaclient/SLAPIService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/SLAPIService;)V
    .registers 3

    .line 23
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IncomingHandler;->mService:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private handleMessage(Lcom/navngo/igo/javaclient/SLAPIService;Landroid/os/Message;)V
    .registers 27

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 39
    iget-object v2, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-virtual {v2}, Landroid/os/Messenger;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SLAPIService.handleMessage("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-virtual {v4}, Landroid/os/Messenger;->hashCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v1, Landroid/os/Message;->what:I

    invoke-static {v4}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "IncomingHandler"

    invoke-static {v4, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-virtual/range {p2 .. p2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 47
    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/SLAPIService;->getClient(Ljava/lang/Integer;)Landroid/os/Messenger;

    move-result-object v5

    .line 48
    iget v6, v1, Landroid/os/Message;->what:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_73

    if-nez v5, :cond_72

    .line 51
    iget-object v3, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 52
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Register client with Id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    invoke-virtual {v0, v2, v3}, Lcom/navngo/igo/javaclient/SLAPIService;->addClient(Ljava/lang/Integer;Landroid/os/Messenger;)V

    .line 54
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v2, v1, Landroid/os/Message;->what:I

    iget v3, v1, Landroid/os/Message;->arg1:I

    iget v1, v1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/NNG;->sendSimpleSLAPIMessage2iGO(IIII)Z

    :cond_72
    return-void

    .line 58
    :cond_73
    iget v6, v1, Landroid/os/Message;->what:I

    const/4 v8, 0x3

    if-ne v6, v8, :cond_9f

    if-eqz v5, :cond_9f

    .line 60
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Disconnect client with Id "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/SLAPIService;->removeClient(Ljava/lang/Integer;)V

    .line 62
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v2, v1, Landroid/os/Message;->what:I

    iget v3, v1, Landroid/os/Message;->arg1:I

    iget v1, v1, Landroid/os/Message;->arg2:I

    invoke-static {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/NNG;->sendSimpleSLAPIMessage2iGO(IIII)Z

    return-void

    :cond_9f
    if-nez v5, :cond_a7

    const-string v0, "Client is null!"

    .line 68
    invoke-static {v4, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 71
    :cond_a7
    iget v0, v1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_346

    const-string v6, "Order"

    const-string v9, "Bytes"

    const-string v10, " is not yet implemented"

    const-string v11, "PlanMode"

    const-string v12, "Name"

    const-string v13, "Message id "

    const-string v14, "Longitude"

    const-string v15, "Latitude"

    const-string v5, "Address"

    packed-switch v0, :pswitch_data_37a

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Landroid/os/Message;->what:I

    invoke-static {v2}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " is invalid or not implemented"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    .line 185
    invoke-super {v0, v1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_344

    :pswitch_e5
    move-object/from16 v0, p0

    const-string v1, "Button1"

    .line 107
    invoke-virtual {v3, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "Timeout"

    const/4 v5, 0x0

    .line 110
    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v13

    const/4 v4, 0x0

    if-eqz v1, :cond_10b

    const-string v6, "Button2"

    .line 113
    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_105

    const-string v4, "Button3"

    .line 115
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_105
    move-object/from16 v23, v6

    move-object v6, v4

    move-object/from16 v4, v23

    goto :goto_10c

    :cond_10b
    move-object v6, v4

    .line 118
    :goto_10c
    sget-object v9, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v10, "Message"

    invoke-virtual {v3, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v11

    new-array v14, v8, [Ljava/lang/String;

    aput-object v1, v14, v5

    aput-object v4, v14, v7

    const/4 v1, 0x2

    aput-object v6, v14, v1

    const-string v12, "com.navngo.igo.javaclient.SLAPI_MESSAGE_BOX_PRESSED"

    invoke-virtual/range {v9 .. v14}, Lcom/navngo/igo/javaclient/Application;->alert(Ljava/lang/String;ILjava/lang/String;I[Ljava/lang/String;)V

    goto/16 :goto_344

    :pswitch_128
    move-object/from16 v0, p0

    .line 174
    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v3

    if-eqz v3, :cond_13c

    .line 176
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v1, v1, Landroid/os/Message;->what:I

    array-length v4, v3

    invoke-static {v2, v1, v3, v4}, Lcom/navngo/igo/javaclient/NNG;->sendBytesSLAPIMessage2iGO(II[BI)Z

    goto/16 :goto_344

    .line 179
    :cond_13c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/os/Message;->what:I

    invoke-static {v1}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": \'Bytes\' entry is not set"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_344

    :pswitch_15b
    move-object/from16 v0, p0

    .line 165
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget v6, v1, Landroid/os/Message;->what:I

    const-string v1, "ZoomLevel"

    invoke-virtual {v3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v3, v15}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v10

    invoke-virtual {v3, v14}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v11

    const-string v12, ""

    const-string v13, ""

    invoke-static/range {v5 .. v13}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_17c
    move-object/from16 v0, p0

    .line 159
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v1, v1, Landroid/os/Message;->what:I

    const/4 v4, -0x1

    invoke-virtual {v3, v6, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual {v3, v15}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v19

    invoke-virtual {v3, v14}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v20

    const-string v21, ""

    const-string v22, ""

    move v14, v2

    move v15, v1

    invoke-static/range {v14 .. v22}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_1a0
    move-object/from16 v0, p0

    .line 156
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v4, v1, Landroid/os/Message;->what:I

    const/4 v1, -0x1

    invoke-virtual {v3, v6, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, ""

    move v3, v2

    move v5, v1

    invoke-static/range {v3 .. v11}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_1be
    move-object/from16 v0, p0

    .line 147
    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v3

    if-eqz v3, :cond_1d2

    .line 149
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v1, v1, Landroid/os/Message;->what:I

    array-length v4, v3

    invoke-static {v2, v1, v3, v4}, Lcom/navngo/igo/javaclient/NNG;->sendBytesSLAPIMessage2iGO(II[BI)Z

    goto/16 :goto_344

    .line 152
    :cond_1d2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/os/Message;->what:I

    invoke-static {v1}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_344

    :pswitch_1ef
    move-object/from16 v0, p0

    .line 144
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/os/Message;->what:I

    invoke-static {v1}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_344

    :pswitch_20e
    move-object/from16 v0, p0

    .line 140
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v6, v1, Landroid/os/Message;->what:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, ""

    move v5, v2

    invoke-static/range {v5 .. v13}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_227
    move-object/from16 v0, p0

    .line 162
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v1, v1, Landroid/os/Message;->what:I

    const-string v4, "MarkerId"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual {v3, v15}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v19

    invoke-virtual {v3, v14}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v20

    const-string v4, "Category"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v4, "Label"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move v14, v2

    move v15, v1

    invoke-static/range {v14 .. v22}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_254
    move-object/from16 v0, p0

    .line 137
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v4, v1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v15}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v8

    invoke-virtual {v3, v14}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v9

    const-string v10, ""

    const-string v11, ""

    move v3, v2

    invoke-static/range {v3 .. v11}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_274
    move-object/from16 v0, p0

    .line 134
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v12

    iget v13, v1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v14

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, ""

    invoke-static/range {v12 .. v20}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_292
    move-object/from16 v0, p0

    .line 131
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v4, v1, Landroid/os/Message;->what:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v1, "Path"

    invoke-virtual {v3, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, ""

    move v1, v2

    move v2, v4

    move v3, v5

    move v4, v6

    move v5, v7

    move v6, v8

    move v7, v9

    move-object v8, v10

    move-object v9, v11

    invoke-static/range {v1 .. v9}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_2b5
    move-object/from16 v0, p0

    .line 128
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v12

    iget v13, v1, Landroid/os/Message;->what:I

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v20, ""

    invoke-static/range {v12 .. v20}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_344

    :pswitch_2d0
    move-object/from16 v0, p0

    .line 122
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v4, v1, Landroid/os/Message;->what:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v3, v15}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v8

    invoke-virtual {v3, v14}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v9

    invoke-virtual {v3, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, ""

    move v1, v2

    move v2, v4

    move v3, v5

    move v4, v6

    move v5, v7

    move v6, v8

    move v7, v9

    move-object v8, v10

    move-object v9, v11

    invoke-static/range {v1 .. v9}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto :goto_344

    :pswitch_2f6
    move-object/from16 v0, p0

    .line 125
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v13, v1, Landroid/os/Message;->what:I

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual {v3, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move v12, v2

    invoke-static/range {v12 .. v20}, Lcom/navngo/igo/javaclient/NNG;->sendComplexSLAPIMessage2iGO(IIIIIFFLjava/lang/String;Ljava/lang/String;)Z

    goto :goto_344

    :pswitch_313
    move-object/from16 v0, p0

    .line 99
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget v3, v1, Landroid/os/Message;->what:I

    iget v5, v1, Landroid/os/Message;->arg1:I

    iget v6, v1, Landroid/os/Message;->arg2:I

    invoke-static {v2, v3, v5, v6}, Lcom/navngo/igo/javaclient/NNG;->sendSimpleSLAPIMessage2iGO(IIII)Z

    move-result v2

    if-eqz v2, :cond_344

    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "SLAPI call : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, v1, Landroid/os/Message;->what:I

    invoke-static {v1}, Lcom/navngo/igo/javaclient/SLAPIMessageIds;->MessageName(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " failed!"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_344
    :goto_344
    return-void

    nop

    :pswitch_data_346
    .packed-switch 0x64
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
        :pswitch_313
    .end packed-switch

    :pswitch_data_37a
    .packed-switch 0xc9
        :pswitch_2f6
        :pswitch_2d0
        :pswitch_2b5
        :pswitch_292
        :pswitch_274
        :pswitch_254
        :pswitch_227
        :pswitch_20e
        :pswitch_1ef
        :pswitch_1be
        :pswitch_1a0
        :pswitch_17c
        :pswitch_15b
        :pswitch_128
        :pswitch_128
        :pswitch_128
        :pswitch_128
        :pswitch_128
        :pswitch_128
        :pswitch_e5
        :pswitch_128
    .end packed-switch
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3

    .line 30
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IncomingHandler;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/SLAPIService;

    if-nez v0, :cond_12

    const-string p1, "IncomingHandler"

    const-string v0, "SLAPIService is not available!"

    .line 32
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 35
    :cond_12
    invoke-direct {p0, v0, p1}, Lcom/navngo/igo/javaclient/IncomingHandler;->handleMessage(Lcom/navngo/igo/javaclient/SLAPIService;Landroid/os/Message;)V

    return-void
.end method
