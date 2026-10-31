###### Class com.navngo.igo.javaclient.Service1 (com.navngo.igo.javaclient.Service1)
.class public interface abstract Lcom/navngo/igo/javaclient/Service1;
.super Ljava/lang/Object;
.source "Service1.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/Service1$Stub;,
        Lcom/navngo/igo/javaclient/Service1$Default;
    }
.end annotation


# virtual methods
.method public abstract function1(Ljava/lang/String;[Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

###### Class com.navngo.igo.javaclient.Service1.Default (com.navngo.igo.javaclient.Service1$Default)
.class public Lcom/navngo/igo/javaclient/Service1$Default;
.super Ljava/lang/Object;
.source "Service1.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Service1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Service1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    const/4 v0, 0x0

    return-object v0
.end method

.method public function1(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

###### Class com.navngo.igo.javaclient.Service1.Stub (com.navngo.igo.javaclient.Service1$Stub)
.class public abstract Lcom/navngo/igo/javaclient/Service1$Stub;
.super Landroid/os/Binder;
.source "Service1.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Service1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Service1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.navngo.igo.javaclient.Service1"

.field static final TRANSACTION_function1:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 25
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.navngo.igo.javaclient.Service1"

    .line 26
    invoke-virtual {p0, p0, v0}, Lcom/navngo/igo/javaclient/Service1$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/navngo/igo/javaclient/Service1;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const-string v0, "com.navngo.igo.javaclient.Service1"

    .line 37
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 38
    instance-of v1, v0, Lcom/navngo/igo/javaclient/Service1;

    if-eqz v1, :cond_13

    .line 39
    check-cast v0, Lcom/navngo/igo/javaclient/Service1;

    return-object v0

    .line 41
    :cond_13
    new-instance v0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lcom/navngo/igo/javaclient/Service1;
    .registers 1

    .line 142
    sget-object v0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;->sDefaultImpl:Lcom/navngo/igo/javaclient/Service1;

    return-object v0
.end method

.method public static setDefaultImpl(Lcom/navngo/igo/javaclient/Service1;)Z
    .registers 2

    .line 132
    sget-object v0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;->sDefaultImpl:Lcom/navngo/igo/javaclient/Service1;

    if-nez v0, :cond_c

    if-eqz p0, :cond_a

    .line 136
    sput-object p0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;->sDefaultImpl:Lcom/navngo/igo/javaclient/Service1;

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0

    .line 133
    :cond_c
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "setDefaultImpl() called twice"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x1

    const-string v1, "com.navngo.igo.javaclient.Service1"

    if-eq p1, v0, :cond_13

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_f

    .line 78
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 54
    :cond_f
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 59
    :cond_13
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 63
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p2

    if-gez p2, :cond_22

    const/4 p2, 0x0

    goto :goto_24

    .line 68
    :cond_22
    new-array p2, p2, [Ljava/lang/String;

    .line 70
    :goto_24
    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/Service1$Stub;->function1(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result p1

    .line 71
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 72
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    invoke-virtual {p3, p2}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    return v0
.end method

###### Class com.navngo.igo.javaclient.Service1.Stub.Proxy (com.navngo.igo.javaclient.Service1$Stub$Proxy)
.class Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;
.super Ljava/lang/Object;
.source "Service1.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/Service1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/Service1$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# static fields
.field public static sDefaultImpl:Lcom/navngo/igo/javaclient/Service1;


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .line 91
    iget-object v0, p0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public function1(Ljava/lang/String;[Ljava/lang/String;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 99
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 100
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_8
    const-string v2, "com.navngo.igo.javaclient.Service1"

    .line 103
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 104
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    if-nez p2, :cond_17

    const/4 v2, -0x1

    .line 106
    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1b

    .line 109
    :cond_17
    array-length v2, p2

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 111
    :goto_1b
    iget-object v2, p0, Lcom/navngo/igo/javaclient/Service1$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-interface {v2, v4, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v2

    if-nez v2, :cond_3a

    .line 112
    invoke-static {}, Lcom/navngo/igo/javaclient/Service1$Stub;->getDefaultImpl()Lcom/navngo/igo/javaclient/Service1;

    move-result-object v2

    if-eqz v2, :cond_3a

    .line 113
    invoke-static {}, Lcom/navngo/igo/javaclient/Service1$Stub;->getDefaultImpl()Lcom/navngo/igo/javaclient/Service1;

    move-result-object v2

    invoke-interface {v2, p1, p2}, Lcom/navngo/igo/javaclient/Service1;->function1(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result p1
    :try_end_33
    .catchall {:try_start_8 .. :try_end_33} :catchall_4e

    .line 120
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 121
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return p1

    .line 115
    :cond_3a
    :try_start_3a
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 116
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_44

    const/4 v3, 0x1

    .line 117
    :cond_44
    invoke-virtual {v1, p2}, Landroid/os/Parcel;->readStringArray([Ljava/lang/String;)V
    :try_end_47
    .catchall {:try_start_3a .. :try_end_47} :catchall_4e

    .line 120
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 121
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return v3

    :catchall_4e
    move-exception p1

    .line 120
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 121
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 122
    throw p1
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    const-string v0, "com.navngo.igo.javaclient.Service1"

    return-object v0
.end method
