###### Class com.navngo.igo.javaclient.view.GLMapView (com.navngo.igo.javaclient.view.GLMapView)
.class public Lcom/navngo/igo/javaclient/view/GLMapView;
.super Landroid/view/SurfaceView;
.source "GLMapView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback2;
.implements Lcom/navngo/igo/javaclient/view/IMapView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;,
        Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;,
        Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;
    }
.end annotation


# static fields
.field private static final attribsToQuery:[I

.field private static final attribsToQueryNames:[Ljava/lang/String;

.field private static final bDrawTest:Z = false

.field private static final logname:Ljava/lang/String; = "GLMapView"


# instance fields
.field private frameCount:I

.field protected mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

.field private mOffscreenPresentListener:Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

.field private mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;


# direct methods
.method static constructor <clinit>()V
    .registers 22

    const/16 v0, 0x15

    new-array v0, v0, [I

    .line 69
    fill-array-data v0, :array_3a

    sput-object v0, Lcom/navngo/igo/javaclient/view/GLMapView;->attribsToQuery:[I

    const-string v1, "EGL_RENDER_BUFFER"

    const-string v2, "EGL_LEVEL"

    const-string v3, "EGL_SURFACE_TYPE"

    const-string v4, "EGL_RED_SIZE"

    const-string v5, "EGL_GREEN_SIZE"

    const-string v6, "EGL_BLUE_SIZE"

    const-string v7, "EGL_ALPHA_SIZE"

    const-string v8, "EGL_BUFFER_SIZE"

    const-string v9, "EGL_CONFIG_CAVEAT"

    const-string v10, "EGL_CONFIG_ID"

    const-string v11, "EGL_DEPTH_SIZE"

    const-string v12, "EGL_NATIVE_RENDERABLE"

    const-string v13, "EGL_NATIVE_VISUAL_TYPE"

    const-string v14, "EGL_SAMPLE_BUFFERS"

    const-string v15, "EGL_SAMPLES"

    const-string v16, "EGL_STENCIL_SIZE"

    const-string v17, "EGL_RENDERABLE_TYPE"

    const-string v18, "EGL_TRANSPARENT_TYPE"

    const-string v19, "EGL_TRANSPARENT_RED_VALUE"

    const-string v20, "EGL_TRANSPARENT_GREEN_VALUE"

    const-string v21, "EGL_TRANSPARENT_BLUE_VALUE"

    .line 98
    filled-new-array/range {v1 .. v21}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/navngo/igo/javaclient/view/GLMapView;->attribsToQueryNames:[Ljava/lang/String;

    return-void

    :array_3a
    .array-data 4
        0x3086
        0x3029
        0x3033
        0x3024
        0x3023
        0x3022
        0x3021
        0x3020
        0x3027
        0x3028
        0x3025
        0x302d
        0x302f
        0x3032
        0x3031
        0x3026
        0x3040
        0x3034
        0x3037
        0x3036
        0x3035
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 197
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 128
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->frameCount:I

    const/4 p1, 0x0

    .line 129
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mOffscreenPresentListener:Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

    .line 198
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 192
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 128
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->frameCount:I

    const/4 p1, 0x0

    .line 129
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mOffscreenPresentListener:Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

    .line 193
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->init()V

    return-void
.end method

.method private static native GrabSurfaceFast(ILjava/nio/ByteBuffer;)Z
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/view/GLMapView;)Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;
    .registers 1

    .line 37
    iget-object p0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mOffscreenPresentListener:Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

    return-object p0
.end method

.method static synthetic access$100(ILjava/nio/ByteBuffer;)Z
    .registers 2

    .line 37
    invoke-static {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView;->GrabSurfaceFast(ILjava/nio/ByteBuffer;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200()[I
    .registers 1

    .line 37
    sget-object v0, Lcom/navngo/igo/javaclient/view/GLMapView;->attribsToQuery:[I

    return-object v0
.end method

.method static synthetic access$300()[Ljava/lang/String;
    .registers 1

    .line 37
    sget-object v0, Lcom/navngo/igo/javaclient/view/GLMapView;->attribsToQueryNames:[Ljava/lang/String;

    return-object v0
.end method

.method private declared-synchronized init()V
    .registers 2

    monitor-enter p0

    .line 338
    :try_start_1
    new-instance v0, Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/view/CommonMapView;-><init>(Lcom/navngo/igo/javaclient/view/IMapView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    .line 339
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->init()V

    .line 340
    new-instance v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;-><init>(Lcom/navngo/igo/javaclient/view/GLMapView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    .line 341
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1b

    .line 342
    monitor-exit p0

    return-void

    :catchall_1b
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public BeginPaint()Z
    .registers 4

    .line 243
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    const-string v1, "GLMapView"

    const/4 v2, 0x0

    if-nez v0, :cond_d

    const-string v0, "No renderer present"

    .line 244
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 247
    :cond_d
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->hasValidSurface()Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "BeginPaint inactive/invalid"

    .line 249
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 253
    :cond_19
    :try_start_19
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->my_beginPaint()Z

    move-result v0
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_19 .. :try_end_1f} :catch_20

    return v0

    :catch_20
    return v2
.end method

.method public EndPaint()V
    .registers 5

    const-string v0, "GLMapView"

    .line 263
    :try_start_2
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    if-nez v1, :cond_c

    const-string v1, "No renderer present"

    .line 265
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 268
    :cond_c
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->hasValidSurface()Z

    move-result v1

    if-nez v1, :cond_18

    const-string v1, "EndPaint inactive/invalid"

    .line 270
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 273
    :cond_18
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->my_endPaint()V

    .line 274
    iget v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->frameCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->frameCount:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_43

    .line 276
    invoke-static {}, Lcom/navngo/igo/javaclient/NNG;->SendFirstFrameEvent()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_29} :catch_2a

    goto :goto_43

    :catch_2a
    move-exception v1

    .line 280
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception in GLMapView.EndPaint: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_43
    :goto_43
    return-void
.end method

.method public OpenGL_ChangeHWDisplay(I)V
    .registers 3

    .line 311
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    if-nez v0, :cond_5

    return-void

    .line 314
    :cond_5
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->changeHWDisplay(I)V

    return-void
.end method

.method public OpenGL_CreateBuffers()Z
    .registers 4

    const-string v0, "GLMapView"

    const-string v1, "OpenGL_CreateBuffers"

    .line 226
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    const/4 v2, 0x0

    if-nez v1, :cond_d

    return v2

    .line 229
    :cond_d
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->hasValidSurface()Z

    move-result v1

    if-nez v1, :cond_19

    const-string v1, "createContext failed - there is no valid surface"

    .line 231
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 235
    :cond_19
    :try_start_19
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->createContext()Z

    move-result v0
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_19 .. :try_end_1f} :catch_20

    return v0

    :catch_20
    return v2
.end method

.method public OpenGL_CreateSurface(IIIZI)Z
    .registers 14

    const-string v0, "GLMapView"

    const-string v1, "OpenGL_CreateSurface"

    .line 294
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    if-nez v2, :cond_d

    const/4 p1, 0x0

    return p1

    :cond_d
    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    .line 298
    invoke-virtual/range {v2 .. v7}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->createSurface(IIIZI)Z

    move-result p1

    return p1
.end method

.method public OpenGL_DeleteBuffers()Z
    .registers 3

    const-string v0, "GLMapView"

    const-string v1, "OpenGL_DeleteBuffers"

    .line 285
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    const/4 v1, 0x0

    if-nez v0, :cond_d

    return v1

    .line 288
    :cond_d
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->deinitGL()V

    .line 289
    iput v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->frameCount:I

    const/4 v0, 0x1

    return v0
.end method

.method public OpenGL_DeleteSurface(I)V
    .registers 4

    const-string v0, "GLMapView"

    const-string v1, "OpenGL_DeleteSurface"

    .line 302
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    if-nez v0, :cond_c

    return-void

    .line 306
    :cond_c
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->deleteSurface(I)V

    return-void
.end method

.method public OpenGL_SwapBuffers(I)V
    .registers 3

    .line 319
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    if-nez v0, :cond_5

    return-void

    .line 322
    :cond_5
    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->swapBuffers(I)V

    return-void
.end method

.method public asView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public findFocus()Landroid/view/View;
    .registers 2

    .line 1008
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->findFocus()V

    .line 1009
    invoke-super {p0}, Landroid/view/SurfaceView;->findFocus()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getCommonInterface()Lcom/navngo/igo/javaclient/view/CommonMapView;
    .registers 2

    .line 137
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    return-object v0
.end method

.method public get_Height()I
    .registers 2

    .line 1003
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->getHeight()I

    move-result v0

    return v0
.end method

.method public get_Width()I
    .registers 2

    .line 999
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView;->getWidth()I

    move-result v0

    return v0
.end method

.method public hasValidSurface()Z
    .registers 3

    .line 327
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 329
    :cond_6
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->hasValidSurface()Z

    move-result v0

    if-nez v0, :cond_f

    return v1

    .line 331
    :cond_f
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/view/CommonMapView;->paintTaskActive:Z

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    return v0

    :cond_17
    return v1
.end method

.method public mapMousePoints(FF)Landroid/graphics/PointF;
    .registers 4

    .line 995
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method protected declared-synchronized onDetachedFromWindow()V
    .registers 2

    monitor-enter p0

    .line 363
    :try_start_1
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    .line 364
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onDetachedFromWindow()V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 365
    monitor-exit p0

    return-void

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 381
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 373
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onPaintCallback(IIIIII)V
    .registers 7

    const-string p1, "GLMapView"

    const-string p2, "onPaintCallback: should not be called"

    .line 204
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPause()V
    .registers 2

    const/4 v0, 0x0

    .line 346
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/view/GLMapView;->onPause(I)V

    return-void
.end method

.method public onPause(I)V
    .registers 3

    const-string p1, "GLMapView"

    const-string v0, "onPause"

    .line 349
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onResume()V
    .registers 2

    const/4 v0, 0x0

    .line 354
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/view/GLMapView;->onResume(I)V

    return-void
.end method

.method public onResume(I)V
    .registers 3

    const-string p1, "GLMapView"

    const-string v0, "onResume"

    .line 357
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 368
    invoke-super {p0, p1}, Landroid/view/SurfaceView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 369
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setOffscreenPresentListener(Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;)V
    .registers 2

    .line 132
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mOffscreenPresentListener:Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

    return-void
.end method

.method public superonKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 385
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public superonKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 377
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public surfaceChanged(IIII)V
    .registers 6

    .line 165
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    invoke-virtual {v0, p1, p3, p4}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->surfaceChanged(III)V

    .line 166
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/navngo/igo/javaclient/view/CommonMapView;->surfaceChanged(IIII)V

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .registers 5

    const/4 p1, 0x0

    .line 161
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/navngo/igo/javaclient/view/GLMapView;->surfaceChanged(IIII)V

    return-void
.end method

.method public surfaceCreated(Landroid/view/Surface;I)V
    .registers 4

    .line 155
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->surfaceCreated(Landroid/view/Surface;I)V

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .registers 3

    .line 150
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/navngo/igo/javaclient/view/GLMapView;->surfaceCreated(Landroid/view/Surface;I)V

    return-void
.end method

.method public surfaceDestroyed(I)V
    .registers 3

    .line 177
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->surfaceDestroyed(I)V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .registers 2

    const/4 p1, 0x0

    .line 172
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView;->surfaceDestroyed(I)V

    return-void
.end method

.method public surfaceRedrawNeeded(Landroid/view/SurfaceHolder;)V
    .registers 2

    return-void
.end method

.method public surfaceRedrawNeededAsync(Landroid/view/SurfaceHolder;Ljava/lang/Runnable;)V
    .registers 3

    .line 188
    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView;->mRenderer:Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->surfaceRedrawNeededAsync(Ljava/lang/Runnable;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.view.GLMapView.EGLSurfaceData (com.navngo.igo.javaclient.view.GLMapView$EGLSurfaceData)
.class public Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;
.super Ljava/lang/Object;
.source "GLMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/view/GLMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EGLSurfaceData"
.end annotation


# instance fields
.field public mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field public mHeight:I

.field public mNativeSurfaceID:I

.field public mOnScreen:Z

.field public mScreenBuffer:Ljava/nio/ByteBuffer;

.field public mWidth:I


# direct methods
.method constructor <init>(IIZLjavax/microedition/khronos/egl/EGLSurface;I)V
    .registers 6

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mWidth:I

    .line 48
    iput p2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mHeight:I

    .line 49
    iput-boolean p3, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mOnScreen:Z

    .line 50
    iput-object p4, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 51
    iput p5, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mNativeSurfaceID:I

    if-eqz p3, :cond_13

    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mScreenBuffer:Ljava/nio/ByteBuffer;

    goto :goto_24

    :cond_13
    mul-int p1, p1, p2

    mul-int/lit8 p1, p1, 0x4

    .line 55
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mScreenBuffer:Ljava/nio/ByteBuffer;

    .line 56
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    :goto_24
    return-void
.end method

###### Class com.navngo.igo.javaclient.view.GLMapView.OffscreenPresentListener (com.navngo.igo.javaclient.view.GLMapView$OffscreenPresentListener)
.class public interface abstract Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;
.super Ljava/lang/Object;
.source "GLMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/view/GLMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OffscreenPresentListener"
.end annotation


# virtual methods
.method public abstract onEndPaint(ILcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V
.end method

###### Class com.navngo.igo.javaclient.view.GLMapView.Renderer (com.navngo.igo.javaclient.view.GLMapView$Renderer)
.class Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;
.super Ljava/lang/Object;
.source "GLMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/view/GLMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Renderer"
.end annotation


# static fields
.field private static final EGL_CONTEXT_CLIENT_VERSION:I = 0x3098

.field private static final EGL_RECORDABLE_ANDROID:I = 0x3142

.field private static final INVALID_SURFACE_ID:I = -0x1

.field private static final logname:Ljava/lang/String; = "GLMapView.Renderer"


# instance fields
.field private egl:Ljavax/microedition/khronos/egl/EGL10;

.field private eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field private eglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field private eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field private gl:Ljavax/microedition/khronos/opengles/GL10;

.field private inited:Z

.field private mColorArray:Ljava/nio/ByteBuffer;

.field private mCurrentSurfaceID:I

.field private mDrawingFinishedRunnable:Ljava/lang/Runnable;

.field private mRotation:I

.field private mSurfaceMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;",
            ">;"
        }
    .end annotation
.end field

.field private mTestInited:Z

.field private mVertexArray:Ljava/nio/ShortBuffer;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/view/GLMapView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/view/GLMapView;)V
    .registers 3

    .line 405
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 394
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->inited:Z

    const/4 v0, 0x0

    .line 400
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    .line 402
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mDrawingFinishedRunnable:Ljava/lang/Runnable;

    .line 897
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mTestInited:Z

    .line 898
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mRotation:I

    .line 406
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    const/4 p1, -0x1

    .line 407
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mCurrentSurfaceID:I

    return-void
.end method

.method private EGL_Error()V
    .registers 4

    .line 502
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-ne v0, v1, :cond_b

    return-void

    :cond_b
    packed-switch v0, :pswitch_data_4c

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 525
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "unknown EGL error:0x%x"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_45

    :pswitch_1f
    const-string v0, "EGL_BAD_SURFACE"

    goto :goto_45

    :pswitch_22
    const-string v0, "EGL_BAD_PARAMETER"

    goto :goto_45

    :pswitch_25
    const-string v0, "EGL_BAD_NATIVE_WINDOW"

    goto :goto_45

    :pswitch_28
    const-string v0, "EGL_BAD_NATIVE_PIXMAP"

    goto :goto_45

    :pswitch_2b
    const-string v0, "EGL_BAD_MATCH"

    goto :goto_45

    :pswitch_2e
    const-string v0, "EGL_BAD_DISPLAY"

    goto :goto_45

    :pswitch_31
    const-string v0, "EGL_BAD_CURRENT_SURFACE"

    goto :goto_45

    :pswitch_34
    const-string v0, "EGL_BAD_CONTEXT"

    goto :goto_45

    :pswitch_37
    const-string v0, "EGL_BAD_CONFIG"

    goto :goto_45

    :pswitch_3a
    const-string v0, "EGL_BAD_ATTRIBUTE"

    goto :goto_45

    :pswitch_3d
    const-string v0, "EGL_BAD_ALLOC"

    goto :goto_45

    :pswitch_40
    const-string v0, "EGL_BAD_ACCESS"

    goto :goto_45

    :pswitch_43
    const-string v0, "EGL_NOT_INITIALIZED"

    :goto_45
    const-string v1, "GLMapView.Renderer"

    .line 527
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_4c
    .packed-switch 0x3001
        :pswitch_43
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_28
        :pswitch_25
        :pswitch_22
        :pswitch_1f
    .end packed-switch
.end method

.method private FixedFromInt(I)I
    .registers 2

    shl-int/lit8 p1, p1, 0x10

    return p1
.end method

.method private GL_Error()V
    .registers 4

    .line 486
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/opengles/GL10;->glGetError()I

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    packed-switch v0, :pswitch_data_2c

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 496
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "GL error code: 0x%x"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_25

    :pswitch_1d
    const-string v0, "GL_INVALID_OPERATION"

    goto :goto_25

    :pswitch_20
    const-string v0, "GL_INVALID_VALUE"

    goto :goto_25

    :pswitch_23
    const-string v0, "GL_INVALID_ENUM"

    :goto_25
    const-string v1, "GLMapView.Renderer"

    .line 498
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x500
        :pswitch_23
        :pswitch_20
        :pswitch_1d
    .end packed-switch
.end method

.method private deinitTest()V
    .registers 1

    return-void
.end method

.method private drawTest(Ljavax/microedition/khronos/opengles/GL10;)V
    .registers 2

    return-void
.end method

.method private dumpGLInfo(Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V
    .registers 10

    .line 807
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initGl D "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " S "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " C "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "GLMapView.Renderer"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initGL: VENDOR = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v2, 0x1f00

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initGL: RENDERER = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v2, 0x1f01

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 811
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initGL: VERSION = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v2, 0x1f02

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initGL: EXTENSIONS = "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v2, 0x1f03

    invoke-interface {v1, v2}, Ljavax/microedition/khronos/opengles/GL10;->glGetString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 813
    invoke-static {p1}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v1

    .line 814
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v3, 0xd52

    invoke-interface {v2, v3, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "initGL: RED_BITS = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 815
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v4, 0xd53

    invoke-interface {v2, v4, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initGL: GREEN_BITS = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 816
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v4, 0xd54

    invoke-interface {v2, v4, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initGL: BLUE_BITS = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v4, 0xd55

    invoke-interface {v2, v4, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initGL: ALPHA_BITS = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 818
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v4, 0xd56

    invoke-interface {v2, v4, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initGL: DEPTH_BITS = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 819
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    const/16 v4, 0xd57

    invoke-interface {v2, v4, v1}, Ljavax/microedition/khronos/opengles/GL10;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "initGL: STENCIL_BITS = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/nio/IntBuffer;->get(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    invoke-static {}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$200()[I

    move-result-object v1

    array-length v1, v1

    :goto_161
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_1bd

    .line 822
    invoke-static {}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$200()[I

    move-result-object v1

    aget v1, v1, v2

    new-array v4, p1, [I

    .line 824
    iget-object v5, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v6, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v7, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v5, v6, v7, v1, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v1

    const-string v5, "initGL: "

    if-eqz v1, :cond_19e

    .line 825
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$300()[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " = "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v4, v4, v3

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1bb

    .line 827
    :cond_19e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$300()[Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v2

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " N/A "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1bb
    move v1, v2

    goto :goto_161

    :cond_1bd
    return-void
.end method

.method private initGL()Z
    .registers 32

    move-object/from16 v0, p0

    const-string v1, "GLMapView.Renderer"

    const-string v2, "initGL"

    .line 674
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    iget-boolean v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->inited:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_f

    return v3

    .line 678
    :cond_f
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v2

    check-cast v2, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    .line 679
    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v2, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v2

    iput-object v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 680
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    .line 681
    iget-object v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-virtual {v2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_33

    const-string v2, "initGL: eglGetDisplay returned EGL_NO_DISPLAY!"

    .line 682
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v4

    :cond_33
    const/4 v2, 0x2

    new-array v5, v2, [I

    .line 687
    iget-object v6, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v7, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v6, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    .line 688
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    .line 689
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "EGL: ver = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v7, v5, v4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v5, v5, v3

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "android"

    const-string v6, "egl_recordable"

    .line 691
    invoke-static {v5, v6, v4}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_6c

    const/4 v6, 0x1

    goto :goto_6d

    :cond_6c
    const/4 v6, -0x1

    :goto_6d
    const/4 v7, 0x5

    const/4 v8, 0x4

    if-eqz v5, :cond_73

    const/4 v5, 0x5

    goto :goto_74

    :cond_73
    const/4 v5, 0x4

    :goto_74
    const-string v9, "rawdisplay"

    const-string v10, "subsamples"

    .line 697
    invoke-static {v9, v10, v8}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v9

    const-string v10, "rawdisplay"

    const-string v11, "alpha_size"

    .line 698
    invoke-static {v10, v11, v4}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v10

    if-lez v10, :cond_90

    .line 700
    iget-object v11, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-virtual {v11}, Lcom/navngo/igo/javaclient/view/GLMapView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v11

    const/4 v12, -0x3

    invoke-interface {v11, v12}, Landroid/view/SurfaceHolder;->setFormat(I)V

    :cond_90
    new-array v11, v8, [[I

    const/16 v12, 0x17

    new-array v12, v12, [I

    const/16 v13, 0x3025

    aput v13, v12, v4

    const/16 v14, 0x10

    aput v14, v12, v3

    const/16 v15, 0x3033

    aput v15, v12, v2

    const/4 v2, 0x3

    aput v5, v12, v2

    const/16 v17, 0x3032

    aput v17, v12, v8

    if-eqz v9, :cond_ae

    const/16 v17, 0x1

    goto :goto_b0

    :cond_ae
    const/16 v17, 0x0

    :goto_b0
    aput v17, v12, v7

    const/16 v17, 0x3031

    const/16 v18, 0x6

    aput v17, v12, v18

    const/16 v17, 0x7

    aput v9, v12, v17

    const/16 v19, 0x8

    const/16 v20, 0x3024

    aput v20, v12, v19

    const/16 v21, 0x9

    aput v19, v12, v21

    const/16 v22, 0xa

    const/16 v23, 0x3023

    aput v23, v12, v22

    const/16 v24, 0xb

    aput v19, v12, v24

    const/16 v25, 0xc

    const/16 v26, 0x3022

    aput v26, v12, v25

    const/16 v27, 0xd

    aput v19, v12, v27

    const/16 v28, 0x3021

    const/16 v29, 0xe

    aput v28, v12, v29

    const/16 v28, 0xf

    aput v10, v12, v28

    const/16 v28, 0x3026

    aput v28, v12, v14

    const/16 v28, 0x11

    aput v19, v12, v28

    const/16 v28, 0x12

    const/16 v30, 0x3040

    aput v30, v12, v28

    const/16 v28, 0x13

    aput v8, v12, v28

    const/16 v28, 0x14

    const/16 v30, 0x3142

    aput v30, v12, v28

    const/16 v28, 0x15

    aput v6, v12, v28

    const/16 v28, 0x16

    const/16 v30, 0x3038

    aput v30, v12, v28

    aput-object v12, v11, v4

    const/16 v12, 0x13

    new-array v12, v12, [I

    aput v13, v12, v4

    aput v14, v12, v3

    const/16 v16, 0x2

    aput v15, v12, v16

    aput v5, v12, v2

    aput v20, v12, v8

    aput v19, v12, v7

    aput v23, v12, v18

    aput v19, v12, v17

    aput v26, v12, v19

    aput v19, v12, v21

    const/16 v28, 0x3021

    aput v28, v12, v22

    aput v10, v12, v24

    const/16 v28, 0x3026

    aput v28, v12, v25

    aput v19, v12, v27

    const/16 v28, 0x3040

    aput v28, v12, v29

    const/16 v28, 0xf

    aput v8, v12, v28

    const/16 v28, 0x3142

    aput v28, v12, v14

    const/16 v28, 0x11

    aput v6, v12, v28

    const/16 v28, 0x12

    aput v30, v12, v28

    aput-object v12, v11, v3

    const/16 v12, 0x15

    new-array v12, v12, [I

    aput v13, v12, v4

    aput v14, v12, v3

    const/16 v16, 0x2

    aput v15, v12, v16

    aput v5, v12, v2

    const/16 v28, 0x3032

    aput v28, v12, v8

    if-eqz v9, :cond_15b

    const/16 v28, 0x1

    goto :goto_15d

    :cond_15b
    const/16 v28, 0x0

    :goto_15d
    aput v28, v12, v7

    const/16 v28, 0x3031

    aput v28, v12, v18

    aput v9, v12, v17

    aput v20, v12, v19

    aput v8, v12, v21

    aput v23, v12, v22

    aput v8, v12, v24

    aput v26, v12, v25

    aput v8, v12, v27

    const/16 v9, 0x3021

    aput v9, v12, v29

    const/16 v9, 0xf

    aput v10, v12, v9

    const/16 v9, 0x3040

    aput v9, v12, v14

    const/16 v9, 0x11

    aput v8, v12, v9

    const/16 v9, 0x12

    const/16 v28, 0x3142

    aput v28, v12, v9

    const/16 v9, 0x13

    aput v6, v12, v9

    const/16 v9, 0x14

    const/16 v28, 0x3038

    aput v28, v12, v9

    const/4 v9, 0x2

    aput-object v12, v11, v9

    const/16 v12, 0x11

    new-array v12, v12, [I

    aput v13, v12, v4

    aput v14, v12, v3

    aput v15, v12, v9

    aput v5, v12, v2

    aput v20, v12, v8

    aput v8, v12, v7

    aput v23, v12, v18

    aput v8, v12, v17

    aput v26, v12, v19

    aput v8, v12, v21

    const/16 v5, 0x3021

    aput v5, v12, v22

    aput v10, v12, v24

    const/16 v5, 0x3040

    aput v5, v12, v25

    aput v8, v12, v27

    const/16 v5, 0x3142

    aput v5, v12, v29

    const/16 v5, 0xf

    aput v6, v12, v5

    const/16 v5, 0x3038

    aput v5, v12, v14

    aput-object v12, v11, v2

    const/16 v5, 0x64

    new-array v5, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    new-array v6, v3, [I

    const/4 v7, 0x0

    const/4 v9, 0x0

    :goto_1ce
    if-nez v7, :cond_1f8

    if-ge v9, v8, :cond_1f8

    .line 761
    aget-object v10, v11, v9

    invoke-direct {v0, v10, v5, v6}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->tryGetEGLConfig([I[Ljavax/microedition/khronos/egl/EGLConfig;[I)Z

    move-result v10

    if-eqz v10, :cond_1dc

    const/4 v7, 0x1

    goto :goto_1f5

    .line 767
    :cond_1dc
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "No proper EGL config present! (ConfigSet "

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ")"

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v1, v10}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1f5
    add-int/lit8 v9, v9, 0x1

    goto :goto_1ce

    :cond_1f8
    if-nez v7, :cond_200

    const-string v2, "No proper EGL config present!"

    .line 773
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v4

    :cond_200
    new-array v2, v2, [I

    .line 777
    fill-array-data v2, :array_24c

    const/4 v7, 0x0

    :goto_206
    aget v8, v6, v4

    if-ge v7, v8, :cond_22b

    .line 785
    aget-object v8, v5, v7

    iput-object v8, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 786
    iget-object v9, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v10, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v11, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v9, v10, v8, v11, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v8

    iput-object v8, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 787
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    .line 789
    iget-object v8, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v9, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_228

    goto :goto_22b

    :cond_228
    add-int/lit8 v7, v7, 0x1

    goto :goto_206

    .line 794
    :cond_22b
    :goto_22b
    iget-object v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v5, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v2, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23b

    const-string v2, "initGL: eglCreateContext returned EGL_NO_CONTEXT!"

    .line 795
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v4

    .line 798
    :cond_23b
    iget-object v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v1}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v1

    check-cast v1, Ljavax/microedition/khronos/opengles/GL10;

    iput-object v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    .line 799
    invoke-direct/range {p0 .. p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    .line 801
    iput-boolean v3, v0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->inited:Z

    return v3

    nop

    :array_24c
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method private initTest(Ljavax/microedition/khronos/opengles/GL10;)V
    .registers 2

    .line 903
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mTestInited:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    .line 905
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mTestInited:Z

    return-void
.end method

.method private makeCurrentGL(Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V
    .registers 6

    .line 833
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->inited:Z

    if-nez v0, :cond_c

    const-string p1, "GLMapView.Renderer"

    const-string v0, "makecurrent called without an initGL"

    .line 835
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 839
    :cond_c
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p1, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, p1, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 840
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    return-void
.end method

.method private tryGetEGLConfig([I[Ljavax/microedition/khronos/egl/EGLConfig;[I)Z
    .registers 10

    .line 532
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    array-length v4, p2

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-interface/range {v0 .. v5}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p1

    const-string p2, "GLMapView.Renderer"

    const/4 v0, 0x0

    if-nez p1, :cond_17

    const-string p1, "initGL: No config present."

    .line 534
    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 539
    :cond_17
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initGL:"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v1, p3, v0

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " config(s) present."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 540
    aget p1, p3, v0

    if-gtz p1, :cond_37

    return v0

    :cond_37
    const/4 p1, 0x1

    return p1
.end method

.method private tryInitGL()Z
    .registers 4

    const-string v0, "GLMapView.Renderer"

    const-string v1, "tryInitGL:"

    .line 445
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 447
    :try_start_7
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->initGL()Z

    move-result v1

    if-eqz v1, :cond_1d

    const-string v1, "tryInitGL succeed."

    .line 449
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_12} :catch_14

    const/4 v0, 0x1

    return v0

    :catch_14
    move-exception v1

    const-string v2, "Exception during initGL:"

    .line 453
    invoke-static {v0, v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 454
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1d
    const-string v1, "tryInitGL failed."

    .line 457
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->deinitGL()V

    const-string v1, "tryInitGL END"

    .line 459
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method changeHWDisplay(I)V
    .registers 4

    .line 599
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->getEGLSurfaceData(I)Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    move-result-object v0

    if-eqz v0, :cond_19

    .line 600
    iget-object v1, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v1, :cond_19

    .line 601
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->makeCurrentGL(Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V

    .line 602
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mCurrentSurfaceID:I

    .line 603
    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    iget v0, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mNativeSurfaceID:I

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->setActiveDisplayId(I)V

    goto :goto_2f

    .line 605
    :cond_19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "changeHWDisplay: no surface with ID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "GLMapView.Renderer"

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2f
    return-void
.end method

.method public createContext()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const-string v0, "GLMapView.Renderer"

    const-string v1, "createContext BEGIN"

    .line 427
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    if-nez v0, :cond_13

    .line 433
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    .line 435
    :cond_13
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->tryInitGL()Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v0, 0x0

    return v0

    .line 438
    :cond_1b
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->initTest(Ljavax/microedition/khronos/opengles/GL10;)V

    const/4 v0, 0x1

    return v0
.end method

.method createSurface(IIIZI)Z
    .registers 16

    .line 550
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createSurface: id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " onscreen="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GLMapView.Renderer"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 551
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->getEGLSurfaceData(I)Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_4f

    .line 552
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "createSurface: surface with id="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " already exists!"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_4f
    const/4 v0, 0x1

    if-eqz p4, :cond_68

    .line 558
    iget-object v3, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    iget-object v6, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    iget-object v6, v6, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v6, p5}, Lcom/navngo/igo/javaclient/view/CommonMapView;->getSurfaceData(I)Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    move-result-object v6

    iget-object v6, v6, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mSurface:Landroid/view/Surface;

    const/4 v7, 0x0

    invoke-interface {v3, v4, v5, v6, v7}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateWindowSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    goto :goto_88

    :cond_68
    const/4 v3, 0x5

    new-array v3, v3, [I

    const/16 v4, 0x3057

    aput v4, v3, v2

    aput p2, v3, v0

    const/4 v4, 0x2

    const/16 v5, 0x3056

    aput v5, v3, v4

    const/4 v4, 0x3

    aput p3, v3, v4

    const/4 v4, 0x4

    const/16 v5, 0x3038

    aput v5, v3, v4

    .line 565
    iget-object v4, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v5, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v6, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v4, v5, v6, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v3

    :goto_88
    move-object v8, v3

    .line 567
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    .line 569
    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-virtual {v8, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9a

    const-string p1, "createSurface: eglCreateWindowSurface returned EGL_NO_SURFACE!"

    .line 570
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 574
    :cond_9a
    new-instance v1, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    move-object v4, v1

    move v5, p2

    move v6, p3

    move v7, p4

    move v9, p5

    invoke-direct/range {v4 .. v9}, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;-><init>(IIZLjavax/microedition/khronos/egl/EGLSurface;I)V

    .line 576
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    move-result p2

    if-nez p2, :cond_bb

    .line 577
    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->makeCurrentGL(Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V

    .line 578
    iput p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mCurrentSurfaceID:I

    .line 579
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    iget-object p2, p2, Lcom/navngo/igo/javaclient/view/GLMapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {p2, p5}, Lcom/navngo/igo/javaclient/view/CommonMapView;->setActiveDisplayId(I)V

    .line 580
    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->dumpGLInfo(Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V

    .line 583
    :cond_bb
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    invoke-virtual {p2, p1, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    return v0
.end method

.method public deinitGL()V
    .registers 5

    const-string v0, "GLMapView.Renderer"

    const-string v1, "deinitGL"

    .line 873
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->deinitTest()V

    const/4 v1, 0x0

    .line 875
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->inited:Z

    .line 877
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v1, :cond_45

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_45

    .line 879
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v1, :cond_39

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    const-string v1, "deinitContext:eglDestroyContext"

    .line 880
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 881
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->releaseContext()V

    .line 882
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 883
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    :cond_39
    const-string v1, "deinitContext:eglTerminate"

    .line 886
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    :cond_45
    const/4 v0, 0x0

    .line 889
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    .line 890
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    .line 891
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 892
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 893
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglContext:Ljavax/microedition/khronos/egl/EGLContext;

    const/4 v0, -0x1

    .line 894
    iput v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mCurrentSurfaceID:I

    return-void
.end method

.method public deinitSurface(Ljavax/microedition/khronos/egl/EGLSurface;Z)V
    .registers 8

    const-string v0, "GLMapView.Renderer"

    const-string v1, "deinitSurface"

    .line 856
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_2f

    if-eqz p2, :cond_20

    const-string p2, "DeinitSurface:eglMakeCurrent"

    .line 861
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 862
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p2, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 863
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    :cond_20
    const-string p2, "deinitSurface:eglDestroySurface"

    .line 865
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 866
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {p2, v0, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 867
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    :cond_2f
    return-void
.end method

.method deleteSurface(I)V
    .registers 5

    .line 588
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "deleteSurface: id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GLMapView.Renderer"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    if-eqz v0, :cond_32

    .line 591
    iget-object v0, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mCurrentSurfaceID:I

    if-ne v1, p1, :cond_28

    const/4 v1, 0x1

    goto :goto_29

    :cond_28
    const/4 v1, 0x0

    :goto_29
    invoke-virtual {p0, v0, v1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->deinitSurface(Ljavax/microedition/khronos/egl/EGLSurface;Z)V

    .line 592
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    goto :goto_46

    .line 594
    :cond_32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteSurface: invalid surface ID: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_46
    return-void
.end method

.method public getCurrentSurface()Ljavax/microedition/khronos/egl/EGLSurface;
    .registers 2

    .line 423
    iget v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mCurrentSurfaceID:I

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->getSurface(I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v0

    return-object v0
.end method

.method public getEGLSurfaceData(I)Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;
    .registers 3

    .line 411
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mSurfaceMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    return-object p1
.end method

.method public getSurface(I)Ljavax/microedition/khronos/egl/EGLSurface;
    .registers 2

    .line 415
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->getEGLSurfaceData(I)Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    move-result-object p1

    if-nez p1, :cond_8

    const/4 p1, 0x0

    return-object p1

    .line 419
    :cond_8
    iget-object p1, p1, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    return-object p1
.end method

.method public my_beginPaint()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 467
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->inited:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    if-nez v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x1

    return v0

    :cond_b
    :goto_b
    const-string v0, "GLMapView.Renderer"

    const-string v1, "my_beginPaint GL not inited"

    .line 468
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public my_endPaint()V
    .registers 1

    return-void
.end method

.method public releaseContext()V
    .registers 6

    .line 846
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_12

    .line 849
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v0, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 850
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    :cond_12
    return-void
.end method

.method public stepTest()V
    .registers 1

    return-void
.end method

.method surfaceChanged(III)V
    .registers 5

    .line 610
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->getEGLSurfaceData(I)Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 614
    iput p2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mWidth:I

    .line 615
    iput p3, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mHeight:I

    goto :goto_21

    .line 619
    :cond_b
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "surfaceChanged: no surface found with ID:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "GLMapView.Renderer"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_21
    return-void
.end method

.method surfaceRedrawNeededAsync(Ljava/lang/Runnable;)V
    .registers 3

    .line 624
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mDrawingFinishedRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_a

    .line 625
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    const/4 v0, 0x0

    .line 626
    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mDrawingFinishedRunnable:Ljava/lang/Runnable;

    .line 628
    :cond_a
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mDrawingFinishedRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method swapBuffers(I)V
    .registers 5

    .line 632
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->getEGLSurfaceData(I)Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;

    move-result-object v0

    const-string v1, "GLMapView.Renderer"

    if-eqz v0, :cond_6b

    .line 636
    iget-boolean v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mOnScreen:Z

    if-eqz v2, :cond_3c

    .line 638
    iget-object v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v2, :cond_27

    .line 640
    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mDrawingFinishedRunnable:Ljava/lang/Runnable;

    if-eqz p1, :cond_1a

    .line 641
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    .line 642
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->mDrawingFinishedRunnable:Ljava/lang/Runnable;

    .line 645
    :cond_1a
    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->egl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->eglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {p1, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    .line 646
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->EGL_Error()V

    goto :goto_7f

    .line 648
    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "swapBuffers: no surface with ID: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7f

    .line 653
    :cond_3c
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$000(Lcom/navngo/igo/javaclient/view/GLMapView;)Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

    move-result-object v2

    if-eqz v2, :cond_7f

    .line 655
    iget-object v2, v0, Lcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;->mScreenBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v2}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$100(ILjava/nio/ByteBuffer;)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 657
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->this$0:Lcom/navngo/igo/javaclient/view/GLMapView;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/view/GLMapView;->access$000(Lcom/navngo/igo/javaclient/view/GLMapView;)Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Lcom/navngo/igo/javaclient/view/GLMapView$OffscreenPresentListener;->onEndPaint(ILcom/navngo/igo/javaclient/view/GLMapView$EGLSurfaceData;)V

    goto :goto_7f

    .line 661
    :cond_56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "swapBuffers: grab surface failed! Display id: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7f

    .line 668
    :cond_6b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "swapBuffers: no surface data for id: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7f
    :goto_7f
    return-void
.end method

.method public testPaint()V
    .registers 2

    .line 479
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->gl:Ljavax/microedition/khronos/opengles/GL10;

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/view/GLMapView$Renderer;->drawTest(Ljavax/microedition/khronos/opengles/GL10;)V

    return-void
.end method
