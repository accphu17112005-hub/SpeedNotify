###### Class com.google.android.gms.common.images.zac (com.google.android.gms.common.images.zac)
.class public final Lcom/google/android/gms/common/images/zac;
.super Lcom/google/android/gms/common/images/zaa;


# instance fields
.field private zanb:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;I)V
    .registers 4

    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/images/zaa;-><init>(Landroid/net/Uri;I)V

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Asserts;->checkNotNull(Ljava/lang/Object;)V

    .line 7
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/google/android/gms/common/images/zac;->zanb:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Landroid/net/Uri;)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/common/images/zaa;-><init>(Landroid/net/Uri;I)V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Asserts;->checkNotNull(Ljava/lang/Object;)V

    .line 3
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/google/android/gms/common/images/zac;->zanb:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    .line 10
    instance-of v0, p1, Lcom/google/android/gms/common/images/zac;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    const/4 v0, 0x1

    if-ne p0, p1, :cond_a

    return v0

    .line 14
    :cond_a
    check-cast p1, Lcom/google/android/gms/common/images/zac;

    .line 15
    iget-object v2, p0, Lcom/google/android/gms/common/images/zac;->zanb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 16
    iget-object p1, p1, Lcom/google/android/gms/common/images/zac;->zanb:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    if-eqz p1, :cond_27

    if-eqz v2, :cond_27

    .line 18
    invoke-static {p1, v2}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_27

    return v0

    :cond_27
    return v1
.end method

.method public final hashCode()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method protected final zaa(Landroid/graphics/drawable/Drawable;ZZZ)V
    .registers 10

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/common/images/zac;->zanb:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_63

    const/4 v1, 0x0

    if-nez p3, :cond_11

    if-nez p4, :cond_11

    const/4 v2, 0x1

    goto :goto_12

    :cond_11
    const/4 v2, 0x0

    :goto_12
    if-eqz v2, :cond_24

    .line 24
    instance-of v3, v0, Lcom/google/android/gms/internal/base/zaj;

    if-eqz v3, :cond_24

    .line 25
    invoke-static {}, Lcom/google/android/gms/internal/base/zaj;->zach()I

    move-result v3

    .line 26
    iget v4, p0, Lcom/google/android/gms/common/images/zac;->zamw:I

    if-eqz v4, :cond_24

    iget v4, p0, Lcom/google/android/gms/common/images/zac;->zamw:I

    if-eq v3, v4, :cond_63

    .line 27
    :cond_24
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/common/images/zaa;->zaa(ZZ)Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_43

    .line 30
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_3c

    .line 33
    instance-of v4, v3, Lcom/google/android/gms/internal/base/zae;

    if-eqz v4, :cond_3d

    .line 34
    check-cast v3, Lcom/google/android/gms/internal/base/zae;

    .line 35
    invoke-virtual {v3}, Lcom/google/android/gms/internal/base/zae;->zacf()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_3d

    :cond_3c
    move-object v3, p3

    .line 38
    :cond_3d
    :goto_3d
    new-instance v4, Lcom/google/android/gms/internal/base/zae;

    invoke-direct {v4, v3, p1}, Lcom/google/android/gms/internal/base/zae;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    move-object p1, v4

    .line 40
    :cond_43
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 41
    instance-of v0, v0, Lcom/google/android/gms/internal/base/zaj;

    if-eqz v0, :cond_5a

    if-eqz p4, :cond_50

    .line 42
    iget-object p3, p0, Lcom/google/android/gms/common/images/zac;->zamu:Lcom/google/android/gms/common/images/zab;

    iget-object p3, p3, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    .line 43
    :cond_50
    invoke-static {p3}, Lcom/google/android/gms/internal/base/zaj;->zaa(Landroid/net/Uri;)V

    if-eqz v2, :cond_57

    .line 44
    iget v1, p0, Lcom/google/android/gms/common/images/zac;->zamw:I

    .line 45
    :cond_57
    invoke-static {v1}, Lcom/google/android/gms/internal/base/zaj;->zai(I)V

    :cond_5a
    if-eqz p2, :cond_63

    .line 47
    check-cast p1, Lcom/google/android/gms/internal/base/zae;

    const/16 p2, 0xfa

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/base/zae;->startTransition(I)V

    :cond_63
    return-void
.end method
