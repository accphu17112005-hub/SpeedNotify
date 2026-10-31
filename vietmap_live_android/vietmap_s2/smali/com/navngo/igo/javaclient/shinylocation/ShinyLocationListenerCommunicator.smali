###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator (com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator)
.class public final enum Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;
.super Ljava/lang/Enum;
.source "ShinyLocationListenerCommunicator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;


# instance fields
.field public listeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 36
    new-instance v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->INSTANCE:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    aput-object v0, v1, v2

    .line 35
    sput-object v1, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->$VALUES:[Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 92
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->listeners:Ljava/util/Map;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;
    .registers 2

    .line 35
    const-class v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;
    .registers 1

    .line 35
    sget-object v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->$VALUES:[Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;

    return-object v0
.end method


# virtual methods
.method public createListener(I)Z
    .registers 6

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->listeners:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2a

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createListener: id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " already exists"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "shiny"

    invoke-static {v1, p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1

    .line 53
    :cond_2a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->listeners:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    new-instance v3, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;

    invoke-direct {v3, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationConsumerJNI;-><init>(I)V

    sget-object p1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v2, v3, p1}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;-><init>(Lcom/navngo/igo/javaclient/shinylocation/IShinyLocationConsumer;Landroid/content/Context;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1
.end method

.method public destroyListener(I)Z
    .registers 4

    .line 58
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->listeners:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    if-nez v0, :cond_27

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "destroyListener: unknown id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "shiny"

    invoke-static {v1, p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1

    .line 64
    :cond_27
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0;

    invoke-direct {p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;)V

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->runOnHandlerThread(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

.method public registerFunctors()V
    .registers 4

    .line 40
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.shiny.createListener"

    const-string v2, "createListener"

    .line 41
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.shiny.destroyListener"

    const-string v2, "destroyListener"

    .line 42
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.shiny.startListening"

    const-string v2, "startListening"

    .line 43
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.shiny.stopListening"

    const-string v2, "stopListening"

    .line 44
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public startListening(I)Z
    .registers 4

    .line 69
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->listeners:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    if-nez v0, :cond_27

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startListening: unknown id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "shiny"

    invoke-static {v1, p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1

    .line 76
    :cond_27
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1;

    invoke-direct {p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;)V

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->runOnHandlerThread(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

.method public stopListening(I)Z
    .registers 4

    .line 82
    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator;->listeners:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    if-nez v0, :cond_27

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "stopListening: unknown id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "shiny"

    invoke-static {v1, p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1

    .line 88
    :cond_27
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2;

    invoke-direct {p1, v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2;-><init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;)V

    invoke-static {p1}, Lcom/navngo/igo/javaclient/ServerRunner;->runOnHandlerThread(Ljava/lang/Runnable;)V

    const/4 p1, 0x1

    return p1
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->done()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1 (com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->startListening()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2 (com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2)
.class public final synthetic Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2;->f$0:Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/shinylocation/ShinyLocationListener;->stopListening()V

    return-void
.end method
