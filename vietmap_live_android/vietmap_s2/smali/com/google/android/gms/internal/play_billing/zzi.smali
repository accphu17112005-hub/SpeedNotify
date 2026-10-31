###### Class com.google.android.gms.internal.play_billing.zzi (com.google.android.gms.internal.play_billing.zzi)
.class public final Lcom/google/android/gms/internal/play_billing/zzi;
.super Lcom/google/android/gms/internal/play_billing/zzh;
.source "com.android.billingclient:billing@@4.0.0"


# direct methods
.method public static zza(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/CheckForNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/CheckForNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p0, p1, :cond_e

    if-eqz p0, :cond_f

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_e

    :cond_d
    return v0

    :cond_e
    :goto_e
    const/4 v0, 0x1

    :cond_f
    return v0
.end method
