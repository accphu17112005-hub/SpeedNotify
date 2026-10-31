###### Class com.google.android.gms.common.internal.IResolveAccountCallbacks (com.google.android.gms.common.internal.IResolveAccountCallbacks)
.class public interface abstract Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub;
    }
.end annotation


# virtual methods
.method public abstract onAccountResolutionComplete(Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

###### Class com.google.android.gms.common.internal.IResolveAccountCallbacks.Stub (com.google.android.gms.common.internal.IResolveAccountCallbacks$Stub)
.class public abstract Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub;
.super Lcom/google/android/gms/internal/base/zab;

# interfaces
.implements Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub$Proxy;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    const-string v0, "com.google.android.gms.common.internal.IResolveAccountCallbacks"

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/base/zab;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const-string v0, "com.google.android.gms.common.internal.IResolveAccountCallbacks"

    .line 5
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 6
    instance-of v1, v0, Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;

    if-eqz v1, :cond_11

    .line 7
    check-cast v0, Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;

    return-object v0

    .line 8
    :cond_11
    new-instance v0, Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub$Proxy;

    invoke-direct {v0, p0}, Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method


# virtual methods
.method protected dispatchTransaction(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 p4, 0x2

    if-ne p1, p4, :cond_13

    .line 10
    sget-object p1, Lcom/google/android/gms/common/internal/ResolveAccountResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/base/zac;->zaa(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/internal/ResolveAccountResponse;

    .line 11
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub;->onAccountResolutionComplete(Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V

    .line 12
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    const/4 p1, 0x1

    return p1

    :cond_13
    const/4 p1, 0x0

    return p1
.end method

###### Class com.google.android.gms.common.internal.IResolveAccountCallbacks.Stub.Proxy (com.google.android.gms.common.internal.IResolveAccountCallbacks$Stub$Proxy)
.class public Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub$Proxy;
.super Lcom/google/android/gms/internal/base/zaa;

# interfaces
.implements Lcom/google/android/gms/common/internal/IResolveAccountCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/IResolveAccountCallbacks$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Proxy"
.end annotation


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 3

    const-string v0, "com.google.android.gms.common.internal.IResolveAccountCallbacks"

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/base/zaa;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onAccountResolutionComplete(Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/base/zaa;->zaa()Landroid/os/Parcel;

    move-result-object v0

    .line 4
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/base/zac;->zaa(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    const/4 p1, 0x2

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/base/zaa;->zab(ILandroid/os/Parcel;)V

    return-void
.end method
