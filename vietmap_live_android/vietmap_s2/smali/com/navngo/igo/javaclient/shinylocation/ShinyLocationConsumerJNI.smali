###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationConsumerJNI (com.navngo.igo.javaclient.shinylocation.ShinyLocationConsumerJNI)
.class final Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;
.super Ljava/lang/Object;
.source "ShinyLocationListenerCommunicator.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;


# instance fields
.field private id:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;->id:I

    return-void
.end method


# virtual methods
.method public JsonDataArrived(Ljava/lang/String;)V
    .registers 3

    .line 24
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/navngo/igo/javaclient/ServerRunner;->runOnHandlerThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public LogDebugMessage(Ljava/lang/String;)V
    .registers 3

    const-string v0, "shiny"

    .line 29
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$JsonDataArrived$0$com-navngo-igo-javaclient-shinylocation-ShinyLocationConsumerJNI(Ljava/lang/String;)V
    .registers 3

    .line 24
    iget v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;->id:I

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/NNG;->GpsJsonUpdate(ILjava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationConsumerJNI$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.shinylocation.ShinyLocationConsumerJNI$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;->lambda$JsonDataArrived$0$com-navngo-igo-javaclient-shinylocation-ShinyLocationConsumerJNI(Ljava/lang/String;)V

    return-void
.end method
