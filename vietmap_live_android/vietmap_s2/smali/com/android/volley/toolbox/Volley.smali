###### Class com.android.volley.toolbox.Volley (com.android.volley.toolbox.Volley)
.class public Lcom/android/volley/toolbox/Volley;
.super Ljava/lang/Object;
.source "Volley.java"


# static fields
.field private static final DEFAULT_CACHE_DIR:Ljava/lang/String; = "volley"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;
    .registers 3

    const/4 v0, 0x0

    .line 121
    move-object v1, v0

    check-cast v1, Lcom/android/volley/toolbox/BaseHttpStack;

    invoke-static {p0, v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/BaseHttpStack;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    return-object p0
.end method

.method private static newRequestQueue(Landroid/content/Context;Lcom/android/volley/Network;)Lcom/android/volley/RequestQueue;
    .registers 4

    .line 93
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 96
    new-instance v0, Lcom/android/volley/toolbox/Volley$1;

    invoke-direct {v0, p0}, Lcom/android/volley/toolbox/Volley$1;-><init>(Landroid/content/Context;)V

    .line 108
    new-instance p0, Lcom/android/volley/RequestQueue;

    new-instance v1, Lcom/android/volley/toolbox/DiskBasedCache;

    invoke-direct {v1, v0}, Lcom/android/volley/toolbox/DiskBasedCache;-><init>(Lcom/android/volley/toolbox/DiskBasedCache$FileSupplier;)V

    invoke-direct {p0, v1, p1}, Lcom/android/volley/RequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/Network;)V

    .line 109
    invoke-virtual {p0}, Lcom/android/volley/RequestQueue;->start()V

    return-object p0
.end method

.method public static newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/BaseHttpStack;)Lcom/android/volley/RequestQueue;
    .registers 4

    if-nez p1, :cond_48

    .line 45
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x9

    if-lt p1, v0, :cond_13

    .line 46
    new-instance p1, Lcom/android/volley/toolbox/BasicNetwork;

    new-instance v0, Lcom/android/volley/toolbox/HurlStack;

    invoke-direct {v0}, Lcom/android/volley/toolbox/HurlStack;-><init>()V

    invoke-direct {p1, v0}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/BaseHttpStack;)V

    goto :goto_4e

    .line 54
    :cond_13
    :try_start_13
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    .line 56
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_36
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_13 .. :try_end_36} :catch_37

    goto :goto_39

    :catch_37
    const-string p1, "volley/0"

    .line 61
    :goto_39
    new-instance v0, Lcom/android/volley/toolbox/BasicNetwork;

    new-instance v1, Lcom/android/volley/toolbox/HttpClientStack;

    .line 63
    invoke-static {p1}, Landroid/net/http/AndroidHttpClient;->newInstance(Ljava/lang/String;)Landroid/net/http/AndroidHttpClient;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/android/volley/toolbox/HttpClientStack;-><init>(Lorg/apache/http/client/HttpClient;)V

    invoke-direct {v0, v1}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/HttpStack;)V

    goto :goto_4d

    .line 66
    :cond_48
    new-instance v0, Lcom/android/volley/toolbox/BasicNetwork;

    invoke-direct {v0, p1}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/BaseHttpStack;)V

    :goto_4d
    move-object p1, v0

    .line 69
    :goto_4e
    invoke-static {p0, p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/Network;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    return-object p0
.end method

.method public static newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/HttpStack;)Lcom/android/volley/RequestQueue;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    if-nez p1, :cond_b

    const/4 p1, 0x0

    .line 86
    move-object v0, p1

    check-cast v0, Lcom/android/volley/toolbox/BaseHttpStack;

    invoke-static {p0, p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/BaseHttpStack;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    return-object p0

    .line 88
    :cond_b
    new-instance v0, Lcom/android/volley/toolbox/BasicNetwork;

    invoke-direct {v0, p1}, Lcom/android/volley/toolbox/BasicNetwork;-><init>(Lcom/android/volley/toolbox/HttpStack;)V

    invoke-static {p0, v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/Network;)Lcom/android/volley/RequestQueue;

    move-result-object p0

    return-object p0
.end method

###### Class com.android.volley.toolbox.Volley.AnonymousClass1 (com.android.volley.toolbox.Volley$1)
.class Lcom/android/volley/toolbox/Volley$1;
.super Ljava/lang/Object;
.source "Volley.java"

# interfaces
.implements Lcom/android/volley/toolbox/DiskBasedCache$FileSupplier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/Network;)Lcom/android/volley/RequestQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private cacheDir:Ljava/io/File;

.field final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 97
    iput-object p1, p0, Lcom/android/volley/toolbox/Volley$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 98
    iput-object p1, p0, Lcom/android/volley/toolbox/Volley$1;->cacheDir:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public get()Ljava/io/File;
    .registers 4

    .line 102
    iget-object v0, p0, Lcom/android/volley/toolbox/Volley$1;->cacheDir:Ljava/io/File;

    if-nez v0, :cond_13

    .line 103
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/volley/toolbox/Volley$1;->val$appContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "volley"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/volley/toolbox/Volley$1;->cacheDir:Ljava/io/File;

    .line 105
    :cond_13
    iget-object v0, p0, Lcom/android/volley/toolbox/Volley$1;->cacheDir:Ljava/io/File;

    return-object v0
.end method
