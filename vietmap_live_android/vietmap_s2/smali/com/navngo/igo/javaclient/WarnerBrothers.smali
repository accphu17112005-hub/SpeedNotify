###### Class com.navngo.igo.javaclient.WarnerBrothers (com.navngo.igo.javaclient.WarnerBrothers)
.class public final Lcom/navngo/igo/javaclient/WarnerBrothers;
.super Landroid/app/Activity;
.source "WarnerBrothers.java"


# static fields
.field public static final ACTION_CLEAR:Ljava/lang/String; = "com.navngo.igo.javaclient.WarnerBrothers.CLEAR"

.field public static final ACTION_DEFAULT:Ljava/lang/String; = "com.navngo.igo.javaclient.WarnerBrothers.DEFAULT"

.field private static final logname:Ljava/lang/String; = "WarnerBrothers"


# instance fields
.field private mButtons:[Landroid/widget/Button;

.field private mClientId:I

.field private mIntentStr:Ljava/lang/String;

.field private mTimeoutTimer:Ljava/util/Timer;

.field myClickListener:Landroid/view/View$OnClickListener;

.field final myself:Lcom/navngo/igo/javaclient/WarnerBrothers;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 32
    iput-object p0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->myself:Lcom/navngo/igo/javaclient/WarnerBrothers;

    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    const-string v1, ""

    .line 34
    iput-object v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    const/4 v1, 0x0

    .line 35
    iput-object v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mTimeoutTimer:Ljava/util/Timer;

    const/4 v2, 0x3

    new-array v2, v2, [Landroid/widget/Button;

    aput-object v1, v2, v0

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    aput-object v1, v2, v0

    .line 38
    iput-object v2, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    .line 40
    new-instance v0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/WarnerBrothers$1;-><init>(Lcom/navngo/igo/javaclient/WarnerBrothers;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->myClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/WarnerBrothers;)[Landroid/widget/Button;
    .registers 1

    .line 27
    iget-object p0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/WarnerBrothers;)Ljava/util/Timer;
    .registers 1

    .line 27
    iget-object p0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mTimeoutTimer:Ljava/util/Timer;

    return-object p0
.end method

.method static synthetic access$102(Lcom/navngo/igo/javaclient/WarnerBrothers;Ljava/util/Timer;)Ljava/util/Timer;
    .registers 2

    .line 27
    iput-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mTimeoutTimer:Ljava/util/Timer;

    return-object p1
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/WarnerBrothers;I)V
    .registers 2

    .line 27
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->informClient(I)V

    return-void
.end method

.method private getButtonLabelFromIntent(Landroid/content/Intent;I)Ljava/lang/String;
    .registers 5

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Button"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 106
    invoke-virtual {p1, p2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_21

    :cond_20
    const/4 p1, 0x0

    :goto_21
    return-object p1
.end method

.method private informClient(I)V
    .registers 6

    .line 61
    iget v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    if-eqz v0, :cond_53

    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_53

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onClick clientId="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " intentStr="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "WarnerBrothers"

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 64
    iget v2, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    const-string v3, "ClientId"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "Button"

    .line 65
    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 66
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->sendBroadcast(Landroid/content/Intent;)V

    const/4 p1, 0x0

    .line 67
    iput p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    .line 68
    iput-object v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    :cond_53
    return-void
.end method

.method private processIntent(Landroid/content/Intent;Z)V
    .registers 8

    .line 169
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.navngo.igo.javaclient.WarnerBrothers.DEFAULT"

    .line 170
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d9

    if-eqz p2, :cond_e8

    .line 172
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "ClientId"

    .line 173
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "WarnerBrothers"

    if-eqz v1, :cond_39

    const/4 v1, 0x0

    .line 174
    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ClientId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mClientId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :cond_39
    const-string v0, "Intent"

    .line 177
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5d

    .line 178
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IntentStr = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mIntentStr:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5d
    const-string v0, "Timeout"

    .line 181
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 182
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p2

    if-lez p2, :cond_82

    .line 184
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Timeout = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/WarnerBrothers;->startTimeout(I)Z

    :cond_82
    const/4 p2, 0x3

    .line 188
    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/WarnerBrothers;->requestWindowFeature(I)Z

    .line 189
    sget v0, Lcom/navngo/igo/javaclient/R$layout;->warner_brothers:I

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->setContentView(I)V

    const-string v0, "Saying ..."

    .line 191
    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "android.intent.extra.TEXT"

    .line 192
    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_bd

    .line 193
    sget v1, Lcom/navngo/igo/javaclient/R$id;->warner_message:I

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_bd

    .line 195
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 196
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "... "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    :cond_bd
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->setOnClickListener()Z

    move-result v0

    if-eqz v0, :cond_d0

    .line 201
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->setButtons(Landroid/content/Intent;)V

    .line 203
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->getWindow()Landroid/view/Window;

    move-result-object p1

    sget v0, Lcom/navngo/igo/javaclient/Application;->APPICON_ID:I

    invoke-virtual {p1, p2, v0}, Landroid/view/Window;->setFeatureDrawableResource(II)V

    goto :goto_e8

    :cond_d0
    const-string p1, "Resource error (missing buttons in warner_brothers)"

    .line 208
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->finish()V

    goto :goto_e8

    :cond_d9
    const-string p1, "com.navngo.igo.javaclient.WarnerBrothers.CLEAR"

    .line 212
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e5

    .line 213
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->finish()V

    goto :goto_e8

    .line 215
    :cond_e5
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->finish()V

    :cond_e8
    :goto_e8
    return-void
.end method

.method private setButtons(Landroid/content/Intent;)V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    const/4 v3, 0x3

    if-ge v1, v3, :cond_2a

    add-int/lit8 v3, v1, 0x1

    .line 116
    invoke-direct {p0, p1, v3}, Lcom/navngo/igo/javaclient/WarnerBrothers;->getButtonLabelFromIntent(Landroid/content/Intent;I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1f

    .line 118
    iget-object v5, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    aget-object v5, v5, v1

    invoke-virtual {v5, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 119
    iget-object v4, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    aget-object v1, v4, v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setVisibility(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    .line 123
    :cond_1f
    iget-object v4, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    aget-object v1, v4, v1

    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setVisibility(I)V

    :goto_28
    move v1, v3

    goto :goto_3

    :cond_2a
    if-nez v2, :cond_3c

    .line 128
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    aget-object p1, p1, v0

    const-string v1, "Dismiss"

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 129
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    aget-object p1, p1, v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    :cond_3c
    return-void
.end method

.method private setOnClickListener()Z
    .registers 6

    .line 75
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    sget v1, Lcom/navngo/igo/javaclient/R$id;->warner_button1:I

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 76
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    sget v1, Lcom/navngo/igo/javaclient/R$id;->warner_button2:I

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 77
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    sget v1, Lcom/navngo/igo/javaclient/R$id;->warner_button3:I

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    const/4 v4, 0x2

    aput-object v1, v0, v4

    const/4 v0, 0x0

    :goto_28
    const/4 v1, 0x3

    if-ge v0, v1, :cond_3d

    .line 79
    iget-object v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mButtons:[Landroid/widget/Button;

    aget-object v4, v1, v0

    if-eqz v4, :cond_39

    .line 80
    aget-object v1, v1, v0

    iget-object v4, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->myClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3a

    :cond_39
    const/4 v3, 0x0

    :goto_3a
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    :cond_3d
    return v3
.end method

.method private startTimeout(I)Z
    .registers 7

    .line 135
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mTimeoutTimer:Ljava/util/Timer;

    const/4 v1, 0x0

    const-string v2, "WarnerBrothers"

    if-eqz v0, :cond_d

    const-string p1, "Timer is busy, no timeout is possible"

    .line 136
    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_d
    const/16 v0, 0x3e8

    if-le p1, v0, :cond_12

    goto :goto_14

    :cond_12
    mul-int/lit16 p1, p1, 0x3e8

    :goto_14
    int-to-long v3, p1

    .line 146
    new-instance p1, Ljava/util/Timer;

    invoke-direct {p1}, Ljava/util/Timer;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers;->mTimeoutTimer:Ljava/util/Timer;

    .line 148
    :try_start_1c
    new-instance v0, Lcom/navngo/igo/javaclient/WarnerBrothers$2;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/WarnerBrothers$2;-><init>(Lcom/navngo/igo/javaclient/WarnerBrothers;)V

    invoke-virtual {p1, v0, v3, v4}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_24
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_24} :catch_3c
    .catch Ljava/lang/IllegalStateException; {:try_start_1c .. :try_end_24} :catch_26

    const/4 p1, 0x1

    return p1

    :catch_26
    move-exception p1

    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid timer state:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 157
    :catch_3c
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Invalid delay:"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return v1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 92
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "WarnerBrothers"

    const-string v0, "onCreate"

    .line 93
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x1

    .line 95
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->processIntent(Landroid/content/Intent;Z)V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 3

    .line 100
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    const/4 v0, 0x0

    .line 101
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->processIntent(Landroid/content/Intent;Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.WarnerBrothers.AnonymousClass1 (com.navngo.igo.javaclient.WarnerBrothers$1)
.class Lcom/navngo/igo/javaclient/WarnerBrothers$1;
.super Ljava/lang/Object;
.source "WarnerBrothers.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/WarnerBrothers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/WarnerBrothers;)V
    .registers 2

    .line 40
    iput-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x3

    const/4 v2, 0x1

    if-ge v0, v1, :cond_18

    .line 46
    iget-object v1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$000(Lcom/navngo/igo/javaclient/WarnerBrothers;)[Landroid/widget/Button;

    move-result-object v1

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    add-int/2addr v2, v0

    goto :goto_18

    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 51
    :cond_18
    :goto_18
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$100(Lcom/navngo/igo/javaclient/WarnerBrothers;)Ljava/util/Timer;

    move-result-object p1

    if-eqz p1, :cond_2f

    .line 52
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$100(Lcom/navngo/igo/javaclient/WarnerBrothers;)Ljava/util/Timer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Timer;->cancel()V

    .line 53
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$102(Lcom/navngo/igo/javaclient/WarnerBrothers;Ljava/util/Timer;)Ljava/util/Timer;

    .line 55
    :cond_2f
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-static {p1, v2}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$200(Lcom/navngo/igo/javaclient/WarnerBrothers;I)V

    .line 56
    iget-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$1;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/WarnerBrothers;->myself:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->finish()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.WarnerBrothers.AnonymousClass2 (com.navngo.igo.javaclient.WarnerBrothers$2)
.class Lcom/navngo/igo/javaclient/WarnerBrothers$2;
.super Ljava/util/TimerTask;
.source "WarnerBrothers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/WarnerBrothers;->startTimeout(I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/WarnerBrothers;)V
    .registers 2

    .line 148
    iput-object p1, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$2;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 151
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$2;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$100(Lcom/navngo/igo/javaclient/WarnerBrothers;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 152
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$2;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/WarnerBrothers;->access$200(Lcom/navngo/igo/javaclient/WarnerBrothers;I)V

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/WarnerBrothers$2;->this$0:Lcom/navngo/igo/javaclient/WarnerBrothers;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/WarnerBrothers;->finish()V

    return-void
.end method
