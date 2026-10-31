###### Class com.navngo.igo.javaclient.permission.PermissionHandler (com.navngo.igo.javaclient.permission.PermissionHandler)
.class public Lcom/navngo/igo/javaclient/permission/PermissionHandler;
.super Ljava/lang/Object;
.source "PermissionHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;,
        Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;
    }
.end annotation


# static fields
.field private static volatile INSTANCE:Lcom/navngo/igo/javaclient/permission/PermissionHandler;

.field private static requestCode:I


# instance fields
.field private callbacks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;",
            ">;"
        }
    .end annotation
.end field

.field private multipleCallbacks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->multipleCallbacks:Ljava/util/HashMap;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->callbacks:Ljava/util/HashMap;

    return-void
.end method

.method private filterPermissions(Landroid/content/Context;Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 194
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    .line 195
    :cond_4
    :goto_4
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 196
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 197
    invoke-static {p1, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_4

    .line 198
    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    goto :goto_4

    :cond_1a
    return-void
.end method

.method public static get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;
    .registers 2

    .line 67
    sget-object v0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->INSTANCE:Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    if-nez v0, :cond_17

    .line 68
    const-class v0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    monitor-enter v0

    .line 69
    :try_start_7
    sget-object v1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->INSTANCE:Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    if-nez v1, :cond_12

    .line 70
    new-instance v1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;-><init>()V

    sput-object v1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->INSTANCE:Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    .line 72
    :cond_12
    monitor-exit v0

    goto :goto_17

    :catchall_14
    move-exception v1

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_14

    throw v1

    .line 74
    :cond_17
    :goto_17
    sget-object v0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->INSTANCE:Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    return-object v0
.end method

.method private isAllGranted([I)Z
    .registers 6

    .line 206
    array-length v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_5

    return v1

    :cond_5
    const/4 v0, 0x0

    .line 209
    :goto_6
    array-length v2, p1

    if-ge v0, v2, :cond_12

    .line 210
    aget v2, p1, v0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_f

    return v1

    :cond_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_12
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public getCriticalPermissions()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 159
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 163
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_15

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    .line 166
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_15
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getLockedTo()Ljava/lang/String;

    move-result-object v1

    const-string v2, "imei"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    const-string v1, "android.permission.READ_PHONE_STATE"

    .line 170
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_26
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 172
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getOptionalPermissions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 184
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public isPermissionGranted(Ljava/lang/String;)Z
    .registers 3

    .line 118
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    return p1
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 8

    .line 129
    iget-object v0, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->callbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 130
    invoke-direct {p0, p3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isAllGranted([I)Z

    move-result p2

    if-eqz p2, :cond_22

    .line 131
    iget-object p2, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->callbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;

    invoke-interface {p2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;->onPermissionGranted()V

    goto :goto_31

    .line 134
    :cond_22
    iget-object p2, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->callbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;

    invoke-interface {p2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;->onPermissionDenied()V

    .line 136
    :goto_31
    iget-object p2, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->callbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8c

    .line 138
    :cond_3b
    iget-object v0, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->multipleCallbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8c

    .line 139
    invoke-direct {p0, p3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->isAllGranted([I)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 140
    iget-object p2, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->multipleCallbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;

    invoke-interface {p2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;->onAllPermissionsGranted()V

    goto :goto_83

    .line 143
    :cond_5d
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 144
    :goto_63
    array-length v2, p2

    if-ge v1, v2, :cond_74

    .line 145
    aget-object v2, p2, v1

    aget v3, p3, v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_63

    .line 147
    :cond_74
    iget-object p2, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->multipleCallbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;

    invoke-interface {p2, v0}, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;->onSomePermissionsDenied(Ljava/util/Map;)V

    .line 149
    :goto_83
    iget-object p2, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->multipleCallbacks:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8c
    :goto_8c
    return-void
.end method

.method public requestPermission(Landroid/app/Activity;Ljava/lang/String;Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;)V
    .registers 6

    .line 102
    iget-object v0, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->callbacks:Ljava/util/HashMap;

    sget v1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_26

    const/4 p3, 0x1

    new-array v0, p3, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 105
    sget p2, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    invoke-static {p1, v0, p2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 106
    sget p1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    add-int/2addr p1, p3

    sput p1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    goto :goto_29

    .line 108
    :cond_26
    invoke-interface {p3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;->onPermissionGranted()V

    :goto_29
    return-void
.end method

.method public requestPermissions(Landroid/app/Activity;Ljava/util/List;Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;",
            ")V"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->multipleCallbacks:Ljava/util/HashMap;

    sget v1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->filterPermissions(Landroid/content/Context;Ljava/util/List;)V

    .line 86
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2d

    const/4 p3, 0x0

    new-array p3, p3, [Ljava/lang/String;

    .line 87
    invoke-interface {p2, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    sget p3, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    invoke-static {p1, p2, p3}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 88
    sget p1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    add-int/lit8 p1, p1, 0x1

    sput p1, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestCode:I

    goto :goto_30

    .line 90
    :cond_2d
    invoke-interface {p3}, Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;->onAllPermissionsGranted()V

    :goto_30
    return-void
.end method

###### Class com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForMultiple (com.navngo.igo.javaclient.permission.PermissionHandler$CallbackForMultiple)
.class public interface abstract Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForMultiple;
.super Ljava/lang/Object;
.source "PermissionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/permission/PermissionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CallbackForMultiple"
.end annotation


# virtual methods
.method public abstract onAllPermissionsGranted()V
.end method

.method public abstract onSomePermissionsDenied(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

###### Class com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForOne (com.navngo.igo.javaclient.permission.PermissionHandler$CallbackForOne)
.class public interface abstract Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;
.super Ljava/lang/Object;
.source "PermissionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/permission/PermissionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CallbackForOne"
.end annotation


# virtual methods
.method public abstract onPermissionDenied()V
.end method

.method public abstract onPermissionGranted()V
.end method
