###### Class com.navngo.igo.javaclient.login.api.Counter (com.navngo.igo.javaclient.login.api.Counter)
.class public Lcom/navngo/igo/javaclient/login/api/Counter;
.super Ljava/lang/Object;
.source "Counter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;
    }
.end annotation


# instance fields
.field private current:I

.field private final delay:I

.field private final delta:I

.field private final from:I

.field private handler:Landroid/os/Handler;

.field private listener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

.field private runTask:Ljava/lang/Runnable;

.field private final to:I


# direct methods
.method public constructor <init>(I)V
    .registers 4

    const/4 v0, 0x0

    const/16 v1, 0x3e8

    .line 38
    invoke-direct {p0, v0, p1, v1}, Lcom/navngo/igo/javaclient/login/api/Counter;-><init>(III)V

    return-void
.end method

.method public constructor <init>(III)V
    .registers 5

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Lcom/navngo/igo/javaclient/login/api/Counter$1;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/login/api/Counter$1;-><init>(Lcom/navngo/igo/javaclient/login/api/Counter;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->runTask:Ljava/lang/Runnable;

    .line 31
    iput p1, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->from:I

    .line 32
    iput p2, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->to:I

    .line 33
    iput p3, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->delay:I

    sub-int/2addr p2, p1

    .line 34
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    div-int/2addr p2, p1

    iput p2, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->delta:I

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/login/api/Counter;)I
    .registers 1

    .line 5
    iget p0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    return p0
.end method

.method static synthetic access$012(Lcom/navngo/igo/javaclient/login/api/Counter;I)I
    .registers 3

    .line 5
    iget v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    return v0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/login/api/Counter;)I
    .registers 1

    .line 5
    iget p0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->delta:I

    return p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/login/api/Counter;)I
    .registers 1

    .line 5
    iget p0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->to:I

    return p0
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/login/api/Counter;)Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;
    .registers 1

    .line 5
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->listener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/login/api/Counter;)I
    .registers 1

    .line 5
    iget p0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->delay:I

    return p0
.end method

.method static synthetic access$500(Lcom/navngo/igo/javaclient/login/api/Counter;)Landroid/os/Handler;
    .registers 1

    .line 5
    iget-object p0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->handler:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method public isRunning()Z
    .registers 2

    .line 27
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public setOnCountListener(Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;)V
    .registers 4

    .line 42
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->listener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    .line 43
    iget v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/login/api/Counter;->isRunning()Z

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;->onCount(IZ)V

    return-void
.end method

.method public start()V
    .registers 5

    .line 51
    iget v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->from:I

    iput v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    .line 52
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->handler:Landroid/os/Handler;

    .line 53
    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->runTask:Ljava/lang/Runnable;

    iget v2, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->delay:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 54
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->listener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    if-eqz v0, :cond_1d

    iget v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;->onCount(IZ)V

    :cond_1d
    return-void
.end method

.method public stop()V
    .registers 4

    .line 58
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->runTask:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    .line 59
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->handler:Landroid/os/Handler;

    .line 60
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->listener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    if-eqz v0, :cond_14

    iget v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->current:I

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;->onCount(IZ)V

    :cond_14
    return-void
.end method

.method public unsetOnCountListener()V
    .registers 2

    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter;->listener:Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.api.Counter.AnonymousClass1 (com.navngo.igo.javaclient.login.api.Counter$1)
.class Lcom/navngo/igo/javaclient/login/api/Counter$1;
.super Ljava/lang/Object;
.source "Counter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/api/Counter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/api/Counter;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/api/Counter;)V
    .registers 2

    .line 15
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 18
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$100(Lcom/navngo/igo/javaclient/login/api/Counter;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$012(Lcom/navngo/igo/javaclient/login/api/Counter;I)I

    .line 19
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$000(Lcom/navngo/igo/javaclient/login/api/Counter;)I

    move-result v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$200(Lcom/navngo/igo/javaclient/login/api/Counter;)I

    move-result v1

    if-le v0, v1, :cond_40

    .line 20
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$300(Lcom/navngo/igo/javaclient/login/api/Counter;)Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    move-result-object v0

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$300(Lcom/navngo/igo/javaclient/login/api/Counter;)Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$000(Lcom/navngo/igo/javaclient/login/api/Counter;)I

    move-result v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;->onCount(IZ)V

    .line 21
    :cond_2f
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$500(Lcom/navngo/igo/javaclient/login/api/Counter;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/login/api/Counter;->access$400(Lcom/navngo/igo/javaclient/login/api/Counter;)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_45

    .line 22
    :cond_40
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Counter$1;->this$0:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/login/api/Counter;->stop()V

    :goto_45
    return-void
.end method

###### Class com.navngo.igo.javaclient.login.api.Counter.OnCountListener (com.navngo.igo.javaclient.login.api.Counter$OnCountListener)
.class public interface abstract Lcom/navngo/igo/javaclient/login/api/Counter$OnCountListener;
.super Ljava/lang/Object;
.source "Counter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/api/Counter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnCountListener"
.end annotation


# virtual methods
.method public abstract onCount(IZ)V
.end method
