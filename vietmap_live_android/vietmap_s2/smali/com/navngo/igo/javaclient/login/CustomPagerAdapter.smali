###### Class com.navngo.igo.javaclient.login.CustomPagerAdapter (com.navngo.igo.javaclient.login.CustomPagerAdapter)
.class Lcom/navngo/igo/javaclient/login/CustomPagerAdapter;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "CustomPagerAdapter.java"


# static fields
.field private static NUM_ITEMS:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/FragmentActivity;)V
    .registers 2

    .line 15
    invoke-direct {p0, p1}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    return-void
.end method


# virtual methods
.method public createFragment(I)Landroidx/fragment/app/Fragment;
    .registers 3

    if-eqz p1, :cond_d

    const/4 v0, 0x1

    if-eq p1, v0, :cond_7

    const/4 p1, 0x0

    goto :goto_12

    .line 27
    :cond_7
    new-instance p1, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;-><init>()V

    goto :goto_12

    .line 24
    :cond_d
    new-instance p1, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-direct {p1}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;-><init>()V

    :goto_12
    return-object p1
.end method

.method public getItemCount()I
    .registers 2

    .line 36
    sget v0, Lcom/navngo/igo/javaclient/login/CustomPagerAdapter;->NUM_ITEMS:I

    return v0
.end method
