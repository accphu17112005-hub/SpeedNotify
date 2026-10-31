###### Class com.navngo.igo.javaclient.ebp.IMutingDevice (com.navngo.igo.javaclient.ebp.IMutingDevice)
.class public interface abstract Lcom/navngo/igo/javaclient/ebp/IMutingDevice;
.super Ljava/lang/Object;
.source "IMutingDevice.java"


# static fields
.field public static final MUTED:I = 0x0

.field public static final MUTE_FAILED:I = 0x2

.field public static final UNMUTED:I = 0x1


# virtual methods
.method public abstract Close()V
.end method

.method public abstract Mute(III)V
.end method

.method public abstract OnAudioFocusLoss()V
.end method

.method public abstract Unmute()V
.end method
