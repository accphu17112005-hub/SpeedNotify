###### Class com.navngo.igo.javaclient.I18N (com.navngo.igo.javaclient.I18N)
.class public Lcom/navngo/igo/javaclient/I18N;
.super Ljava/lang/Object;
.source "I18N.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/I18N$AsyncI18N;,
        Lcom/navngo/igo/javaclient/I18N$Callback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setText(Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 4

    .line 62
    new-instance v0, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;

    new-instance v1, Lcom/navngo/igo/javaclient/I18N$2;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/I18N$2;-><init>(Landroid/widget/TextView;)V

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;-><init>(Lcom/navngo/igo/javaclient/I18N$Callback;)V

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, p0, v1

    .line 67
    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static showToast(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 5

    .line 53
    new-instance v0, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;

    new-instance v1, Lcom/navngo/igo/javaclient/I18N$1;

    invoke-direct {v1, p0, p2}, Lcom/navngo/igo/javaclient/I18N$1;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;-><init>(Lcom/navngo/igo/javaclient/I18N$Callback;)V

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/String;

    const/4 p2, 0x0

    aput-object p1, p0, p2

    .line 58
    invoke-virtual {v0, p0}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static translate(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 79
    invoke-static {p0}, Lcom/navngo/igo/javaclient/NNG;->I18N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static translate(Ljava/lang/String;Lcom/navngo/igo/javaclient/I18N$Callback;)V
    .registers 4

    .line 71
    new-instance v0, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;-><init>(Lcom/navngo/igo/javaclient/I18N$Callback;)V

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

###### Class com.navngo.igo.javaclient.I18N.AnonymousClass1 (com.navngo.igo.javaclient.I18N$1)
.class Lcom/navngo/igo/javaclient/I18N$1;
.super Ljava/lang/Object;
.source "I18N.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/I18N$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/I18N;->showToast(Landroid/content/Context;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$length:I


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .registers 3

    .line 53
    iput-object p1, p0, Lcom/navngo/igo/javaclient/I18N$1;->val$context:Landroid/content/Context;

    iput p2, p0, Lcom/navngo/igo/javaclient/I18N$1;->val$length:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTranslated(Ljava/lang/String;)V
    .registers 4

    .line 56
    iget-object v0, p0, Lcom/navngo/igo/javaclient/I18N$1;->val$context:Landroid/content/Context;

    iget v1, p0, Lcom/navngo/igo/javaclient/I18N$1;->val$length:I

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.I18N.AnonymousClass2 (com.navngo.igo.javaclient.I18N$2)
.class Lcom/navngo/igo/javaclient/I18N$2;
.super Ljava/lang/Object;
.source "I18N.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/I18N$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/I18N;->setText(Landroid/widget/TextView;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$view:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    .line 62
    iput-object p1, p0, Lcom/navngo/igo/javaclient/I18N$2;->val$view:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTranslated(Ljava/lang/String;)V
    .registers 3

    .line 65
    iget-object v0, p0, Lcom/navngo/igo/javaclient/I18N$2;->val$view:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.I18N.AsyncI18N (com.navngo.igo.javaclient.I18N$AsyncI18N)
.class Lcom/navngo/igo/javaclient/I18N$AsyncI18N;
.super Landroid/os/AsyncTask;
.source "I18N.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/I18N;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AsyncI18N"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field callback:Lcom/navngo/igo/javaclient/I18N$Callback;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/I18N$Callback;)V
    .registers 2

    .line 37
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->callback:Lcom/navngo/igo/javaclient/I18N$Callback;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 33
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    .line 43
    aget-object p1, p1, v0

    invoke-static {p1}, Lcom/navngo/igo/javaclient/NNG;->I18N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .line 33
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 3

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/I18N$AsyncI18N;->callback:Lcom/navngo/igo/javaclient/I18N$Callback;

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/I18N$Callback;->onTranslated(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.I18N.Callback (com.navngo.igo.javaclient.I18N$Callback)
.class public interface abstract Lcom/navngo/igo/javaclient/I18N$Callback;
.super Ljava/lang/Object;
.source "I18N.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/I18N;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onTranslated(Ljava/lang/String;)V
.end method
