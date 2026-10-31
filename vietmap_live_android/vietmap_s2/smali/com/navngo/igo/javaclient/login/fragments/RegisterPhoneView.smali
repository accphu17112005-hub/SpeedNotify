###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView)
.class public Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;
.super Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;
.source "RegisterPhoneView.java"


# instance fields
.field private clearButton:Landroidx/appcompat/widget/AppCompatImageView;

.field private continueButton:Landroid/widget/Button;

.field private errorMessage:Landroid/widget/TextView;

.field private inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

.field private phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private phoneInput:Landroid/widget/EditText;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 24
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;-><init>()V

    .line 54
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$1;-><init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

    .line 75
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$2;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$2;-><init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)Landroid/widget/Button;
    .registers 1

    .line 24
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->continueButton:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)Landroid/widget/EditText;
    .registers 1

    .line 24
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneInput:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V
    .registers 1

    .line 24
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->sendPhoneRequest()V

    return-void
.end method

.method private sendPhoneRequest()V
    .registers 4

    .line 84
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneInput:Landroid/widget/EditText;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->hideKeyboard(Landroid/widget/EditText;)V

    .line 85
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressStart()V

    .line 86
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;-><init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->registerPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreateView$0$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView(Landroid/view/View;)V
    .registers 3

    .line 43
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneInput:Landroid/widget/EditText;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 44
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->continueButton:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method synthetic lambda$onCreateView$1$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView(Landroid/view/View;)V
    .registers 2

    .line 48
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->sendPhoneRequest()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    const p3, 0x7f0b0021

    const/4 v0, 0x0

    .line 35
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->view:Landroid/view/View;

    const p2, 0x7f0800e2

    .line 37
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneInput:Landroid/widget/EditText;

    .line 38
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->view:Landroid/view/View;

    const p2, 0x7f080069

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/AppCompatImageView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->clearButton:Landroidx/appcompat/widget/AppCompatImageView;

    .line 39
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->view:Landroid/view/View;

    const p2, 0x7f080095

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->errorMessage:Landroid/widget/TextView;

    .line 40
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->view:Landroid/view/View;

    const p2, 0x7f080076

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->continueButton:Landroid/widget/Button;

    .line 42
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->clearButton:Landroidx/appcompat/widget/AppCompatImageView;

    new-instance p2, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneInput:Landroid/widget/EditText;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->onFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 47
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneInput:Landroid/widget/EditText;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->continueButton:Landroid/widget/Button;

    new-instance p2, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda1;-><init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->view:Landroid/view/View;

    return-object p1
.end method

.method public onStart()V
    .registers 3

    .line 65
    invoke-super {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->onStart()V

    .line 66
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->addAndExecuteOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    return-void
.end method

.method public onStop()V
    .registers 3

    .line 71
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->removeOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    .line 72
    invoke-super {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->onStop()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView.AnonymousClass1 (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$1)
.class Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$1;
.super Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;
.source "RegisterPhoneView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V
    .registers 2

    .line 54
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange(Ljava/lang/CharSequence;I)V
    .registers 5

    .line 57
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)Landroid/widget/Button;

    move-result-object p2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    invoke-virtual {p2, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 58
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object p2

    iget-object p2, p2, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/navngo/igo/javaclient/login/api/Observable;->setValue(Ljava/lang/Object;)V

    .line 59
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object p1

    iget-object p1, p1, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    const-string p2, ""

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/login/api/Observable;->setValue(Ljava/lang/Object;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView.AnonymousClass2 (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$2)
.class Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$2;
.super Ljava/lang/Object;
.source "RegisterPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V
    .registers 2

    .line 75
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V
    .registers 3

    .line 75
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$2;->onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/String;)V

    return-void
.end method

.method public onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/login/api/Observable<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 78
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->access$100(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView.AnonymousClass3 (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$3)
.class Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;
.super Ljava/lang/Object;
.source "RegisterPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/LoginResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->sendPhoneRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V
    .registers 2

    .line 86
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$0$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView$3(Landroid/view/View;)V
    .registers 2

    .line 96
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->access$200(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V

    return-void
.end method

.method public onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    .registers 4

    .line 96
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;)V

    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onSuccess()V
    .registers 3

    .line 89
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/api/Observable;->postValue()V

    .line 90
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressDone()V

    .line 91
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    sget-object v1, Lcom/navngo/igo/javaclient/login/LoginActivity$State;->VERIFY:Lcom/navngo/igo/javaclient/login/LoginActivity$State;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onPage(Lcom/navngo/igo/javaclient/login/LoginActivity$State;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$3$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$3$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$3;->lambda$onError$0$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView$3(Landroid/view/View;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->lambda$onCreateView$0$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView(Landroid/view/View;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$$ExternalSyntheticLambda1 (com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$$ExternalSyntheticLambda1)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/RegisterPhoneView;->lambda$onCreateView$1$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView(Landroid/view/View;)V

    return-void
.end method
