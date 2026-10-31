###### Class com.navngo.igo.javaclient.IgoActivity (com.navngo.igo.javaclient.IgoActivity)
.class public Lcom/navngo/igo/javaclient/IgoActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "IgoActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;
    }
.end annotation


# static fields
.field private static final DIALOG_ABORTRETRYIGNORE:I = 0x1

.field private static final DIALOG_OK:I = 0x2

.field private static final DIALOG_OKCANCEL:I = 0x3

.field public static EXTRA_IS_INTERNAL_EVENT:Ljava/lang/String; = null

.field private static final ICON_ABORTRETRYIGNORE:I

.field private static final ICON_OK:I

.field private static final ICON_OKCANCEL:I

.field private static INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity; = null

.field static final INTENT_HANDLED:Ljava/lang/String; = "com.navngo.igo.javaclient.INTENT_HANDLED"

.field static final INTENT_STARTLOCKS:Ljava/lang/String; = "com.navngo.igo.javaclient.STARTLOCKS"

.field private static final logname:Ljava/lang/String; = "IgoActivity"

.field private static mOnRecreatedListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/OnActivityRecreatedListener;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private destroyed:Z

.field private dialogMsg:Ljava/lang/String;

.field private dialogRet:[I

.field private dialogTitle:Ljava/lang/String;

.field private googleVR:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

.field private mActivityResultHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;",
            ">;"
        }
    .end annotation
.end field

.field private mFixedOrientation:Z

.field final mIntentLock:Ljava/lang/String;

.field private mIntentProcessers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;",
            ">;"
        }
    .end annotation
.end field

.field private mLatestReceivedIntent:Landroid/content/Intent;

.field protected mMenu:Landroid/view/Menu;

.field public mNoSystemExit:Z

.field private mOnDestroyedListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/OnActivityDestroyedListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOrientationLocked:Z

.field private mRequestedOrientation:I

.field private mStuckWaiters:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private prevLocale:Ljava/util/Locale;

.field private progressDialog:Landroid/app/ProgressDialog;

.field private final shortLock:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 151
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/IgoActivity;->mOnRecreatedListeners:Ljava/util/List;

    const-string v0, "com.navngo.igo.javaclient.extra.IS_INTERNAL_EVENT"

    .line 201
    sput-object v0, Lcom/navngo/igo/javaclient/IgoActivity;->EXTRA_IS_INTERNAL_EVENT:Ljava/lang/String;

    const/4 v0, 0x0

    .line 227
    sput-object v0, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    .line 878
    sget v0, Lcom/navngo/igo/javaclient/Application;->APPICON_ID:I

    sput v0, Lcom/navngo/igo/javaclient/IgoActivity;->ICON_ABORTRETRYIGNORE:I

    .line 879
    sget v0, Lcom/navngo/igo/javaclient/Application;->APPICON_ID:I

    sput v0, Lcom/navngo/igo/javaclient/IgoActivity;->ICON_OK:I

    .line 880
    sget v0, Lcom/navngo/igo/javaclient/Application;->APPICON_ID:I

    sput v0, Lcom/navngo/igo/javaclient/IgoActivity;->ICON_OKCANCEL:I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 65
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mIntentProcessers:Ljava/util/List;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mActivityResultHandlers:Ljava/util/Map;

    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOnDestroyedListeners:Ljava/util/List;

    .line 203
    new-instance v0, Ljava/lang/String;

    const-string v1, "shortLock"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->shortLock:Ljava/lang/String;

    const/4 v0, 0x0

    .line 205
    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->googleVR:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const/4 v1, 0x0

    .line 228
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->destroyed:Z

    .line 229
    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->prevLocale:Ljava/util/Locale;

    .line 452
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mFixedOrientation:Z

    .line 453
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOrientationLocked:Z

    .line 543
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mNoSystemExit:Z

    .line 648
    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mLatestReceivedIntent:Landroid/content/Intent;

    const-string v1, "IntentLock"

    .line 649
    iput-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mIntentLock:Ljava/lang/String;

    .line 759
    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    .line 874
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mStuckWaiters:Ljava/util/Set;

    const/4 v0, -0x1

    .line 1126
    iput v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mRequestedOrientation:I

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/IgoActivity;)Landroid/content/Intent;
    .registers 1

    .line 65
    iget-object p0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mLatestReceivedIntent:Landroid/content/Intent;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;
    .registers 1

    .line 65
    iget-object p0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogMsg:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$102(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 65
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogMsg:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;
    .registers 1

    .line 65
    iget-object p0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogTitle:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$202(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 65
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/navngo/igo/javaclient/IgoActivity;[I)[I
    .registers 2

    .line 65
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogRet:[I

    return-object p1
.end method

.method private getLocale(Landroid/content/res/Configuration;)Ljava/util/Locale;
    .registers 4

    .line 443
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_10

    .line 444
    invoke-virtual {p1}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object p1

    goto :goto_12

    .line 447
    :cond_10
    iget-object p1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    :goto_12
    return-object p1
.end method

.method public static getMainActivityIntent()Landroid/content/Intent;
    .registers 3

    .line 1018
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.navngo.igo.javaclient.MainActivity"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
    :try_end_11
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_1b

    :catch_12
    move-exception v0

    const-string v1, "IgoActivity"

    const-string v2, "MainActivity not found"

    .line 1020
    invoke-static {v1, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    :goto_1b
    return-object v0
.end method

.method private registerFunctors()V
    .registers 5

    .line 808
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.optionsMenu.clear"

    const-string v2, "clearOptionsMenu"

    .line 810
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.optionsMenu.show"

    const-string v2, "showOptionsMenu"

    .line 811
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.optionsMenu.hide"

    const-string v2, "hideOptionsMenu"

    .line 812
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.optionsMenu.addItem"

    const-string v2, "addOptionsMenuItem"

    .line 814
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.optionsMenu.setItemProperties"

    const-string v2, "setOptionsMenuItemProperties"

    .line 815
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.activity.setTitle"

    const-string v2, "setTitleBarText"

    .line 817
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.getCurrentOrientation"

    const-string v2, "getCurrentOrientation"

    .line 819
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android"

    const-string v2, "register_functors"

    const/4 v3, 0x1

    .line 821
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_41

    return-void

    :cond_41
    const-string v1, "android.go_to_background"

    const-string v2, "goToBackground"

    .line 823
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.move_task_to_back"

    const-string v2, "uiMoveTaskToBack"

    .line 824
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.goToHomeScreen"

    const-string v2, "goToHomeScreen"

    .line 825
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.throwshutdownreasonexception"

    const-string v2, "throwShutdownReasonException"

    .line 826
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method private setScreenSizes()V
    .registers 7

    .line 398
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->resetScreenSizes()V

    .line 399
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getScreenSizes()Lcom/navngo/igo/javaclient/Application$ScreenSizes;

    move-result-object v0

    .line 402
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->isOrientationFixed()Z

    move-result v1

    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mFixedOrientation:Z

    const-string v2, "IgoActivity"

    if-eqz v1, :cond_50

    const-string v1, "rawdisplay"

    const-string v3, "orientation"

    const/4 v4, -0x1

    .line 406
    invoke-static {v1, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    const/4 v3, 0x7

    const/4 v5, 0x6

    if-eq v1, v4, :cond_2b

    if-eqz v1, :cond_29

    const/4 v0, 0x1

    if-eq v1, v0, :cond_38

    const/4 v3, 0x4

    goto :goto_38

    :cond_29
    :goto_29
    const/4 v3, 0x6

    goto :goto_38

    .line 422
    :cond_2b
    iget v1, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x:I

    iget v4, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y:I

    if-gt v1, v4, :cond_29

    iget v1, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x2:I

    iget v0, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y2:I

    if-le v1, v0, :cond_38

    goto :goto_29

    .line 427
    :cond_38
    :goto_38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setScreenSizes() mFixedOrientation orientation:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    invoke-virtual {p0, v3}, Lcom/navngo/igo/javaclient/IgoActivity;->setRequestedOrientation(I)V

    goto :goto_68

    .line 431
    :cond_50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setScreenSizes() !mFixedOrientation orientation:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getCurrentOrientation()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_68
    return-void
.end method

.method private showBGNotification(Z)V
    .registers 4

    .line 1098
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    if-eqz v0, :cond_1a

    if-eqz p1, :cond_13

    .line 1099
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->isThereSDNotification()Z

    move-result p1

    if-nez p1, :cond_13

    .line 1101
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/ServiceRunner;->showBGNotification(Z)V

    goto :goto_3c

    .line 1105
    :cond_13
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/ServiceRunner;->showBGNotification(Z)V

    goto :goto_3c

    .line 1109
    :cond_1a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "could not "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_29

    const-string p1, "show"

    goto :goto_2b

    :cond_29
    const-string p1, "hide"

    :goto_2b
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " BGNotification"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IgoActivity"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3c
    return-void
.end method

.method public static startInForeground(I)V
    .registers 2

    const/4 v0, 0x0

    .line 1026
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForegroundExtras(ILandroid/os/Bundle;)V

    return-void
.end method

.method public static startInForegroundExtras(ILandroid/os/Bundle;)V
    .registers 7

    const-string v0, "tmpWakeLock was released"

    .line 1030
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    if-lez p0, :cond_11

    .line 1032
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$18;

    invoke-direct {v0, p0, v1, p1}, Lcom/navngo/igo/javaclient/IgoActivity$18;-><init>(ILcom/navngo/igo/javaclient/IgoActivity;Landroid/os/Bundle;)V

    .line 1053
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity$18;->start()V

    return-void

    :cond_11
    const-string p0, "IgoActivity"

    const-string v1, "coming back really"

    .line 1057
    invoke-static {p0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1059
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    const/4 v3, 0x1

    if-ge v1, v2, :cond_31

    .line 1061
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v2, Landroid/content/Intent;

    const-string v4, "android.intent.action.CLOSE_SYSTEM_DIALOGS"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/navngo/igo/javaclient/IgoActivity;->EXTRA_IS_INTERNAL_EVENT:Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/Application;->sendBroadcast(Landroid/content/Intent;)V

    .line 1064
    :cond_31
    invoke-static {}, Lcom/navngo/igo/javaclient/IgoActivity;->getMainActivityIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "android.intent.action.MAIN"

    .line 1065
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x30440000

    .line 1066
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v2, "com.navngo.igo.javaclient.STARTLOCKS"

    .line 1071
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz p1, :cond_49

    .line 1073
    invoke-virtual {v1, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1080
    :cond_49
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "power"

    invoke-virtual {p1, v2}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    const-string v2, "Creating tmpWakeLock"

    .line 1081
    invoke-static {p0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const v2, 0x3000000a

    const-string v3, "iGO:tmpWakeLock"

    .line 1082
    invoke-virtual {p1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    const-string v2, "Acquiring tmpWakeLock"

    .line 1087
    invoke-static {p0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1088
    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1090
    :try_start_69
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2, v1}, Lcom/navngo/igo/javaclient/Application;->startActivity(Landroid/content/Intent;)V
    :try_end_6e
    .catchall {:try_start_69 .. :try_end_6e} :catchall_75

    .line 1092
    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1093
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_75
    move-exception v1

    .line 1092
    invoke-virtual {p1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1093
    invoke-static {p0, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1094
    throw v1
.end method


# virtual methods
.method public MessageBox(ILjava/lang/String;I)I
    .registers 5

    .line 941
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/IgoActivity;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public MessageBox(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 11

    if-nez p2, :cond_c

    .line 883
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/navngo/igo/javaclient/R$string;->app_name:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    :cond_c
    move-object v3, p2

    const-string p2, "IgoActivity"

    .line 885
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MessageBox: ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p2, 0x3

    const/4 v0, 0x1

    if-nez p3, :cond_32

    const/4 p2, 0x2

    const/4 v5, 0x2

    goto :goto_3d

    :cond_32
    and-int/lit8 v1, p3, 0x2

    if-eqz v1, :cond_38

    const/4 v5, 0x1

    goto :goto_3d

    :cond_38
    and-int/lit8 v1, p3, 0x1

    if-eqz v1, :cond_99

    const/4 v5, 0x3

    .line 899
    :goto_3d
    sget-object p2, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/ResumeHandler;->isResumed()Z

    move-result p2

    if-nez p2, :cond_4e

    const-string p1, "IgoActivity"

    const-string p2, "MessageBox can only be displayed if app is in foreground"

    .line 900
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x5

    return p1

    :cond_4e
    new-array v6, v0, [I

    .line 906
    new-instance p2, Lcom/navngo/igo/javaclient/IgoActivity$8;

    move-object v0, p2

    move-object v1, p0

    move-object v2, p1

    move-object v4, v6

    invoke-direct/range {v0 .. v5}, Lcom/navngo/igo/javaclient/IgoActivity$8;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;Ljava/lang/String;[II)V

    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 927
    monitor-enter v6

    .line 929
    :try_start_5d
    iget-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mStuckWaiters:Ljava/util/Set;

    invoke-interface {p1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 930
    invoke-virtual {v6}, Ljava/lang/Object;->wait()V
    :try_end_65
    .catch Ljava/lang/InterruptedException; {:try_start_5d .. :try_end_65} :catch_8e
    .catchall {:try_start_5d .. :try_end_65} :catchall_87

    .line 934
    :try_start_65
    iget-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mStuckWaiters:Ljava/util/Set;

    invoke-interface {p1, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const-string p1, "IgoActivity"

    .line 936
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "MessageBox returns "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p3, 0x0

    aget v0, v6, p3

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    aget p1, v6, p3

    .line 937
    monitor-exit v6

    return p1

    :catchall_87
    move-exception p1

    .line 934
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mStuckWaiters:Ljava/util/Set;

    invoke-interface {p2, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 935
    throw p1

    :catch_8e
    const/4 p1, 0x4

    .line 934
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mStuckWaiters:Ljava/util/Set;

    invoke-interface {p2, v6}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v6

    return p1

    :catchall_96
    move-exception p1

    .line 938
    monitor-exit v6
    :try_end_98
    .catchall {:try_start_65 .. :try_end_98} :catchall_96

    throw p1

    :cond_99
    const-string p1, "IgoActivity"

    .line 894
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MessageBox: mb_opts = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return p2
.end method

.method public SetPlatformID()V
    .registers 1

    return-void
.end method

.method public SetSleepMode(Z)V
    .registers 3

    .line 208
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$2;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$2;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Z)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final addActivityResultHandler(Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;)V
    .registers 4

    .line 115
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mActivityResultHandlers:Ljava/util/Map;

    invoke-interface {p1}, Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;->getHandledRequestCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;)V
    .registers 3

    .line 99
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mIntentProcessers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;Z)V
    .registers 4

    .line 103
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;)V

    if-eqz p2, :cond_12

    .line 105
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    .line 106
    invoke-interface {p1, p2}, Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 107
    invoke-interface {p1, p2}, Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;->processIntent(Landroid/content/Intent;)Z

    :cond_12
    return-void
.end method

.method public addOptionsMenuItem(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 1212
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$20;

    invoke-direct {v0, p0, p1, p2}, Lcom/navngo/igo/javaclient/IgoActivity$20;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public clearOptionsMenu()V
    .registers 2

    .line 1199
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$19;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/IgoActivity$19;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected connectToSdl(Landroid/view/View;)V
    .registers 10

    const/4 v0, 0x1

    :try_start_1
    const-string v1, "com.navngo.igo.javaclient.sdl.SdlConnection"

    .line 466
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Class;

    .line 467
    const-class v3, Landroid/app/Activity;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v3, v0, [Ljava/lang/Object;

    aput-object p0, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "bindSdlService"

    new-array v5, v0, [Ljava/lang/Class;

    .line 468
    const-class v6, Landroid/content/Intent;

    aput-object v6, v5, v4

    invoke-virtual {v1, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const-string v5, "setSdlRemoteView"

    new-array v6, v0, [Ljava/lang/Class;

    .line 469
    const-class v7, Landroid/view/View;

    aput-object v7, v6, v4

    invoke-virtual {v1, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v5, v0, [Ljava/lang/Object;

    aput-object p1, v5, v4

    .line 470
    invoke-virtual {v1, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array p1, v0, [Ljava/lang/Object;

    .line 471
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    aput-object v1, p1, v4

    invoke-virtual {v3, v2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_44} :catch_45

    goto :goto_62

    :catch_45
    move-exception p1

    .line 473
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_62
    return-void
.end method

.method protected endDialog(Landroid/content/DialogInterface;II)V
    .registers 6

    const-string p1, "IgoActivity"

    const-string v0, "endDialog"

    .line 1007
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 1008
    iget-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogRet:[I

    monitor-enter p1

    .line 1009
    :try_start_a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogRet:[I

    const/4 v1, 0x0

    aput p3, v0, v1

    .line 1010
    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 1011
    monitor-exit p1
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_17

    .line 1012
    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/IgoActivity;->removeDialog(I)V

    return-void

    :catchall_17
    move-exception p2

    .line 1011
    :try_start_18
    monitor-exit p1
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    throw p2
.end method

.method public getCurrentOrientation()I
    .registers 3

    .line 456
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_f

    const/4 v0, 0x0

    return v0

    :cond_f
    const/4 v0, 0x1

    return v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getLatestReceivedIntent()Landroid/content/Intent;
    .registers 2

    .line 1280
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mLatestReceivedIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public goToBackground()V
    .registers 4

    const-string v0, "IgoActivity"

    const-string v1, "goToBackground"

    .line 830
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "android"

    const-string v1, "register_functors"

    const/4 v2, 0x1

    .line 833
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_13

    return-void

    .line 836
    :cond_13
    invoke-virtual {p0, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->moveTaskToBack(Z)Z

    return-void
.end method

.method public goToHomeScreen()V
    .registers 3

    const-string v0, "IgoActivity"

    const-string v1, "goToHomeScreen"

    .line 849
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 850
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.HOME"

    .line 851
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    .line 852
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 854
    :try_start_18
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1b
    .catch Landroid/content/ActivityNotFoundException; {:try_start_18 .. :try_end_1b} :catch_1b

    :catch_1b
    return-void
.end method

.method public hideLoadAnimation()V
    .registers 3

    .line 785
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_11

    .line 786
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    const/4 v0, 0x0

    .line 787
    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    const-string v0, "IgoActivity"

    const-string v1, "hideLoadAnimation done."

    .line 788
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    return-void
.end method

.method public hideOptionsMenu()V
    .registers 2

    .line 1251
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$23;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/IgoActivity$23;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public declared-synchronized lockCurrentOrientation()V
    .registers 3

    monitor-enter p0

    .line 1114
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mFixedOrientation:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_18

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    const/4 v0, 0x1

    .line 1115
    :try_start_8
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOrientationLocked:Z

    .line 1116
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getCurrentOrientation()I

    move-result v1

    if-ne v1, v0, :cond_12

    const/4 v0, 0x7

    goto :goto_13

    :cond_12
    const/4 v0, 0x6

    :goto_13
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->setRequestedOrientation(I)V
    :try_end_16
    .catchall {:try_start_8 .. :try_end_16} :catchall_18

    .line 1119
    monitor-exit p0

    return-void

    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 5

    .line 1264
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 1265
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mActivityResultHandlers:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;

    if-eqz p1, :cond_14

    .line 1267
    invoke-interface {p1, p2, p3}, Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;->handleActivityResult(ILandroid/content/Intent;)V

    :cond_14
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 8

    .line 702
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IgoActivity class onConfigurationChanged: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoActivity"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "IgoActivity class onConfigurationChanged: BEGIN"

    .line 703
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 704
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    const-string v0, "IgoActivity class onConfigurationChanged: MIDDLE"

    .line 705
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 706
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->setOrientation(I)V

    .line 708
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    .line 709
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->getLocale(Landroid/content/res/Configuration;)Ljava/util/Locale;

    move-result-object p1

    .line 710
    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->prevLocale:Ljava/util/Locale;

    invoke-virtual {v2, p1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4d

    .line 711
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->saveCurrentLocale()Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 712
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v4, "android.on_locale_changed"

    invoke-virtual {v0, v4, v2, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    .line 713
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->prevLocale:Ljava/util/Locale;

    :cond_4d
    const-string p1, "IgoActivity class onConfigurationChanged: END"

    .line 716
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 6

    const-string v0, "IgoActivity"

    const-string v1, "onCreate"

    .line 233
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 235
    sget-object p1, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    if-eqz p1, :cond_29

    .line 236
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCreate: INSTANCE is not null, destroying the old one. value = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    sget-object p1, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/IgoActivity;->onDestroy()V

    .line 239
    :cond_29
    sput-object p0, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    .line 241
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/Application;->setApplicationContext(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 242
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/Application;->setIgoActivity(Lcom/navngo/igo/javaclient/IgoActivity;Z)V

    .line 243
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->requestPermissions()V

    .line 244
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->getLocale(Landroid/content/res/Configuration;)Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->prevLocale:Ljava/util/Locale;

    .line 245
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->localeHasBeenChanged()Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 247
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->saveCurrentLocale()Z

    .line 248
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/program/ProgramPhases;->getPhase()Lcom/navngo/program/ProgramPhases$Phase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/program/ProgramPhases$Phase;->getCode()I

    move-result v0

    sget-object v1, Lcom/navngo/program/ProgramPhases$Phase;->LANGUAGE_READY:Lcom/navngo/program/ProgramPhases$Phase;

    invoke-virtual {v1}, Lcom/navngo/program/ProgramPhases$Phase;->getCode()I

    move-result v1

    if-le v0, v1, :cond_7b

    .line 249
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/IgoActivity;->prevLocale:Ljava/util/Locale;

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, p1

    const-string p1, "android.on_locale_changed"

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :cond_7b
    return-void
.end method

.method protected onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5

    const-string v0, "IgoActivity"

    const-string v1, "onCreateDialog"

    .line 946
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    if-eq p1, v0, :cond_7e

    const/4 v0, 0x2

    const-string v1, "Ok"

    if-eq p1, v0, :cond_50

    const/4 v0, 0x3

    if-eq p1, v0, :cond_17

    .line 1003
    invoke-super {p0, p1, p2}, Landroidx/appcompat/app/AppCompatActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;

    move-result-object p1

    return-object p1

    .line 985
    :cond_17
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/navngo/igo/javaclient/IgoActivity;->ICON_OKCANCEL:I

    .line 986
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$17;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$17;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    .line 987
    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$16;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$16;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    const-string v1, "Cancel"

    .line 991
    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$15;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$15;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    .line 995
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogMsg:Ljava/lang/String;

    .line 999
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogTitle:Ljava/lang/String;

    .line 1000
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 1001
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1

    .line 971
    :cond_50
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/navngo/igo/javaclient/IgoActivity;->ICON_OK:I

    .line 972
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$14;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$14;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    .line 973
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$13;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$13;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    .line 977
    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogMsg:Ljava/lang/String;

    .line 981
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogTitle:Ljava/lang/String;

    .line 982
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 983
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1

    .line 949
    :cond_7e
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/navngo/igo/javaclient/IgoActivity;->ICON_ABORTRETRYIGNORE:I

    .line 950
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$12;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$12;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    const-string v1, "ABORT"

    .line 951
    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$11;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$11;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    const-string v1, "RETRY"

    .line 955
    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$10;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$10;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    .line 959
    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$9;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$9;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V

    const-string p1, "IGNORE"

    .line 963
    invoke-virtual {p2, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogMsg:Ljava/lang/String;

    .line 967
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity;->dialogTitle:Ljava/lang/String;

    .line 968
    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 969
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4

    .line 1162
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    if-nez v0, :cond_7

    .line 1163
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    goto :goto_13

    .line 1167
    :cond_7
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    const-string v0, "IgoActivity"

    const-string v1, "onCreateOptionsMenu() is called again! Using new Menu object."

    .line 1169
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 1170
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->onMultipleCreateOptionsMenu(Landroid/view/Menu;)V

    :goto_13
    const/4 p1, 0x1

    return p1
.end method

.method protected onDestroy()V
    .registers 8

    const-string v0, "IgoActivity"

    const-string v1, "onDestroy"

    .line 547
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 548
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->destroyed:Z

    if-eqz v0, :cond_16

    const-string v0, "IgoActivity"

    const-string v1, "onDestroy: this instance is already destroyed, exiting..."

    .line 549
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 550
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    return-void

    :cond_16
    const/4 v0, 0x1

    .line 553
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->destroyed:Z

    .line 556
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mStuckWaiters:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    const-string v3, "IgoActivity"

    const-string v4, "onDestroy: releasing stuck dialog box"

    .line 557
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    monitor-enter v2

    .line 559
    :try_start_31
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 560
    monitor-exit v2
    :try_end_35
    .catchall {:try_start_31 .. :try_end_35} :catchall_3d

    const-string v2, "IgoActivity"

    const-string v3, "onDestroy: released  stuck dialog box"

    .line 561
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1f

    :catchall_3d
    move-exception v0

    .line 560
    :try_start_3e
    monitor-exit v2
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3d

    throw v0

    .line 564
    :cond_40
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->hideLoadAnimation()V

    .line 565
    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->stop()V

    .line 568
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOnDestroyedListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/OnActivityDestroyedListener;

    .line 569
    invoke-interface {v2, p0}, Lcom/navngo/igo/javaclient/OnActivityDestroyedListener;->onActivityDestroyed(Lcom/navngo/igo/javaclient/IgoActivity;)V

    goto :goto_4e

    .line 571
    :cond_5e
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOnDestroyedListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 573
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/Application;->setIgoActivity(Lcom/navngo/igo/javaclient/IgoActivity;Z)V

    .line 588
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->localeHasBeenChanged()Z

    move-result v3

    const-string v4, "IgoActivity"

    .line 590
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onDestroy:100 isFinishing: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->isFinishing()Z

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, " localeHasBeenChanged="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_a3

    if-nez v3, :cond_a3

    const-string v0, "IgoActivity"

    const-string v2, "onDestroy, but not finishing"

    .line 592
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 594
    sput-object v1, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    return-void

    :cond_a3
    const-string v3, "IgoActivity"

    const-string v4, "onDestroy:200"

    .line 598
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 600
    sget-boolean v3, Lcom/navngo/igo/javaclient/Application;->exitOnDestroy:Z

    .line 614
    sget-boolean v3, Lcom/navngo/igo/javaclient/Application;->exitOnDestroy:Z

    if-nez v3, :cond_b1

    goto :goto_b4

    .line 615
    :cond_b1
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->blockWhileExit(Z)V

    :goto_b4
    const-string v0, "IgoActivity"

    const-string v3, "onDestroy:600"

    .line 618
    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    const-string v0, "IgoActivity"

    const-string v3, "onDestroy:700"

    .line 620
    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mNoSystemExit:Z

    if-nez v0, :cond_e3

    const-string v0, "android"

    const-string v3, "call_system_exit"

    sget-boolean v4, Lcom/navngo/igo/javaclient/Config;->def_callSystemExit:Z

    invoke-static {v0, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_e3

    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->exitOnDestroy:Z

    if-eqz v0, :cond_e3

    const-string v0, "IgoActivity"

    const-string v3, "Calling System.exit(0)"

    .line 624
    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 627
    :cond_e3
    sput-object v1, Lcom/navngo/igo/javaclient/IgoActivity;->INSTANCE:Lcom/navngo/igo/javaclient/IgoActivity;

    return-void
.end method

.method protected onIgoStarted()V
    .registers 1

    return-void
.end method

.method protected onLoadingFinished(Z)V
    .registers 2

    .line 74
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->hideLoadAnimation()V

    if-eqz p1, :cond_e

    .line 76
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->IsIntroEnded()Z

    move-result p1

    if-eqz p1, :cond_e

    .line 78
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->onIgoStarted()V

    :cond_e
    return-void
.end method

.method public onLowMemory()V
    .registers 3

    const-string v0, "IgoActivity"

    const-string v1, "onLowMemory"

    .line 794
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 795
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->onLowMemory()V

    return-void
.end method

.method protected onMultipleCreateOptionsMenu(Landroid/view/Menu;)V
    .registers 2

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 5

    .line 653
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onNewIntent(Landroid/content/Intent;)V

    const-string v0, "IgoActivity"

    .line 655
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNewIntent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "IntentLock"

    .line 656
    monitor-enter v0

    :try_start_1c
    const-string v1, "com.navngo.igo.javaclient.INTENT_HANDLED"

    const/4 v2, 0x1

    .line 659
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 660
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mLatestReceivedIntent:Landroid/content/Intent;

    const-string v1, "IgoActivity"

    const-string v2, "onNewIntent"

    .line 662
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 663
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v1

    const/high16 v2, 0x100000

    and-int/2addr v1, v2

    if-nez v1, :cond_38

    .line 665
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->processIntent(Landroid/content/Intent;)Z

    goto :goto_3f

    :cond_38
    const-string v1, "IgoActivity"

    const-string v2, "Activity was launched from history: don\'t process intent"

    .line 667
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 669
    :goto_3f
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->setIntent(Landroid/content/Intent;)V

    .line 670
    monitor-exit v0

    return-void

    :catchall_44
    move-exception p1

    monitor-exit v0
    :try_end_46
    .catchall {:try_start_1c .. :try_end_46} :catchall_44

    throw p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 6

    .line 1185
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    .line 1186
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    .line 1187
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string p1, "sc_on_options_menu_item_selected"

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v3, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return v1
.end method

.method public onOptionsMenuClosed(Landroid/view/Menu;)V
    .registers 5

    .line 1193
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "sc_on_options_menu_closed"

    const/4 v2, 0x0

    .line 1194
    invoke-virtual {p1, v1, v2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method protected onPause()V
    .registers 4

    .line 694
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    const-string v0, "IgoActivity"

    const-string v1, "onPause called"

    .line 695
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->pauseCalled()V

    const-string v0, "android"

    const-string v1, "show_background_notification"

    const/4 v2, 0x1

    .line 697
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->showBGNotification(Z)V

    return-void
.end method

.method protected onPermissionsGranted()V
    .registers 7

    const-string v0, "IgoActivity"

    const-string v1, "permissions are granted"

    .line 255
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->isEngineRunning()Z

    move-result v1

    if-nez v1, :cond_18

    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->isEngineStarting()Z

    move-result v1

    if-nez v1, :cond_18

    const-string v1, "Trying to create an activity while the engine is not running or starting."

    .line 258
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    :cond_18
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x200080

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    const-string v1, "android"

    const-string v2, "dismiss_keyguard"

    const/4 v3, 0x1

    .line 263
    invoke-static {v1, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 266
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/high16 v4, 0x480000

    invoke-virtual {v2, v4}, Landroid/view/Window;->addFlags(I)V

    .line 270
    :cond_36
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/navngo/igo/javaclient/Sound;->init(Landroid/app/Activity;)V

    const/4 v2, 0x0

    .line 272
    sput-boolean v2, Lcom/navngo/igo/javaclient/Application;->exitOnDestroy:Z

    const-string v4, "onPermissionsGranted:10"

    .line 274
    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    invoke-static {p0, v3}, Lcom/navngo/igo/javaclient/Application;->setIgoActivity(Lcom/navngo/igo/javaclient/IgoActivity;Z)V

    const-string v4, "onPermissionsGranted:20"

    .line 276
    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    :try_start_4d
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getWindow()Landroid/view/Window;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v4, v5}, Landroid/view/Window;->addFlags(I)V

    .line 279
    sget-object v4, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v4, p0}, Lcom/navngo/igo/javaclient/ResumeHandler;->start(Landroid/app/Activity;)V

    const/4 v4, 0x3

    .line 281
    invoke-static {v4}, Lcom/navngo/igo/javaclient/Config;->reload(I)V

    const-string v4, "wait_for_sdcard_on_start"

    .line 283
    invoke-static {v1, v4, v2}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_96

    .line 288
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "waiting "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "ms for sdcard"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_80
    if-lez v1, :cond_96

    .line 289
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    move-result v4

    if-nez v4, :cond_96

    const/16 v4, 0x1f4

    .line 290
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v4
    :try_end_8e
    .catchall {:try_start_4d .. :try_end_8e} :catchall_ff

    sub-int/2addr v1, v4

    int-to-long v4, v4

    .line 293
    :try_start_90
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_93
    .catch Ljava/lang/InterruptedException; {:try_start_90 .. :try_end_93} :catch_94
    .catchall {:try_start_90 .. :try_end_93} :catchall_ff

    goto :goto_80

    :catch_94
    nop

    goto :goto_80

    .line 300
    :cond_96
    :try_start_96
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->checkForSDCard(Z)Z

    move-result v1

    if-nez v1, :cond_a6

    .line 301
    invoke-static {}, Lcom/navngo/igo/javaclient/InsertSDCard;->show()V

    .line 302
    invoke-static {v3}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V
    :try_end_a2
    .catchall {:try_start_96 .. :try_end_a2} :catchall_ff

    .line 333
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->isFinishing()Z

    return-void

    :cond_a6
    :try_start_a6
    const-string v1, "onPermissionsGranted:100"

    .line 305
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->registerFunctors()V

    .line 308
    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;-><init>()V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->googleVR:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    .line 310
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->lockCurrentOrientation()V

    .line 311
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->setScreenSizes()V

    .line 312
    sget-boolean v1, Lcom/navngo/igo/javaclient/Config;->fullscreen:Z

    if-eqz v1, :cond_c8

    .line 313
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v3, 0x400

    invoke-virtual {v1, v3, v3}, Landroid/view/Window;->setFlags(II)V

    :cond_c8
    const-string v1, "onPermissionsGranted:200"

    .line 317
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/navngo/igo/javaclient/IgoActivity;->mOnRecreatedListeners:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 320
    sget-object v1, Lcom/navngo/igo/javaclient/IgoActivity;->mOnRecreatedListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 321
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_dd
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ed

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/OnActivityRecreatedListener;

    .line 322
    invoke-interface {v1, p0}, Lcom/navngo/igo/javaclient/OnActivityRecreatedListener;->onActivityRecreated(Lcom/navngo/igo/javaclient/IgoActivity;)V

    goto :goto_dd

    .line 326
    :cond_ed
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    sget-object v1, Lcom/navngo/program/ProgramPhases$Phase;->INTROSCREEN:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v3, Lcom/navngo/igo/javaclient/IgoActivity$3;

    invoke-direct {v3, p0}, Lcom/navngo/igo/javaclient/IgoActivity$3;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V
    :try_end_fb
    .catchall {:try_start_a6 .. :try_end_fb} :catchall_ff

    .line 333
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->isFinishing()Z

    return-void

    :catchall_ff
    move-exception v0

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->isFinishing()Z

    .line 335
    throw v0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 5

    .line 375
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 376
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method

.method protected onRestart()V
    .registers 3

    const-string v0, "IgoActivity"

    const-string v1, "onRestart called"

    .line 637
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onRestart()V

    return-void
.end method

.method protected onResume()V
    .registers 4

    .line 675
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    const-string v0, "IgoActivity"

    const-string v1, "onResume called"

    .line 676
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    sget-object v1, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ResumeHandler;->resumeCalled()V

    .line 679
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->isAppInForeground()Z

    move-result v1

    .line 680
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/ServiceRunner;->isMainServiceRunningOrStarting()Z

    move-result v2

    if-nez v2, :cond_25

    .line 681
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Lcom/navngo/igo/javaclient/ServiceRunner;->startMainService(Z)V

    goto :goto_29

    :cond_25
    const/4 v1, 0x0

    .line 683
    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->showBGNotification(Z)V

    .line 685
    :goto_29
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServiceRunner;->isSlapiServiceRunningOrStarting()Z

    move-result v1

    if-nez v1, :cond_36

    .line 687
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->serviceRunner:Lcom/navngo/igo/javaclient/ServiceRunner;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ServiceRunner;->startSlapiService()V

    :cond_36
    const-string v1, "onResume finished"

    .line 689
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onStart()V
    .registers 3

    const-string v0, "IgoActivity"

    const-string v1, "onStart called"

    .line 632
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 633
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStart()V

    return-void
.end method

.method protected onStop()V
    .registers 3

    const-string v0, "IgoActivity"

    const-string v1, "onStop called"

    .line 642
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onStop()V

    return-void
.end method

.method protected processIntent(Landroid/content/Intent;)Z
    .registers 8

    const/4 v0, 0x0

    .line 720
    move-object v1, v0

    check-cast v1, Ljava/util/Locale;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "processIntent: %s, flags = %d, extras = %s"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "IgoActivity"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mIntentProcessers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_31
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;

    .line 724
    invoke-interface {v2, p1}, Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result v5

    if-eqz v5, :cond_31

    .line 726
    invoke-interface {v2, p1}, Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;->processIntent(Landroid/content/Intent;)Z

    move-result v2

    if-eqz v2, :cond_31

    const/4 v0, 0x1

    goto :goto_4c

    :cond_4b
    const/4 v0, 0x0

    :goto_4c
    const-string v2, "com.navngo.igo.javaclient.STARTLOCKS"

    .line 734
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_5e

    .line 735
    new-instance p1, Lcom/navngo/igo/javaclient/IgoActivity$6;

    const-string v2, "INTENT_STARTLOCKS"

    invoke-direct {p1, p0, v2}, Lcom/navngo/igo/javaclient/IgoActivity$6;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)V

    .line 753
    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/IgoActivity$6;->start()V

    :cond_5e
    new-array p1, v4, [Ljava/lang/Object;

    .line 755
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, p1, v3

    const-string v2, "processIntent success: %b"

    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method protected final registerCommonReceivers()V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 139
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->registerCommonReceivers()V

    return-void
.end method

.method public final registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 147
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    return-void
.end method

.method public final registerObserver(Lcom/navngo/igo/javaclient/observer/IObserver;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 123
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/Application;->registerObserver(Lcom/navngo/igo/javaclient/observer/IObserver;)V

    return-void
.end method

.method public final registerOnActivityDestroyedListener(Lcom/navngo/igo/javaclient/OnActivityDestroyedListener;)V
    .registers 3

    .line 154
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOnDestroyedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final registerOnActivityRecreatedListener(Lcom/navngo/igo/javaclient/OnActivityRecreatedListener;)V
    .registers 3

    .line 158
    sget-object v0, Lcom/navngo/igo/javaclient/IgoActivity;->mOnRecreatedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 131
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Lcom/navngo/igo/javaclient/receiver/IReceiver;)V

    return-void
.end method

.method public declared-synchronized releaseFixedOrientation()V
    .registers 2

    monitor-enter p0

    .line 1121
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mFixedOrientation:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_11

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    const/4 v0, 0x0

    .line 1122
    :try_start_8
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOrientationLocked:Z

    .line 1123
    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mRequestedOrientation:I

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->requestOrientation(I)V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_11

    .line 1124
    monitor-exit p0

    return-void

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized requestOrientation(I)V
    .registers 9

    monitor-enter p0

    .line 1136
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mFixedOrientation:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_43

    if-eqz v0, :cond_7

    .line 1137
    monitor-exit p0

    return-void

    :cond_7
    const/4 v0, -0x1

    if-lt p1, v0, :cond_21

    const/16 v0, 0xa

    if-le p1, v0, :cond_f

    goto :goto_21

    .line 1143
    :cond_f
    :try_start_f
    iput p1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mRequestedOrientation:I

    .line 1144
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->mOrientationLocked:Z

    if-nez v0, :cond_1f

    .line 1146
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->setRequestedOrientation(I)V

    .line 1147
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getCurrentOrientation()I

    move-result p1

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->setOrientation(I)V
    :try_end_1f
    .catchall {:try_start_f .. :try_end_1f} :catchall_43

    .line 1149
    :cond_1f
    monitor-exit p0

    return-void

    :cond_21
    :goto_21
    :try_start_21
    const-string v0, "IgoActivity"

    const-string v1, ""

    .line 1140
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const/4 v3, 0x0

    move-object v4, v3

    check-cast v4, Ljava/util/Locale;

    const-string v4, "orientation value: %d is out of range"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_41
    .catchall {:try_start_21 .. :try_end_41} :catchall_43

    .line 1141
    monitor-exit p0

    return-void

    :catchall_43
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public requestPermissions()V
    .registers 5

    .line 339
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->getCriticalPermissions()Ljava/util/List;

    move-result-object v0

    .line 340
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v1

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->getOptionalPermissions()Ljava/util/List;

    move-result-object v1

    .line 341
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 342
    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 344
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v1

    new-instance v3, Lcom/navngo/igo/javaclient/IgoActivity$4;

    invoke-direct {v3, p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity$4;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/util/List;)V

    invoke-virtual {v1, p0, v2, v3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestPermissions(Landroid/app/Activity;Ljava/util/List;Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;)V

    return-void
.end method

.method protected setMapViewAsContentView()V
    .registers 2

    .line 162
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/IgoActivity$1;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setOptionsMenuItemProperties(III)V
    .registers 5

    .line 1226
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$21;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/navngo/igo/javaclient/IgoActivity$21;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;III)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setTitleBarText(Ljava/lang/String;)V
    .registers 2

    .line 1259
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected showLoadAnimation()V
    .registers 4

    .line 761
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->isEngineRunning()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 764
    :cond_7
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    .line 766
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/navngo/igo/javaclient/R$string;->loading_motonav:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 767
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showLoadAnimation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IgoActivity"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 768
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 769
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 771
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 772
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setOwnerActivity(Landroid/app/Activity;)V

    .line 773
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 774
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->requestWindowFeature(I)Z

    .line 775
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    return-void
.end method

.method public showOptionsMenu()V
    .registers 2

    .line 1243
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$22;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/IgoActivity$22;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected startLoaderThread()V
    .registers 3

    .line 481
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$5;

    const-string v1, "LoaderThread"

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/javaclient/IgoActivity$5;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)V

    .line 540
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity$5;->start()V

    return-void
.end method

.method public throwShutdownReasonException(Ljava/lang/String;)V
    .registers 7

    const-string v0, "IgoActivity"

    const-string v1, "Throwing RuntimeException to include shoutdown reason into crash report."

    .line 860
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 862
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getScreenSizes()Lcom/navngo/igo/javaclient/Application$ScreenSizes;

    move-result-object v0

    const/4 v1, 0x0

    .line 863
    move-object v2, v1

    check-cast v2, Ljava/util/Locale;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget v3, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    iget v3, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_x2:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v2, v4

    iget v0, v0, Lcom/navngo/igo/javaclient/Application$ScreenSizes;->mSize_y2:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v3, 0x3

    aput-object v0, v2, v3

    const-string v0, "<Resolution not supported: [%dx%d] [%dx%d]>"

    invoke-static {v1, v0, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "<resolutionnotsupported>"

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 864
    new-instance v0, Lcom/navngo/igo/javaclient/IgoActivity$7;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/IgoActivity$7;-><init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public uiMoveTaskToBack()V
    .registers 4

    const-string v0, "IgoActivity"

    const-string v1, "uiMoveTaskToBack"

    .line 840
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "android"

    const-string v1, "register_functors"

    const/4 v2, 0x1

    .line 843
    invoke-static {v0, v1, v2}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_13

    return-void

    .line 845
    :cond_13
    invoke-virtual {p0, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->moveTaskToBack(Z)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass1 (com.navngo.igo.javaclient.IgoActivity$1)
.class Lcom/navngo/igo/javaclient/IgoActivity$1;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->setMapViewAsContentView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 162
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .line 164
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->createMapView()Lcom/navngo/igo/javaclient/view/IMapView;

    move-result-object v0

    .line 165
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/view/IMapView;->asView()Landroid/view/View;

    move-result-object v1

    .line 166
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 167
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_19

    .line 168
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_19
    const-string v2, "rawdisplay"

    const-string v3, "screen_x"

    const/4 v4, 0x0

    .line 170
    invoke-static {v2, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    const-string v5, "screen_y"

    .line 171
    invoke-static {v2, v5, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    if-eqz v3, :cond_af

    if-eqz v5, :cond_af

    .line 175
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Overriding screen resolution using a linear layout: [ "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " x "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " ]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "IgoActivity"

    invoke-static {v7, v6}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    new-instance v6, Landroid/widget/LinearLayout;

    iget-object v8, p0, Lcom/navngo/igo/javaclient/IgoActivity$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v8}, Lcom/navngo/igo/javaclient/IgoActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v6, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 177
    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v8, v3, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v3, "paddig_left"

    .line 179
    invoke-static {v2, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    const-string v5, "paddig_top"

    .line 180
    invoke-static {v2, v5, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    const-string v8, "padding_right"

    .line 181
    invoke-static {v2, v8, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v8

    const-string v9, "padding_bottom"

    .line 182
    invoke-static {v2, v9, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    .line 183
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Padding values for linear layout:  Left: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " Top: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " Right: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " Bottom: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    invoke-virtual {v6, v3, v5, v8, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 185
    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v2, v6}, Lcom/navngo/igo/javaclient/IgoActivity;->setContentView(Landroid/view/View;)V

    goto :goto_b4

    .line 187
    :cond_af
    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v2, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->setContentView(Landroid/view/View;)V

    :goto_b4
    const-string v2, "sdl"

    const-string v3, "enabled"

    .line 189
    invoke-static {v2, v3, v4}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_c3

    .line 190
    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v2, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->connectToSdl(Landroid/view/View;)V

    .line 193
    :cond_c3
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/view/IMapView;->getCommonInterface()Lcom/navngo/igo/javaclient/view/CommonMapView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->requestFocus()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass10 (com.navngo.igo.javaclient.IgoActivity$10)
.class Lcom/navngo/igo/javaclient/IgoActivity$10;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 959
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$10;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$10;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 5

    .line 961
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$10;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$10;->val$id:I

    const/4 v2, 0x5

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass11 (com.navngo.igo.javaclient.IgoActivity$11)
.class Lcom/navngo/igo/javaclient/IgoActivity$11;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 955
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$11;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$11;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 957
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$11;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$11;->val$id:I

    const/4 v1, 0x4

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass12 (com.navngo.igo.javaclient.IgoActivity$12)
.class Lcom/navngo/igo/javaclient/IgoActivity$12;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 951
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$12;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$12;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 953
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$12;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$12;->val$id:I

    const/4 v1, 0x3

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass13 (com.navngo.igo.javaclient.IgoActivity$13)
.class Lcom/navngo/igo/javaclient/IgoActivity$13;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 977
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$13;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$13;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 979
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$13;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$13;->val$id:I

    const/4 v1, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass14 (com.navngo.igo.javaclient.IgoActivity$14)
.class Lcom/navngo/igo/javaclient/IgoActivity$14;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 973
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$14;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$14;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 5

    .line 975
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$14;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$14;->val$id:I

    const/4 v2, 0x2

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass15 (com.navngo.igo.javaclient.IgoActivity$15)
.class Lcom/navngo/igo/javaclient/IgoActivity$15;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 995
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$15;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$15;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 5

    .line 997
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$15;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$15;->val$id:I

    const/4 v2, 0x2

    invoke-virtual {v0, p1, v1, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass16 (com.navngo.igo.javaclient.IgoActivity$16)
.class Lcom/navngo/igo/javaclient/IgoActivity$16;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 991
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$16;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$16;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 993
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$16;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$16;->val$id:I

    const/4 v1, 0x2

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass17 (com.navngo.igo.javaclient.IgoActivity$17)
.class Lcom/navngo/igo/javaclient/IgoActivity$17;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 987
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$17;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$17;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 989
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$17;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$17;->val$id:I

    const/4 v1, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass18 (com.navngo.igo.javaclient.IgoActivity$18)
.class Lcom/navngo/igo/javaclient/IgoActivity$18;
.super Ljava/lang/Thread;
.source "IgoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->startInForegroundExtras(ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$delay:I

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(ILcom/navngo/igo/javaclient/IgoActivity;Landroid/os/Bundle;)V
    .registers 4

    .line 1032
    iput p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$delay:I

    iput-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1036
    :try_start_0
    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$delay:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_6} :catch_19

    .line 1040
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    if-eqz v0, :cond_13

    .line 1041
    new-instance v1, Lcom/navngo/igo/javaclient/IgoActivity$18$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/IgoActivity$18$1;-><init>(Lcom/navngo/igo/javaclient/IgoActivity$18;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_19

    :cond_13
    const/4 v0, 0x0

    .line 1049
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$extras:Landroid/os/Bundle;

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForegroundExtras(ILandroid/os/Bundle;)V

    :catch_19
    :goto_19
    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass18.AnonymousClass1 (com.navngo.igo.javaclient.IgoActivity$18$1)
.class Lcom/navngo/igo/javaclient/IgoActivity$18$1;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity$18;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity$18;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity$18;)V
    .registers 2

    .line 1041
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$18$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1044
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$18$1;->this$0:Lcom/navngo/igo/javaclient/IgoActivity$18;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity$18;->val$extras:Landroid/os/Bundle;

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startInForegroundExtras(ILandroid/os/Bundle;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass19 (com.navngo.igo.javaclient.IgoActivity$19)
.class Lcom/navngo/igo/javaclient/IgoActivity$19;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->clearOptionsMenu()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1199
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$19;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1201
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$19;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    if-nez v0, :cond_e

    const-string v0, "IgoActivity"

    const-string v1, "clearOptionsMenu before mMenu was initialized."

    .line 1203
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1206
    :cond_e
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$19;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    invoke-interface {v0}, Landroid/view/Menu;->clear()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass2 (com.navngo.igo.javaclient.IgoActivity$2)
.class Lcom/navngo/igo/javaclient/IgoActivity$2;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->SetSleepMode(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$enableSleep:Z


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Z)V
    .registers 3

    .line 208
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$2;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$2;->val$enableSleep:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 210
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$2;->val$enableSleep:Z

    const/16 v1, 0x80

    if-eqz v0, :cond_10

    .line 212
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$2;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_19

    .line 215
    :cond_10
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$2;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    :goto_19
    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass20 (com.navngo.igo.javaclient.IgoActivity$20)
.class Lcom/navngo/igo/javaclient/IgoActivity$20;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->addOptionsMenuItem(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$icon:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 1212
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->val$icon:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 1214
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    if-nez v0, :cond_e

    const-string v0, "IgoActivity"

    const-string v1, "addOptionsMenuItem before mMenu was initialized."

    .line 1216
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1219
    :cond_e
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    invoke-interface {v1}, Landroid/view/Menu;->size()I

    move-result v1

    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->val$title:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    .line 1220
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$20;->val$icon:Ljava/lang/String;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/NNG;->loadImageAsDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass21 (com.navngo.igo.javaclient.IgoActivity$21)
.class Lcom/navngo/igo/javaclient/IgoActivity$21;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->setOptionsMenuItemProperties(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$enabled:I

.field final synthetic val$index:I

.field final synthetic val$visible:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;III)V
    .registers 5

    .line 1226
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->val$index:I

    iput p3, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->val$visible:I

    iput p4, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->val$enabled:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 1228
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    if-nez v0, :cond_e

    const-string v0, "IgoActivity"

    const-string v1, "setOptionsMenuItemProperties before mMenu was initialized."

    .line 1230
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1233
    :cond_e
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mMenu:Landroid/view/Menu;

    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->val$index:I

    invoke-interface {v0, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 1235
    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->val$visible:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_20

    const/4 v1, 0x1

    goto :goto_21

    :cond_20
    const/4 v1, 0x0

    :goto_21
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1236
    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$21;->val$enabled:I

    if-eqz v1, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v2, 0x0

    :goto_2a
    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass22 (com.navngo.igo.javaclient.IgoActivity$22)
.class Lcom/navngo/igo/javaclient/IgoActivity$22;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->showOptionsMenu()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1243
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$22;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1245
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$22;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->openOptionsMenu()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass23 (com.navngo.igo.javaclient.IgoActivity$23)
.class Lcom/navngo/igo/javaclient/IgoActivity$23;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->hideOptionsMenu()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1251
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$23;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1253
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$23;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->closeOptionsMenu()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass3 (com.navngo.igo.javaclient.IgoActivity$3)
.class Lcom/navngo/igo/javaclient/IgoActivity$3;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onPermissionsGranted()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 326
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$3;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 329
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$3;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->onLoadingFinished(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass4 (com.navngo.igo.javaclient.IgoActivity$4)
.class Lcom/navngo/igo/javaclient/IgoActivity$4;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->requestPermissions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$criticalPermissions:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/util/List;)V
    .registers 3

    .line 344
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$4;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$4;->val$criticalPermissions:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllPermissionsGranted()V
    .registers 2

    .line 347
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->onPermissionsGranted()V

    .line 348
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$4;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/IgoActivity;->onPermissionsGranted()V

    return-void
.end method

.method public onSomePermissionsDenied(Ljava/util/Map;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 354
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    const-string v4, "IgoActivity"

    if-eqz v2, :cond_5e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 356
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_36

    const-string v6, " granted"

    goto :goto_38

    :cond_36
    const-string v6, " denied"

    :goto_38
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_5b

    iget-object v4, p0, Lcom/navngo/igo/javaclient/IgoActivity$4;->val$criticalPermissions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5b

    goto :goto_5c

    :cond_5b
    const/4 v3, 0x0

    :goto_5c
    or-int/2addr v1, v3

    goto :goto_a

    :cond_5e
    if-eqz v1, :cond_69

    const-string p1, "critical permission is denied: Application.exit(true)"

    .line 361
    invoke-static {v4, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    invoke-static {v3}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    goto :goto_6c

    .line 367
    :cond_69
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/IgoActivity$4;->onAllPermissionsGranted()V

    :goto_6c
    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass5 (com.navngo.igo.javaclient.IgoActivity$5)
.class Lcom/navngo/igo/javaclient/IgoActivity$5;
.super Ljava/lang/Thread;
.source "IgoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->startLoaderThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)V
    .registers 3

    .line 481
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    const-string v0, "IgoActivity"

    const-string v1, "startLoaderThread:300.000"

    .line 483
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->logBuild()V

    .line 491
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getTTSSpeaker()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    move-result-object v0

    invoke-interface {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeaker;->create()V

    .line 492
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->reInit()V

    .line 495
    sget-boolean v0, Lcom/navngo/igo/javaclient/Application;->NNG_FullyLoaded:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_31

    .line 496
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v0, v2}, Lcom/navngo/igo/javaclient/IgoActivity;->onLoadingFinished(Z)V

    const-string v0, "IgoActivity"

    const-string v2, "! NNG_FullyLoaded"

    .line 497
    new-instance v3, Ljava/lang/Exception;

    const-string v4, "error loading NNG"

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 499
    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    return-void

    :cond_31
    const-string v0, "IgoActivity"

    const-string v3, "startLoaderThread:300.100"

    .line 503
    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    invoke-static {v2}, Lcom/navngo/igo/javaclient/ServerRunner;->startServerAfterMediaScan(Z)V

    const-string v0, "IgoActivity"

    const-string v3, "startLoaderThread:300.400"

    .line 507
    invoke-static {v0, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "android"

    const-string v3, "enable_geo_intents"

    .line 508
    invoke-static {v0, v3, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    .line 512
    invoke-static {}, Lcom/navngo/igo/javaclient/Config;->useDefaultLocation()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_5b

    const-string v3, "IgoActivity"

    const-string v5, "startLoaderThread:300.410"

    .line 513
    invoke-static {v3, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    invoke-static {v4}, Lcom/navngo/igo/javaclient/ServerRunner;->onLocationChanged(Landroid/location/Location;)V

    :cond_5b
    const-string v3, "IgoActivity"

    const-string v5, "startLoaderThread:300.500"

    .line 518
    invoke-static {v3, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    iget-object v3, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/IgoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    invoke-static {v3}, Lcom/navngo/igo/javaclient/ServerRunner;->setOrientation(I)V

    const-string v3, "IgoActivity"

    const-string v5, "startLoaderThread:300.600"

    .line 522
    invoke-static {v3, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "IntentLock"

    .line 523
    monitor-enter v3

    .line 524
    :try_start_7b
    iget-object v5, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-static {v5}, Lcom/navngo/igo/javaclient/IgoActivity;->access$000(Lcom/navngo/igo/javaclient/IgoActivity;)Landroid/content/Intent;

    move-result-object v5

    if-eqz v5, :cond_8a

    iget-object v5, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-static {v5}, Lcom/navngo/igo/javaclient/IgoActivity;->access$000(Lcom/navngo/igo/javaclient/IgoActivity;)Landroid/content/Intent;

    move-result-object v5

    goto :goto_90

    :cond_8a
    iget-object v5, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v5}, Lcom/navngo/igo/javaclient/IgoActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    :goto_90
    if-eqz v5, :cond_9c

    const-string v6, "com.navngo.igo.javaclient.INTENT_HANDLED"

    .line 526
    invoke-virtual {v5, v6, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_9c

    const/4 v6, 0x1

    goto :goto_9d

    :cond_9c
    const/4 v6, 0x0

    :goto_9d
    const-string v7, "IgoActivity"

    .line 527
    move-object v8, v4

    check-cast v8, Ljava/util/Locale;

    const-string v8, "StartloaderThread intent check: action = %s, handled = %b, flags = %d"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v5}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v2

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v9, v1

    const/4 v1, 0x2

    invoke-virtual {v5}, Landroid/content/Intent;->getFlags()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v9, v1

    invoke-static {v4, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_d8

    if-nez v6, :cond_d8

    .line 528
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v1, v5}, Lcom/navngo/igo/javaclient/IgoActivity;->processIntent(Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_d8

    const-string v1, "IgoActivity"

    const-string v2, "startLoaderThread:300.610"

    .line 529
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    :cond_d8
    monitor-exit v3
    :try_end_d9
    .catchall {:try_start_7b .. :try_end_d9} :catchall_106

    const-string v1, "IgoActivity"

    const-string v2, "startLoaderThread:300.700"

    .line 533
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/Application;->setupAudioPath(Landroid/media/AudioManager;)V

    const-string v1, "IgoActivity"

    const-string v2, "startLoaderThread:300.800"

    .line 536
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/IgoActivity;->setMapViewAsContentView()V

    if-eqz v0, :cond_105

    .line 538
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$5;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->addIntentProcesser(Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;)V

    :cond_105
    return-void

    :catchall_106
    move-exception v0

    .line 531
    :try_start_107
    monitor-exit v3
    :try_end_108
    .catchall {:try_start_107 .. :try_end_108} :catchall_106

    throw v0
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass6 (com.navngo.igo.javaclient.IgoActivity$6)
.class Lcom/navngo/igo/javaclient/IgoActivity$6;
.super Ljava/lang/Thread;
.source "IgoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->processIntent(Landroid/content/Intent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)V
    .registers 3

    .line 735
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$6;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    const-wide/16 v0, 0x3e8

    .line 737
    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_5} :catch_f

    .line 741
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$6;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/IgoActivity$6$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/IgoActivity$6$1;-><init>(Lcom/navngo/igo/javaclient/IgoActivity$6;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :catch_f
    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass6.AnonymousClass1 (com.navngo.igo.javaclient.IgoActivity$6$1)
.class Lcom/navngo/igo/javaclient/IgoActivity$6$1;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/navngo/igo/javaclient/IgoActivity$6;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity$6;)V
    .registers 2

    .line 741
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$6$1;->this$1:Lcom/navngo/igo/javaclient/IgoActivity$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    const-string v0, "IgoActivity"

    const-string v1, "executing INTENT_STARTLOCKS"

    .line 742
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 743
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    .line 744
    new-instance v1, Lcom/navngo/igo/javaclient/IgoActivity$6$1$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/IgoActivity$6$1$1;-><init>(Lcom/navngo/igo/javaclient/IgoActivity$6$1;)V

    invoke-virtual {v0, v1}, Landroid/app/KeyguardManager;->exitKeyguardSecurely(Landroid/app/KeyguardManager$OnKeyguardExitResult;)V

    .line 751
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/ResumeHandler;->retest(J)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass6.AnonymousClass1.C00081 (com.navngo.igo.javaclient.IgoActivity$6$1$1)
.class Lcom/navngo/igo/javaclient/IgoActivity$6$1$1;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/app/KeyguardManager$OnKeyguardExitResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity$6$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/navngo/igo/javaclient/IgoActivity$6$1;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity$6$1;)V
    .registers 2

    .line 744
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$6$1$1;->this$2:Lcom/navngo/igo/javaclient/IgoActivity$6$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKeyguardExitResult(Z)V
    .registers 4

    .line 747
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onKeyguardExitResult: success = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IgoActivity"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass7 (com.navngo.igo.javaclient.IgoActivity$7)
.class Lcom/navngo/igo/javaclient/IgoActivity$7;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->throwShutdownReasonException(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$extendedReason:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)V
    .registers 3

    .line 864
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$7;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$7;->val$extendedReason:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 866
    new-instance v0, Ljava/lang/RuntimeException;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$7;->val$extendedReason:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass8 (com.navngo.igo.javaclient.IgoActivity$8)
.class Lcom/navngo/igo/javaclient/IgoActivity$8;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->MessageBox(Ljava/lang/String;Ljava/lang/String;I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$f_id:I

.field final synthetic val$f_title:Ljava/lang/String;

.field final synthetic val$msg:Ljava/lang/String;

.field final synthetic val$ret:[I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;Ljava/lang/String;[II)V
    .registers 6

    .line 906
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$msg:Ljava/lang/String;

    iput-object p3, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$f_title:Ljava/lang/String;

    iput-object p4, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$ret:[I

    iput p5, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$f_id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 909
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$msg:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->access$102(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 910
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$f_title:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->access$202(Lcom/navngo/igo/javaclient/IgoActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 911
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$ret:[I

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->access$302(Lcom/navngo/igo/javaclient/IgoActivity;[I)[I

    .line 912
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_2c

    const-string v0, "IgoActivity"

    const-string v1, "MessageBox.showDialog"

    .line 913
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 914
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$f_id:I

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->showDialog(I)V

    goto :goto_63

    :cond_2c
    const-string v0, "IgoActivity"

    .line 918
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageBox: ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/IgoActivity;->access$200(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/IgoActivity;->access$100(Lcom/navngo/igo/javaclient/IgoActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 919
    iget-object v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$ret:[I

    monitor-enter v0

    .line 920
    :try_start_59
    iget-object v1, p0, Lcom/navngo/igo/javaclient/IgoActivity$8;->val$ret:[I

    const/4 v2, 0x0

    const/4 v3, 0x5

    aput v3, v1, v2

    .line 921
    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 922
    monitor-exit v0

    :goto_63
    return-void

    :catchall_64
    move-exception v1

    monitor-exit v0
    :try_end_66
    .catchall {:try_start_59 .. :try_end_66} :catchall_64

    throw v1
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.AnonymousClass9 (com.navngo.igo.javaclient.IgoActivity$9)
.class Lcom/navngo/igo/javaclient/IgoActivity$9;
.super Ljava/lang/Object;
.source "IgoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/IgoActivity;->onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;I)V
    .registers 3

    .line 963
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$9;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iput p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$9;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 965
    iget-object p2, p0, Lcom/navngo/igo/javaclient/IgoActivity$9;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    iget v0, p0, Lcom/navngo/igo/javaclient/IgoActivity$9;->val$id:I

    const/4 v1, 0x5

    invoke-virtual {p2, p1, v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->endDialog(Landroid/content/DialogInterface;II)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.IgoActivity.optionsMenuItem (com.navngo.igo.javaclient.IgoActivity$optionsMenuItem)
.class public Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;
.super Ljava/lang/Object;
.source "IgoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/IgoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "optionsMenuItem"
.end annotation


# instance fields
.field enabled:Z

.field icon:Ljava/lang/String;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/IgoActivity;

.field title:Ljava/lang/String;

.field visible:Z


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/IgoActivity;)V
    .registers 2

    .line 1152
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;->this$0:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, ""

    .line 1153
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;->title:Ljava/lang/String;

    .line 1154
    iput-object p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;->icon:Ljava/lang/String;

    const/4 p1, 0x1

    .line 1155
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;->enabled:Z

    .line 1156
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/IgoActivity$optionsMenuItem;->visible:Z

    return-void
.end method
