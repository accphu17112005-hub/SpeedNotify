###### Class com.navngo.igo.javaclient.functors.IgoEvents (com.navngo.igo.javaclient.functors.IgoEvents)
.class public Lcom/navngo/igo/javaclient/functors/IgoEvents;
.super Ljava/lang/Object;
.source "IgoEvents.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# static fields
.field private static final logname:Ljava/lang/String; = "IgoEvents"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onExitPressed()V
    .registers 3

    const-string v0, "IgoEvents"

    const-string v1, "onExitPressed"

    .line 14
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 15
    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    return-void
.end method

.method public registerFunctors()V
    .registers 4

    .line 19
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.on_exit_pressed"

    const-string v2, "onExitPressed"

    .line 20
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
