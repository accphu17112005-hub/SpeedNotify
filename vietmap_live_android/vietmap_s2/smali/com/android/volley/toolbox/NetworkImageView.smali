###### Class com.android.volley.toolbox.NetworkImageView (com.android.volley.toolbox.NetworkImageView)
.class public Lcom/android/volley/toolbox/NetworkImageView;
.super Landroid/widget/ImageView;
.source "NetworkImageView.java"


# instance fields
.field private mDefaultImageBitmap:Landroid/graphics/Bitmap;

.field private mDefaultImageDrawable:Landroid/graphics/drawable/Drawable;

.field private mDefaultImageId:I

.field private mErrorImageBitmap:Landroid/graphics/Bitmap;

.field private mErrorImageDrawable:Landroid/graphics/drawable/Drawable;

.field private mErrorImageId:I

.field private mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 77
    invoke-direct {p0, p1, v0}, Lcom/android/volley/toolbox/NetworkImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1, p2, v0}, Lcom/android/volley/toolbox/NetworkImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 85
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/volley/toolbox/NetworkImageView;)I
    .registers 1

    .line 30
    iget p0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageId:I

    return p0
.end method

.method static synthetic access$100(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/drawable/Drawable;
    .registers 1

    .line 30
    iget-object p0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/Bitmap;
    .registers 1

    .line 30
    iget-object p0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/volley/toolbox/NetworkImageView;)I
    .registers 1

    .line 30
    iget p0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageId:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/drawable/Drawable;
    .registers 1

    .line 30
    iget-object p0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/Bitmap;
    .registers 1

    .line 30
    iget-object p0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method private setDefaultImageOrNull()V
    .registers 2

    .line 297
    iget v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageId:I

    if-eqz v0, :cond_8

    .line 298
    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageResource(I)V

    goto :goto_1c

    .line 299
    :cond_8
    iget-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_10

    .line 300
    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1c

    .line 301
    :cond_10
    iget-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_18

    .line 302
    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1c

    :cond_18
    const/4 v0, 0x0

    .line 304
    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_1c
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .line 329
    invoke-super {p0}, Landroid/widget/ImageView;->drawableStateChanged()V

    .line 330
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->invalidate()V

    return-void
.end method

.method loadImageIfNecessary(Z)V
    .registers 10

    .line 196
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->getWidth()I

    move-result v0

    .line 197
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->getHeight()I

    move-result v1

    .line 198
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v7

    .line 201
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2a

    .line 202
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v5, -0x2

    if-ne v2, v5, :cond_1f

    const/4 v2, 0x1

    goto :goto_20

    :cond_1f
    const/4 v2, 0x0

    .line 203
    :goto_20
    invoke-virtual {p0}, Lcom/android/volley/toolbox/NetworkImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    iget v6, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ne v6, v5, :cond_2b

    const/4 v5, 0x1

    goto :goto_2c

    :cond_2a
    const/4 v2, 0x0

    :cond_2b
    const/4 v5, 0x0

    :goto_2c
    if-eqz v2, :cond_31

    if-eqz v5, :cond_31

    goto :goto_32

    :cond_31
    const/4 v3, 0x0

    :goto_32
    if-nez v0, :cond_39

    if-nez v1, :cond_39

    if-nez v3, :cond_39

    return-void

    .line 215
    :cond_39
    iget-object v3, p0, Lcom/android/volley/toolbox/NetworkImageView;->mUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4f

    .line 216
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz p1, :cond_4b

    .line 217
    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    const/4 p1, 0x0

    .line 218
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 220
    :cond_4b
    invoke-direct {p0}, Lcom/android/volley/toolbox/NetworkImageView;->setDefaultImageOrNull()V

    return-void

    .line 225
    :cond_4f
    iget-object v3, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v3, :cond_70

    invoke-virtual {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getRequestUrl()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_70

    .line 226
    iget-object v3, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getRequestUrl()Ljava/lang/String;

    move-result-object v3

    iget-object v6, p0, Lcom/android/volley/toolbox/NetworkImageView;->mUrl:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_68

    return-void

    .line 231
    :cond_68
    iget-object v3, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v3}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 232
    invoke-direct {p0}, Lcom/android/volley/toolbox/NetworkImageView;->setDefaultImageOrNull()V

    :cond_70
    if-eqz v2, :cond_73

    const/4 v0, 0x0

    :cond_73
    if-eqz v5, :cond_77

    const/4 v6, 0x0

    goto :goto_78

    :cond_77
    move v6, v1

    .line 244
    :goto_78
    iget-object v2, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    iget-object v3, p0, Lcom/android/volley/toolbox/NetworkImageView;->mUrl:Ljava/lang/String;

    new-instance v4, Lcom/android/volley/toolbox/NetworkImageView$1;

    invoke-direct {v4, p0, p1}, Lcom/android/volley/toolbox/NetworkImageView$1;-><init>(Lcom/android/volley/toolbox/NetworkImageView;Z)V

    move v5, v0

    .line 245
    invoke-virtual/range {v2 .. v7}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;IILandroid/widget/ImageView$ScaleType;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object p1

    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 316
    iget-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v0, :cond_d

    .line 319
    invoke-virtual {v0}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    const/4 v0, 0x0

    .line 320
    invoke-virtual {p0, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 322
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 324
    :cond_d
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 6

    .line 310
    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    const/4 p1, 0x1

    .line 311
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/NetworkImageView;->loadImageIfNecessary(Z)V

    return-void
.end method

.method public setDefaultImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 3

    const/4 v0, 0x0

    .line 146
    iput v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageId:I

    const/4 v0, 0x0

    .line 147
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageDrawable:Landroid/graphics/drawable/Drawable;

    .line 148
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setDefaultImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    const/4 v0, 0x0

    .line 133
    iput v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageId:I

    const/4 v0, 0x0

    .line 134
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageBitmap:Landroid/graphics/Bitmap;

    .line 135
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setDefaultImageResId(I)V
    .registers 3

    const/4 v0, 0x0

    .line 120
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageBitmap:Landroid/graphics/Bitmap;

    .line 121
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageDrawable:Landroid/graphics/drawable/Drawable;

    .line 122
    iput p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mDefaultImageId:I

    return-void
.end method

.method public setErrorImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 3

    const/4 v0, 0x0

    .line 185
    iput v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageId:I

    const/4 v0, 0x0

    .line 186
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageDrawable:Landroid/graphics/drawable/Drawable;

    .line 187
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setErrorImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    const/4 v0, 0x0

    .line 172
    iput v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageId:I

    const/4 v0, 0x0

    .line 173
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageBitmap:Landroid/graphics/Bitmap;

    .line 174
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setErrorImageResId(I)V
    .registers 3

    const/4 v0, 0x0

    .line 159
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageBitmap:Landroid/graphics/Bitmap;

    .line 160
    iput-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageDrawable:Landroid/graphics/drawable/Drawable;

    .line 161
    iput p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mErrorImageId:I

    return-void
.end method

.method public setImageUrl(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader;)V
    .registers 3

    .line 105
    invoke-static {}, Lcom/android/volley/toolbox/Threads;->throwIfNotOnMainThread()V

    .line 106
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView;->mUrl:Ljava/lang/String;

    .line 107
    iput-object p2, p0, Lcom/android/volley/toolbox/NetworkImageView;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    const/4 p1, 0x0

    .line 109
    invoke-virtual {p0, p1}, Lcom/android/volley/toolbox/NetworkImageView;->loadImageIfNecessary(Z)V

    return-void
.end method

###### Class com.android.volley.toolbox.NetworkImageView.AnonymousClass1 (com.android.volley.toolbox.NetworkImageView$1)
.class Lcom/android/volley/toolbox/NetworkImageView$1;
.super Ljava/lang/Object;
.source "NetworkImageView.java"

# interfaces
.implements Lcom/android/volley/toolbox/ImageLoader$ImageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/NetworkImageView;->loadImageIfNecessary(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/volley/toolbox/NetworkImageView;

.field final synthetic val$isInLayoutPass:Z


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/NetworkImageView;Z)V
    .registers 3

    .line 247
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    iput-boolean p2, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->val$isInLayoutPass:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .registers 3

    .line 250
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$000(Lcom/android/volley/toolbox/NetworkImageView;)I

    move-result p1

    if-eqz p1, :cond_12

    .line 251
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$000(Lcom/android/volley/toolbox/NetworkImageView;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageResource(I)V

    goto :goto_35

    .line 252
    :cond_12
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$100(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_24

    .line 253
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$100(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_35

    .line 254
    :cond_24
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$200(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_35

    .line 255
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$200(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/volley/toolbox/NetworkImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_35
    :goto_35
    return-void
.end method

.method public onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V
    .registers 4

    if-eqz p2, :cond_11

    .line 269
    iget-boolean p2, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->val$isInLayoutPass:Z

    if-eqz p2, :cond_11

    .line 270
    iget-object p2, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    new-instance v0, Lcom/android/volley/toolbox/NetworkImageView$1$1;

    invoke-direct {v0, p0, p1}, Lcom/android/volley/toolbox/NetworkImageView$1$1;-><init>(Lcom/android/volley/toolbox/NetworkImageView$1;Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)V

    invoke-virtual {p2, v0}, Lcom/android/volley/toolbox/NetworkImageView;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 280
    :cond_11
    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    if-eqz p2, :cond_21

    .line 281
    iget-object p2, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-virtual {p1}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/android/volley/toolbox/NetworkImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_56

    .line 282
    :cond_21
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$300(Lcom/android/volley/toolbox/NetworkImageView;)I

    move-result p1

    if-eqz p1, :cond_33

    .line 283
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$300(Lcom/android/volley/toolbox/NetworkImageView;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/android/volley/toolbox/NetworkImageView;->setImageResource(I)V

    goto :goto_56

    .line 284
    :cond_33
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$400(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_45

    .line 285
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$400(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/volley/toolbox/NetworkImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_56

    .line 286
    :cond_45
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$500(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_56

    .line 287
    iget-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1;->this$0:Lcom/android/volley/toolbox/NetworkImageView;

    invoke-static {p1}, Lcom/android/volley/toolbox/NetworkImageView;->access$500(Lcom/android/volley/toolbox/NetworkImageView;)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/volley/toolbox/NetworkImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_56
    :goto_56
    return-void
.end method

###### Class com.android.volley.toolbox.NetworkImageView.AnonymousClass1.RunnableC00061 (com.android.volley.toolbox.NetworkImageView$1$1)
.class Lcom/android/volley/toolbox/NetworkImageView$1$1;
.super Ljava/lang/Object;
.source "NetworkImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/volley/toolbox/NetworkImageView$1;->onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/volley/toolbox/NetworkImageView$1;

.field final synthetic val$response:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;


# direct methods
.method constructor <init>(Lcom/android/volley/toolbox/NetworkImageView$1;Lcom/android/volley/toolbox/ImageLoader$ImageContainer;)V
    .registers 3

    .line 271
    iput-object p1, p0, Lcom/android/volley/toolbox/NetworkImageView$1$1;->this$1:Lcom/android/volley/toolbox/NetworkImageView$1;

    iput-object p2, p0, Lcom/android/volley/toolbox/NetworkImageView$1$1;->val$response:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 274
    iget-object v0, p0, Lcom/android/volley/toolbox/NetworkImageView$1$1;->this$1:Lcom/android/volley/toolbox/NetworkImageView$1;

    iget-object v1, p0, Lcom/android/volley/toolbox/NetworkImageView$1$1;->val$response:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/volley/toolbox/NetworkImageView$1;->onResponse(Lcom/android/volley/toolbox/ImageLoader$ImageContainer;Z)V

    return-void
.end method
