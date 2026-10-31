###### Class com.navngo.igo.javaclient.activityresulthandler.TTSSupportedLangResultHandler (com.navngo.igo.javaclient.activityresulthandler.TTSSupportedLangResultHandler)
.class public Lcom/navngo/igo/javaclient/activityresulthandler/TTSSupportedLangResultHandler;
.super Ljava/lang/Object;
.source "TTSSupportedLangResultHandler.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/activityresulthandler/IActivityResultHandler;


# static fields
.field public static final REQUEST_CODE:I = 0x4e2


# instance fields
.field private mTTSSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;


# direct methods
.method public constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeaker;)V
    .registers 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/navngo/igo/javaclient/activityresulthandler/TTSSupportedLangResultHandler;->mTTSSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    return-void
.end method


# virtual methods
.method public getHandledRequestCode()I
    .registers 2

    const/16 v0, 0x4e2

    return v0
.end method

.method public handleActivityResult(ILandroid/content/Intent;)V
    .registers 5

    .line 21
    iget-object v0, p0, Lcom/navngo/igo/javaclient/activityresulthandler/TTSSupportedLangResultHandler;->mTTSSpeaker:Lcom/navngo/igo/javaclient/tts/TTSSpeaker;

    if-eqz v0, :cond_9

    const/16 v1, 0x4e2

    .line 22
    invoke-interface {v0, v1, p1, p2}, Lcom/navngo/igo/javaclient/tts/TTSSpeaker;->onActivityResult(IILandroid/content/Intent;)V

    :cond_9
    return-void
.end method
