###### Class com.android.vending.licensing.ILicenseResultListener (com.android.vending.licensing.ILicenseResultListener)
.class public interface abstract Lcom/android/vending/licensing/ILicenseResultListener;
.super Ljava/lang/Object;
.source "ILicenseResultListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/ILicenseResultListener$Stub;,
        Lcom/android/vending/licensing/ILicenseResultListener$Default;
    }
.end annotation


# virtual methods
.method public abstract verifyLicense(ILjava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

###### Class com.android.vending.licensing.ILicenseResultListener.Default (com.android.vending.licensing.ILicenseResultListener$Default)
.class public Lcom/android/vending/licensing/ILicenseResultListener$Default;
.super Ljava/lang/Object;
.source "ILicenseResultListener.java"

# interfaces
.implements Lcom/android/vending/licensing/ILicenseResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/vending/licensing/ILicenseResultListener;
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

.method public verifyLicense(ILjava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    return-void
.end method

###### Class com.android.vending.licensing.ILicenseResultListener.Stub (com.android.vending.licensing.ILicenseResultListener$Stub)
.class public abstract Lcom/android/vending/licensing/ILicenseResultListener$Stub;
.super Landroid/os/Binder;
.source "ILicenseResultListener.java"

# interfaces
.implements Lcom/android/vending/licensing/ILicenseResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/vending/licensing/ILicenseResultListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.android.vending.licensing.ILicenseResultListener"

.field static final TRANSACTION_verifyLicense:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 24
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.android.vending.licensing.ILicenseResultListener"

    .line 25
    invoke-virtual {p0, p0, v0}, Lcom/android/vending/licensing/ILicenseResultListener$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/android/vending/licensing/ILicenseResultListener;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const-string v0, "com.android.vending.licensing.ILicenseResultListener"

    .line 36
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_13

    .line 37
    instance-of v1, v0, Lcom/android/vending/licensing/ILicenseResultListener;

    if-eqz v1, :cond_13

    .line 38
    check-cast v0, Lcom/android/vending/licensing/ILicenseResultListener;

    return-object v0

    .line 40
    :cond_13
    new-instance v0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lcom/android/vending/licensing/ILicenseResultListener;
    .registers 1

    .line 124
    sget-object v0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;->sDefaultImpl:Lcom/android/vending/licensing/ILicenseResultListener;

    return-object v0
.end method

.method public static setDefaultImpl(Lcom/android/vending/licensing/ILicenseResultListener;)Z
    .registers 2

    .line 114
    sget-object v0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;->sDefaultImpl:Lcom/android/vending/licensing/ILicenseResultListener;

    if-nez v0, :cond_c

    if-eqz p0, :cond_a

    .line 118
    sput-object p0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;->sDefaultImpl:Lcom/android/vending/licensing/ILicenseResultListener;

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0

    .line 115
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

    const-string v1, "com.android.vending.licensing.ILicenseResultListener"

    if-eq p1, v0, :cond_13

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_f

    .line 70
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 53
    :cond_f
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 58
    :cond_13
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    .line 62
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p3

    .line 64
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    .line 65
    invoke-virtual {p0, p1, p3, p2}, Lcom/android/vending/licensing/ILicenseResultListener$Stub;->verifyLicense(ILjava/lang/String;Ljava/lang/String;)V

    return v0
.end method

###### Class com.android.vending.licensing.ILicenseResultListener.Stub.Proxy (com.android.vending.licensing.ILicenseResultListener$Stub$Proxy)
.class Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;
.super Ljava/lang/Object;
.source "ILicenseResultListener.java"

# interfaces
.implements Lcom/android/vending/licensing/ILicenseResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/vending/licensing/ILicenseResultListener$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# static fields
.field public static sDefaultImpl:Lcom/android/vending/licensing/ILicenseResultListener;


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .line 83
    iget-object v0, p0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    const-string v0, "com.android.vending.licensing.ILicenseResultListener"

    return-object v0
.end method

.method public verifyLicense(ILjava/lang/String;Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 91
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    :try_start_4
    const-string v1, "com.android.vending.licensing.ILicenseResultListener"

    .line 93
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 95
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 97
    iget-object v1, p0, Lcom/android/vending/licensing/ILicenseResultListener$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v1, v3, v0, v2, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    if-nez v1, :cond_2d

    .line 98
    invoke-static {}, Lcom/android/vending/licensing/ILicenseResultListener$Stub;->getDefaultImpl()Lcom/android/vending/licensing/ILicenseResultListener;

    move-result-object v1

    if-eqz v1, :cond_2d

    .line 99
    invoke-static {}, Lcom/android/vending/licensing/ILicenseResultListener$Stub;->getDefaultImpl()Lcom/android/vending/licensing/ILicenseResultListener;

    move-result-object v1

    invoke-interface {v1, p1, p2, p3}, Lcom/android/vending/licensing/ILicenseResultListener;->verifyLicense(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_29
    .catchall {:try_start_4 .. :try_end_29} :catchall_31

    .line 104
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-void

    :cond_2d
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-void

    :catchall_31
    move-exception p1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 105
    throw p1
.end method
