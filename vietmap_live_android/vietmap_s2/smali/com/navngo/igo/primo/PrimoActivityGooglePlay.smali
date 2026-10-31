###### Class com.navngo.igo.primo.PrimoActivityGooglePlay (com.navngo.igo.primo.PrimoActivityGooglePlay)
.class public Lcom/navngo/igo/primo/PrimoActivityGooglePlay;
.super Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;
.source "PrimoActivityGooglePlay.java"


# static fields
.field private static final logname:Ljava/lang/String; = "PrimoActivityGooglePlay"


# instance fields
.field private final PHONE_NUMBER:Ljava/lang/String;

.field private final SHARED_PREFERENCES_NAME:Ljava/lang/String;

.field private init_done:Z

.field private preferences:Landroid/content/SharedPreferences;

.field private resumed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 30
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->init_done:Z

    .line 34
    iput-boolean v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->resumed:Z

    const-string v0, "PrimoServiceSharedPreferences"

    .line 36
    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->SHARED_PREFERENCES_NAME:Ljava/lang/String;

    const-string v0, "phoneNumber"

    .line 37
    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->PHONE_NUMBER:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z
    .registers 1

    .line 30
    iget-boolean p0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->init_done:Z

    return p0
.end method

.method static synthetic access$002(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;Z)Z
    .registers 2

    .line 30
    iput-boolean p1, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->init_done:Z

    return p1
.end method

.method static synthetic access$100(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z
    .registers 1

    .line 30
    iget-boolean p0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->resumed:Z

    return p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z
    .registers 1

    .line 30
    invoke-direct {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->isPhoneNumberSaved()Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)V
    .registers 1

    .line 30
    invoke-direct {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startDataInstall()V

    return-void
.end method

.method static synthetic access$400(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)V
    .registers 1

    .line 30
    invoke-direct {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startLoginActivity()V

    return-void
.end method

.method static synthetic access$500()Ljava/lang/String;
    .registers 1

    .line 30
    sget-object v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->logname:Ljava/lang/String;

    return-object v0
.end method

.method private isPhoneNumberSaved()Z
    .registers 5

    const-string v0, "PrimoServiceSharedPreferences"

    const/4 v1, 0x0

    .line 82
    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->preferences:Landroid/content/SharedPreferences;

    const-string v2, "phoneNumber"

    const-string v3, ""

    .line 83
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Encryptor;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 84
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1e

    const/4 v1, 0x1

    :cond_1e
    return v1
.end method

.method private startDataInstall()V
    .registers 3

    .line 93
    new-instance v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;

    const-string v1, "DataInstallerThread"

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;-><init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;Ljava/lang/String;)V

    .line 106
    invoke-virtual {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->start()V

    .line 107
    invoke-virtual {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->showLoadAnimation()V

    return-void
.end method

.method private startLoginActivity()V
    .registers 3

    .line 88
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/navngo/igo/javaclient/login/LoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 89
    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method protected getXorKey()[B
    .registers 5

    const/16 v0, 0x10

    new-array v1, v0, [B

    .line 41
    fill-array-data v1, :array_18

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_16

    .line 48
    aget-byte v3, v1, v2

    mul-int/lit8 v3, v3, 0x5

    add-int/lit8 v3, v3, 0x4

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_16
    return-object v1

    nop

    :array_18
    .array-data 1
        -0xft
        0x48t
        -0x72t
        0x5dt
        0x36t
        -0x12t
        -0x69t
        -0x21t
        -0x10t
        -0x67t
        0x4dt
        0x59t
        0x26t
        0x22t
        -0x6dt
        -0x61t
    .end array-data
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4

    .line 55
    sget-object v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->logname:Ljava/lang/String;

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-super {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onCreate(Landroid/os/Bundle;)V

    .line 57
    sget-object p1, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    new-instance v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$1;-><init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)V

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->setExternalLogic(Lcom/navngo/igo/javaclient/IExternalResumeLogic;)V

    return-void
.end method

.method protected onDestroy()V
    .registers 1

    .line 194
    invoke-super {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onDestroy()V

    return-void
.end method

.method protected onLoadingFinished(Z)V
    .registers 2

    .line 199
    invoke-super {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onLoadingFinished(Z)V

    return-void
.end method

.method protected onPause()V
    .registers 3

    .line 187
    invoke-super {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onPause()V

    .line 188
    sget-object v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->logname:Ljava/lang/String;

    const-string v1, "onPause called"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 189
    iput-boolean v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->resumed:Z

    return-void
.end method

.method public onPermissionsGranted()V
    .registers 3

    .line 144
    invoke-super {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onPermissionsGranted()V

    .line 146
    invoke-virtual {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    .line 154
    :cond_a
    new-instance v0, Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/intentprocessers/ViewContactAddressProcesser;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;)V

    .line 155
    new-instance v0, Lcom/navngo/igo/javaclient/intentprocessers/OldFormatContactAddressProcesser;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/intentprocessers/OldFormatContactAddressProcesser;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;)V

    .line 156
    new-instance v0, Lcom/navngo/igo/javaclient/intentprocessers/HTCContactAddressProcesser;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/intentprocessers/HTCContactAddressProcesser;-><init>()V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;)V

    .line 159
    new-instance v0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->addActivityResultHandler(Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;)V

    .line 160
    new-instance v0, Lcom/navngo/igo/javaclient/activityresulthandler/EditContactResultHandler;

    sget-object v1, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->INSTANCE:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/activityresulthandler/EditContactResultHandler;-><init>(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->addActivityResultHandler(Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;)V

    .line 161
    new-instance v0, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/activityresulthandler/PicturePickerResultHandler;-><init>()V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->addActivityResultHandler(Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;)V

    .line 165
    invoke-virtual {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startLoaderThread()V

    return-void
.end method

.method protected onRestart()V
    .registers 2

    .line 170
    invoke-super {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onRestart()V

    .line 171
    invoke-direct {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->isPhoneNumberSaved()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 172
    invoke-direct {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startDataInstall()V

    goto :goto_10

    .line 174
    :cond_d
    invoke-direct {p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startLoginActivity()V

    :goto_10
    return-void
.end method

.method protected onResume()V
    .registers 3

    .line 180
    invoke-super {p0}, Lcom/navngo/igo/javaclient/googleplay/IgoActivityGooglePlay;->onResume()V

    .line 181
    sget-object v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->logname:Ljava/lang/String;

    const-string v1, "onResume called"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 182
    iput-boolean v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->resumed:Z

    return-void
.end method

.method public requestPermissions()V
    .registers 5

    .line 112
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->getCriticalPermissions()Ljava/util/List;

    move-result-object v0

    .line 113
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v1

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->getOptionalPermissions()Ljava/util/List;

    move-result-object v1

    .line 114
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 115
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 117
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v1

    new-instance v3, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;

    invoke-direct {v3, p0, v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;-><init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;Ljava/util/List;)V

    invoke-virtual {v1, p0, v2, v3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestPermissions(Landroid/app/Activity;Ljava/util/List;Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;)V

    return-void
.end method

###### Class com.navngo.igo.primo.PrimoActivityGooglePlay.AnonymousClass1 (com.navngo.igo.primo.PrimoActivityGooglePlay$1)
.class Lcom/navngo/igo/primo/PrimoActivityGooglePlay$1;
.super Ljava/lang/Object;
.source "PrimoActivityGooglePlay.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/IExternalResumeLogic;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;


# direct methods
.method constructor <init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)V
    .registers 2

    .line 57
    iput-object p1, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$1;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleScreenOn()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public pauseIgo()Z
    .registers 2

    .line 68
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$1;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$000(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

.method public resumeIgo()Z
    .registers 2

    .line 60
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$1;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$000(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

###### Class com.navngo.igo.primo.PrimoActivityGooglePlay.AnonymousClass2 (com.navngo.igo.primo.PrimoActivityGooglePlay$2)
.class Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;
.super Ljava/lang/Thread;
.source "PrimoActivityGooglePlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->startDataInstall()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;


# direct methods
.method constructor <init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;Ljava/lang/String;)V
    .registers 3

    .line 93
    iput-object p1, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 95
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->onPermissionsGranted()V

    .line 96
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    new-instance v1, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;-><init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

###### Class com.navngo.igo.primo.PrimoActivityGooglePlay.AnonymousClass2.AnonymousClass1 (com.navngo.igo.primo.PrimoActivityGooglePlay$2$1)
.class Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;
.super Ljava/lang/Object;
.source "PrimoActivityGooglePlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;


# direct methods
.method constructor <init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;)V
    .registers 2

    .line 96
    iput-object p1, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;->this$1:Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 99
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;->this$1:Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;

    iget-object v0, v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-virtual {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->onPermissionsGranted()V

    .line 100
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;->this$1:Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;

    iget-object v0, v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$002(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;Z)Z

    .line 101
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2$1;->this$1:Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;

    iget-object v0, v0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$2;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$100(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 102
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->resumeCalled()V

    :cond_1e
    return-void
.end method

###### Class com.navngo.igo.primo.PrimoActivityGooglePlay.AnonymousClass3 (com.navngo.igo.primo.PrimoActivityGooglePlay$3)
.class Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;
.super Ljava/lang/Object;
.source "PrimoActivityGooglePlay.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->requestPermissions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

.field final synthetic val$criticalPermissions:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;Ljava/util/List;)V
    .registers 3

    .line 117
    iput-object p1, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    iput-object p2, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;->val$criticalPermissions:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllPermissionsGranted()V
    .registers 2

    .line 120
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$200(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 121
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$300(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)V

    goto :goto_13

    .line 123
    :cond_e
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;->this$0:Lcom/navngo/igo/primo/PrimoActivityGooglePlay;

    invoke-static {v0}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$400(Lcom/navngo/igo/primo/PrimoActivityGooglePlay;)V

    :goto_13
    return-void
.end method

.method public onSomePermissionsDenied(Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 129
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8
    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 131
    invoke-static {}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$500()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_35

    const-string v3, " granted"

    goto :goto_37

    :cond_35
    const-string v3, " denied"

    :goto_37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    iget-object v1, p0, Lcom/navngo/igo/primo/PrimoActivityGooglePlay$3;->val$criticalPermissions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 133
    invoke-static {}, Lcom/navngo/igo/primo/PrimoActivityGooglePlay;->access$500()Ljava/lang/String;

    move-result-object v0

    const-string v1, "critical permission is denied: Application.exit(true)"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 135
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    goto :goto_8

    :cond_5b
    return-void
.end method
