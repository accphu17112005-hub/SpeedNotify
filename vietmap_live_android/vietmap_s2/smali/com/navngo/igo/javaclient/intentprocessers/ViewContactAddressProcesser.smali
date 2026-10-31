###### Class com.navngo.igo.javaclient.intentprocessers.ViewContactAddressProcesser (com.navngo.igo.javaclient.intentprocessers.ViewContactAddressProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;
.super Ljava/lang/Object;
.source "ViewContactAddressProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# static fields
.field private static final logname:Ljava/lang/String; = "ViewContactAddressProcesser"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 6

    .line 42
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 46
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_f

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v1

    goto :goto_1b

    :cond_f
    iget-object v1, p0, Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_19} :catch_1a

    goto :goto_1b

    :catch_1a
    const/4 v1, 0x0

    .line 51
    :goto_1b
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 52
    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object p1

    const-string v2, "content"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4d

    if-eqz v0, :cond_4d

    .line 54
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.android.contacts"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4d

    if-eqz v1, :cond_4d

    const-string p1, "vnd.android.cursor.item/postal-address_v2"

    .line 56
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4d

    const/4 p1, 0x1

    goto :goto_4e

    :cond_4d
    const/4 p1, 0x0

    :goto_4e
    return p1
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 22

    .line 60
    invoke-virtual/range {p0 .. p1}, Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_17d

    move-object/from16 v0, p0

    .line 62
    iget-object v2, v0, Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 65
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, v2

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    const-string v3, "data10"

    .line 66
    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    const-string v4, "data8"

    .line 67
    invoke-interface {v9, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    const-string v5, "data7"

    .line 68
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    const-string v6, "data4"

    .line 69
    invoke-interface {v9, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    const-string v7, "data9"

    .line 70
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    const-string v10, "data1"

    .line 71
    invoke-interface {v9, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    const-string v11, "raw_contact_id"

    .line 72
    invoke-interface {v9, v11}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    .line 75
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v12

    if-eqz v12, :cond_179

    .line 76
    new-instance v15, Lcom/navngo/igo/javaclient/address/StructuredAddress;

    .line 77
    invoke-interface {v9, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v13

    const-string v19, ""

    if-eqz v13, :cond_59

    move-object/from16 v14, v19

    goto :goto_5e

    :cond_59
    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object v14, v3

    .line 78
    :goto_5e
    invoke-interface {v9, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_67

    move-object/from16 v3, v19

    goto :goto_6b

    :cond_67
    invoke-interface {v9, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 79
    :goto_6b
    invoke-interface {v9, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_74

    move-object/from16 v16, v19

    goto :goto_7a

    :cond_74
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v16, v4

    .line 80
    :goto_7a
    invoke-interface {v9, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_83

    move-object/from16 v17, v19

    goto :goto_89

    :cond_83
    invoke-interface {v9, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v17, v4

    .line 81
    :goto_89
    invoke-interface {v9, v7}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_92

    move-object/from16 v18, v19

    goto :goto_98

    :cond_92
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v18, v4

    :goto_98
    move-object v13, v15

    move-object v7, v15

    move-object v15, v3

    invoke-direct/range {v13 .. v18}, Lcom/navngo/igo/javaclient/address/StructuredAddress;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    invoke-interface {v9, v8}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_a5

    goto :goto_a9

    :cond_a5
    invoke-interface {v9, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    :goto_a9
    move-object/from16 v3, v19

    const-string v4, "\n"

    const-string v13, " "

    .line 86
    invoke-virtual {v3, v4, v13}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    .line 88
    iget-object v4, v7, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    aput-object v4, v3, v1

    iget-object v4, v7, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, v7, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    const/4 v6, 0x2

    aput-object v4, v3, v6

    const/4 v4, 0x3

    iget-object v8, v7, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    aput-object v8, v3, v4

    const/4 v4, 0x4

    iget-object v8, v7, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    aput-object v8, v3, v4

    const/4 v4, 0x5

    aput-object v14, v3, v4

    const-string v4, "Country = \'%s\', state = \'%s\', city = \'%s\', street = \'%s\', zip = \'%s\'. Full addr.: \'%s\'"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v15, "ViewContactAddressProcesser"

    invoke-static {v15, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-interface {v9, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 94
    sget-object v4, Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    move-object v11, v2

    int-to-long v1, v3

    invoke-static {v4, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "data"

    .line 95
    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 96
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GCOOR serach Uri: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v15, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v2, v6, [Ljava/lang/Object;

    const-string v3, "mimetype"

    const/4 v6, 0x0

    aput-object v3, v2, v6

    const-string v3, "vnd.android.cursor.item/motonav_gcoor"

    aput-object v3, v2, v5

    const-string v3, "%s = \'%s\'"

    .line 99
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v2, 0x0

    const/4 v8, 0x0

    move-object v3, v11

    move-object v5, v1

    move-object v1, v7

    move-object v7, v2

    .line 98
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 101
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_16a

    .line 102
    invoke-interface {v2, v10}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "data2"

    .line 103
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 105
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GCOOR found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " !!!"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v15, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 108
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    .line 110
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v1

    new-instance v3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>(DD)V

    invoke-virtual {v1, v3}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)V

    goto :goto_176

    :cond_16a
    const-string v3, "GCOOR NOT found"

    .line 112
    invoke-static {v15, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v3

    invoke-virtual {v3, v1, v14}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    .line 116
    :goto_176
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 119
    :cond_179
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    return v12

    :cond_17d
    move-object/from16 v0, p0

    return v1
.end method
