###### Class com.google.android.gms.common.util.zzb (com.google.android.gms.common.util.zzb)
.class public final Lcom/google/android/gms/common/util/zzb;
.super Ljava/lang/Object;


# static fields
.field private static zzgv:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public static zzc(I)I
    .registers 2

    const/4 v0, -0x1

    if-ne p0, v0, :cond_4

    return v0

    .line 3
    :cond_4
    div-int/lit16 p0, p0, 0x3e8

    return p0
.end method
