###### Class com.navngo.igo.javaclient.androidgo.GeneralFunctor (com.navngo.igo.javaclient.androidgo.GeneralFunctor)
.class public final Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;
.super Ljava/lang/Object;
.source "GeneralFunctor.java"


# static fields
.field private static final logname:Ljava/lang/String; = "GeneralFunctor"


# instance fields
.field private mFunction:Ljava/lang/reflect/Method;

.field private mName:Ljava/lang/String;

.field private mObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    const-string v0, "GeneralFunctor"

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    .line 19
    iput-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    .line 39
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mName:Ljava/lang/String;

    .line 40
    iput-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mObj:Ljava/lang/Object;

    .line 42
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    .line 45
    :goto_10
    :try_start_10
    iget-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    if-nez p2, :cond_21

    if-eqz p1, :cond_21

    .line 47
    invoke-direct {p0, p3, p1}, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->searchMethod(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    iput-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    .line 48
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p1

    goto :goto_10

    :cond_21
    if-nez p2, :cond_3e

    .line 51
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Cannot find method: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_37} :catch_38

    goto :goto_3e

    :catch_38
    move-exception p1

    const-string p2, "Exception while trying to find method:"

    .line 54
    invoke-static {v0, p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3e
    :goto_3e
    return-void
.end method

.method private searchMethod(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 59
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object p2

    .line 60
    array-length v0, p2

    const/4 v1, 0x0

    :goto_6
    if-ge v1, v0, :cond_18

    aget-object v2, p2, v1

    .line 61
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    return-object v2

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_18
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public varargs call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    .line 70
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_5b

    .line 72
    :try_start_4
    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mObj:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_a} :catch_b

    goto :goto_5c

    :catch_b
    move-exception v0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error invoking method: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GeneralFunctor"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    array-length v1, p1

    const/4 v3, 0x0

    :goto_2a
    if-ge v3, v1, :cond_45

    aget-object v4, p1, v3

    .line 76
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Args: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2a

    .line 82
    :cond_45
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5b
    const/4 p1, 0x0

    :goto_5c
    return-object p1
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .line 23
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getParameterTypes()[Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 27
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/GeneralFunctor;->mFunction:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method
