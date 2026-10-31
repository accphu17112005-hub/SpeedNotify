###### Class com.navngo.igo.javaclient.InsertSDCard (com.navngo.igo.javaclient.InsertSDCard)
.class public final Lcom/navngo/igo/javaclient/InsertSDCard;
.super Landroid/app/Activity;
.source "InsertSDCard.java"


# static fields
.field public static final ACTION_CLEAR:Ljava/lang/String; = "com.navngo.igo.javaclient.InsertSDCard.CLEAR"

.field public static final ACTION_DEFAULT:Ljava/lang/String; = "com.navngo.igo.javaclient.InsertSDCard.DEFAULT"

.field private static final logname:Ljava/lang/String; = "InsertSDCard"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private processIntent(Landroid/content/Intent;Z)V
    .registers 5

    .line 37
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.navngo.igo.javaclient.InsertSDCard.DEFAULT"

    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "InsertSDCard"

    if-eqz v0, :cond_3a

    const-string p1, "Saying: insert SD card"

    .line 39
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_52

    const/4 p1, 0x3

    .line 42
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/InsertSDCard;->requestWindowFeature(I)Z

    .line 43
    sget p2, Lcom/navngo/igo/javaclient/R$layout;->insert_sd_card:I

    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/InsertSDCard;->setContentView(I)V

    .line 44
    sget p2, Lcom/navngo/igo/javaclient/R$id;->insert_sd_card_button:I

    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/InsertSDCard;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    if-eqz p2, :cond_30

    .line 46
    new-instance v0, Lcom/navngo/igo/javaclient/InsertSDCard$1;

    invoke-direct {v0, p0, p0}, Lcom/navngo/igo/javaclient/InsertSDCard$1;-><init>(Lcom/navngo/igo/javaclient/InsertSDCard;Lcom/navngo/igo/javaclient/InsertSDCard;)V

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    :cond_30
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/InsertSDCard;->getWindow()Landroid/view/Window;

    move-result-object p2

    sget v0, Lcom/navngo/igo/javaclient/Application;->APPICON_ID:I

    invoke-virtual {p2, p1, v0}, Landroid/view/Window;->setFeatureDrawableResource(II)V

    goto :goto_52

    :cond_3a
    const-string p2, "com.navngo.igo.javaclient.InsertSDCard.CLEAR"

    .line 57
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const-string p1, "SD card warning cleared"

    .line 58
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 59
    invoke-static {p1}, Lcom/navngo/igo/javaclient/Application;->setSDNotificationCleared(Z)V

    .line 60
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/InsertSDCard;->finish()V

    goto :goto_52

    .line 62
    :cond_4f
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/InsertSDCard;->finish()V

    :cond_52
    :goto_52
    return-void
.end method

.method public static show()V
    .registers 2

    .line 67
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 68
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/IgoActivity;->mNoSystemExit:Z

    .line 69
    :cond_d
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.navngo.igo.javaclient.InsertSDCard.DEFAULT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 70
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x30000000

    .line 71
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 74
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1, v0}, Lcom/navngo/igo/javaclient/Application;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3

    .line 23
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const-string p1, "InsertSDCard"

    const-string v0, "onCreate"

    .line 24
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    invoke-static {p0}, Lcom/navngo/igo/javaclient/Application;->setInsertSDCard(Lcom/navngo/igo/javaclient/InsertSDCard;)V

    .line 26
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/InsertSDCard;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x1

    .line 27
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/InsertSDCard;->processIntent(Landroid/content/Intent;Z)V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .registers 3

    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/InsertSDCard;->processIntent(Landroid/content/Intent;Z)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.InsertSDCard.AnonymousClass1 (com.navngo.igo.javaclient.InsertSDCard$1)
.class Lcom/navngo/igo/javaclient/InsertSDCard$1;
.super Ljava/lang/Object;
.source "InsertSDCard.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/InsertSDCard;->processIntent(Landroid/content/Intent;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/InsertSDCard;

.field final synthetic val$myself:Lcom/navngo/igo/javaclient/InsertSDCard;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/InsertSDCard;Lcom/navngo/igo/javaclient/InsertSDCard;)V
    .registers 3

    .line 46
    iput-object p1, p0, Lcom/navngo/igo/javaclient/InsertSDCard$1;->this$0:Lcom/navngo/igo/javaclient/InsertSDCard;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/InsertSDCard$1;->val$myself:Lcom/navngo/igo/javaclient/InsertSDCard;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 2

    .line 48
    iget-object p1, p0, Lcom/navngo/igo/javaclient/InsertSDCard$1;->val$myself:Lcom/navngo/igo/javaclient/InsertSDCard;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/InsertSDCard;->finish()V

    return-void
.end method
