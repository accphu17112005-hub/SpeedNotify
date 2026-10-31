###### Class com.google.android.vending.licensing.NullDeviceLimiter (com.google.android.vending.licensing.NullDeviceLimiter)
.class public Lcom/google/android/vending/licensing/NullDeviceLimiter;
.super Ljava/lang/Object;
.source "NullDeviceLimiter.java"

# interfaces
.implements Lcom/google/android/vending/licensing/DeviceLimiter;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isDeviceAllowed(Ljava/lang/String;)I
    .registers 2

    const/16 p1, 0x100

    return p1
.end method
