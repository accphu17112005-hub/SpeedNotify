###### Class com.navngo.igo.javaclient.login.fragments.PhoneFragment (com.navngo.igo.javaclient.login.fragments.PhoneFragment)
.class public Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;
.super Landroidx/fragment/app/Fragment;
.source "PhoneFragment.java"


# instance fields
.field private focusTarget:Landroid/view/View;

.field private focusTime:J

.field private final minDelta:I

.field protected onFocusChangeListener:Landroid/view/View$OnFocusChangeListener;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 12
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/16 v0, 0x12c

    .line 33
    iput v0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->minDelta:I

    const-wide/16 v0, 0x0

    .line 34
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->focusTime:J

    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->focusTarget:Landroid/view/View;

    .line 37
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;-><init>(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->onFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)J
    .registers 3

    .line 12
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->focusTime:J

    return-wide v0
.end method

.method static synthetic access$002(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;J)J
    .registers 3

    .line 12
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->focusTime:J

    return-wide p1
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)Landroid/view/View;
    .registers 1

    .line 12
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->focusTarget:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$102(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;Landroid/view/View;)Landroid/view/View;
    .registers 2

    .line 12
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->focusTarget:Landroid/view/View;

    return-object p1
.end method


# virtual methods
.method protected getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;
    .registers 2

    .line 15
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/login/LoginActivity;

    return-object v0
.end method

.method protected hideKeyboard(Landroid/widget/EditText;)V
    .registers 5

    .line 26
    invoke-virtual {p1}, Landroid/widget/EditText;->clearFocus()V

    .line 27
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 28
    invoke-virtual {p1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    const/4 v0, 0x0

    .line 29
    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    return-void
.end method

.method protected showKeyboard(Landroid/widget/EditText;)V
    .registers 4

    .line 19
    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    .line 20
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.PhoneFragment.AnonymousClass1 (com.navngo.igo.javaclient.login.fragments.PhoneFragment$1)
.class Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;
.super Ljava/lang/Object;
.source "PhoneFragment.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)V
    .registers 2

    .line 37
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .registers 9

    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 42
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->access$000(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)J

    move-result-wide v2

    sub-long v2, v0, v2

    const-wide/16 v4, 0x12c

    if-eqz p2, :cond_1f

    cmp-long p2, v2, v4

    if-lez p2, :cond_39

    .line 47
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-static {p2, v0, v1}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->access$002(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;J)J

    .line 48
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->access$102(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;Landroid/view/View;)Landroid/view/View;

    goto :goto_39

    :cond_1f
    cmp-long p2, v2, v4

    if-gtz p2, :cond_39

    .line 54
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->access$100(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)Landroid/view/View;

    move-result-object p2

    if-ne p1, p2, :cond_39

    .line 55
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->access$100(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1$1;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1$1;-><init>(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_39
    :goto_39
    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.PhoneFragment.AnonymousClass1.RunnableC00091 (com.navngo.igo.javaclient.login.fragments.PhoneFragment$1$1)
.class Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1$1;
.super Ljava/lang/Object;
.source "PhoneFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->onFocusChange(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;)V
    .registers 2

    .line 55
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1$1;->this$1:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 59
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1$1;->this$1:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->access$100(Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method
