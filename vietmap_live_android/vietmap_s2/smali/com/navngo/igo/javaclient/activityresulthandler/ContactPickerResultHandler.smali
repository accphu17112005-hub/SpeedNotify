###### Class com.navngo.igo.javaclient.activityresulthandler.ContactPickerResultHandler (com.navngo.igo.javaclient.activityresulthandler.ContactPickerResultHandler)
.class public Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;
.super Ljava/lang/Object;
.source "ContactPickerResultHandler.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;


# static fields
.field public static final REQUEST_CODE:I = 0x4e0

.field protected static final logname:Ljava/lang/String; = "ContactPickerResultHandler"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mContactCallbackScript:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 4

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "sc_contact_callback"

    .line 15
    iput-object v0, p0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;->mContactCallbackScript:Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;->mActivity:Landroid/app/Activity;

    .line 20
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const-string v0, "android.contacts.set_callback"

    const-string v1, "setContactCallbackScript"

    invoke-virtual {p1, v0, p0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getHandledRequestCode()I
    .registers 2

    const/16 v0, 0x4e0

    return v0
.end method

.method public handleActivityResult(ILandroid/content/Intent;)V
    .registers 15

    .line 33
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    if-ne p1, v5, :cond_55

    .line 35
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    .line 36
    iget-object v6, p0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;->mActivity:Landroid/app/Activity;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Landroid/app/Activity;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_55

    .line 37
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p2

    if-eqz p2, :cond_55

    const-string p2, "_id"

    .line 38
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 39
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleActivityResult contactID: "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v5, "ContactPickerResultHandler"

    invoke-static {v5, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    iget-object p2, p0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;->mContactCallbackScript:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v1, v4

    aput-object p1, v1, v3

    invoke-virtual {v0, p2, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void

    .line 44
    :cond_55
    iget-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;->mContactCallbackScript:Ljava/lang/String;

    new-array p2, v1, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, p2, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p2, v3

    invoke-virtual {v0, p1, v2, p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public setContactCallbackScript(Ljava/lang/String;)V
    .registers 2

    .line 29
    iput-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/ContactPickerResultHandler;->mContactCallbackScript:Ljava/lang/String;

    return-void
.end method
