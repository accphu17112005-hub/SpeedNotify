###### Class com.navngo.igo.contactshelper.ContactsHelper (com.navngo.igo.contactshelper.ContactsHelper)
.class public Lcom/navngo/igo/contactshelper/ContactsHelper;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/contactshelper/ContactsHelper$GCoor;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$Note;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$Phone;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$StructuredName;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$StructuredPostal;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$CommonColumns;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$BaseTypes;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$RawContactsColumns;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$SyncColumns;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;,
        Lcom/navngo/igo/contactshelper/ContactsHelper$Contacts;
    }
.end annotation


# static fields
.field static final AUTHORITY_URI:Landroid/net/Uri;

.field public static final CALLER_IS_SYNCADAPTER:Ljava/lang/String; = "caller_is_syncadapter"

.field static final DATA_CONTENT_URI:Landroid/net/Uri;

.field static final POSTAL_CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "content://com.android.contacts"

    .line 15
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->AUTHORITY_URI:Landroid/net/Uri;

    const-string v1, "data"

    .line 17
    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->DATA_CONTENT_URI:Landroid/net/Uri;

    const-string v1, "postals"

    .line 18
    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->POSTAL_CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.BaseTypes (com.navngo.igo.contactshelper.ContactsHelper$BaseTypes)
.class public interface abstract Lcom/navngo/igo/contactshelper/ContactsHelper$BaseTypes;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BaseTypes"
.end annotation


# static fields
.field public static final TYPE_CUSTOM:I

###### Class com.navngo.igo.contactshelper.ContactsHelper.CommonColumns (com.navngo.igo.contactshelper.ContactsHelper$CommonColumns)
.class interface abstract Lcom/navngo/igo/contactshelper/ContactsHelper$CommonColumns;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$BaseTypes;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "CommonColumns"
.end annotation


# static fields
.field public static final DATA:Ljava/lang/String; = "data1"

.field public static final LABEL:Ljava/lang/String; = "data3"

.field public static final TYPE:Ljava/lang/String; = "data2"

###### Class com.navngo.igo.contactshelper.ContactsHelper.Contacts (com.navngo.igo.contactshelper.ContactsHelper$Contacts)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$Contacts;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Contacts"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/contact"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/contact"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final CUSTOM_RINGTONE:Ljava/lang/String; = "custom_ringtone"

.field public static final DISPLAY_NAME:Ljava/lang/String; = "display_name"

.field public static final HAS_PHONE_NUMBER:Ljava/lang/String; = "has_phone_number"

.field public static final IN_VISIBLE_GROUP:Ljava/lang/String; = "in_visible_group"

.field public static final LAST_TIME_CONTACTED:Ljava/lang/String; = "last_time_contacted"

.field public static final LOOKUP_KEY:Ljava/lang/String; = "lookup"

.field public static final PHOTO_ID:Ljava/lang/String; = "photo_id"

.field public static final PRESENCE_CUSTOM_PROTOCOL:Ljava/lang/String; = "presence_custom_protocol"

.field public static final PRESENCE_PROTOCOL:Ljava/lang/String; = "presence_protocol"

.field public static final SEND_TO_VOICEMAIL:Ljava/lang/String; = "send_to_voicemail"

.field public static final STARRED:Ljava/lang/String; = "starred"

.field public static final TIMES_CONTACTED:Ljava/lang/String; = "times_contacted"


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 21
    sget-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->AUTHORITY_URI:Landroid/net/Uri;

    const-string v1, "contacts"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper$Contacts;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.DataColumns (com.navngo.igo.contactshelper.ContactsHelper$DataColumns)
.class interface abstract Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "DataColumns"
.end annotation


# static fields
.field public static final DATA1:Ljava/lang/String; = "data1"

.field public static final DATA10:Ljava/lang/String; = "data10"

.field public static final DATA11:Ljava/lang/String; = "data11"

.field public static final DATA12:Ljava/lang/String; = "data12"

.field public static final DATA13:Ljava/lang/String; = "data13"

.field public static final DATA14:Ljava/lang/String; = "data14"

.field public static final DATA15:Ljava/lang/String; = "data15"

.field public static final DATA2:Ljava/lang/String; = "data2"

.field public static final DATA3:Ljava/lang/String; = "data3"

.field public static final DATA4:Ljava/lang/String; = "data4"

.field public static final DATA5:Ljava/lang/String; = "data5"

.field public static final DATA6:Ljava/lang/String; = "data6"

.field public static final DATA7:Ljava/lang/String; = "data7"

.field public static final DATA8:Ljava/lang/String; = "data8"

.field public static final DATA9:Ljava/lang/String; = "data9"

.field public static final DATA_VERSION:Ljava/lang/String; = "data_version"

.field public static final IS_PRIMARY:Ljava/lang/String; = "is_primary"

.field public static final IS_SUPER_PRIMARY:Ljava/lang/String; = "is_super_primary"

.field public static final MIMETYPE:Ljava/lang/String; = "mimetype"

.field public static final RAW_CONTACT_ID:Ljava/lang/String; = "raw_contact_id"

.field public static final RES_PACKAGE:Ljava/lang/String; = "res_package"

.field public static final SYNC1:Ljava/lang/String; = "data_sync1"

.field public static final SYNC2:Ljava/lang/String; = "data_sync2"

.field public static final SYNC3:Ljava/lang/String; = "data_sync3"

.field public static final SYNC4:Ljava/lang/String; = "data_sync4"

###### Class com.navngo.igo.contactshelper.ContactsHelper.GCoor (com.navngo.igo.contactshelper.ContactsHelper$GCoor)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$GCoor;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "GCoor"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/motonav_gcoor"

.field public static final COOR_LATITUDE:Ljava/lang/String; = "data1"

.field public static final COOR_LONGITUDE:Ljava/lang/String; = "data2"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 643
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.Note (com.navngo.igo.contactshelper.ContactsHelper$Note)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$Note;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Note"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/note"

.field public static final NOTE:Ljava/lang/String; = "data1"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 623
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.Phone (com.navngo.igo.contactshelper.ContactsHelper$Phone)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$Phone;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$CommonColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Phone"
.end annotation


# static fields
.field public static final CONTENT_FILTER_URI:Landroid/net/Uri;

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/phone_v2"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/phone_v2"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final NUMBER:Ljava/lang/String; = "data1"

.field public static final TYPE_ASSISTANT:I = 0x13

.field public static final TYPE_CALLBACK:I = 0x8

.field public static final TYPE_CAR:I = 0x9

.field public static final TYPE_COMPANY_MAIN:I = 0xa

.field public static final TYPE_FAX_HOME:I = 0x5

.field public static final TYPE_FAX_WORK:I = 0x4

.field public static final TYPE_HOME:I = 0x1

.field public static final TYPE_ISDN:I = 0xb

.field public static final TYPE_MAIN:I = 0xc

.field public static final TYPE_MMS:I = 0x14

.field public static final TYPE_MOBILE:I = 0x2

.field public static final TYPE_OTHER:I = 0x7

.field public static final TYPE_OTHER_FAX:I = 0xd

.field public static final TYPE_PAGER:I = 0x6

.field public static final TYPE_RADIO:I = 0xe

.field public static final TYPE_TELEX:I = 0xf

.field public static final TYPE_TTY_TDD:I = 0x10

.field public static final TYPE_WORK:I = 0x3

.field public static final TYPE_WORK_MOBILE:I = 0x11

.field public static final TYPE_WORK_PAGER:I = 0x12


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 576
    sget-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->DATA_CONTENT_URI:Landroid/net/Uri;

    const-string v1, "phones"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string v1, "filter"

    .line 585
    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper$Phone;->CONTENT_FILTER_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 560
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.RawContacts (com.navngo.igo.contactshelper.ContactsHelper$RawContacts)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$SyncColumns;
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$RawContactsColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RawContacts"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts$Data;
    }
.end annotation


# static fields
.field public static final AGGREGATION_MODE_DEFAULT:I = 0x0

.field public static final AGGREGATION_MODE_DISABLED:I = 0x3

.field public static final AGGREGATION_MODE_IMMEDIATE:I = 0x1

.field public static final AGGREGATION_MODE_SUSPENDED:I = 0x2

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/raw_contact"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/raw_contact"

.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 294
    sget-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->AUTHORITY_URI:Landroid/net/Uri;

    const-string v1, "raw_contacts"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.RawContacts.Data (com.navngo.igo.contactshelper.ContactsHelper$RawContacts$Data)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts$Data;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper$RawContacts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Data"
.end annotation


# static fields
.field public static final CONTENT_DIRECTORY:Ljava/lang/String; = "data"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 343
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.RawContactsColumns (com.navngo.igo.contactshelper.ContactsHelper$RawContactsColumns)
.class interface abstract Lcom/navngo/igo/contactshelper/ContactsHelper$RawContactsColumns;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "RawContactsColumns"
.end annotation


# static fields
.field public static final AGGREGATION_MODE:Ljava/lang/String; = "aggregation_mode"

.field public static final CONTACT_ID:Ljava/lang/String; = "contact_id"

.field public static final DELETED:Ljava/lang/String; = "deleted"

.field public static final IS_RESTRICTED:Ljava/lang/String; = "is_restricted"

###### Class com.navngo.igo.contactshelper.ContactsHelper.StructuredName (com.navngo.igo.contactshelper.ContactsHelper$StructuredName)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$StructuredName;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$CommonColumns;
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "StructuredName"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/name"

.field public static final DISPLAY_NAME:Ljava/lang/String; = "data1"

.field public static final FAMILY_NAME:Ljava/lang/String; = "data3"

.field public static final GIVEN_NAME:Ljava/lang/String; = "data2"

.field public static final MIDDLE_NAME:Ljava/lang/String; = "data5"

.field public static final PHONETIC_FAMILY_NAME:Ljava/lang/String; = "data9"

.field public static final PHONETIC_GIVEN_NAME:Ljava/lang/String; = "data7"

.field public static final PHONETIC_MIDDLE_NAME:Ljava/lang/String; = "data8"

.field public static final PREFIX:Ljava/lang/String; = "data4"

.field public static final SUFFIX:Ljava/lang/String; = "data6"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.StructuredPostal (com.navngo.igo.contactshelper.ContactsHelper$StructuredPostal)
.class public final Lcom/navngo/igo/contactshelper/ContactsHelper$StructuredPostal;
.super Ljava/lang/Object;
.source "ContactsHelper.java"

# interfaces
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$CommonColumns;
.implements Lcom/navngo/igo/contactshelper/ContactsHelper$DataColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "StructuredPostal"
.end annotation


# static fields
.field public static final CITY:Ljava/lang/String; = "data7"

.field public static final CONTENT_DIRECTORY:Ljava/lang/String; = "data"

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/postal-address_v2"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/postal-address_v2"

.field public static final CONTENT_URI:Landroid/net/Uri;

.field public static final COUNTRY:Ljava/lang/String; = "data10"

.field public static final FORMATTED_ADDRESS:Ljava/lang/String; = "data1"

.field public static final NEIGHBORHOOD:Ljava/lang/String; = "data6"

.field public static final POBOX:Ljava/lang/String; = "data5"

.field public static final POSTCODE:Ljava/lang/String; = "data9"

.field public static final REGION:Ljava/lang/String; = "data8"

.field public static final STREET:Ljava/lang/String; = "data4"

.field public static final TYPE_HOME:I = 0x1

.field public static final TYPE_OTHER:I = 0x3

.field public static final TYPE_WORK:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 406
    sget-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper;->DATA_CONTENT_URI:Landroid/net/Uri;

    const-string v1, "postals"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/contactshelper/ContactsHelper$StructuredPostal;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 389
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.contactshelper.ContactsHelper.SyncColumns (com.navngo.igo.contactshelper.ContactsHelper$SyncColumns)
.class interface abstract Lcom/navngo/igo/contactshelper/ContactsHelper$SyncColumns;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/contactshelper/ContactsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "SyncColumns"
.end annotation


# static fields
.field public static final ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final ACCOUNT_TYPE:Ljava/lang/String; = "account_type"

.field public static final DIRTY:Ljava/lang/String; = "dirty"

.field public static final SOURCE_ID:Ljava/lang/String; = "sourceid"

.field public static final VERSION:Ljava/lang/String; = "version"
