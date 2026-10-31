###### Class com.google.android.gms.common.images.ImageManager (com.google.android.gms.common.images.ImageManager)
.class public final Lcom/google/android/gms/common/images/ImageManager;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/images/ImageManager$zaa;,
        Lcom/google/android/gms/common/images/ImageManager$zad;,
        Lcom/google/android/gms/common/images/ImageManager$zab;,
        Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;,
        Lcom/google/android/gms/common/images/ImageManager$zac;,
        Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;
    }
.end annotation


# static fields
.field private static final zamg:Ljava/lang/Object;

.field private static zamh:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private static zami:Lcom/google/android/gms/common/images/ImageManager;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final zamj:Ljava/util/concurrent/ExecutorService;

.field private final zamk:Lcom/google/android/gms/common/images/ImageManager$zaa;

.field private final zaml:Lcom/google/android/gms/internal/base/zak;

.field private final zamm:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/images/zaa;",
            "Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private final zamn:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private final zamo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 54
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/images/ImageManager;->zamg:Ljava/lang/Object;

    .line 55
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/images/ImageManager;->zamh:Ljava/util/HashSet;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Z)V
    .registers 3

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->mContext:Landroid/content/Context;

    .line 8
    new-instance p1, Lcom/google/android/gms/internal/base/zal;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/base/zal;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->mHandler:Landroid/os/Handler;

    const/4 p1, 0x4

    .line 9
    invoke-static {p1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->zamj:Ljava/util/concurrent/ExecutorService;

    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->zamk:Lcom/google/android/gms/common/images/ImageManager$zaa;

    .line 11
    new-instance p1, Lcom/google/android/gms/internal/base/zak;

    invoke-direct {p1}, Lcom/google/android/gms/internal/base/zak;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->zaml:Lcom/google/android/gms/internal/base/zak;

    .line 12
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->zamm:Ljava/util/Map;

    .line 13
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->zamn:Ljava/util/Map;

    .line 14
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager;->zamo:Ljava/util/Map;

    return-void
.end method

.method public static create(Landroid/content/Context;)Lcom/google/android/gms/common/images/ImageManager;
    .registers 3

    .line 2
    sget-object v0, Lcom/google/android/gms/common/images/ImageManager;->zami:Lcom/google/android/gms/common/images/ImageManager;

    if-nez v0, :cond_c

    .line 3
    new-instance v0, Lcom/google/android/gms/common/images/ImageManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/common/images/ImageManager;-><init>(Landroid/content/Context;Z)V

    sput-object v0, Lcom/google/android/gms/common/images/ImageManager;->zami:Lcom/google/android/gms/common/images/ImageManager;

    .line 4
    :cond_c
    sget-object p0, Lcom/google/android/gms/common/images/ImageManager;->zami:Lcom/google/android/gms/common/images/ImageManager;

    return-object p0
.end method

.method static synthetic zaa(Lcom/google/android/gms/common/images/ImageManager;Lcom/google/android/gms/common/images/zab;)Landroid/graphics/Bitmap;
    .registers 2

    .line 46
    invoke-direct {p0, p1}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/zab;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method private final zaa(Lcom/google/android/gms/common/images/zab;)Landroid/graphics/Bitmap;
    .registers 3

    .line 39
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager;->zamk:Lcom/google/android/gms/common/images/ImageManager$zaa;

    if-nez v0, :cond_6

    const/4 p1, 0x0

    return-object p1

    .line 41
    :cond_6
    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/images/ImageManager$zaa;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic zaa(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;
    .registers 1

    .line 43
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->zamm:Ljava/util/Map;

    return-object p0
.end method

.method private final zaa(Lcom/google/android/gms/common/images/zaa;)V
    .registers 3

    const-string v0, "ImageManager.loadImage() must be called in the main thread"

    .line 35
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Asserts;->checkMainThread(Ljava/lang/String;)V

    .line 36
    new-instance v0, Lcom/google/android/gms/common/images/ImageManager$zac;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/common/images/ImageManager$zac;-><init>(Lcom/google/android/gms/common/images/ImageManager;Lcom/google/android/gms/common/images/zaa;)V

    .line 37
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;
    .registers 1

    .line 44
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic zac(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/base/zak;
    .registers 1

    .line 45
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->zaml:Lcom/google/android/gms/internal/base/zak;

    return-object p0
.end method

.method static synthetic zacc()Ljava/lang/Object;
    .registers 1

    .line 49
    sget-object v0, Lcom/google/android/gms/common/images/ImageManager;->zamg:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic zacd()Ljava/util/HashSet;
    .registers 1

    .line 50
    sget-object v0, Lcom/google/android/gms/common/images/ImageManager;->zamh:Ljava/util/HashSet;

    return-object v0
.end method

.method static synthetic zad(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;
    .registers 1

    .line 47
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->zamo:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic zae(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;
    .registers 1

    .line 48
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->zamn:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic zaf(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/concurrent/ExecutorService;
    .registers 1

    .line 51
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->zamj:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static synthetic zag(Lcom/google/android/gms/common/images/ImageManager;)Landroid/os/Handler;
    .registers 1

    .line 52
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic zah(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/common/images/ImageManager$zaa;
    .registers 1

    .line 53
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager;->zamk:Lcom/google/android/gms/common/images/ImageManager$zaa;

    return-object p0
.end method


# virtual methods
.method public final loadImage(Landroid/widget/ImageView;I)V
    .registers 4

    .line 19
    new-instance v0, Lcom/google/android/gms/common/images/zac;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/common/images/zac;-><init>(Landroid/widget/ImageView;I)V

    .line 20
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/zaa;)V

    return-void
.end method

.method public final loadImage(Landroid/widget/ImageView;Landroid/net/Uri;)V
    .registers 4

    .line 16
    new-instance v0, Lcom/google/android/gms/common/images/zac;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/common/images/zac;-><init>(Landroid/widget/ImageView;Landroid/net/Uri;)V

    .line 17
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/zaa;)V

    return-void
.end method

.method public final loadImage(Landroid/widget/ImageView;Landroid/net/Uri;I)V
    .registers 5

    .line 22
    new-instance v0, Lcom/google/android/gms/common/images/zac;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/common/images/zac;-><init>(Landroid/widget/ImageView;Landroid/net/Uri;)V

    .line 24
    iput p3, v0, Lcom/google/android/gms/common/images/zaa;->zamw:I

    .line 25
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/zaa;)V

    return-void
.end method

.method public final loadImage(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;)V
    .registers 4

    .line 27
    new-instance v0, Lcom/google/android/gms/common/images/zad;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/common/images/zad;-><init>(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;)V

    .line 28
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/zaa;)V

    return-void
.end method

.method public final loadImage(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;I)V
    .registers 5

    .line 30
    new-instance v0, Lcom/google/android/gms/common/images/zad;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/common/images/zad;-><init>(Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;Landroid/net/Uri;)V

    .line 32
    iput p3, v0, Lcom/google/android/gms/common/images/zaa;->zamw:I

    .line 33
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/zaa;)V

    return-void
.end method

###### Class com.google.android.gms.common.images.ImageManager.ImageReceiver (com.google.android.gms.common.images.ImageManager$ImageReceiver)
.class final Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;
.super Landroid/os/ResultReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ImageReceiver"
.end annotation


# instance fields
.field private final mUri:Landroid/net/Uri;

.field private final zamp:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/gms/common/images/zaa;",
            ">;"
        }
    .end annotation
.end field

.field private final synthetic zamq:Lcom/google/android/gms/common/images/ImageManager;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    .line 2
    new-instance p1, Lcom/google/android/gms/internal/base/zal;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/google/android/gms/internal/base/zal;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, p1}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamp:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic zaa(Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;)Ljava/util/ArrayList;
    .registers 1

    .line 21
    iget-object p0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamp:Ljava/util/ArrayList;

    return-object p0
.end method


# virtual methods
.method public final onReceiveResult(ILandroid/os/Bundle;)V
    .registers 6

    const-string p1, "com.google.android.gms.extra.fileDescriptor"

    .line 18
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/os/ParcelFileDescriptor;

    .line 19
    iget-object p2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {p2}, Lcom/google/android/gms/common/images/ImageManager;->zaf(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/concurrent/ExecutorService;

    move-result-object p2

    new-instance v0, Lcom/google/android/gms/common/images/ImageManager$zab;

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/gms/common/images/ImageManager$zab;-><init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;Landroid/os/ParcelFileDescriptor;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zab(Lcom/google/android/gms/common/images/zaa;)V
    .registers 3

    const-string v0, "ImageReceiver.addImageRequest() must be called in the main thread"

    .line 6
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Asserts;->checkMainThread(Ljava/lang/String;)V

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamp:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final zac(Lcom/google/android/gms/common/images/zaa;)V
    .registers 3

    const-string v0, "ImageReceiver.removeImageRequest() must be called in the main thread"

    .line 9
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Asserts;->checkMainThread(Ljava/lang/String;)V

    .line 10
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamp:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final zace()V
    .registers 4

    .line 12
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.common.images.LOAD_IMAGE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->mUri:Landroid/net/Uri;

    const-string v2, "com.google.android.gms.extras.uri"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "com.google.android.gms.extras.resultReceiver"

    .line 14
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "com.google.android.gms.extras.priority"

    const/4 v2, 0x3

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

###### Class com.google.android.gms.common.images.ImageManager.OnImageLoadedListener (com.google.android.gms.common.images.ImageManager$OnImageLoadedListener)
.class public interface abstract Lcom/google/android/gms/common/images/ImageManager$OnImageLoadedListener;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnImageLoadedListener"
.end annotation


# virtual methods
.method public abstract onImageLoaded(Landroid/net/Uri;Landroid/graphics/drawable/Drawable;Z)V
.end method

###### Class com.google.android.gms.common.images.ImageManager.zaa (com.google.android.gms.common.images.ImageManager$zaa)
.class final Lcom/google/android/gms/common/images/ImageManager$zaa;
.super Landroidx/collection/LruCache;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "zaa"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/collection/LruCache<",
        "Lcom/google/android/gms/common/images/zab;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# virtual methods
.method protected final synthetic entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    .line 4
    check-cast p2, Lcom/google/android/gms/common/images/zab;

    check-cast p3, Landroid/graphics/Bitmap;

    check-cast p4, Landroid/graphics/Bitmap;

    .line 5
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/collection/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method protected final synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    .line 1
    check-cast p2, Landroid/graphics/Bitmap;

    .line 2
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result p2

    mul-int p1, p1, p2

    return p1
.end method

###### Class com.google.android.gms.common.images.ImageManager.zab (com.google.android.gms.common.images.ImageManager$zab)
.class final Lcom/google/android/gms/common/images/ImageManager$zab;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "zab"
.end annotation


# instance fields
.field private final mUri:Landroid/net/Uri;

.field private final synthetic zamq:Lcom/google/android/gms/common/images/ImageManager;

.field private final zamr:Landroid/os/ParcelFileDescriptor;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;Landroid/os/ParcelFileDescriptor;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->mUri:Landroid/net/Uri;

    .line 3
    iput-object p3, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->zamr:Landroid/os/ParcelFileDescriptor;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    const-string v0, "LoadBitmapFromDiskRunnable can\'t be executed in the main thread"

    .line 5
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Asserts;->checkNotMainThread(Ljava/lang/String;)V

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->zamr:Landroid/os/ParcelFileDescriptor;

    const/4 v1, 0x1

    const-string v2, "ImageManager"

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_4c

    .line 9
    :try_start_e
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;

    move-result-object v4
    :try_end_16
    .catch Ljava/lang/OutOfMemoryError; {:try_start_e .. :try_end_16} :catch_17

    goto :goto_3d

    :catch_17
    move-exception v0

    .line 12
    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->mUri:Landroid/net/Uri;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x22

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "OOM while loading bitmap for uri: "

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v3, 0x1

    .line 14
    :goto_3d
    :try_start_3d
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->zamr:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_42} :catch_43

    goto :goto_49

    :catch_43
    move-exception v0

    const-string v5, "closed failed"

    .line 17
    invoke-static {v2, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_49
    move v10, v3

    move-object v9, v4

    goto :goto_4e

    :cond_4c
    move-object v9, v4

    const/4 v10, 0x0

    .line 18
    :goto_4e
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 19
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zag(Lcom/google/android/gms/common/images/ImageManager;)Landroid/os/Handler;

    move-result-object v1

    new-instance v3, Lcom/google/android/gms/common/images/ImageManager$zad;

    iget-object v7, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    iget-object v8, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->mUri:Landroid/net/Uri;

    move-object v6, v3

    move-object v11, v0

    invoke-direct/range {v6 .. v11}, Lcom/google/android/gms/common/images/ImageManager$zad;-><init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;Landroid/graphics/Bitmap;ZLjava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 20
    :try_start_67
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_6a
    .catch Ljava/lang/InterruptedException; {:try_start_67 .. :try_end_6a} :catch_6b

    return-void

    .line 23
    :catch_6b
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zab;->mUri:Landroid/net/Uri;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x20

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Latch interrupted while posting "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

###### Class com.google.android.gms.common.images.ImageManager.zac (com.google.android.gms.common.images.ImageManager$zac)
.class final Lcom/google/android/gms/common/images/ImageManager$zac;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "zac"
.end annotation


# instance fields
.field private final synthetic zamq:Lcom/google/android/gms/common/images/ImageManager;

.field private final zams:Lcom/google/android/gms/common/images/zaa;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Lcom/google/android/gms/common/images/zaa;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    const-string v0, "LoadImageRunnable must be executed on the main thread"

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Asserts;->checkMainThread(Ljava/lang/String;)V

    .line 5
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    if-eqz v0, :cond_25

    .line 7
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zac(Lcom/google/android/gms/common/images/zaa;)V

    .line 9
    :cond_25
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    iget-object v0, v0, Lcom/google/android/gms/common/images/zaa;->zamu:Lcom/google/android/gms/common/images/zab;

    .line 10
    iget-object v1, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    const/4 v2, 0x1

    if-nez v1, :cond_40

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    .line 12
    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v3}, Lcom/google/android/gms/common/images/ImageManager;->zac(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/base/zak;

    move-result-object v3

    .line 13
    invoke-virtual {v0, v1, v3, v2}, Lcom/google/android/gms/common/images/zaa;->zaa(Landroid/content/Context;Lcom/google/android/gms/internal/base/zak;Z)V

    return-void

    .line 15
    :cond_40
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1, v0}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/ImageManager;Lcom/google/android/gms/common/images/zab;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_54

    .line 17
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v3}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v0, v3, v1, v2}, Lcom/google/android/gms/common/images/zaa;->zaa(Landroid/content/Context;Landroid/graphics/Bitmap;Z)V

    return-void

    .line 19
    :cond_54
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zad(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v1

    iget-object v3, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    if-eqz v1, :cond_91

    .line 21
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    const-wide/32 v5, 0x36ee80

    cmp-long v1, v3, v5

    if-gez v1, :cond_86

    .line 22
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    .line 23
    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v3}, Lcom/google/android/gms/common/images/ImageManager;->zac(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/base/zak;

    move-result-object v3

    .line 24
    invoke-virtual {v0, v1, v3, v2}, Lcom/google/android/gms/common/images/zaa;->zaa(Landroid/content/Context;Lcom/google/android/gms/internal/base/zak;Z)V

    return-void

    .line 26
    :cond_86
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zad(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    :cond_91
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v3}, Lcom/google/android/gms/common/images/ImageManager;->zac(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/base/zak;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/common/images/zaa;->zaa(Landroid/content/Context;Lcom/google/android/gms/internal/base/zak;)V

    .line 28
    iget-object v1, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v1}, Lcom/google/android/gms/common/images/ImageManager;->zae(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v1

    iget-object v2, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    if-nez v1, :cond_c6

    .line 30
    new-instance v1, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    iget-object v3, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;-><init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;)V

    .line 31
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->zae(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v2

    iget-object v3, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    :cond_c6
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zab(Lcom/google/android/gms/common/images/zaa;)V

    .line 33
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    instance-of v2, v2, Lcom/google/android/gms/common/images/zad;

    if-nez v2, :cond_dc

    .line 34
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zac;->zams:Lcom/google/android/gms/common/images/zaa;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    :cond_dc
    invoke-static {}, Lcom/google/android/gms/common/images/ImageManager;->zacc()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 36
    :try_start_e1
    invoke-static {}, Lcom/google/android/gms/common/images/ImageManager;->zacd()Ljava/util/HashSet;

    move-result-object v3

    iget-object v4, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f9

    .line 38
    invoke-static {}, Lcom/google/android/gms/common/images/ImageManager;->zacd()Ljava/util/HashSet;

    move-result-object v3

    iget-object v0, v0, Lcom/google/android/gms/common/images/zab;->uri:Landroid/net/Uri;

    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 39
    invoke-virtual {v1}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zace()V

    .line 40
    :cond_f9
    monitor-exit v2

    return-void

    :catchall_fb
    move-exception v0

    monitor-exit v2
    :try_end_fd
    .catchall {:try_start_e1 .. :try_end_fd} :catchall_fb

    throw v0
.end method

###### Class com.google.android.gms.common.images.ImageManager.zad (com.google.android.gms.common.images.ImageManager$zad)
.class final Lcom/google/android/gms/common/images/ImageManager$zad;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/images/ImageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "zad"
.end annotation


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mUri:Landroid/net/Uri;

.field private final zadq:Ljava/util/concurrent/CountDownLatch;

.field private final synthetic zamq:Lcom/google/android/gms/common/images/ImageManager;

.field private zamt:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/images/ImageManager;Landroid/net/Uri;Landroid/graphics/Bitmap;ZLjava/util/concurrent/CountDownLatch;)V
    .registers 6

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mUri:Landroid/net/Uri;

    .line 3
    iput-object p3, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mBitmap:Landroid/graphics/Bitmap;

    .line 4
    iput-boolean p4, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamt:Z

    .line 5
    iput-object p5, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zadq:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 11

    const-string v0, "OnBitmapLoadedRunnable must be executed in the main thread"

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Asserts;->checkMainThread(Ljava/lang/String;)V

    .line 8
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    .line 9
    :goto_d
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->zah(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/common/images/ImageManager$zaa;

    move-result-object v2

    if-eqz v2, :cond_45

    .line 10
    iget-boolean v2, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamt:Z

    if-eqz v2, :cond_31

    .line 11
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->zah(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/common/images/ImageManager$zaa;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/images/ImageManager$zaa;->evictAll()V

    .line 12
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 13
    iput-boolean v1, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamt:Z

    .line 14
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v0}, Lcom/google/android/gms/common/images/ImageManager;->zag(Lcom/google/android/gms/common/images/ImageManager;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_31
    if-eqz v0, :cond_45

    .line 17
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->zah(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/common/images/ImageManager$zaa;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/common/images/zab;

    iget-object v4, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mUri:Landroid/net/Uri;

    invoke-direct {v3, v4}, Lcom/google/android/gms/common/images/zab;-><init>(Landroid/net/Uri;)V

    iget-object v4, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/common/images/ImageManager$zaa;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    :cond_45
    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager;->zae(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mUri:Landroid/net/Uri;

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;

    if-eqz v2, :cond_a6

    .line 21
    invoke-static {v2}, Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;->zaa(Lcom/google/android/gms/common/images/ImageManager$ImageReceiver;)Ljava/util/ArrayList;

    move-result-object v2

    .line 22
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_5e
    if-ge v4, v3, :cond_a6

    .line 23
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/common/images/zaa;

    if-eqz v0, :cond_74

    .line 25
    iget-object v6, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v6}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v6, v7, v1}, Lcom/google/android/gms/common/images/zaa;->zaa(Landroid/content/Context;Landroid/graphics/Bitmap;Z)V

    goto :goto_96

    .line 26
    :cond_74
    iget-object v6, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v6}, Lcom/google/android/gms/common/images/ImageManager;->zad(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mUri:Landroid/net/Uri;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    iget-object v6, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    .line 28
    invoke-static {v6}, Lcom/google/android/gms/common/images/ImageManager;->zab(Lcom/google/android/gms/common/images/ImageManager;)Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v7}, Lcom/google/android/gms/common/images/ImageManager;->zac(Lcom/google/android/gms/common/images/ImageManager;)Lcom/google/android/gms/internal/base/zak;

    move-result-object v7

    .line 29
    invoke-virtual {v5, v6, v7, v1}, Lcom/google/android/gms/common/images/zaa;->zaa(Landroid/content/Context;Lcom/google/android/gms/internal/base/zak;Z)V

    .line 30
    :goto_96
    instance-of v6, v5, Lcom/google/android/gms/common/images/zad;

    if-nez v6, :cond_a3

    .line 31
    iget-object v6, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zamq:Lcom/google/android/gms/common/images/ImageManager;

    invoke-static {v6}, Lcom/google/android/gms/common/images/ImageManager;->zaa(Lcom/google/android/gms/common/images/ImageManager;)Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a3
    add-int/lit8 v4, v4, 0x1

    goto :goto_5e

    .line 33
    :cond_a6
    iget-object v0, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->zadq:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 34
    invoke-static {}, Lcom/google/android/gms/common/images/ImageManager;->zacc()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 35
    :try_start_b0
    invoke-static {}, Lcom/google/android/gms/common/images/ImageManager;->zacd()Ljava/util/HashSet;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/images/ImageManager$zad;->mUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 36
    monitor-exit v0

    return-void

    :catchall_bb
    move-exception v1

    monitor-exit v0
    :try_end_bd
    .catchall {:try_start_b0 .. :try_end_bd} :catchall_bb

    throw v1
.end method
