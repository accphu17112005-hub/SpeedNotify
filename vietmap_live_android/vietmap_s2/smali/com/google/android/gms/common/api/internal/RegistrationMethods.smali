###### Class com.google.android.gms.common.api.internal.RegistrationMethods (com.google.android.gms.common.api.internal.RegistrationMethods)
.class public Lcom/google/android/gms/common/api/internal/RegistrationMethods;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A::",
        "Lcom/google/android/gms/common/api/Api$AnyClient;",
        "L:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final zajy:Lcom/google/android/gms/common/api/internal/RegisterListenerMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/RegisterListenerMethod<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation
.end field

.field public final zajz:Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/internal/RegisterListenerMethod;Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/RegisterListenerMethod<",
            "TA;T",
            "L;",
            ">;",
            "Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod<",
            "TA;T",
            "L;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods;->zajy:Lcom/google/android/gms/common/api/internal/RegisterListenerMethod;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods;->zajz:Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/api/internal/RegisterListenerMethod;Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod;Lcom/google/android/gms/common/api/internal/zabx;)V
    .registers 4

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/api/internal/RegistrationMethods;-><init>(Lcom/google/android/gms/common/api/internal/RegisterListenerMethod;Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod;)V

    return-void
.end method

.method public static builder()Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$AnyClient;",
            "L:Ljava/lang/Object;",
            ">()",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 5
    new-instance v0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;-><init>(Lcom/google/android/gms/common/api/internal/zabx;)V

    return-object v0
.end method

###### Class com.google.android.gms.common.api.internal.RegistrationMethods.Builder (com.google.android.gms.common.api.internal.RegistrationMethods$Builder)
.class public Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/internal/RegistrationMethods;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A::",
        "Lcom/google/android/gms/common/api/Api$AnyClient;",
        "L:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private zajv:Z

.field private zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/RemoteCall<",
            "TA;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private zakb:Lcom/google/android/gms/common/api/internal/RemoteCall;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/RemoteCall<",
            "TA;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field private zakc:Lcom/google/android/gms/common/api/internal/ListenerHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/internal/ListenerHolder<",
            "T",
            "L;",
            ">;"
        }
    .end annotation
.end field

.field private zakd:[Lcom/google/android/gms/common/Feature;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zajv:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/api/internal/zabx;)V
    .registers 2

    .line 25
    invoke-direct {p0}, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;-><init>()V

    return-void
.end method

.method static synthetic zaa(Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;)Lcom/google/android/gms/common/api/internal/RemoteCall;
    .registers 1

    .line 26
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;

    return-object p0
.end method

.method static synthetic zab(Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;)Lcom/google/android/gms/common/api/internal/RemoteCall;
    .registers 1

    .line 27
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakb:Lcom/google/android/gms/common/api/internal/RemoteCall;

    return-object p0
.end method


# virtual methods
.method public build()Lcom/google/android/gms/common/api/internal/RegistrationMethods;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    const-string v3, "Must set register function"

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 19
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakb:Lcom/google/android/gms/common/api/internal/RemoteCall;

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    const-string v3, "Must set unregister function"

    invoke-static {v0, v3}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakc:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    if-eqz v0, :cond_1f

    goto :goto_20

    :cond_1f
    const/4 v1, 0x0

    :goto_20
    const-string v0, "Must set holder"

    invoke-static {v1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 21
    new-instance v0, Lcom/google/android/gms/common/api/internal/RegistrationMethods;

    new-instance v1, Lcom/google/android/gms/common/api/internal/zaca;

    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakc:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    iget-object v3, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakd:[Lcom/google/android/gms/common/Feature;

    iget-boolean v4, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zajv:Z

    invoke-direct {v1, p0, v2, v3, v4}, Lcom/google/android/gms/common/api/internal/zaca;-><init>(Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;Lcom/google/android/gms/common/api/internal/ListenerHolder;[Lcom/google/android/gms/common/Feature;Z)V

    new-instance v2, Lcom/google/android/gms/common/api/internal/zacb;

    iget-object v3, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakc:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    .line 22
    invoke-virtual {v3}, Lcom/google/android/gms/common/api/internal/ListenerHolder;->getListenerKey()Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/google/android/gms/common/api/internal/zacb;-><init>(Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;Lcom/google/android/gms/common/api/internal/ListenerHolder$ListenerKey;)V

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/api/internal/RegistrationMethods;-><init>(Lcom/google/android/gms/common/api/internal/RegisterListenerMethod;Lcom/google/android/gms/common/api/internal/UnregisterListenerMethod;Lcom/google/android/gms/common/api/internal/zabx;)V

    return-object v0
.end method

.method public register(Lcom/google/android/gms/common/api/internal/RemoteCall;)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/RemoteCall<",
            "TA;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;>;)",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 8
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;

    return-object p0
.end method

.method public register(Lcom/google/android/gms/common/util/BiConsumer;)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/util/BiConsumer<",
            "TA;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;>;)",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 4
    new-instance v0, Lcom/google/android/gms/common/api/internal/zaby;

    invoke-direct {v0, p1}, Lcom/google/android/gms/common/api/internal/zaby;-><init>(Lcom/google/android/gms/common/util/BiConsumer;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;

    return-object p0
.end method

.method public setAutoResolveMissingFeatures(Z)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 16
    iput-boolean p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zajv:Z

    return-object p0
.end method

.method public setFeatures([Lcom/google/android/gms/common/Feature;)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/google/android/gms/common/Feature;",
            ")",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 14
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakd:[Lcom/google/android/gms/common/Feature;

    return-object p0
.end method

.method public unregister(Lcom/google/android/gms/common/api/internal/RemoteCall;)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/RemoteCall<",
            "TA;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Boolean;",
            ">;>;)",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakb:Lcom/google/android/gms/common/api/internal/RemoteCall;

    return-object p0
.end method

.method public unregister(Lcom/google/android/gms/common/util/BiConsumer;)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/util/BiConsumer<",
            "TA;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Boolean;",
            ">;>;)",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 6
    new-instance p1, Lcom/google/android/gms/common/api/internal/zabz;

    invoke-direct {p1, p0}, Lcom/google/android/gms/common/api/internal/zabz;-><init>(Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;)V

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;

    return-object p0
.end method

.method public withHolder(Lcom/google/android/gms/common/api/internal/ListenerHolder;)Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/internal/ListenerHolder<",
            "T",
            "L;",
            ">;)",
            "Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder<",
            "TA;T",
            "L;",
            ">;"
        }
    .end annotation

    .line 12
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zakc:Lcom/google/android/gms/common/api/internal/ListenerHolder;

    return-object p0
.end method

.method final synthetic zaa(Lcom/google/android/gms/common/api/Api$AnyClient;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 24
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaka:Lcom/google/android/gms/common/api/internal/RemoteCall;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/common/api/internal/RemoteCall;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

###### Class com.google.android.gms.common.api.internal.zaby (com.google.android.gms.common.api.internal.zaby)
.class final synthetic Lcom/google/android/gms/common/api/internal/zaby;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field private final zake:Lcom/google/android/gms/common/util/BiConsumer;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/util/BiConsumer;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zaby;->zake:Lcom/google/android/gms/common/util/BiConsumer;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaby;->zake:Lcom/google/android/gms/common/util/BiConsumer;

    check-cast p1, Lcom/google/android/gms/common/api/Api$AnyClient;

    check-cast p2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 2
    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/common/util/BiConsumer;->accept(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

###### Class com.google.android.gms.common.api.internal.zabz (com.google.android.gms.common.api.internal.zabz)
.class final synthetic Lcom/google/android/gms/common/api/internal/zabz;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field private final zakf:Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zabz;->zakf:Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zabz;->zakf:Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;

    check-cast p1, Lcom/google/android/gms/common/api/Api$AnyClient;

    check-cast p2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/common/api/internal/RegistrationMethods$Builder;->zaa(Lcom/google/android/gms/common/api/Api$AnyClient;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
