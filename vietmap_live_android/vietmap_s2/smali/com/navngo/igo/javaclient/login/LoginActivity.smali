###### Class com.navngo.igo.javaclient.login.LoginActivity (com.navngo.igo.javaclient.login.LoginActivity)
.class public Lcom/navngo/igo/javaclient/login/LoginActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "LoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/login/LoginActivity$State;
    }
.end annotation


# instance fields
.field private final PHONE_NUMBER:Ljava/lang/String;

.field private final SHARED_PREFERENCES_NAME:Ljava/lang/String;

.field private final TOKEN:Ljava/lang/String;

.field private final logname:Ljava/lang/String;

.field private pagerAdapter:Landroidx/viewpager2/adapter/FragmentStateAdapter;

.field private preferences:Landroid/content/SharedPreferences;

.field private progressCover:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

.field private titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

.field private viewPager:Landroidx/viewpager2/widget/ViewPager2;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 23
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    const-string v0, "LoginActivity"

    .line 33
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->logname:Ljava/lang/String;

    const-string v0, "PrimoServiceSharedPreferences"

    .line 35
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->SHARED_PREFERENCES_NAME:Ljava/lang/String;

    const-string v0, "phoneNumber"

    .line 36
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->PHONE_NUMBER:Ljava/lang/String;

    const-string v0, "token"

    .line 37
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->TOKEN:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public disableTitleBarOnBack()V
    .registers 2

    .line 68
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->disableOnBack()V

    return-void
.end method

.method public enableTitleBarOnBack()V
    .registers 2

    .line 72
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->enableOnBack()V

    return-void
.end method

.method public onBackPressed()V
    .registers 3

    .line 130
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->isBackEnabled()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 131
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    move-result v0

    if-nez v0, :cond_1a

    .line 132
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    .line 133
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    goto :goto_26

    :cond_1a
    const v0, 0x7f0d0063

    .line 135
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->setUpTitleBar(I)V

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    :cond_26
    :goto_26
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5

    .line 41
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b001c

    .line 42
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->setContentView(I)V

    const-string p1, "LoginActivity"

    const-string v0, "onCreate"

    .line 43
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "PrimoServiceSharedPreferences"

    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->preferences:Landroid/content/SharedPreferences;

    const-string v1, "phoneNumber"

    const-string v2, ""

    .line 45
    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/navngo/igo/javaclient/Encryptor;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    const p1, 0x7f0800d0

    .line 46
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/viewpager2/widget/ViewPager2;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    .line 47
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 48
    new-instance p1, Lcom/navngo/igo/javaclient/login/CustomPagerAdapter;

    invoke-direct {p1, p0}, Lcom/navngo/igo/javaclient/login/CustomPagerAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->pagerAdapter:Landroidx/viewpager2/adapter/FragmentStateAdapter;

    .line 49
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 50
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    new-instance v0, Lcom/navngo/igo/javaclient/login/ZoomOutPageTransformer;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/login/ZoomOutPageTransformer;-><init>()V

    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setPageTransformer(Landroidx/viewpager2/widget/ViewPager2$PageTransformer;)V

    const p1, 0x7f080134

    .line 51
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/login/components/TitleBar;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    const p1, 0x7f0800e9

    .line 52
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->progressCover:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    const p1, 0x7f0d0063

    .line 53
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->setUpTitleBar(I)V

    return-void
.end method

.method public onLoginSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    const-string v0, "LoginActivity"

    const-string v1, "onLoginSuccess"

    .line 116
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 118
    invoke-static {p1}, Lcom/navngo/igo/javaclient/Encryptor;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 119
    invoke-static {p2}, Lcom/navngo/igo/javaclient/Encryptor;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v2, "phoneNumber"

    .line 120
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "token"

    .line 121
    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 122
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 123
    sget-object p2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    const-string v0, "android_id"

    invoke-static {p2, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 124
    invoke-static {}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->getInstace()Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "+"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->setID(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->finish()V

    return-void
.end method

.method public onPage(Lcom/navngo/igo/javaclient/login/LoginActivity$State;)V
    .registers 3

    .line 96
    sget-object v0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->REGISTER:Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    const p1, 0x7f0d0063

    .line 98
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->setUpTitleBar(I)V

    .line 99
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    goto :goto_2e

    .line 101
    :cond_15
    sget-object v0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->VERIFY:Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2e

    const p1, 0x7f0d0079

    .line 103
    new-instance v0, Lcom/navngo/igo/javaclient/login/LoginActivity$2;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/LoginActivity$2;-><init>(Lcom/navngo/igo/javaclient/login/LoginActivity;)V

    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->setUpTitleBar(ILandroid/view/View$OnClickListener;)V

    .line 109
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V

    :cond_2e
    :goto_2e
    return-void
.end method

.method public onProgressBlock(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    .registers 4

    .line 87
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->progressCover:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    new-instance v1, Lcom/navngo/igo/javaclient/login/LoginActivity$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/login/LoginActivity$1;-><init>(Lcom/navngo/igo/javaclient/login/LoginActivity;)V

    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onProgressDone()V
    .registers 2

    .line 80
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->progressCover:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->onDone()V

    return-void
.end method

.method public onProgressError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V
    .registers 4

    .line 84
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->progressCover:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onProgressStart()V
    .registers 2

    .line 76
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->progressCover:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->onProgress()V

    return-void
.end method

.method public setUpTitleBar(I)V
    .registers 3

    .line 58
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->setTitle(I)V

    .line 59
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->clearOnBack()V

    return-void
.end method

.method public setUpTitleBar(ILandroid/view/View$OnClickListener;)V
    .registers 4

    .line 63
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->setTitle(I)V

    .line 64
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity;->titleBar:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->setOnBack(Landroid/view/View$OnClickListener;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.LoginActivity.AnonymousClass1 (com.navngo.igo.javaclient.login.LoginActivity$1)
.class Lcom/navngo/igo/javaclient/login/LoginActivity$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressBlock(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/LoginActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/LoginActivity;)V
    .registers 2

    .line 87
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity$1;->this$0:Lcom/navngo/igo/javaclient/login/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 89
    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const/4 p1, 0x1

    invoke-static {p1}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.LoginActivity.AnonymousClass2 (com.navngo.igo.javaclient.login.LoginActivity$2)
.class Lcom/navngo/igo/javaclient/login/LoginActivity$2;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/LoginActivity;->onPage(Lcom/navngo/igo/javaclient/login/LoginActivity$State;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/LoginActivity;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/LoginActivity;)V
    .registers 2

    .line 103
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity$2;->this$0:Lcom/navngo/igo/javaclient/login/LoginActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 106
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/LoginActivity$2;->this$0:Lcom/navngo/igo/javaclient/login/LoginActivity;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onBackPressed()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.LoginActivity.State (com.navngo.igo.javaclient.login.LoginActivity$State)
.class public final enum Lcom/navngo/igo/javaclient/login/LoginActivity$State;
.super Ljava/lang/Enum;
.source "LoginActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/LoginActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/login/LoginActivity$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/login/LoginActivity$State;

.field public static final enum REGISTER:Lcom/navngo/igo/javaclient/login/LoginActivity$State;

.field public static final enum VERIFY:Lcom/navngo/igo/javaclient/login/LoginActivity$State;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .line 26
    new-instance v0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    const-string v1, "REGISTER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/LoginActivity$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->REGISTER:Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    new-instance v1, Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    const-string v3, "VERIFY"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/login/LoginActivity$State;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->VERIFY:Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 25
    sput-object v3, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->$VALUES:[Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/LoginActivity$State;
    .registers 2

    .line 25
    const-class v0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/login/LoginActivity$State;
    .registers 1

    .line 25
    sget-object v0, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->$VALUES:[Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/login/LoginActivity$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    return-object v0
.end method
