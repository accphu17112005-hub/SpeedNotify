###### Class com.navngo.igo.javaclient.login.ZoomOutPageTransformer (com.navngo.igo.javaclient.login.ZoomOutPageTransformer)
.class public Lcom/navngo/igo/javaclient/login/ZoomOutPageTransformer;
.super Ljava/lang/Object;
.source "ZoomOutPageTransformer.java"

# interfaces
.implements Landroidx/viewpager2/widget/ViewPager2$PageTransformer;


# static fields
.field private static final MIN_ALPHA:F = 0.5f

.field private static final MIN_SCALE:F = 0.85f


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transformPage(Landroid/view/View;F)V
    .registers 10

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    const/4 v2, 0x0

    const/high16 v3, -0x40800000    # -1.0f

    cmpg-float v3, p2, v3

    if-gez v3, :cond_13

    .line 19
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    goto :goto_58

    :cond_13
    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v4, p2, v3

    if-gtz v4, :cond_55

    .line 23
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sub-float v4, v3, v4

    const v5, 0x3f59999a    # 0.85f

    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    int-to-float v1, v1

    sub-float/2addr v3, v4

    mul-float v1, v1, v3

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v1, v6

    int-to-float v0, v0

    mul-float v0, v0, v3

    div-float/2addr v0, v6

    cmpg-float p2, p2, v2

    if-gez p2, :cond_3b

    div-float/2addr v1, v6

    sub-float/2addr v0, v1

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_41

    :cond_3b
    neg-float p2, v0

    div-float/2addr v1, v6

    add-float/2addr p2, v1

    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 33
    :goto_41
    invoke-virtual {p1, v4}, Landroid/view/View;->setScaleX(F)V

    .line 34
    invoke-virtual {p1, v4}, Landroid/view/View;->setScaleY(F)V

    sub-float/2addr v4, v5

    const p2, 0x3e199998    # 0.14999998f

    div-float/2addr v4, p2

    const/high16 p2, 0x3f000000    # 0.5f

    mul-float v4, v4, p2

    add-float/2addr v4, p2

    .line 37
    invoke-virtual {p1, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_58

    .line 43
    :cond_55
    invoke-virtual {p1, v2}, Landroid/view/View;->setAlpha(F)V

    :goto_58
    return-void
.end method
