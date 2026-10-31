###### Class com.navngo.igo.javaclient.login.components.ProgressCover (com.navngo.igo.javaclient.login.components.ProgressCover)
.class public Lcom/navngo/igo/javaclient/login/components/ProgressCover;
.super Landroid/widget/FrameLayout;
.source "ProgressCover.java"


# instance fields
.field private block:Landroid/widget/Button;

.field private blockContainer:Landroid/widget/RelativeLayout;

.field private blockText:Landroid/widget/TextView;

.field private close:Landroid/widget/Button;

.field private errorContainer:Landroid/widget/RelativeLayout;

.field private errorText:Landroid/widget/TextView;

.field private progressContainer:Landroid/widget/RelativeLayout;

.field private retry:Landroid/widget/Button;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 27
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x7f0b001e

    const/4 v0, 0x0

    .line 29
    invoke-static {p1, p2, v0}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800df

    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->progressContainer:Landroid/widget/RelativeLayout;

    .line 35
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800dc

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorContainer:Landroid/widget/RelativeLayout;

    .line 36
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800de

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorText:Landroid/widget/TextView;

    .line 37
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 38
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800db

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->close:Landroid/widget/Button;

    .line 39
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800e0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->retry:Landroid/widget/Button;

    .line 42
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800d8

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockContainer:Landroid/widget/RelativeLayout;

    .line 43
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800da

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockText:Landroid/widget/TextView;

    .line 44
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 45
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const p2, 0x7f0800d7

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->block:Landroid/widget/Button;

    .line 47
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->progressContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 49
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 50
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 52
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->close:Landroid/widget/Button;

    new-instance p2, Lcom/navngo/igo/javaclient/login/components/ProgressCover$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/components/ProgressCover$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/components/ProgressCover;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$new$0$com-navngo-igo-javaclient-login-components-ProgressCover(Landroid/view/View;)V
    .registers 2

    .line 52
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->onDone()V

    return-void
.end method

.method public onBlock(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V
    .registers 6

    .line 86
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 87
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->progressContainer:Landroid/widget/RelativeLayout;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 88
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 89
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 90
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockText:Landroid/widget/TextView;

    iget p1, p1, Lcom/navngo/igo/javaclient/login/api/LoginError;->stringRes:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 92
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->block:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->block:Landroid/widget/Button;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method public onDone()V
    .registers 3

    .line 99
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 100
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->progressContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 101
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 102
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->retry:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V
    .registers 6

    .line 69
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->progressContainer:Landroid/widget/RelativeLayout;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 71
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 72
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 73
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorText:Landroid/widget/TextView;

    iget v2, p1, Lcom/navngo/igo/javaclient/login/api/LoginError;->stringRes:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 75
    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->NO_INTERNET:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/login/api/LoginError;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/login/api/LoginError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2e

    goto :goto_34

    .line 79
    :cond_2e
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->retry:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_3f

    .line 76
    :cond_34
    :goto_34
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->retry:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->retry:Landroid/widget/Button;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setEnabled(Z)V

    :goto_3f
    return-void
.end method

.method public onProgress()V
    .registers 3

    .line 60
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->view:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->progressContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 62
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->errorContainer:Landroid/widget/RelativeLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 63
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->blockContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.components.ProgressCover$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.components.ProgressCover$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/components/ProgressCover$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/components/ProgressCover;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/components/ProgressCover;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/ProgressCover$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/components/ProgressCover;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/components/ProgressCover;->lambda$new$0$com-navngo-igo-javaclient-login-components-ProgressCover(Landroid/view/View;)V

    return-void
.end method
