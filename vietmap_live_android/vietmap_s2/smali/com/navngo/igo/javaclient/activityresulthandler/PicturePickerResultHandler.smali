###### Class com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler (com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler)
.class public Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;
.super Ljava/lang/Object;
.source "PicturePickerResultHandler.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;
    }
.end annotation


# static fields
.field public static final REQUEST_CODE:I = 0x5c0b

.field private static final logname:Ljava/lang/String; = "PicturePickerResultHandler"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->registerFunctors()V

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;)V
    .registers 1

    .line 26
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->openPicturePickerInternal()V

    return-void
.end method

.method private getInputStreamFromURI(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;
    .registers 3

    .line 87
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_8} :catch_9

    return-object p1

    :catch_9
    const/4 p1, 0x0

    return-object p1
.end method

.method private openPicturePickerInternal()V
    .registers 4

    const-string v0, "PicturePickerResultHandler"

    const-string v1, "openPicturePickerInternal"

    .line 79
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    .line 81
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    const/16 v2, 0x5c0b

    invoke-virtual {v1, v0, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private registerFunctors()V
    .registers 4

    .line 48
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.openPicturePicker"

    const-string v2, "openPicturePicker"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getHandledRequestCode()I
    .registers 2

    const/16 v0, 0x5c0b

    return v0
.end method

.method public handleActivityResult(ILandroid/content/Intent;)V
    .registers 14

    const-string v0, "PicturePickerResultHandler"

    .line 100
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>()V

    const/4 v2, 0x2

    const-string v3, "other.picture_navigation.select_picture_from_android"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-nez p1, :cond_25

    .line 103
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v2, [Ljava/lang/Object;

    aput-object v1, p2, v5

    sget-object v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_USER_CANCELLED:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    iget v0, v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    invoke-virtual {p1, v3, v6, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void

    :cond_25
    const/4 v7, -0x1

    if-eq v7, p1, :cond_3e

    .line 106
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v2, [Ljava/lang/Object;

    aput-object v1, p2, v5

    sget-object v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_SOURCE_UNAVAILABLE:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    iget v0, v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->value:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p2, v4

    invoke-virtual {p1, v3, v6, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void

    .line 110
    :cond_3e
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 113
    :try_start_42
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object p2

    invoke-direct {p0, p2, p1}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->getInputStreamFromURI(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_4a} :catch_af

    if-eqz p1, :cond_5e

    .line 117
    :try_start_4c
    new-instance p2, Landroidx/exifinterface/media/ExifInterface;

    invoke-direct {p2, p1}, Landroidx/exifinterface/media/ExifInterface;-><init>(Ljava/io/InputStream;)V

    .line 118
    invoke-virtual {p2}, Landroidx/exifinterface/media/ExifInterface;->getLatLong()[D

    move-result-object p2
    :try_end_55
    .catchall {:try_start_4c .. :try_end_55} :catchall_59

    .line 120
    :try_start_55
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    goto :goto_5f

    :catchall_59
    move-exception p2

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 121
    throw p2

    :cond_5e
    move-object p2, v6

    :goto_5f
    if-eqz p2, :cond_94

    .line 124
    new-instance p1, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    aget-wide v7, p2, v5

    aget-wide v9, p2, v4

    invoke-direct {p1, v7, v8, v9, v10}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>(DD)V

    .line 125
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleActivityResult(): coordinates in image: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p2

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v5

    sget-object p1, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_NO_ERROR:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    iget p1, p1, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->value:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v4

    invoke-virtual {p2, v3, v6, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_c8

    :cond_94
    const-string p1, "handleActivityResult(): getLatLong() returned null"

    .line 129
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    new-array p2, v2, [Ljava/lang/Object;

    aput-object v1, p2, v5

    sget-object v1, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_NO_LOCATION_INFO:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    iget v1, v1, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->value:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p2, v4

    invoke-virtual {p1, v3, v6, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_ae} :catch_af

    goto :goto_c8

    :catch_af
    move-exception p1

    .line 134
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleActivityResult(): IOException, message: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_c8
    return-void
.end method

.method public openPicturePicker()V
    .registers 5

    const-string v0, "PicturePickerResultHandler"

    const-string v1, "openPicturePicker"

    .line 52
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_25

    const-string v1, "requesting ACCESS_MEDIA_LOCATION permission..."

    .line 59
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$1;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$1;-><init>(Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;)V

    const-string v3, "android.permission.ACCESS_MEDIA_LOCATION"

    invoke-virtual {v0, v1, v3, v2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestPermission(Landroid/app/Activity;Ljava/lang/String;Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;)V

    goto :goto_28

    .line 74
    :cond_25
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->openPicturePickerInternal()V

    :goto_28
    return-void
.end method

###### Class com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler.AnonymousClass1 (com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler$1)
.class Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$1;
.super Ljava/lang/Object;
.source "PicturePickerResultHandler.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->openPicturePicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;)V
    .registers 2

    .line 60
    iput-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$1;->this$0:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied()V
    .registers 3

    const-string v0, "PicturePickerResultHandler"

    const-string v1, "ACCESS_MEDIA_LOCATION permission was denied"

    .line 69
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$1;->this$0:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->access$000(Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;)V

    return-void
.end method

.method public onPermissionGranted()V
    .registers 3

    const-string v0, "PicturePickerResultHandler"

    const-string v1, "ACCESS_MEDIA_LOCATION permission is granted"

    .line 63
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$1;->this$0:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;->access$000(Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler.Result (com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler$Result)
.class final enum Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;
.super Ljava/lang/Enum;
.source "PicturePickerResultHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

.field public static final enum ERR_ACCESS_DENIED:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

.field public static final enum ERR_NO_ERROR:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

.field public static final enum ERR_NO_LOCATION_INFO:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

.field public static final enum ERR_SOURCE_UNAVAILABLE:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

.field public static final enum ERR_USER_CANCELLED:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;


# instance fields
.field public final value:I


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 29
    new-instance v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    const-string v1, "ERR_NO_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_NO_ERROR:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    .line 30
    new-instance v1, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    const-string v3, "ERR_SOURCE_UNAVAILABLE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_SOURCE_UNAVAILABLE:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    .line 31
    new-instance v3, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    const-string v5, "ERR_USER_CANCELLED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_USER_CANCELLED:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    .line 32
    new-instance v5, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    const-string v7, "ERR_NO_LOCATION_INFO"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_NO_LOCATION_INFO:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    .line 33
    new-instance v7, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    const-string v9, "ERR_ACCESS_DENIED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->ERR_ACCESS_DENIED:Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    const/4 v9, 0x5

    new-array v9, v9, [Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 28
    sput-object v9, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->$VALUES:[Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;
    .registers 2

    .line 28
    const-class v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;
    .registers 1

    .line 28
    sget-object v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->$VALUES:[Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler$Result;

    return-object v0
.end method
