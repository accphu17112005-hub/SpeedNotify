###### Class com.google.android.gms.common.util.concurrent.zza (com.google.android.gms.common.util.concurrent.zza)
.class final Lcom/google/android/gms/common/util/concurrent/zza;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final priority:I

.field private final zzhs:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;I)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/util/concurrent/zza;->zzhs:Ljava/lang/Runnable;

    .line 3
    iput p2, p0, Lcom/google/android/gms/common/util/concurrent/zza;->priority:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 5
    iget v0, p0, Lcom/google/android/gms/common/util/concurrent/zza;->priority:I

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/common/util/concurrent/zza;->zzhs:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
