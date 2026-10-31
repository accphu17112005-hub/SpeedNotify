###### Class com.navngo.igo.javaclient.view.MapView (com.navngo.igo.javaclient.view.MapView)
.class public Lcom/navngo/igo/javaclient/view/MapView;
.super Landroid/view/SurfaceView;
.source "MapView.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Lcom/navngo/igo/javaclient/view/IMapView;


# static fields
.field private static final logname:Ljava/lang/String; = "MapView"


# instance fields
.field private volatile height565:I

.field private lastOrientation:I

.field public log_fps_counter:J

.field public log_fps_counter_logged:J

.field public log_fps_tick:J

.field public log_fps_tick_logged:J

.field public log_fps_tick_start:J

.field private mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

.field volatile mMouseMatrix:Landroid/graphics/Matrix;

.field private mSurfaceHeight:I

.field private mSurfaceWidth:I

.field volatile matrix888:Landroid/graphics/Matrix;

.field private volatile onDrawDetectedRotation:Z

.field private renderBlack:Z

.field private renderBlack_had_timed_out:Z

.field private renderBlack_started_at:J

.field private volatile width565:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 108
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    .line 40
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    const/4 v0, -0x1

    .line 41
    iput v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->lastOrientation:I

    .line 43
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->onDrawDetectedRotation:Z

    .line 46
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    .line 47
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mMouseMatrix:Landroid/graphics/Matrix;

    .line 49
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceWidth:I

    .line 50
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceHeight:I

    const-wide/16 v0, 0x0

    .line 103
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter_logged:J

    .line 104
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_start:J

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick:J

    .line 105
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_logged:J

    const/4 p1, 0x1

    .line 130
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    .line 131
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    .line 109
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/MapView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 113
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    .line 40
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    const/4 p2, -0x1

    .line 41
    iput p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->lastOrientation:I

    .line 43
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->onDrawDetectedRotation:Z

    .line 46
    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    .line 47
    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->mMouseMatrix:Landroid/graphics/Matrix;

    .line 49
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceWidth:I

    .line 50
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceHeight:I

    const-wide/16 p1, 0x0

    .line 103
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter_logged:J

    .line 104
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_start:J

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick:J

    .line 105
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_logged:J

    const/4 p1, 0x1

    .line 130
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    .line 131
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    .line 114
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/MapView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 118
    invoke-direct {p0, p1, p2, p3}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 38
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    .line 40
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    const/4 p2, -0x1

    .line 41
    iput p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->lastOrientation:I

    .line 43
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->onDrawDetectedRotation:Z

    .line 46
    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    .line 47
    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->mMouseMatrix:Landroid/graphics/Matrix;

    .line 49
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceWidth:I

    .line 50
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceHeight:I

    const-wide/16 p1, 0x0

    .line 103
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter_logged:J

    .line 104
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_start:J

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick:J

    .line 105
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_logged:J

    const/4 p1, 0x1

    .line 130
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    .line 131
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    .line 119
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/MapView;->init()V

    return-void
.end method

.method private fullRedraw()V
    .registers 6

    .line 167
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/view/CommonMapView;->paintTaskActive:Z

    if-eqz v0, :cond_48

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/MapView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 169
    sget-boolean v0, Lcom/navngo/igo/javaclient/NNG;->javaPainting:Z

    if-eqz v0, :cond_18

    const-string v0, "MapView"

    const-string v1, "Skipping fullRedraw because we are already doing a fullRedraw"

    .line 172
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_18
    const/4 v0, 0x1

    .line 175
    sput-boolean v0, Lcom/navngo/igo/javaclient/NNG;->javaPainting:Z

    .line 176
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/MapView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 180
    :try_start_21
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v1

    if-eqz v1, :cond_30

    .line 183
    monitor-enter v0
    :try_end_28
    .catchall {:try_start_21 .. :try_end_28} :catchall_3f

    .line 184
    :try_start_28
    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/view/MapView;->doDraw(Landroid/graphics/Canvas;)V

    .line 185
    monitor-exit v0

    goto :goto_37

    :catchall_2d
    move-exception v3

    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_2d

    :try_start_2f
    throw v3

    :cond_30
    const-string v3, "MapView"

    const-string v4, "Returned Canvas object null!!!!!"

    .line 189
    invoke-static {v3, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_37
    .catchall {:try_start_2f .. :try_end_37} :catchall_3f

    :goto_37
    if-eqz v1, :cond_3c

    .line 196
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 198
    :cond_3c
    sput-boolean v2, Lcom/navngo/igo/javaclient/NNG;->javaPainting:Z

    goto :goto_48

    :catchall_3f
    move-exception v3

    if-eqz v1, :cond_45

    .line 196
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 198
    :cond_45
    sput-boolean v2, Lcom/navngo/igo/javaclient/NNG;->javaPainting:Z

    .line 199
    throw v3

    :cond_48
    :goto_48
    return-void
.end method

.method private declared-synchronized init()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "MapView"

    const-string v1, "init()"

    .line 124
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    new-instance v0, Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/view/CommonMapView;-><init>(Lcom/navngo/igo/javaclient/view/IMapView;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    .line 126
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/MapView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 127
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->init()V
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1d

    .line 128
    monitor-exit p0

    return-void

    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public BeginPaint()Z
    .registers 4

    .line 83
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/MapView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 84
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    iget-boolean v1, v1, Lcom/navngo/igo/javaclient/view/CommonMapView;->paintTaskActive:Z

    if-eqz v1, :cond_3e

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    if-eqz v1, :cond_3e

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v0

    if-nez v0, :cond_1b

    goto :goto_3e

    .line 89
    :cond_1b
    iget v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceWidth:I

    iget v1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceHeight:I

    mul-int v0, v0, v1

    if-lez v0, :cond_3c

    .line 90
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->bufferB_ARGB8888:[I

    if-eqz v1, :cond_2c

    sget-object v1, Lcom/navngo/igo/javaclient/Application;->bufferB_ARGB8888:[I

    array-length v1, v1

    if-le v0, v1, :cond_3c

    :cond_2c
    const-string v1, "MapView"

    const-string v2, "Reallocating buffer"

    .line 91
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    new-array v0, v0, [I

    .line 93
    sput-object v0, Lcom/navngo/igo/javaclient/Application;->bufferB_ARGB8888:[I

    .line 94
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->bufferB_ARGB8888:[I

    invoke-static {v0}, Lcom/navngo/igo/javaclient/NNG;->setBuffer888([I)V

    :cond_3c
    const/4 v0, 0x1

    return v0

    :cond_3e
    :goto_3e
    const/4 v0, 0x0

    return v0
.end method

.method public EndPaint()V
    .registers 1

    return-void
.end method

.method public OpenGL_CreateBuffers()Z
    .registers 3

    const-string v0, "MapView"

    const-string v1, "OpenGL_CreateBuffers: should not be called"

    .line 147
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public OpenGL_DeleteBuffers()Z
    .registers 3

    const-string v0, "MapView"

    const-string v1, "OpenGL_DeleteBuffers: should not be called"

    .line 161
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public OpenGL_PrepareBuffers()Z
    .registers 3

    const-string v0, "MapView"

    const-string v1, "OpenGL_PrepareBuffers: should not be called"

    .line 152
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0
.end method

.method public OpenGL_SwapBuffers(II)V
    .registers 3

    const-string p1, "MapView"

    const-string p2, "OpenGL_SwapBuffers: should not be called"

    .line 157
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public asView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method protected doDraw(Landroid/graphics/Canvas;)V
    .registers 19

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 208
    iget v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_15

    iget v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    if-ne v2, v3, :cond_15

    const-string v0, "MapView"

    const-string v2, "doDraw: w == h == 1, skip"

    .line 212
    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 216
    :cond_15
    sget v2, Lcom/navngo/igo/javaclient/Config;->log_fps:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-lez v2, :cond_60

    .line 217
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 218
    iget-wide v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    const-wide/16 v10, 0x1

    add-long/2addr v8, v10

    iput-wide v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    .line 219
    iget-wide v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_logged:J

    sub-long v8, v6, v8

    sget v2, Lcom/navngo/igo/javaclient/Config;->log_fps:I

    int-to-long v10, v2

    cmp-long v2, v8, v10

    if-ltz v2, :cond_60

    .line 220
    iget-wide v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    iget-wide v10, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter_logged:J

    sub-long/2addr v8, v10

    long-to-double v8, v8

    const-wide v10, 0x408f400000000000L    # 1000.0

    mul-double v8, v8, v10

    iget-wide v10, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_logged:J

    sub-long v10, v6, v10

    long-to-double v10, v10

    div-double/2addr v8, v10

    const-string v2, "MapView"

    .line 221
    move-object v10, v4

    check-cast v10, Ljava/util/Locale;

    const-string v10, "log_fps: Java   FPS =%5g"

    new-array v11, v3, [Ljava/lang/Object;

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v11, v5

    invoke-static {v4, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v2, v8}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    iget-wide v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter:J

    iput-wide v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_counter_logged:J

    .line 223
    iput-wide v6, v1, Lcom/navngo/igo/javaclient/view/MapView;->log_fps_tick_logged:J

    .line 226
    :cond_60
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    iput-object v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    const/4 v2, 0x2

    :try_start_67
    new-array v6, v2, [F

    const/4 v7, 0x0

    aput v7, v6, v5

    aput v7, v6, v3

    .line 229
    iget-object v8, v1, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    invoke-virtual {v8, v6}, Landroid/graphics/Matrix;->mapPoints([F)V

    aget v8, v6, v5

    float-to-double v8, v8

    const-wide/high16 v10, 0x3fe0000000000000L    # 0.5

    add-double/2addr v8, v10

    double-to-int v8, v8

    aget v6, v6, v3

    float-to-double v12, v6

    add-double/2addr v12, v10

    double-to-int v6, v12

    .line 233
    sget v9, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    const/4 v10, 0x3

    if-eq v9, v3, :cond_d3

    if-eq v9, v2, :cond_ca

    const/4 v4, 0x4

    const/4 v11, 0x5

    if-eq v9, v10, :cond_91

    if-eq v9, v4, :cond_91

    if-eq v9, v11, :cond_91

    const/4 v6, 0x0

    const/4 v8, 0x0

    goto :goto_db

    .line 247
    :cond_91
    new-instance v9, Landroid/graphics/Matrix;

    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    .line 248
    iget-object v12, v1, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    invoke-virtual {v12, v9}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    move-result v12

    if-eqz v12, :cond_c2

    const/16 v12, 0x9

    new-array v12, v12, [F

    .line 250
    invoke-virtual {v9, v12}, Landroid/graphics/Matrix;->getValues([F)V

    .line 251
    sget v13, Lcom/navngo/igo/javaclient/Config;->canvas_matrix_hack:I

    if-eq v13, v4, :cond_b1

    if-eq v13, v11, :cond_ac

    goto :goto_bb

    :cond_ac
    aput v7, v12, v2

    aput v7, v12, v11

    goto :goto_bb

    :cond_b1
    aget v4, v12, v2

    neg-float v4, v4

    aput v4, v12, v2

    aget v4, v12, v11

    neg-float v4, v4

    aput v4, v12, v11

    .line 264
    :goto_bb
    invoke-virtual {v9, v12}, Landroid/graphics/Matrix;->setValues([F)V

    .line 266
    invoke-virtual {v0, v9}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    goto :goto_d6

    :cond_c2
    const-string v4, "MapView"

    const-string v9, "onDraw: invert failed"

    .line 268
    invoke-static {v4, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d6

    .line 242
    :cond_ca
    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v0, v4}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    goto :goto_d6

    .line 239
    :cond_d3
    invoke-virtual {v0, v4}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    :goto_d6
    move/from16 v16, v8

    move v8, v6

    move/from16 v6, v16

    .line 272
    :goto_db
    invoke-virtual/range {p0 .. p0}, Lcom/navngo/igo/javaclient/view/MapView;->getWidth()I

    move-result v4

    .line 273
    invoke-virtual/range {p0 .. p0}, Lcom/navngo/igo/javaclient/view/MapView;->getHeight()I

    move-result v9

    .line 279
    monitor-enter p0
    :try_end_e4
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_e4} :catch_25b

    if-gt v4, v9, :cond_e8

    const/4 v11, 0x1

    goto :goto_e9

    :cond_e8
    const/4 v11, 0x0

    .line 282
    :goto_e9
    :try_start_e9
    iget v12, v1, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    iget v13, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    if-gt v12, v13, :cond_f1

    const/4 v12, 0x1

    goto :goto_f2

    :cond_f1
    const/4 v12, 0x0

    .line 283
    :goto_f2
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v13

    const-string v14, "window"

    .line 284
    invoke-virtual {v13, v14}, Lcom/navngo/igo/javaclient/IgoActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/view/WindowManager;

    invoke-interface {v13}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/Display;->getRotation()I

    move-result v13

    const/16 v14, -0x5a

    const/16 v15, 0x5a

    if-eqz v11, :cond_161

    if-nez v12, :cond_161

    .line 289
    sget-boolean v11, Lcom/navngo/igo/javaclient/Config;->fourway_orientable_device:Z

    if-eqz v11, :cond_12a

    iget v11, v1, Lcom/navngo/igo/javaclient/view/MapView;->lastOrientation:I

    if-ne v11, v10, :cond_118

    if-eqz v13, :cond_11c

    :cond_118
    if-ne v11, v3, :cond_12a

    if-ne v13, v2, :cond_12a

    :cond_11c
    const-string v2, "MapView"

    const-string v11, "landscape -> portrait transition: reversed"

    .line 292
    invoke-static {v2, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    iget v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    neg-int v2, v2

    move v11, v2

    move v12, v4

    const/4 v2, 0x0

    goto :goto_13a

    :cond_12a
    const-string v2, "MapView"

    const-string v11, "landscape -> portrait transition"

    .line 299
    invoke-static {v2, v11}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    iget v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    neg-int v2, v2

    .line 302
    iget v11, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    neg-int v11, v11

    const/4 v12, 0x0

    const/16 v14, 0x5a

    :goto_13a
    const-string v13, "MapView"

    .line 306
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "angle="

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " w="

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " h="

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v13, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c0

    :cond_161
    if-nez v11, :cond_1b9

    if-eqz v12, :cond_1b9

    .line 309
    sget-boolean v7, Lcom/navngo/igo/javaclient/Config;->fourway_orientable_device:Z

    if-eqz v7, :cond_185

    iget v7, v1, Lcom/navngo/igo/javaclient/view/MapView;->lastOrientation:I

    if-nez v7, :cond_16f

    if-eq v13, v10, :cond_173

    :cond_16f
    if-ne v7, v2, :cond_185

    if-ne v13, v3, :cond_185

    :cond_173
    const-string v2, "MapView"

    const-string v7, "portrait -> landscape transition: reversed"

    .line 312
    invoke-static {v2, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    iget v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    neg-int v2, v2

    .line 315
    iget v7, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    neg-int v7, v7

    move v11, v7

    const/4 v12, 0x0

    const/16 v14, 0x5a

    goto :goto_192

    :cond_185
    const-string v2, "MapView"

    const-string v7, "portrait -> landscape transition"

    .line 319
    invoke-static {v2, v7}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    iget v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    neg-int v2, v2

    move v11, v2

    move v12, v4

    const/4 v2, 0x0

    :goto_192
    const-string v7, "MapView"

    .line 326
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "angle="

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, " w="

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " h="

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1c0

    .line 328
    :cond_1b9
    iput v13, v1, Lcom/navngo/igo/javaclient/view/MapView;->lastOrientation:I

    const/4 v2, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    :goto_1c0
    if-eqz v14, :cond_211

    .line 333
    iput-boolean v3, v1, Lcom/navngo/igo/javaclient/view/MapView;->onDrawDetectedRotation:Z

    .line 334
    sget-boolean v4, Lcom/navngo/igo/javaclient/Config;->upside_down_bug:Z

    if-eqz v4, :cond_200

    .line 335
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    .line 336
    iget-boolean v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    if-nez v2, :cond_1df

    const-string v2, "MapView"

    const-string v4, "onDraw: renderBlack BEGIN"

    .line 337
    invoke-static {v2, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    iput-boolean v3, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    .line 339
    iput-wide v11, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_started_at:J

    .line 340
    iput-boolean v5, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    move v7, v6

    goto :goto_226

    .line 342
    :cond_1df
    iget-wide v13, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_started_at:J

    sget v2, Lcom/navngo/igo/javaclient/Config;->orientationchange_timeout:I

    move v7, v6

    int-to-long v5, v2

    add-long/2addr v13, v5

    cmp-long v2, v11, v13

    if-lez v2, :cond_1f8

    const-string v2, "MapView"

    const-string v5, "onDraw: renderBlack TIMEOUT"

    .line 345
    invoke-static {v2, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    iget-boolean v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    if-nez v2, :cond_225

    .line 347
    iput-boolean v3, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    goto :goto_225

    :cond_1f8
    const-string v2, "MapView"

    const-string v5, "onDraw: renderBlack BLACK"

    .line 351
    invoke-static {v2, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_226

    :cond_200
    move v7, v6

    int-to-float v3, v12

    int-to-float v5, v9

    .line 355
    invoke-virtual {v0, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    int-to-float v3, v14

    const/4 v5, 0x0

    .line 356
    invoke-virtual {v0, v3, v5, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    int-to-float v2, v2

    int-to-float v3, v11

    .line 357
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_225

    :cond_211
    move v7, v6

    .line 359
    iget-boolean v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    if-eqz v2, :cond_225

    const-string v2, "MapView"

    const-string v3, "onDraw: renderBlack END"

    .line 360
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 361
    iput-boolean v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack:Z

    .line 362
    iput-boolean v2, v1, Lcom/navngo/igo/javaclient/view/MapView;->renderBlack_had_timed_out:Z

    .line 363
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    :cond_225
    :goto_225
    const/4 v3, 0x0

    .line 366
    :goto_226
    sget v2, Lcom/navngo/igo/javaclient/Config;->mouse_matrix_hack:I

    if-eq v2, v10, :cond_22b

    goto :goto_234

    .line 371
    :cond_22b
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    iget-object v5, v1, Lcom/navngo/igo/javaclient/view/MapView;->mMouseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v5}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 375
    :goto_234
    sget-object v5, Lcom/navngo/igo/javaclient/Application;->bufferB_ARGB8888:[I

    if-nez v3, :cond_252

    if-nez v5, :cond_23b

    goto :goto_252

    :cond_23b
    const/4 v4, 0x0

    .line 379
    iget v6, v1, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    iget v9, v1, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    iget v10, v1, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v2, p1

    move-object v3, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move v9, v10

    move v10, v11

    move-object v11, v12

    invoke-virtual/range {v2 .. v11}, Landroid/graphics/Canvas;->drawBitmap([IIIIIIIZLandroid/graphics/Paint;)V

    goto :goto_256

    :cond_252
    :goto_252
    const/4 v2, 0x0

    .line 377
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 381
    :goto_256
    monitor-exit p0

    goto :goto_27b

    :catchall_258
    move-exception v0

    monitor-exit p0
    :try_end_25a
    .catchall {:try_start_e9 .. :try_end_25a} :catchall_258

    :try_start_25a
    throw v0
    :try_end_25b
    .catch Ljava/lang/Exception; {:try_start_25a .. :try_end_25b} :catch_25b

    :catch_25b
    move-exception v0

    const-string v2, "MapView"

    const-string v3, "onDraw: unexpected exception: "

    .line 383
    invoke-static {v2, v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string v0, "MapView"

    .line 384
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDraw: was:  matrix888 = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    :goto_27b
    return-void
.end method

.method public findFocus()Landroid/view/View;
    .registers 2

    .line 459
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->findFocus()V

    .line 460
    invoke-super {p0}, Landroid/view/SurfaceView;->findFocus()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getCommonInterface()Lcom/navngo/igo/javaclient/view/CommonMapView;
    .registers 2

    .line 55
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    return-object v0
.end method

.method public get_Height()I
    .registers 2

    .line 454
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/MapView;->getHeight()I

    move-result v0

    return v0
.end method

.method public get_Width()I
    .registers 2

    .line 450
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/MapView;->getWidth()I

    move-result v0

    return v0
.end method

.method public hasValidSurface()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public mapMousePoints(FF)Landroid/graphics/PointF;
    .registers 7

    const/4 v0, 0x4

    new-array v0, v0, [F

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput v2, v0, v1

    const/4 v3, 0x1

    aput v2, v0, v3

    const/4 v2, 0x2

    aput p1, v0, v2

    const/4 p1, 0x3

    aput p2, v0, p1

    .line 436
    sget p2, Lcom/navngo/igo/javaclient/Config;->mouse_matrix_hack:I

    if-eq p2, p1, :cond_15

    goto :goto_1f

    .line 441
    :cond_15
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->mMouseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 442
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->matrix888:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 446
    :goto_1f
    new-instance p2, Landroid/graphics/PointF;

    aget v2, v0, v2

    aget v1, v0, v1

    sub-float/2addr v2, v1

    aget p1, v0, p1

    aget v0, v0, v3

    sub-float/2addr p1, v0

    invoke-direct {p2, v2, p1}, Landroid/graphics/PointF;-><init>(FF)V

    return-object p2
.end method

.method protected declared-synchronized onDetachedFromWindow()V
    .registers 2

    monitor-enter p0

    .line 404
    :try_start_1
    invoke-super {p0}, Landroid/view/SurfaceView;->onDetachedFromWindow()V

    .line 405
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onDetachedFromWindow()V
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    .line 406
    monitor-exit p0

    return-void

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 421
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 413
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onPaintCallback(IIIIII)V
    .registers 7

    .line 136
    iput p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->width565:I

    .line 137
    iput p2, p0, Lcom/navngo/igo/javaclient/view/MapView;->height565:I

    .line 138
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->onDrawDetectedRotation:Z

    if-eqz p1, :cond_b

    const/4 p1, 0x0

    .line 140
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->onDrawDetectedRotation:Z

    .line 142
    :cond_b
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/view/MapView;->fullRedraw()V

    return-void
.end method

.method public declared-synchronized onPause()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "MapView"

    const-string v1, "onPause"

    .line 391
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x8

    .line 392
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/view/MapView;->setVisibility(I)V
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    .line 393
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onResume()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "MapView"

    const-string v1, "onResume"

    .line 397
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 398
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/view/MapView;->setVisibility(I)V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 399
    monitor-exit p0

    return-void

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 409
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public superonKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 425
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public superonKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 3

    .line 417
    invoke-super {p0, p1, p2}, Landroid/view/SurfaceView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .registers 6

    .line 69
    iput p3, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceWidth:I

    .line 70
    iput p4, p0, Lcom/navngo/igo/javaclient/view/MapView;->mSurfaceHeight:I

    .line 72
    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2, p3, p4}, Lcom/navngo/igo/javaclient/view/CommonMapView;->surfaceChanged(IIII)V

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .registers 4

    .line 65
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->surfaceCreated(Landroid/view/Surface;I)V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .registers 3

    .line 78
    iget-object p1, p0, Lcom/navngo/igo/javaclient/view/MapView;->mCommon:Lcom/navngo/igo/javaclient/view/CommonMapView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->surfaceDestroyed(I)V

    return-void
.end method
