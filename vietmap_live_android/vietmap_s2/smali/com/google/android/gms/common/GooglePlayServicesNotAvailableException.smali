###### Class com.google.android.gms.common.GooglePlayServicesNotAvailableException (com.google.android.gms.common.GooglePlayServicesNotAvailableException)
.class public final Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;
.super Ljava/lang/Exception;


# instance fields
.field public final errorCode:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 2
    iput p1, p0, Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;->errorCode:I

    return-void
.end method
