###### Class com.navngo.igo.javaclient.activityresulthandler.EditContactResultHandler (com.navngo.igo.javaclient.activityresulthandler.EditContactResultHandler)
.class public Lcom/navngo/igo/javaclient/activityresulthandler/EditContactResultHandler;
.super Ljava/lang/Object;
.source "EditContactResultHandler.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;


# static fields
.field public static final REQUEST_CODE:I = 0x4e1


# instance fields
.field private mMailSmsContacts:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/functors/MailSmsContacts;)V
    .registers 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/EditContactResultHandler;->mMailSmsContacts:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    return-void
.end method


# virtual methods
.method public getHandledRequestCode()I
    .registers 2

    const/16 v0, 0x4e1

    return v0
.end method

.method public handleActivityResult(ILandroid/content/Intent;)V
    .registers 3

    const/4 p2, -0x1

    if-eq p1, p2, :cond_9

    .line 24
    iget-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/EditContactResultHandler;->mMailSmsContacts:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->deleteRecentlyInserted()V

    goto :goto_e

    .line 26
    :cond_9
    iget-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/EditContactResultHandler;->mMailSmsContacts:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->resetRecentlyInserted()V

    :goto_e
    return-void
.end method
