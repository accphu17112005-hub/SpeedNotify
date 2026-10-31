###### Class com.google.android.gms.common.api.internal.zabj (com.google.android.gms.common.api.internal.zabj)
.class final Lcom/google/android/gms/common/api/internal/zabj;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic zaix:Lcom/google/android/gms/common/api/internal/GoogleApiManager$zaa;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/internal/GoogleApiManager$zaa;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zabj;->zaix:Lcom/google/android/gms/common/api/internal/GoogleApiManager$zaa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 2
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zabj;->zaix:Lcom/google/android/gms/common/api/internal/GoogleApiManager$zaa;

    invoke-static {v0}, Lcom/google/android/gms/common/api/internal/GoogleApiManager$zaa;->zae(Lcom/google/android/gms/common/api/internal/GoogleApiManager$zaa;)V

    return-void
.end method
