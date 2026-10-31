###### Class com.google.android.gms.common.api.internal.zaah (com.google.android.gms.common.api.internal.zaah)
.class public final Lcom/google/android/gms/common/api/internal/zaah;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/internal/zabd;


# instance fields
.field private final zafs:Lcom/google/android/gms/common/api/internal/zabe;

.field private zaft:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zabe;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    return-void
.end method

.method static synthetic zaa(Lcom/google/android/gms/common/api/internal/zaah;)Lcom/google/android/gms/common/api/internal/zabe;
    .registers 1

    .line 49
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    return-object p0
.end method


# virtual methods
.method public final begin()V
    .registers 1

    return-void
.end method

.method public final connect()V
    .registers 3

    .line 35
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    if-eqz v0, :cond_11

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    .line 37
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    new-instance v1, Lcom/google/android/gms/common/api/internal/zaaj;

    invoke-direct {v1, p0, p0}, Lcom/google/android/gms/common/api/internal/zaaj;-><init>(Lcom/google/android/gms/common/api/internal/zaah;Lcom/google/android/gms/common/api/internal/zabd;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/internal/zabe;->zaa(Lcom/google/android/gms/common/api/internal/zabf;)V

    :cond_11
    return-void
.end method

.method public final disconnect()Z
    .registers 4

    .line 25
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return v1

    .line 27
    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zabe;->zaed:Lcom/google/android/gms/common/api/internal/zaaw;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/zaaw;->zaax()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2e

    .line 28
    iput-boolean v2, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    .line 29
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zabe;->zaed:Lcom/google/android/gms/common/api/internal/zaaw;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zaaw;->zahd:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/api/internal/zacm;

    .line 30
    invoke-virtual {v2}, Lcom/google/android/gms/common/api/internal/zacm;->zabv()V

    goto :goto_1d

    :cond_2d
    return v1

    .line 33
    :cond_2e
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/internal/zabe;->zaf(Lcom/google/android/gms/common/ConnectionResult;)V

    return v2
.end method

.method public final enqueue(Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;)Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$AnyClient;",
            "R::",
            "Lcom/google/android/gms/common/api/Result;",
            "T:",
            "Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl<",
            "TR;TA;>;>(TT;)TT;"
        }
    .end annotation

    .line 6
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zaah;->execute(Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;)Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;

    move-result-object p1

    return-object p1
.end method

.method public final execute(Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;)Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Lcom/google/android/gms/common/api/Api$AnyClient;",
            "T:",
            "Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl<",
            "+",
            "Lcom/google/android/gms/common/api/Result;",
            "TA;>;>(TT;)TT;"
        }
    .end annotation

    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zabe;->zaed:Lcom/google/android/gms/common/api/internal/zaaw;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zaaw;->zahe:Lcom/google/android/gms/common/api/internal/zacp;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/api/internal/zacp;->zab(Lcom/google/android/gms/common/api/internal/BasePendingResult;)V

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zabe;->zaed:Lcom/google/android/gms/common/api/internal/zaaw;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;->getClientKey()Lcom/google/android/gms/common/api/Api$AnyClientKey;

    move-result-object v1

    .line 10
    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zaaw;->zagy:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$Client;

    const-string v1, "Appropriate Api was not requested."

    .line 11
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    invoke-interface {v0}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result v1

    if-nez v1, :cond_3d

    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v1, v1, Lcom/google/android/gms/common/api/internal/zabe;->zaho:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;->getClientKey()Lcom/google/android/gms/common/api/Api$AnyClientKey;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 15
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;->setFailedResult(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_55

    .line 17
    :cond_3d
    instance-of v1, v0, Lcom/google/android/gms/common/internal/SimpleClientAdapter;

    if-eqz v1, :cond_47

    .line 18
    check-cast v0, Lcom/google/android/gms/common/internal/SimpleClientAdapter;

    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/SimpleClientAdapter;->getClient()Lcom/google/android/gms/common/api/Api$SimpleClient;

    move-result-object v0

    .line 20
    :cond_47
    invoke-virtual {p1, v0}, Lcom/google/android/gms/common/api/internal/BaseImplementation$ApiMethodImpl;->run(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    :try_end_4a
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_4a} :catch_4b

    goto :goto_55

    .line 23
    :catch_4b
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    new-instance v1, Lcom/google/android/gms/common/api/internal/zaai;

    invoke-direct {v1, p0, p0}, Lcom/google/android/gms/common/api/internal/zaai;-><init>(Lcom/google/android/gms/common/api/internal/zaah;Lcom/google/android/gms/common/api/internal/zabd;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/internal/zabe;->zaa(Lcom/google/android/gms/common/api/internal/zabf;)V

    :goto_55
    return-object p1
.end method

.method public final onConnected(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method

.method public final onConnectionSuspended(I)V
    .registers 4

    .line 41
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/internal/zabe;->zaf(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 42
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zabe;->zahs:Lcom/google/android/gms/common/api/internal/zabt;

    iget-boolean v1, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    invoke-interface {v0, p1, v1}, Lcom/google/android/gms/common/api/internal/zabt;->zab(IZ)V

    return-void
.end method

.method public final zaa(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/common/api/Api;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/ConnectionResult;",
            "Lcom/google/android/gms/common/api/Api<",
            "*>;Z)V"
        }
    .end annotation

    return-void
.end method

.method final zaam()V
    .registers 2

    .line 44
    iget-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zaft:Z

    .line 46
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zaah;->zafs:Lcom/google/android/gms/common/api/internal/zabe;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zabe;->zaed:Lcom/google/android/gms/common/api/internal/zaaw;

    iget-object v0, v0, Lcom/google/android/gms/common/api/internal/zaaw;->zahe:Lcom/google/android/gms/common/api/internal/zacp;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/zacp;->release()V

    .line 47
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zaah;->disconnect()Z

    :cond_13
    return-void
.end method
