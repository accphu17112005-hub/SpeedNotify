###### Class com.navngo.igo.javaclient.functors.MailSmsContacts (com.navngo.igo.javaclient.functors.MailSmsContacts)
.class public final enum Lcom/navngo/igo/javaclient/functors/MailSmsContacts;
.super Ljava/lang/Enum;
.source "MailSmsContacts.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/functors/MailSmsContacts;",
        ">;",
        "Lcom/navngo/igo/javaclient/functors/IFunctorCollection;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

.field private static final logname:Ljava/lang/String; = "MailSmsContacts"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mLastContactAdresses:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/address/StructuredAddress;",
            ">;"
        }
    .end annotation
.end field

.field private mRecentlyInsertedContact:Landroid/net/Uri;

.field private volatile oldInsertContactMethod:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 46
    new-instance v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->INSTANCE:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    aput-object v0, v1, v2

    .line 45
    sput-object v1, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->$VALUES:[Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 92
    iput-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mRecentlyInsertedContact:Landroid/net/Uri;

    const/4 p2, 0x1

    .line 336
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->oldInsertContactMethod:Z

    .line 643
    iput-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mLastContactAdresses:Ljava/util/ArrayList;

    .line 50
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    .line 52
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object p1

    sget-object v0, Lcom/navngo/program/ProgramPhases$Phase;->STARTUP:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v1, Lcom/navngo/igo/javaclient/functors/MailSmsContacts$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts$1;-><init>(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;)V

    invoke-virtual {p1, v0, p2, v1}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    return-void
.end method

.method private GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 843
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    const-string v0, ""

    if-ltz p2, :cond_d

    .line 845
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_e

    :cond_d
    move-object p1, v0

    :goto_e
    if-nez p1, :cond_11

    goto :goto_12

    :cond_11
    move-object v0, p1

    :goto_12
    return-object v0
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;)Z
    .registers 1

    .line 45
    iget-boolean p0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->oldInsertContactMethod:Z

    return p0
.end method

.method static synthetic access$002(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;Z)Z
    .registers 2

    .line 45
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->oldInsertContactMethod:Z

    return p1
.end method

.method private checkPermission()Z
    .registers 3

    .line 62
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    const-string v1, "android.permission.READ_CONTACTS"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private composeMessageText(Ljava/lang/String;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .registers 11

    .line 355
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 359
    invoke-virtual {p3}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result v1

    const-string v2, " "

    if-eqz v1, :cond_27

    .line 361
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "http://maps.google.com/maps?q="

    .line 362
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    iget-wide v3, p3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v1, ","

    .line 364
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    iget-wide v3, p3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 366
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    :cond_27
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3f

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_39

    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3f

    .line 371
    :cond_39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    :cond_3f
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_4b

    .line 377
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    :cond_4b
    invoke-virtual {p3}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result p1

    if-eqz p1, :cond_5b

    .line 384
    invoke-static {p3}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->encodeGPSCoord(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    :cond_5b
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_67

    .line 390
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    :cond_67
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_73

    .line 396
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    :cond_73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    return-object v0
.end method

.method private startEditContactIntentForResult(Landroid/net/Uri;)V
    .registers 5

    const-string v0, "android"

    const-string v1, "register_functors"

    const/4 v2, 0x1

    .line 97
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_c

    return-void

    .line 99
    :cond_c
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-nez v0, :cond_1a

    const-string p1, "MailSmsContacts"

    const-string v0, "IgoActivity is null in startEditContactIntentForResult!"

    .line 101
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 105
    :cond_1a
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.EDIT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v1, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 107
    iput-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mRecentlyInsertedContact:Landroid/net/Uri;

    const/16 p1, 0x4e1

    .line 111
    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/functors/MailSmsContacts;
    .registers 2

    .line 45
    const-class v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/functors/MailSmsContacts;
    .registers 1

    .line 45
    sget-object v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->$VALUES:[Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    return-object v0
.end method

.method private wrapWithSyncAdapter(Landroid/net/Uri;)Landroid/net/Uri;
    .registers 4

    .line 339
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "caller_is_syncadapter"

    const-string v1, "true"

    .line 340
    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 341
    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public addContactAddressOverAPI10(Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/content/ContentValues;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 856
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_4f

    .line 857
    :cond_1e
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/postal-address_v2"

    .line 858
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 859
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const-string v1, "data2"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p2, "data4"

    .line 860
    invoke-virtual {v0, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data7"

    .line 861
    invoke-virtual {v0, p2, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data9"

    .line 862
    invoke-virtual {v0, p2, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data8"

    .line 863
    invoke-virtual {v0, p2, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data10"

    .line 864
    invoke-virtual {v0, p2, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 865
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4f
    return-void
.end method

.method public addContactAddressUntilAPI10(Landroid/net/Uri;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 871
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1e

    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_55

    .line 872
    :cond_1e
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "mimetype"

    const-string v2, "vnd.android.cursor.item/postal-address_v2"

    .line 873
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const-string v1, "data2"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p2, "data4"

    .line 875
    invoke-virtual {v0, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data7"

    .line 876
    invoke-virtual {v0, p2, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data9"

    .line 877
    invoke-virtual {v0, p2, p5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data8"

    .line 878
    invoke-virtual {v0, p2, p6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "data10"

    .line 879
    invoke-virtual {v0, p2, p7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 880
    iget-object p2, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p2, p1, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    :cond_55
    return-void
.end method

.method public deleteRecentlyInserted()V
    .registers 4

    .line 885
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mRecentlyInsertedContact:Landroid/net/Uri;

    if-eqz v0, :cond_13

    .line 886
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mRecentlyInsertedContact:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 887
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->resetRecentlyInserted()V

    :cond_13
    return-void
.end method

.method public getAllContactIDs()[B
    .registers 9

    .line 526
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string v0, "_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_52

    .line 530
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    mul-int/lit8 v3, v3, 0x4

    new-array v3, v3, [B

    .line 531
    :goto_20
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-ge v2, v4, :cond_4e

    .line 532
    invoke-interface {v1, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 533
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    mul-int/lit8 v5, v2, 0x4

    ushr-int/lit8 v6, v4, 0x18

    int-to-byte v6, v6

    .line 534
    aput-byte v6, v3, v5

    add-int/lit8 v6, v5, 0x1

    ushr-int/lit8 v7, v4, 0x10

    int-to-byte v7, v7

    .line 535
    aput-byte v7, v3, v6

    add-int/lit8 v6, v5, 0x2

    ushr-int/lit8 v7, v4, 0x8

    int-to-byte v7, v7

    .line 536
    aput-byte v7, v3, v6

    add-int/lit8 v5, v5, 0x3

    int-to-byte v4, v4

    .line 537
    aput-byte v4, v3, v5

    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 540
    :cond_4e
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    return-object v3

    :cond_52
    new-array v0, v2, [B

    return-object v0
.end method

.method public getCachedContactAddress()Lcom/navngo/igo/javaclient/androidgo/OutArgs;
    .registers 13

    .line 726
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x5

    const/4 v6, 0x0

    const-string v7, ""

    if-nez v0, :cond_20

    .line 727
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v7, v5, v6

    aput-object v7, v5, v4

    aput-object v7, v5, v3

    aput-object v7, v5, v2

    aput-object v7, v5, v1

    invoke-direct {v0, v5}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v0

    .line 730
    :cond_20
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mLastContactAdresses:Ljava/util/ArrayList;

    if-eqz v0, :cond_3d

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3d

    .line 731
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mLastContactAdresses:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/address/StructuredAddress;

    .line 732
    iget-object v7, v0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    .line 733
    iget-object v8, v0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    .line 734
    iget-object v9, v0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    .line 735
    iget-object v10, v0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    .line 736
    iget-object v0, v0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    goto :goto_41

    :cond_3d
    move-object v0, v7

    move-object v8, v0

    move-object v9, v8

    move-object v10, v9

    .line 739
    :goto_41
    new-instance v11, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v7, v5, v6

    aput-object v8, v5, v4

    aput-object v9, v5, v3

    aput-object v10, v5, v2

    aput-object v0, v5, v1

    invoke-direct {v11, v5}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v11
.end method

.method public getContactAllAddr()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 464
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v0

    const/16 v1, 0x2710

    const/4 v2, 0x0

    if-nez v0, :cond_1b

    .line 465
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>(I)V

    .line 466
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 467
    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    .line 468
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    return-object v0

    .line 472
    :cond_1b
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v5, "contact_id"

    const-string v6, "data10"

    const-string v7, "data7"

    const-string v8, "data9"

    const-string v9, "data4"

    const-string v10, "data8"

    const-string v11, "data2"

    filled-new-array/range {v5 .. v11}, [Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v6, "mimetype=\'vnd.android.cursor.item/postal-address_v2\'"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_44

    .line 490
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    goto :goto_45

    :cond_44
    const/4 v3, 0x0

    .line 493
    :goto_45
    new-instance v4, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v4, v1}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>(I)V

    .line 494
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;

    invoke-direct {v1, v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 496
    invoke-virtual {v1, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    const/4 v5, 0x0

    :goto_53
    if-ge v5, v3, :cond_ab

    .line 499
    invoke-interface {v0, v5}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 501
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    const/4 v6, 0x6

    .line 503
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    const/4 v6, 0x1

    .line 505
    invoke-interface {v0, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    const-string v8, ""

    if-eqz v7, :cond_72

    move-object v6, v8

    goto :goto_76

    :cond_72
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    :goto_76
    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    const/4 v6, 0x2

    .line 507
    invoke-interface {v0, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_82

    move-object v6, v8

    goto :goto_86

    :cond_82
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    :goto_86
    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    const/4 v6, 0x3

    .line 509
    invoke-interface {v0, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_92

    move-object v6, v8

    goto :goto_96

    :cond_92
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    :goto_96
    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    const/4 v6, 0x4

    .line 511
    invoke-interface {v0, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v7

    if-eqz v7, :cond_a1

    goto :goto_a5

    :cond_a1
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    :goto_a5
    invoke-virtual {v1, v8}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_53

    :cond_ab
    if-eqz v0, :cond_b0

    .line 516
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 519
    :cond_b0
    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    return-object v0
.end method

.method public getContactAllNames()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 411
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v0

    const/16 v1, 0x3e8

    const/4 v2, 0x0

    if-nez v0, :cond_1b

    .line 412
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>(I)V

    .line 413
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 414
    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    .line 415
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    return-object v0

    .line 419
    :cond_1b
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v0, "contact_id"

    const-string v5, "data3"

    const-string v6, "data2"

    const-string v7, "data1"

    filled-new-array {v0, v5, v6, v7}, [Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v6, "mimetype=\'vnd.android.cursor.item/name\'"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_3e

    .line 434
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    goto :goto_3f

    :cond_3e
    const/4 v3, 0x0

    .line 437
    :goto_3f
    new-instance v4, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    if-lez v3, :cond_47

    mul-int/lit8 v1, v3, 0x10

    add-int/lit16 v1, v1, 0xc8

    :cond_47
    invoke-direct {v4, v1}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>(I)V

    .line 438
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;

    invoke-direct {v1, v4}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 441
    invoke-virtual {v1, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    const/4 v5, 0x0

    :goto_53
    if-ge v5, v3, :cond_7a

    .line 444
    invoke-interface {v0, v5}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 446
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeInt(I)V

    const/4 v6, 0x1

    .line 447
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    const/4 v6, 0x2

    .line 448
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    const/4 v6, 0x3

    .line 449
    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lcom/navngo/igo/javaclient/androidgo/AndroidGoOutputStream;->writeUtf8(Ljava/lang/String;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_53

    :cond_7a
    if-eqz v0, :cond_7f

    .line 453
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 456
    :cond_7f
    invoke-virtual {v4}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    return-object v0
.end method

.method public getContactDetails(I)Lcom/navngo/igo/javaclient/androidgo/OutArgs;
    .registers 36

    move-object/from16 v0, p0

    .line 548
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 551
    iget-object v2, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "data3"

    const-string v9, "data2"

    const-string v10, "data1"

    filled-new-array {v2, v9, v10}, [Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x1

    new-array v7, v11, [Ljava/lang/String;

    .line 556
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v12, 0x0

    aput-object v6, v7, v12

    const-string v6, "contact_id=? AND mimetype=\'vnd.android.cursor.item/name\'"

    const/4 v8, 0x0

    .line 551
    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    const-string v4, ""

    if-eqz v3, :cond_49

    .line 559
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-lez v5, :cond_49

    .line 560
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    .line 561
    invoke-direct {v0, v3, v2}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 562
    invoke-direct {v0, v3, v9}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 563
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_4b

    .line 564
    invoke-direct {v0, v3, v10}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_4b

    :cond_49
    move-object v2, v4

    move-object v5, v2

    :cond_4b
    :goto_4b
    if-eqz v3, :cond_50

    .line 569
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 573
    :cond_50
    iget-object v3, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    sget-object v14, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v15, "data4"

    const-string v16, "data7"

    const-string v17, "data9"

    const-string v18, "data8"

    const-string v19, "data10"

    const-string v20, "data2"

    filled-new-array/range {v15 .. v20}, [Ljava/lang/String;

    move-result-object v15

    new-array v3, v11, [Ljava/lang/String;

    .line 581
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v12

    const/16 v18, 0x0

    const-string v16, "contact_id=? AND mimetype=\'vnd.android.cursor.item/postal-address_v2\'"

    move-object/from16 v17, v3

    .line 573
    invoke-virtual/range {v13 .. v18}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    move-object v6, v4

    move-object v7, v6

    move-object v8, v7

    move-object v10, v8

    move-object v13, v10

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    move-object/from16 v19, v18

    move-object/from16 v20, v19

    move-object/from16 v21, v20

    move-object/from16 v22, v21

    move-object/from16 v23, v22

    move-object/from16 v24, v23

    move-object/from16 v25, v24

    move-object/from16 v26, v25

    move-object/from16 v27, v26

    :goto_99
    if-eqz v3, :cond_13f

    .line 588
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v11

    if-ge v12, v11, :cond_13f

    .line 589
    invoke-interface {v3, v12}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 590
    invoke-interface {v3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    move-object/from16 v28, v9

    if-ltz v11, :cond_133

    .line 592
    invoke-interface {v3, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    move-object/from16 v29, v15

    const-string v15, "data4"

    .line 594
    invoke-direct {v0, v3, v15}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v30, v15

    const-string v15, "data7"

    .line 595
    invoke-direct {v0, v3, v15}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v31, v15

    const-string v15, "data9"

    .line 596
    invoke-direct {v0, v3, v15}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v32, v15

    const-string v15, "data8"

    .line 597
    invoke-direct {v0, v3, v15}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v33, v15

    const-string v15, "data10"

    .line 598
    invoke-direct {v0, v3, v15}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const/4 v0, 0x1

    if-ne v9, v0, :cond_e7

    move-object v10, v15

    move-object/from16 v15, v29

    move-object/from16 v4, v30

    move-object/from16 v6, v31

    move-object/from16 v7, v32

    move-object/from16 v8, v33

    goto :goto_137

    :cond_e7
    const/4 v0, 0x2

    if-ne v9, v0, :cond_f5

    move-object/from16 v17, v15

    move-object/from16 v13, v30

    move-object/from16 v14, v31

    move-object/from16 v15, v32

    move-object/from16 v16, v33

    goto :goto_137

    :cond_f5
    const/4 v0, 0x3

    if-ne v9, v0, :cond_105

    move-object/from16 v22, v15

    move-object/from16 v15, v29

    move-object/from16 v18, v30

    move-object/from16 v19, v31

    move-object/from16 v20, v32

    move-object/from16 v21, v33

    goto :goto_137

    :cond_105
    if-nez v9, :cond_114

    move-object/from16 v27, v15

    move-object/from16 v15, v29

    move-object/from16 v23, v30

    move-object/from16 v24, v31

    move-object/from16 v25, v32

    move-object/from16 v26, v33

    goto :goto_137

    .line 626
    :cond_114
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unknown typeIndex: "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " for contactID: "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v9, "MailSmsContacts"

    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_135

    :cond_133
    move-object/from16 v29, v15

    :goto_135
    move-object/from16 v15, v29

    :goto_137
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    move-object/from16 v9, v28

    goto/16 :goto_99

    :cond_13f
    move-object/from16 v29, v15

    if-eqz v3, :cond_146

    .line 632
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 635
    :cond_146
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    const/16 v1, 0x16

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object v5, v1, v2

    const/4 v2, 0x2

    aput-object v4, v1, v2

    const/4 v2, 0x3

    aput-object v6, v1, v2

    const/4 v2, 0x4

    aput-object v7, v1, v2

    const/4 v2, 0x5

    aput-object v8, v1, v2

    const/4 v2, 0x6

    aput-object v10, v1, v2

    const/4 v2, 0x7

    aput-object v13, v1, v2

    const/16 v2, 0x8

    aput-object v14, v1, v2

    const/16 v2, 0x9

    aput-object v29, v1, v2

    const/16 v2, 0xa

    aput-object v16, v1, v2

    const/16 v2, 0xb

    aput-object v17, v1, v2

    const/16 v2, 0xc

    aput-object v18, v1, v2

    const/16 v2, 0xd

    aput-object v19, v1, v2

    const/16 v2, 0xe

    aput-object v20, v1, v2

    const/16 v2, 0xf

    aput-object v21, v1, v2

    const/16 v2, 0x10

    aput-object v22, v1, v2

    const/16 v2, 0x11

    aput-object v23, v1, v2

    const/16 v2, 0x12

    aput-object v24, v1, v2

    const/16 v2, 0x13

    aput-object v25, v1, v2

    const/16 v2, 0x14

    aput-object v26, v1, v2

    const/16 v2, 0x15

    aput-object v27, v1, v2

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public getContactDetailsCached(I)Lcom/navngo/igo/javaclient/androidgo/OutArgs;
    .registers 22

    move-object/from16 v0, p0

    .line 647
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v1

    const/4 v2, 0x2

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v1, :cond_19

    .line 648
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v3, v2, v4

    aput-object v3, v2, v5

    invoke-direct {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v1

    .line 651
    :cond_19
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 654
    iget-object v6, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    sget-object v8, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v6, "data3"

    const-string v13, "data2"

    const-string v14, "data1"

    filled-new-array {v6, v13, v14}, [Ljava/lang/String;

    move-result-object v9

    new-array v11, v5, [Ljava/lang/String;

    .line 659
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v11, v4

    const/4 v12, 0x0

    const-string v10, "contact_id=? AND mimetype=\'vnd.android.cursor.item/name\'"

    .line 654
    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    if-eqz v7, :cond_5c

    .line 662
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v8

    if-lez v8, :cond_5c

    .line 663
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 664
    invoke-direct {v0, v7, v6}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 665
    invoke-direct {v0, v7, v13}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 666
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_5d

    .line 667
    invoke-direct {v0, v7, v14}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_5d

    :cond_5c
    move-object v6, v3

    :cond_5d
    :goto_5d
    if-eqz v7, :cond_62

    .line 672
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 675
    :cond_62
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mLastContactAdresses:Ljava/util/ArrayList;

    .line 678
    iget-object v7, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    sget-object v15, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const-string v7, "data4"

    const-string v8, "data7"

    const-string v9, "data9"

    const-string v10, "data8"

    const-string v11, "data10"

    const-string v12, "data2"

    filled-new-array/range {v7 .. v12}, [Ljava/lang/String;

    move-result-object v16

    new-array v7, v5, [Ljava/lang/String;

    .line 686
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    const/16 v19, 0x0

    const-string v17, "contact_id=? AND mimetype=\'vnd.android.cursor.item/postal-address_v2\'"

    move-object/from16 v18, v7

    .line 678
    invoke-virtual/range {v14 .. v19}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    const/4 v8, 0x0

    :goto_94
    if-eqz v7, :cond_110

    .line 688
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v9

    if-ge v8, v9, :cond_110

    const-string v9, "ContactPickerResultHandler"

    const-string v10, "handleActivityResult 6"

    .line 689
    invoke-static {v9, v10}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    invoke-interface {v7, v8}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 691
    invoke-interface {v7, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    if-ltz v10, :cond_10d

    const-string v11, "handleActivityResult 7"

    .line 693
    invoke-static {v9, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    const-string v11, "data4"

    .line 696
    invoke-direct {v0, v7, v11}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const-string v11, "data7"

    .line 697
    invoke-direct {v0, v7, v11}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v11, "data9"

    .line 698
    invoke-direct {v0, v7, v11}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v11, "data8"

    .line 699
    invoke-direct {v0, v7, v11}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v11, "data10"

    .line 700
    invoke-direct {v0, v7, v11}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->GetContactColumn(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    if-eqz v9, :cond_102

    if-eq v9, v5, :cond_102

    if-eq v9, v2, :cond_102

    const/4 v11, 0x3

    if-eq v9, v11, :cond_102

    .line 709
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Unknown typeIndex: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ", type: "

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " for contactID: "

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "MailSmsContacts"

    invoke-static {v10, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    :cond_102
    iget-object v9, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mLastContactAdresses:Ljava/util/ArrayList;

    new-instance v10, Lcom/navngo/igo/javaclient/address/StructuredAddress;

    move-object v14, v10

    invoke-direct/range {v14 .. v19}, Lcom/navngo/igo/javaclient/address/StructuredAddress;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10d
    add-int/lit8 v8, v8, 0x1

    goto :goto_94

    :cond_110
    if-eqz v7, :cond_115

    .line 717
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 719
    :cond_115
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v3, v2, v4

    aput-object v6, v2, v5

    invoke-direct {v1, v2}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v1
.end method

.method public insertContact(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/OutArgs;
    .registers 34

    move-object/from16 v8, p0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 748
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v2

    const-wide/16 v3, 0x0

    .line 749
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-nez v2, :cond_1e

    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v1, v11, [Ljava/lang/Object;

    aput-object v9, v1, v10

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v0

    .line 752
    :cond_1e
    sget-boolean v2, Lcom/navngo/igo/javaclient/Config;->enableInsertContactWithNewApi:Z

    const-string v3, "data2"

    const-string v4, "data3"

    const-string v5, "vnd.android.cursor.item/name"

    const-string v6, "mimetype"

    const-string v12, "data"

    if-eqz v2, :cond_a0

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0xa

    if-le v2, v7, :cond_a0

    .line 753
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 756
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 757
    invoke-virtual {v2, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 758
    invoke-virtual {v2, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 759
    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 760
    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object v1, v13

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    .line 763
    invoke-virtual/range {v0 .. v7}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->addContactAddressOverAPI10(Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x2

    move-object/from16 v3, p8

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v6, p11

    move-object/from16 v7, p12

    .line 764
    invoke-virtual/range {v0 .. v7}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->addContactAddressOverAPI10(Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x3

    move-object/from16 p1, p0

    move-object/from16 p2, v13

    move/from16 p3, v0

    move-object/from16 p4, p13

    move-object/from16 p5, p14

    move-object/from16 p6, p15

    move-object/from16 p7, p16

    move-object/from16 p8, p17

    .line 765
    invoke-virtual/range {p1 .. p8}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->addContactAddressOverAPI10(Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "android"

    const-string v1, "register_functors"

    .line 767
    invoke-static {v0, v1, v11}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_96

    .line 769
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "android.intent.action.INSERT"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 770
    invoke-virtual {v0, v12, v13}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 771
    iget-object v1, v8, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 774
    :cond_96
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v1, v11, [Ljava/lang/Object;

    aput-object v9, v1, v10

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v0

    .line 777
    :cond_a0
    iget-object v2, v8, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    .line 778
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 781
    sget-object v2, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    .line 782
    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v7

    const-string v14, "caller_is_syncadapter"

    const-string v15, "true"

    invoke-virtual {v7, v14, v15}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 783
    invoke-virtual {v9, v2, v13}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v14

    .line 787
    invoke-static {v14, v12}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 788
    invoke-virtual {v13}, Landroid/content/ContentValues;->clear()V

    .line 789
    invoke-virtual {v13, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    invoke-virtual {v13, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 791
    invoke-virtual {v13, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 792
    invoke-virtual {v9, v2, v13}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 795
    invoke-static {v14, v12}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    const/4 v2, 0x1

    move-object/from16 v0, p0

    move-object v1, v12

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    .line 796
    invoke-virtual/range {v0 .. v7}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->addContactAddressUntilAPI10(Landroid/net/Uri;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x2

    move-object/from16 v3, p8

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v6, p11

    move-object/from16 v7, p12

    .line 797
    invoke-virtual/range {v0 .. v7}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->addContactAddressUntilAPI10(Landroid/net/Uri;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x3

    move-object/from16 p1, p0

    move-object/from16 p2, v12

    move/from16 p3, v0

    move-object/from16 p4, p13

    move-object/from16 p5, p14

    move-object/from16 p6, p15

    move-object/from16 p7, p16

    move-object/from16 p8, p17

    .line 798
    invoke-virtual/range {p1 .. p8}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->addContactAddressUntilAPI10(Landroid/net/Uri;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 803
    invoke-virtual {v13}, Landroid/content/ContentValues;->clear()V

    .line 804
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "aggregation_mode"

    invoke-virtual {v13, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "sourceid"

    .line 805
    invoke-virtual {v13, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 807
    invoke-virtual {v9, v14, v13, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 809
    invoke-direct {v8, v14}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->startEditContactIntentForResult(Landroid/net/Uri;)V

    .line 811
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;

    new-array v1, v11, [Ljava/lang/Object;

    invoke-static {v14}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v10

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/OutArgs;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method public registerFunctors()V
    .registers 5

    .line 66
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.contact.getAllNames"

    const-string v2, "getContactAllNames"

    .line 69
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.contact.getAllAddr"

    const-string v2, "getContactAllAddr"

    .line 70
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.contact.insert"

    const-string v2, "insertContact"

    .line 71
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.contact.getDetailsCached"

    const-string v2, "getContactDetailsCached"

    .line 73
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.contact.getNextCachedAddress"

    const-string v2, "getCachedContactAddress"

    .line 74
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android"

    const-string v2, "register_functors"

    const/4 v3, 0x1

    .line 77
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_33

    return-void

    :cond_33
    const-string v1, "android.sendMail"

    const-string v2, "uiSendMail"

    .line 80
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.sendSms"

    const-string v2, "uiSendSms"

    .line 81
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.insertContact"

    const-string v2, "uiInsertContact"

    .line 82
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.call"

    const-string v2, "uiCall"

    .line 83
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.contact.show"

    const-string v2, "uiShowContact"

    .line 86
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.contact.showAll"

    const-string v2, "uiShowContacts"

    .line 87
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public resetRecentlyInserted()V
    .registers 2

    const/4 v0, 0x0

    .line 892
    iput-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mRecentlyInsertedContact:Landroid/net/Uri;

    return-void
.end method

.method public uiCall(Ljava/lang/Object;)V
    .registers 5

    if-eqz p1, :cond_2b

    .line 265
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DIAL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    .line 266
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 267
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 268
    iget-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_2b
    return-void
.end method

.method public uiInsertContact(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move-object/from16 v5, p7

    move-object/from16 v6, p10

    move-object/from16 v7, p11

    .line 118
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v8

    if-nez v8, :cond_17

    return-void

    .line 122
    :cond_17
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Insert Contact: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v10, p9

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "MailSmsContacts"

    invoke-static {v9, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    iget-object v8, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 126
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 127
    iget-boolean v12, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->oldInsertContactMethod:Z

    const-string v13, " "

    const-string v15, "data"

    if-nez v12, :cond_227

    .line 132
    sget-object v2, Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v2}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->wrapWithSyncAdapter(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 133
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "RawContact base Uri: "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-virtual {v8, v2, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 136
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Inserted Uri (rawcontact): "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    invoke-static {v2, v15}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    .line 140
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const-string v14, "mimetype"

    const-string v10, "vnd.android.cursor.item/name"

    .line 141
    invoke-virtual {v11, v14, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "data1"

    .line 142
    invoke-virtual {v11, v10, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "data2"

    .line 143
    invoke-virtual {v11, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    invoke-virtual {v8, v12, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 146
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Inserted Uri (name): "

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    invoke-static {v2, v15}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 150
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const-string v7, "vnd.android.cursor.item/postal-address_v2"

    .line 152
    invoke-virtual {v11, v14, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v7, 0x1

    .line 153
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v0, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "data10"

    move-object/from16 v12, p3

    .line 154
    invoke-virtual {v11, v7, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "data8"

    move-object/from16 v12, p4

    .line 155
    invoke-virtual {v11, v7, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "data7"

    .line 156
    invoke-virtual {v11, v7, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "data4"

    invoke-virtual {v11, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "data9"

    move-object/from16 v4, p8

    .line 158
    invoke-virtual {v11, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    invoke-virtual {v8, v1, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 161
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inserted Uri (address): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_163

    .line 165
    invoke-static {v2, v15}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 166
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const-string v3, "vnd.android.cursor.item/phone_v2"

    .line 168
    invoke-virtual {v11, v14, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 169
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v11, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 170
    invoke-virtual {v11, v10, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    invoke-virtual {v8, v1, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 172
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inserted Uri (phone): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    :cond_163
    invoke-virtual/range {p11 .. p11}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_192

    .line 177
    invoke-static {v2, v15}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 178
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const-string v3, "vnd.android.cursor.item/note"

    .line 180
    invoke-virtual {v11, v14, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v3, p11

    .line 181
    invoke-virtual {v11, v10, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    invoke-virtual {v8, v1, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 183
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inserted Uri (notes): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :cond_192
    invoke-virtual/range {p9 .. p9}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1ed

    .line 188
    invoke-static {v2, v15}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v3, "vnd.android.cursor.item/motonav_gcoor"

    .line 190
    invoke-virtual {v11, v14, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    invoke-static/range {p9 .. p9}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseGCoorFromString(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v3

    .line 192
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Coor parsed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    iget-wide v4, v3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->latitude:D

    invoke-static {v4, v5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v10, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    iget-wide v3, v3, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->longitude:D

    invoke-static {v3, v4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v0, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    invoke-virtual {v8, v1, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    .line 197
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Inserted Uri (Coor): "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    :cond_1ed
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const/4 v0, 0x1

    .line 204
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "aggregation_mode"

    invoke-virtual {v11, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "sourceid"

    .line 205
    invoke-virtual {v11, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 207
    invoke-virtual {v8, v2, v11, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Updated Rawcontact "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "; updated rows: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p0

    .line 210
    invoke-direct {v0, v2}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->startEditContactIntentForResult(Landroid/net/Uri;)V

    goto/16 :goto_30b

    :cond_227
    move-object v3, v7

    .line 213
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const-string v4, "name"

    .line 214
    invoke-virtual {v11, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    invoke-virtual/range {p11 .. p11}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_23b

    const-string v1, "notes"

    .line 216
    invoke-virtual {v11, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    :cond_23b
    sget-object v1, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v8, v1, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 220
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Base Contact Uri: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "type"

    if-gtz v3, :cond_26b

    invoke-virtual/range {p9 .. p9}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2e9

    .line 224
    :cond_26b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 225
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    invoke-virtual/range {p9 .. p9}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_28b

    .line 229
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    invoke-virtual/range {p9 .. p9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    invoke-static {v2, v5}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->normalizeGPSFormatted(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    :cond_28b
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const/4 v2, 0x2

    .line 234
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v5, "kind"

    invoke-virtual {v11, v5, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 235
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v15, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 236
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v11, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "contact_methods"

    .line 238
    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 239
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Postal Uri: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    invoke-virtual {v8, v2, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    .line 241
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Inserted Uri (postal): "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    :cond_2e9
    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_308

    .line 246
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    const-string v2, "number"

    .line 247
    invoke-virtual {v11, v2, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 248
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v11, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "phones"

    .line 250
    invoke-static {v1, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 251
    invoke-virtual {v8, v2, v11}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 254
    :cond_308
    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->startEditContactIntentForResult(Landroid/net/Uri;)V

    :goto_30b
    return-void
.end method

.method public uiSendMail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Ljava/lang/String;Ljava/lang/String;)V
    .registers 19

    move-object v0, p1

    .line 274
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v1

    if-nez v1, :cond_8

    return-void

    :cond_8
    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v3, 0x1

    aput-object p2, v1, v3

    const/4 v3, 0x2

    aput-object p3, v1, v3

    const/4 v3, 0x3

    aput-object p4, v1, v3

    const/4 v3, 0x4

    aput-object p5, v1, v3

    const/4 v3, 0x5

    aput-object p6, v1, v3

    const-string v3, "SendMail: subject: %s. name = \'%s\' address = \'%s\' coord = \'%s\' phone = \'%s\' notes = \'%s\'"

    .line 279
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "MailSmsContacts"

    invoke-static {v3, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const-string v10, "Warning"

    const-string v11, "Current position is unknown"

    if-gtz v1, :cond_42

    invoke-virtual/range {p4 .. p4}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result v1

    if-eqz v1, :cond_39

    goto :goto_42

    .line 304
    :cond_39
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    invoke-virtual {v0, v11, v10, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    move-object v0, p0

    goto :goto_a8

    .line 284
    :cond_42
    :goto_42
    new-instance v1, Landroid/content/Intent;

    const-string v4, "android.intent.action.SEND"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "text/plain"

    .line 285
    invoke-virtual {v1, v4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "android.intent.extra.SUBJECT"

    .line 286
    invoke-virtual {v1, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, ""

    .line 287
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v4, "android.intent.extra.EMAIL"

    invoke-virtual {v1, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-object v4, p0

    move-object v5, p2

    move-object v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    .line 289
    invoke-direct/range {v4 .. v9}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->composeMessageText(Ljava/lang/String;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 291
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_a0

    .line 293
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "android.intent.extra.TEXT"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 294
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Sending Email with data \'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, p0

    .line 295
    iget-object v2, v0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    const-string v3, "SendMail"

    invoke-static {v1, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_a8

    :cond_a0
    move-object v0, p0

    .line 299
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    invoke-virtual {v1, v11, v10, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    :goto_a8
    return-void
.end method

.method public uiSendSms(Ljava/lang/String;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 310
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 315
    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SendSMS: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MailSmsContacts"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "vnd.android-dir/mms-sms"

    .line 319
    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 320
    invoke-direct/range {p0 .. p5}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->composeMessageText(Ljava/lang/String;Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 322
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    if-lez p2, :cond_75

    .line 324
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "sms_body"

    invoke-virtual {v0, p3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Sending SMS with data \'"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    iget-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_81

    .line 330
    :cond_75
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p1

    const/4 p2, 0x0

    const-string p3, "Current position is unknown"

    const-string p4, "Warning"

    invoke-virtual {p1, p3, p4, p2}, Lcom/navngo/igo/javaclient/IgoActivity;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    :goto_81
    return-void
.end method

.method public uiShowContact(J)V
    .registers 4

    .line 817
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 821
    :cond_7
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    .line 822
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 823
    iget-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public uiShowContacts()V
    .registers 5

    .line 827
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->checkPermission()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 831
    :cond_7
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-nez v0, :cond_15

    const-string v0, "MailSmsContacts"

    const-string v1, "IgoActivity is null in uiShowContacts!"

    .line 833
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 837
    :cond_15
    new-instance v1, Landroid/content/Intent;

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string v3, "android.intent.action.PICK"

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/16 v2, 0x4e0

    .line 838
    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.functors.MailSmsContacts.AnonymousClass1 (com.navngo.igo.javaclient.functors.MailSmsContacts$1)
.class Lcom/navngo/igo/javaclient/functors/MailSmsContacts$1;
.super Ljava/lang/Object;
.source "MailSmsContacts.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/functors/MailSmsContacts;-><init>(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;)V
    .registers 2

    .line 52
    iput-object p1, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts$1;->this$0:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .line 55
    iget-object v0, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts$1;->this$0:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->getInstance()Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    move-result-object v1

    iget-object v2, p0, Lcom/navngo/igo/javaclient/functors/MailSmsContacts$1;->this$0:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->access$000(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;)Z

    move-result v2

    const-string v3, "android"

    const-string v4, "old_insert_contact_method"

    invoke-virtual {v1, v3, v4, v2}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->access$002(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;Z)Z

    return-void
.end method
