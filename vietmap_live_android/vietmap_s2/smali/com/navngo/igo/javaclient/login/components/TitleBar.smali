###### Class com.navngo.igo.javaclient.login.components.TitleBar (com.navngo.igo.javaclient.login.components.TitleBar)
.class public Lcom/navngo/igo/javaclient/login/components/TitleBar;
.super Landroid/widget/FrameLayout;
.source "TitleBar.java"


# instance fields
.field private back:Landroidx/appcompat/widget/AppCompatImageView;

.field private titleText:Landroid/widget/TextView;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x7f0b001f

    const/4 v0, 0x0

    .line 24
    invoke-static {p1, p2, v0}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->view:Landroid/view/View;

    const p2, 0x7f080129

    .line 25
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/AppCompatImageView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    .line 26
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->view:Landroid/view/View;

    const p2, 0x7f08012a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->titleText:Landroid/widget/TextView;

    .line 28
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setVisibility(I)V

    .line 29
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->view:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public clearOnBack()V
    .registers 3

    .line 40
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setVisibility(I)V

    .line 41
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public disableOnBack()V
    .registers 3

    .line 45
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    const v1, 0x3e4ccccd    # 0.2f

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setAlpha(F)V

    return-void
.end method

.method public enableOnBack()V
    .registers 3

    .line 49
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setAlpha(F)V

    return-void
.end method

.method public getTitleText()Ljava/lang/String;
    .registers 3

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->view:Landroid/view/View;

    const v1, 0x7f08012a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 71
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isBackEnabled()Z
    .registers 3

    .line 53
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatImageView;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method synthetic lambda$setOnBack$0$com-navngo-igo-javaclient-login-components-TitleBar(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .registers 5

    .line 35
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatImageView;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_f

    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_f
    return-void
.end method

.method public setOnBack(Landroid/view/View$OnClickListener;)V
    .registers 4

    .line 33
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setVisibility(I)V

    .line 34
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->back:Landroidx/appcompat/widget/AppCompatImageView;

    new-instance v1, Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/components/TitleBar;Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setTitle(I)V
    .registers 3

    .line 61
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->titleText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 3

    .line 57
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->titleText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitleColor(I)V
    .registers 4

    .line 65
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar;->view:Landroid/view/View;

    const v1, 0x7f08012a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 66
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.components.TitleBar$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.components.TitleBar$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/components/TitleBar;

.field public final synthetic f$1:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/components/TitleBar;Landroid/view/View$OnClickListener;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;->f$1:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/components/TitleBar;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/components/TitleBar$$ExternalSyntheticLambda0;->f$1:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/login/components/TitleBar;->lambda$setOnBack$0$com-navngo-igo-javaclient-login-components-TitleBar(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method
