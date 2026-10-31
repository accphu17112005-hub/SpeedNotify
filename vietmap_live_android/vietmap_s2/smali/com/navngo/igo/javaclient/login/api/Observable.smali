###### Class com.navngo.igo.javaclient.login.api.Observable (com.navngo.igo.javaclient.login.api.Observable)
.class public Lcom/navngo/igo/javaclient/login/api/Observable;
.super Ljava/lang/Object;
.source "Observable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private listenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    .line 15
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public addAndExecuteOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "TT;>;)V"
        }
    .end annotation

    .line 21
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/api/Observable;->addOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V

    .line 22
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->value:Ljava/lang/Object;

    invoke-interface {p1, p0, v0}, Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;->onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V

    return-void
.end method

.method public addOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "TT;>;)V"
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public postValue()V
    .registers 4

    .line 47
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->value:Ljava/lang/Object;

    invoke-interface {v1, p0, v2}, Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;->onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V

    goto :goto_6

    :cond_18
    return-void
.end method

.method public postValue(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;

    invoke-interface {v1, p0, p1}, Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;->onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V

    goto :goto_6

    .line 43
    :cond_16
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/api/Observable;->setValue(Ljava/lang/Object;)V

    return-void
.end method

.method public removeOnChangeListener(Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener<",
            "TT;>;)V"
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_d
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 38
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/Observable;->value:Ljava/lang/Object;

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.api.Observable.OnChangeListener (com.navngo.igo.javaclient.login.api.Observable$OnChangeListener)
.class public interface abstract Lcom/navngo/igo/javaclient/login/api/Observable$OnChangeListener;
.super Ljava/lang/Object;
.source "Observable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/login/api/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnChangeListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onChange(Lcom/navngo/igo/javaclient/login/api/Observable;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/login/api/Observable<",
            "TT;>;TT;)V"
        }
    .end annotation
.end method
