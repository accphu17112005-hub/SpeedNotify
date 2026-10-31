###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView)
.class public Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;
.super Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;
.source "VerifyPhoneView.java"


# instance fields
.field private codeChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private codeInput:Landroid/widget/EditText;

.field private codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

.field private codeList:Landroidx/appcompat/widget/LinearLayoutCompat;

.field private countListener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

.field private descText:Landroid/widget/TextView;

.field private inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

.field private messageText:Landroid/widget/TextView;

.field private phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private sendButton:Landroid/widget/Button;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 26
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;-><init>()V

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/navngo/igo/javaclient/login/components/CodeItem;

    .line 31
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    .line 68
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

    .line 164
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->countListener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    .line 185
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    .line 195
    new-instance v0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/Button;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendButton:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 1

    .line 26
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendVerifyRequest()V

    return-void
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 1

    .line 26
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendPhoneRequest()V

    return-void
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->messageText:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;I)Ljava/lang/String;
    .registers 2

    .line 26
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->countToMinSec(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/EditText;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$700(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->descText:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;Ljava/lang/String;)V
    .registers 2

    .line 26
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->setCodeInputText(Ljava/lang/String;)V

    return-void
.end method

.method private countToMinSec(I)Ljava/lang/String;
    .registers 7

    .line 214
    rem-int/lit8 v0, p1, 0x3c

    div-int/lit8 p1, p1, 0x3c

    rem-int/lit8 p1, p1, 0x3c

    const-string v1, "0"

    const/16 v2, 0xa

    if-ge v0, v2, :cond_1c

    .line 215
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    :cond_1c
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_20
    if-ge p1, v2, :cond_32

    .line 216
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_36

    :cond_32
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 218
    :goto_36
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x7f050000

    invoke-static {v1, v2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const v4, 0xffffff

    and-int/2addr v1, v4

    .line 219
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v3

    const-string v1, "#%06X"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 221
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<font color="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</font>"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private sendPhoneRequest()V
    .registers 4

    .line 149
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressStart()V

    .line 150
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->registerPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V

    return-void
.end method

.method private sendVerifyRequest()V
    .registers 4

    .line 123
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->hideKeyboard(Landroid/widget/EditText;)V

    .line 124
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressStart()V

    .line 125
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->verifyPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V

    return-void
.end method

.method private setCodeInputText(Ljava/lang/String;)V
    .registers 4

    .line 95
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 96
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 97
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$onCreateView$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView(Landroid/view/View;)V
    .registers 2

    .line 57
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object p1

    iget-object p1, p1, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/login/api/Counter;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_11

    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->showKeyboard(Landroid/widget/EditText;)V

    :cond_11
    return-void
.end method

.method synthetic lambda$onCreateView$1$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView(Landroid/view/View;)V
    .registers 2

    .line 59
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendVerifyRequest()V

    return-void
.end method

.method synthetic lambda$onCreateView$2$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView(Landroid/view/View;)V
    .registers 2

    .line 61
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object p1

    iget-object p1, p1, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/login/api/Counter;->isRunning()Z

    move-result p1

    if-nez p1, :cond_f

    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendPhoneRequest()V

    :cond_f
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6

    const p3, 0x7f0b0022

    const/4 v0, 0x0

    .line 38
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p2, 0x7f080081

    .line 40
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->descText:Landroid/widget/TextView;

    .line 41
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p2, 0x7f0800c3

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->messageText:Landroid/widget/TextView;

    .line 42
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p2, 0x7f080105

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendButton:Landroid/widget/Button;

    .line 43
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p2, 0x7f08012b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    .line 44
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p2, 0x7f080072

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/LinearLayoutCompat;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeList:Landroidx/appcompat/widget/LinearLayoutCompat;

    .line 46
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p3, 0x7f08006c

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/login/components/CodeItem;

    aput-object p2, p1, v0

    .line 47
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const p3, 0x7f08006d

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/login/components/CodeItem;

    const/4 p3, 0x1

    aput-object p2, p1, p3

    .line 48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const v1, 0x7f08006e

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/login/components/CodeItem;

    const/4 v1, 0x2

    aput-object p2, p1, v1

    .line 49
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const v1, 0x7f08006f

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/login/components/CodeItem;

    const/4 v1, 0x3

    aput-object p2, p1, v1

    .line 50
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const v1, 0x7f080070

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/login/components/CodeItem;

    const/4 v1, 0x4

    aput-object p2, p1, v1

    .line 51
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    const v1, 0x7f080071

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/login/components/CodeItem;

    const/4 v1, 0x5

    aput-object p2, p1, v1

    .line 52
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeItems:[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    aget-object p1, p1, v0

    invoke-virtual {p1, p3}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    .line 54
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->inputChangeListener:Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 55
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeInput:Landroid/widget/EditText;

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->onFocusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 56
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeList:Landroidx/appcompat/widget/LinearLayoutCompat;

    new-instance p2, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/LinearLayoutCompat;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendButton:Landroid/widget/Button;

    new-instance p2, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda1;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->messageText:Landroid/widget/TextView;

    new-instance p2, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda2;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->view:Landroid/view/View;

    return-object p1
.end method

.method public onStart()V
    .registers 3

    .line 104
    invoke-super {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->onStart()V

    .line 105
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->countListener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Counter;->setOnCountListener(Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;)V

    .line 106
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->addAndExecuteOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    .line 107
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->addAndExecuteOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    return-void
.end method

.method public onStop()V
    .registers 3

    .line 114
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->phoneChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->removeOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    .line 115
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->codeChangeListener:Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->removeOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    .line 116
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v0

    iget-object v0, v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->unsetOnCountListener()V

    .line 117
    invoke-super {p0}, Lcom/navngo/igo/javaclient/login/fragments/PhoneFragment;->onStop()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.AnonymousClass1 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$1)
.class Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;
.super Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;
.source "VerifyPhoneView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    .line 68
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p0}, Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange(Ljava/lang/CharSequence;I)V
    .registers 7

    .line 72
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    if-nez p2, :cond_33

    .line 75
    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p2

    .line 76
    iget-object v3, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v3, p2}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCode(C)V

    .line 77
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    aget-object p2, p2, v0

    invoke-virtual {p2, v2}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    const/4 p2, 0x5

    if-ge v0, p2, :cond_5b

    .line 78
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    add-int/2addr v0, v1

    aget-object p2, p2, v0

    invoke-virtual {p2, v1}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    goto :goto_5b

    .line 82
    :cond_33
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    add-int/lit8 v3, v0, 0x1

    aget-object p2, p2, v3

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->clearCode()V

    .line 83
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    aget-object p2, p2, v3

    invoke-virtual {p2, v1}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    const/4 p2, 0x4

    if-ge v0, p2, :cond_5b

    .line 84
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    add-int/lit8 v0, v0, 0x2

    aget-object p2, p2, v0

    invoke-virtual {p2, v2}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    .line 87
    :cond_5b
    :goto_5b
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$1;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$100(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/Button;

    move-result-object p2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v3, 0x6

    if-ne v0, v3, :cond_69

    goto :goto_6a

    :cond_69
    const/4 v1, 0x0

    :goto_6a
    invoke-virtual {p2, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 88
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object p2

    iget-object p2, p2, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/navngo/igo/javaclient/login/api/Observable;->setValue(Ljava/lang/Object;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.AnonymousClass2 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$2)
.class Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;
.super Ljava/lang/Object;
.source "VerifyPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/LoginResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendVerifyRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    .line 125
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView$2(Landroid/view/View;)V
    .registers 2

    .line 140
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$200(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    return-void
.end method

.method public onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    .registers 4

    .line 137
    iget-object v0, p1, Lcom/navngo/igo/javaclient/login/api/LoginError;->tag:Ljava/lang/String;

    const-string v1, "022"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 138
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressBlock(Lcom/navngo/igo/javaclient/login/api/LoginError;)V

    goto :goto_22

    .line 140
    :cond_14
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;)V

    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V

    :goto_22
    return-void
.end method

.method public onSuccess()V
    .registers 4

    .line 128
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressDone()V

    .line 129
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    .line 130
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v1

    iget-object v1, v1, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 131
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object v2

    iget-object v2, v2, Lcom/navngo/igo/javaclient/login/api/LoginApi;->token:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 129
    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onLoginSuccess(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$2$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$2$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$2;->lambda$onError$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView$2(Landroid/view/View;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.AnonymousClass3 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$3)
.class Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;
.super Ljava/lang/Object;
.source "VerifyPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/LoginResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->sendPhoneRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    .line 150
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView$3(Landroid/view/View;)V
    .registers 2

    .line 158
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$300(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V

    return-void
.end method

.method public onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    .registers 4

    .line 158
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;)V

    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressError(Lcom/navngo/igo/javaclient/login/api/LoginError;Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onSuccess()V
    .registers 2

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/LoginActivity;->onProgressDone()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$3$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$3$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$3;->lambda$onError$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView$3(Landroid/view/View;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.AnonymousClass4 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$4)
.class Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;
.super Ljava/lang/Object;
.source "VerifyPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    .line 164
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCount(IZ)V
    .registers 8

    const/4 v0, 0x0

    if-eqz p2, :cond_48

    .line 169
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object p2

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/login/LoginActivity;->disableTitleBarOnBack()V

    .line 170
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$400(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;

    move-result-object p2

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f05000c

    invoke-static {v1, v2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$400(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;

    move-result-object p2

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0052

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    .line 172
    invoke-static {v4, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$500(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v0

    .line 171
    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_8f

    .line 175
    :cond_48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getLoginActivity()Lcom/navngo/igo/javaclient/login/LoginActivity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/login/LoginActivity;->enableTitleBarOnBack()V

    .line 176
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$400(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;

    move-result-object p1

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getContext()Landroid/content/Context;

    move-result-object p2

    const/high16 v1, 0x7f050000

    invoke-static {p2, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 177
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$400(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;

    move-result-object p1

    const p2, 0x7f0d006b

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 178
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginApi;->getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;

    move-result-object p1

    iget-object p1, p1, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    const-string p2, ""

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/login/api/Observable;->postValue(Ljava/lang/Object;)V

    .line 179
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$100(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 180
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$4;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$600(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/EditText;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->hideKeyboard(Landroid/widget/EditText;)V

    :goto_8f
    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.AnonymousClass5 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$5)
.class Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;
.super Ljava/lang/Object;
.source "VerifyPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;
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
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    .line 185
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V
    .registers 3

    .line 185
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;->onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/String;)V

    return-void
.end method

.method public onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/String;)V
    .registers 7
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

    .line 189
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$700(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)Landroid/widget/TextView;

    move-result-object p1

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$5;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<b>+84"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "</b>"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const p2, 0x7f0d0053

    invoke-virtual {v0, p2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.AnonymousClass6 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$6)
.class Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;
.super Ljava/lang/Object;
.source "VerifyPhoneView.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;
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
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    .line 195
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V
    .registers 3

    .line 195
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/String;)V

    return-void
.end method

.method public onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/String;)V
    .registers 7
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

    .line 200
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$800(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;Ljava/lang/String;)V

    .line 201
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object v0

    array-length v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 202
    :goto_16
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_4a

    if-ge v1, p1, :cond_31

    .line 203
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCode(C)V

    goto :goto_3c

    .line 204
    :cond_31
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->clearCode()V

    .line 205
    :goto_3c
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object v2

    aget-object v2, v2, v1

    invoke-virtual {v2, v0}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 207
    :cond_4a
    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    array-length p2, p2

    if-ge p1, p2, :cond_5f

    iget-object p2, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$6;->this$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-static {p2}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->access$000(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)[Lcom/navngo/igo/javaclient/login/components/CodeItem;

    move-result-object p2

    aget-object p1, p2, p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/login/components/CodeItem;->setCursor(Z)V

    :cond_5f
    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->lambda$onCreateView$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView(Landroid/view/View;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda1 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda1)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->lambda$onCreateView$1$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView(Landroid/view/View;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda2 (com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda2)
.class public final synthetic Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda2;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView$$ExternalSyntheticLambda2;->f$0:Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/login/fragments/VerifyPhoneView;->lambda$onCreateView$2$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView(Landroid/view/View;)V

    return-void
.end method
