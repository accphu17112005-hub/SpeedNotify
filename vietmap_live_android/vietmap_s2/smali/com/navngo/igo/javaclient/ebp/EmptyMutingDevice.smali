###### Class com.navngo.igo.javaclient.ebp.EmptyMutingDevice (com.navngo.igo.javaclient.ebp.EmptyMutingDevice)
.class public Lcom/navngo/igo/javaclient/ebp/EmptyMutingDevice;
.super Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;
.source "EmptyMutingDevice.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/ebp/IMutingDevice;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;-><init>()V

    return-void
.end method


# virtual methods
.method public Close()V
    .registers 1

    return-void
.end method

.method public Mute(III)V
    .registers 4

    const/4 p2, 0x0

    .line 8
    invoke-virtual {p0, p2, p1}, Lcom/navngo/igo/javaclient/ebp/EmptyMutingDevice;->AudiofocusChanged(II)V

    return-void
.end method

.method public Unmute()V
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/ebp/EmptyMutingDevice;->AudiofocusChanged(II)V

    return-void
.end method
