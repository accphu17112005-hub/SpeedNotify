###### Class com.google.android.gms.dynamic.zae (com.google.android.gms.dynamic.zae)
.class final Lcom/google/android/gms/dynamic/zae;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic zarn:Landroid/content/Intent;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/dynamic/zae;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/dynamic/zae;->zarn:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 2
    :try_start_0
    iget-object p1, p0, Lcom/google/android/gms/dynamic/zae;->val$context:Landroid/content/Context;

    iget-object v0, p0, Lcom/google/android/gms/dynamic/zae;->zarn:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_7
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_7} :catch_8

    return-void

    :catch_8
    move-exception p1

    const-string v0, "DeferredLifecycleHelper"

    const-string v1, "Failed to start resolution intent"

    .line 5
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
