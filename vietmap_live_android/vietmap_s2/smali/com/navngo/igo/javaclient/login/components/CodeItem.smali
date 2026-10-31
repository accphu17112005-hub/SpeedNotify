###### Class com.navngo.igo.javaclient.login.components.CodeItem (com.navngo.igo.javaclient.login.components.CodeItem)
.class public Lcom/navngo/igo/javaclient/login/components/CodeItem;
.super Landroid/widget/FrameLayout;
.source "CodeItem.java"


# instance fields
.field private code:Landroid/widget/TextView;

.field private cursor:Landroidx/appcompat/widget/AppCompatImageView;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x7f0b001d

    const/4 v0, 0x0

    .line 28
    invoke-static {p1, p2, v0}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->view:Landroid/view/View;

    const v0, 0x7f080068

    .line 29
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    .line 30
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->view:Landroid/view/View;

    const v0, 0x7f080067

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/appcompat/widget/AppCompatImageView;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->cursor:Landroidx/appcompat/widget/AppCompatImageView;

    .line 32
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    const v0, 0x7f050007

    invoke-static {p1, v0}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 33
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    const-string p2, "0"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->cursor:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setVisibility(I)V

    .line 36
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->view:Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public clearCode()V
    .registers 4

    .line 46
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f050007

    invoke-static {v1, v2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    const-string v1, "0"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCode(C)V
    .registers 5

    .line 41
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f05000c

    invoke-static {v1, v2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->code:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setCursor(Z)V
    .registers 3

    if-eqz p1, :cond_9

    .line 51
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->cursor:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setVisibility(I)V

    goto :goto_f

    .line 52
    :cond_9
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/components/CodeItem;->cursor:Landroidx/appcompat/widget/AppCompatImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setVisibility(I)V

    :goto_f
    return-void
.end method
