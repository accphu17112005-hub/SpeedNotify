###### Class com.google.android.gms.internal.base.zah (com.google.android.gms.internal.base.zah)
.class final Lcom/google/android/gms/internal/base/zah;
.super Landroid/graphics/drawable/Drawable$ConstantState;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/base/zaf;)V
    .registers 2

    .line 4
    invoke-direct {p0}, Lcom/google/android/gms/internal/base/zah;-><init>()V

    return-void
.end method


# virtual methods
.method public final getChangingConfigurations()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public final newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 2
    invoke-static {}, Lcom/google/android/gms/internal/base/zag;->zacg()Lcom/google/android/gms/internal/base/zag;

    move-result-object v0

    return-object v0
.end method
