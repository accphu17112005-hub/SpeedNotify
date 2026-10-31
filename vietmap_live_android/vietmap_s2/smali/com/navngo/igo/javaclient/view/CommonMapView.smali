###### Class com.navngo.igo.javaclient.view.CommonMapView (com.navngo.igo.javaclient.view.CommonMapView)
.class public Lcom/navngo/igo/javaclient/view/CommonMapView;
.super Ljava/lang/Object;
.source "CommonMapView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;,
        Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;
    }
.end annotation


# static fields
.field public static final IGO_KEYCODE_BACKSPACE:I = 0x8

.field public static final IGO_KEYCODE_DOWN:I = 0x28

.field public static final IGO_KEYCODE_ENTER:I = 0xd

.field public static final IGO_KEYCODE_LEFT:I = 0x25

.field public static final IGO_KEYCODE_MENU:I = 0xc8

.field public static final IGO_KEYCODE_PREVSCREEN:I = 0x4

.field public static final IGO_KEYCODE_RIGHT:I = 0x27

.field public static final IGO_KEYCODE_UNICODE:I = 0x10000

.field public static final IGO_KEYCODE_UP:I = 0x26

.field private static final logname:Ljava/lang/String; = "CommonMapView"


# instance fields
.field private altPressed:Z

.field private km:Landroid/view/KeyCharacterMap;

.field private last_drag:J

.field private mActiveDisplayId:I

.field private final mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

.field private mKeyHandler:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;

.field private mOnFindFocusCallback:Ljava/lang/Runnable;

.field private final mOnFindFocusCallbackLock:Ljava/lang/Object;

.field private mSurfaceReinitNeeded:Z

.field private mSurfaces:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;",
            ">;"
        }
    .end annotation
.end field

.field private final mVOwner:Landroid/view/View;

.field volatile paintTaskActive:Z

.field private shiftPressed:Z


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/view/IMapView;)V
    .registers 6

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 101
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->paintTaskActive:Z

    .line 103
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->altPressed:Z

    .line 104
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->shiftPressed:Z

    .line 105
    invoke-static {v0}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object v1

    iput-object v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->km:Landroid/view/KeyCharacterMap;

    .line 107
    iput v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mActiveDisplayId:I

    const/4 v1, 0x0

    .line 111
    iput-object v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    .line 144
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaceReinitNeeded:Z

    const-wide/16 v2, 0x0

    .line 189
    iput-wide v2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->last_drag:J

    .line 405
    iput-object v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mOnFindFocusCallback:Ljava/lang/Runnable;

    .line 406
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mOnFindFocusCallbackLock:Ljava/lang/Object;

    .line 116
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    .line 117
    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mVOwner:Landroid/view/View;

    .line 118
    sget v0, Lcom/navngo/igo/javaclient/R$id;->iMapView:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    .line 119
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    return-void
.end method

.method private adjustVolume(I)V
    .registers 5

    .line 397
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mVOwner:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 399
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getSoundStream()I

    move-result v1

    const/4 v2, 0x5

    .line 398
    invoke-virtual {v0, v1, p1, v2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    return-void
.end method

.method private charToSend(ILandroid/view/KeyEvent;)I
    .registers 4

    .line 368
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->altPressed:Z

    if-eqz v0, :cond_c

    .line 369
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->km:Landroid/view/KeyCharacterMap;

    const/4 v0, 0x2

    invoke-virtual {p2, p1, v0}, Landroid/view/KeyCharacterMap;->get(II)I

    move-result p1

    goto :goto_1c

    .line 370
    :cond_c
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->shiftPressed:Z

    if-eqz v0, :cond_18

    .line 371
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->km:Landroid/view/KeyCharacterMap;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/view/KeyCharacterMap;->get(II)I

    move-result p1

    goto :goto_1c

    .line 373
    :cond_18
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getUnicodeChar()I

    move-result p1

    :goto_1c
    return p1
.end method

.method private handleMetaKeys(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V
    .registers 4

    .line 349
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p2, v0, :cond_f

    const/4 p2, 0x1

    packed-switch p1, :pswitch_data_1a

    goto :goto_18

    .line 357
    :pswitch_9
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->shiftPressed:Z

    goto :goto_18

    .line 353
    :pswitch_c
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->altPressed:Z

    goto :goto_18

    .line 360
    :cond_f
    sget-object p1, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->UP:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p2, p1, :cond_18

    const/4 p1, 0x0

    .line 361
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->altPressed:Z

    .line 362
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->shiftPressed:Z

    :cond_18
    :goto_18
    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x39
        :pswitch_c
        :pswitch_c
        :pswitch_9
        :pswitch_9
    .end packed-switch
.end method

.method private handleVolumeKeys(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V
    .registers 4

    .line 379
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-eq p2, v0, :cond_5

    return-void

    :cond_5
    const/4 p2, 0x0

    const/16 v0, 0x18

    if-eq p1, v0, :cond_11

    const/16 v0, 0x19

    if-eq p1, v0, :cond_f

    goto :goto_12

    :cond_f
    const/4 p2, -0x1

    goto :goto_12

    :cond_11
    const/4 p2, 0x1

    .line 393
    :goto_12
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->adjustVolume(I)V

    return-void
.end method

.method private keyToOwner(ILandroid/view/KeyEvent;Lcom/navngo/igo/javaclient/ServerRunner$KeyState;)Z
    .registers 5

    .line 265
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p3, v0, :cond_b

    iget-object p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-interface {p3, p1, p2}, Lcom/navngo/igo/javaclient/view/IMapView;->superonKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    goto :goto_11

    :cond_b
    iget-object p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-interface {p3, p1, p2}, Lcom/navngo/igo/javaclient/view/IMapView;->superonKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    :goto_11
    return p1
.end method


# virtual methods
.method public CheckForSurfaceChange()Z
    .registers 3

    .line 146
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaceReinitNeeded:Z

    const/4 v1, 0x0

    .line 147
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaceReinitNeeded:Z

    return v0
.end method

.method public findFocus()V
    .registers 3

    .line 409
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mOnFindFocusCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 410
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mOnFindFocusCallback:Ljava/lang/Runnable;

    if-eqz v1, :cond_a

    .line 411
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 413
    :cond_a
    monitor-exit v0

    return-void

    :catchall_c
    move-exception v1

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v1
.end method

.method getActiveDisplayId()I
    .registers 2

    .line 108
    iget v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mActiveDisplayId:I

    return v0
.end method

.method getActiveSurfaceData()Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;
    .registers 3

    .line 113
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    iget v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mActiveDisplayId:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    return-object v0
.end method

.method public getKeyHandler()Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;
    .registers 2

    .line 73
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mKeyHandler:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;

    return-object v0
.end method

.method getSurfaceData(I)Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;
    .registers 3

    .line 112
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    return-object p1
.end method

.method public hasValidSurface()Z
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 135
    :goto_2
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_25

    .line 136
    iget-object v2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    if-eqz v2, :cond_22

    .line 137
    iget-object v3, v2, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mSurface:Landroid/view/Surface;

    if-eqz v3, :cond_22

    iget-object v2, v2, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2}, Landroid/view/Surface;->isValid()Z

    move-result v2

    if-eqz v2, :cond_22

    const/4 v0, 0x1

    return v0

    :cond_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_25
    return v0
.end method

.method init()V
    .registers 3

    const-string v0, "CommonMapView"

    const-string v1, "init()"

    .line 123
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Application;->setMapView(Lcom/navngo/igo/javaclient/view/IMapView;)V

    .line 125
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->requestFocus()V

    return-void
.end method

.method declared-synchronized onDetachedFromWindow()V
    .registers 3

    monitor-enter p0

    :try_start_1
    const-string v0, "CommonMapView"

    const-string v1, "onDetachedFromWindow"

    .line 181
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 187
    monitor-exit p0

    return-void

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5

    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onKeyDown: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonMapView"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onKeyEvent(ILandroid/view/KeyEvent;Lcom/navngo/igo/javaclient/ServerRunner$KeyState;)Z

    move-result p1

    return p1
.end method

.method public onKeyEvent(ILandroid/view/KeyEvent;Lcom/navngo/igo/javaclient/ServerRunner$KeyState;)Z
    .registers 9

    .line 270
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mKeyHandler:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;

    const/4 v1, 0x1

    if-eqz v0, :cond_1d

    .line 272
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p3, v0, :cond_10

    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mKeyHandler:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;->handleKeyDown(ILandroid/view/KeyEvent;)Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;

    move-result-object v0

    goto :goto_16

    :cond_10
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mKeyHandler:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;

    invoke-virtual {v0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;->handleKeyUp(ILandroid/view/KeyEvent;)Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;

    move-result-object v0

    .line 273
    :goto_16
    iget-boolean v2, v0, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;->eventHandled:Z

    .line 274
    iget-boolean v0, v0, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;->preventDefault:Z

    if-eqz v0, :cond_1e

    return v2

    :cond_1d
    const/4 v2, 0x1

    .line 278
    :cond_1e
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result v0

    const/16 v3, 0x8

    and-int/2addr v0, v3

    const/4 v4, 0x0

    if-nez v0, :cond_37

    sget-boolean v0, Lcom/navngo/igo/javaclient/Config;->ignore_spoofed_keys:Z

    if-eqz v0, :cond_37

    .line 279
    invoke-direct {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/view/CommonMapView;->keyToOwner(ILandroid/view/KeyEvent;Lcom/navngo/igo/javaclient/ServerRunner$KeyState;)Z

    move-result p1

    if-eqz p1, :cond_35

    if-eqz v2, :cond_35

    goto :goto_36

    :cond_35
    const/4 v1, 0x0

    :goto_36
    return v1

    :cond_37
    const/4 v0, 0x4

    if-eq p1, v0, :cond_dd

    const/16 v0, 0x52

    if-eq p1, v0, :cond_d7

    const/16 v0, 0x18

    if-eq p1, v0, :cond_bb

    const/16 v0, 0x19

    if-eq p1, v0, :cond_bb

    const/16 v0, 0x42

    if-eq p1, v0, :cond_b5

    const/16 v0, 0x43

    if-eq p1, v0, :cond_b1

    packed-switch p1, :pswitch_data_e2

    packed-switch p1, :pswitch_data_ee

    .line 330
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isSystem()Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 331
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p3, v0, :cond_65

    iget-object p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-interface {p3, p1, p2}, Lcom/navngo/igo/javaclient/view/IMapView;->superonKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    goto :goto_6b

    :cond_65
    iget-object p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-interface {p3, p1, p2}, Lcom/navngo/igo/javaclient/view/IMapView;->superonKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    :goto_6b
    return p1

    .line 336
    :cond_6c
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView;->charToSend(ILandroid/view/KeyEvent;)I

    move-result v0

    if-eqz v0, :cond_79

    const/high16 v3, 0x10000

    or-int/2addr v0, v3

    .line 338
    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    goto :goto_7c

    .line 340
    :cond_79
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    :goto_7c
    add-int/2addr v4, v1

    .line 344
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lt v4, v0, :cond_6c

    return v2

    .line 313
    :pswitch_84
    invoke-direct {p0, p1, p3}, Lcom/navngo/igo/javaclient/view/CommonMapView;->handleMetaKeys(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    .line 314
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->DOWN:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    if-ne p3, v0, :cond_92

    iget-object p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-interface {p3, p1, p2}, Lcom/navngo/igo/javaclient/view/IMapView;->superonKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    goto :goto_98

    :cond_92
    iget-object p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-interface {p3, p1, p2}, Lcom/navngo/igo/javaclient/view/IMapView;->superonKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    :goto_98
    return p1

    :pswitch_99
    const/16 p1, 0x27

    .line 296
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    :pswitch_9f
    const/16 p1, 0x25

    .line 293
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    :pswitch_a5
    const/16 p1, 0x28

    .line 287
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    :pswitch_ab
    const/16 p1, 0x26

    .line 290
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    .line 302
    :cond_b1
    invoke-static {v3, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    :cond_b5
    const/16 p1, 0xd

    .line 305
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    :cond_bb
    const-string p2, "sound"

    const-string v0, "android_muting_device"

    const/4 v1, 0x2

    .line 319
    invoke-static {p2, v0, v1}, Lcom/navngo/igo/javaclient/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p2

    const-string v0, "CommonMapView"

    if-ne p2, v1, :cond_ce

    const-string p1, "Let android handle to volume keys."

    .line 321
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v4

    :cond_ce
    const-string p2, "Handling volume keys from igo."

    .line 325
    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    invoke-direct {p0, p1, p3}, Lcom/navngo/igo/javaclient/view/CommonMapView;->handleVolumeKeys(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    :cond_d7
    const/16 p1, 0xc8

    .line 284
    invoke-static {p1, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    .line 299
    :cond_dd
    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/ServerRunner;->Key(ILcom/navngo/igo/javaclient/ServerRunner$KeyState;)V

    return v2

    nop

    :pswitch_data_e2
    .packed-switch 0x13
        :pswitch_ab
        :pswitch_a5
        :pswitch_9f
        :pswitch_99
    .end packed-switch

    :pswitch_data_ee
    .packed-switch 0x39
        :pswitch_84
        :pswitch_84
        :pswitch_84
        :pswitch_84
    .end packed-switch
.end method

.method onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5

    .line 255
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onKeyUp: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonMapView"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$KeyState;->UP:Lcom/navngo/igo/javaclient/ServerRunner$KeyState;

    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onKeyEvent(ILandroid/view/KeyEvent;Lcom/navngo/igo/javaclient/ServerRunner$KeyState;)Z

    move-result p1

    return p1
.end method

.method public onTouchEvent(ILandroid/view/MotionEvent;)Z
    .registers 15

    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onTouchEvent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " displayId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonMapView"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x1

    if-eqz v0, :cond_a9

    if-eq v0, v2, :cond_a9

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eq v0, v3, :cond_61

    const/4 v3, 0x3

    if-eq v0, v3, :cond_36

    if-eq v0, v1, :cond_a9

    const/4 v3, 0x6

    if-eq v0, v3, :cond_a9

    goto/16 :goto_d8

    .line 234
    :cond_36
    :goto_36
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ge v4, v0, :cond_d8

    .line 235
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-interface {v0, v1, v3}, Lcom/navngo/igo/javaclient/view/IMapView;->mapMousePoints(FF)Landroid/graphics/PointF;

    move-result-object v0

    .line 236
    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    sget-object v7, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_CANCEL:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    float-to-int v8, v1

    iget v0, v0, Landroid/graphics/PointF;->y:F

    float-to-int v9, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v10

    move v5, p1

    invoke-static/range {v5 .. v11}, Lcom/navngo/igo/javaclient/ServerRunner;->SendTouch(IILcom/navngo/igo/javaclient/ServerRunner$TouchAction;IIJ)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_36

    .line 215
    :cond_61
    :goto_61
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    if-ge v4, v0, :cond_8c

    .line 216
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-interface {v0, v1, v3}, Lcom/navngo/igo/javaclient/view/IMapView;->mapMousePoints(FF)Landroid/graphics/PointF;

    move-result-object v0

    .line 217
    invoke-virtual {p2, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    sget-object v7, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_MOVE:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    float-to-int v8, v1

    iget v0, v0, Landroid/graphics/PointF;->y:F

    float-to-int v9, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v10

    move v5, p1

    invoke-static/range {v5 .. v11}, Lcom/navngo/igo/javaclient/ServerRunner;->SendTouch(IILcom/navngo/igo/javaclient/ServerRunner$TouchAction;IIJ)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_61

    .line 220
    :cond_8c
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    .line 221
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->last_drag:J

    sget v3, Lcom/navngo/igo/javaclient/Config;->dragprocesstime:I

    int-to-long v3, v3

    add-long/2addr v0, v3

    sub-long/2addr v0, p1

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_a6

    const-wide/16 v3, 0x3e8

    cmp-long v5, v0, v3

    if-gez v5, :cond_a6

    .line 224
    :try_start_a3
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a6
    .catch Ljava/lang/InterruptedException; {:try_start_a3 .. :try_end_a6} :catch_a6

    .line 229
    :catch_a6
    :cond_a6
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->last_drag:J

    goto :goto_d8

    .line 202
    :cond_a9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    if-eq v0, v1, :cond_b5

    if-nez v0, :cond_b2

    goto :goto_b5

    .line 207
    :cond_b2
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_UP:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    goto :goto_b7

    .line 205
    :cond_b5
    :goto_b5
    sget-object v0, Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;->ACTION_DOWN:Lcom/navngo/igo/javaclient/ServerRunner$TouchAction;

    :goto_b7
    move-object v6, v0

    .line 209
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mIOwner:Lcom/navngo/igo/javaclient/view/IMapView;

    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    invoke-interface {v0, v1, v4}, Lcom/navngo/igo/javaclient/view/IMapView;->mapMousePoints(FF)Landroid/graphics/PointF;

    move-result-object v0

    .line 210
    invoke-virtual {p2, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iget v1, v0, Landroid/graphics/PointF;->x:F

    float-to-int v7, v1

    iget v0, v0, Landroid/graphics/PointF;->y:F

    float-to-int v8, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v9

    move v4, p1

    invoke-static/range {v4 .. v10}, Lcom/navngo/igo/javaclient/ServerRunner;->SendTouch(IILcom/navngo/igo/javaclient/ServerRunner$TouchAction;IIJ)V

    :cond_d8
    :goto_d8
    return v2
.end method

.method onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    const/4 v0, 0x0

    .line 191
    invoke-virtual {p0, v0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->onTouchEvent(ILandroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public requestFocus()V
    .registers 3

    .line 129
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mVOwner:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 130
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mVOwner:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 131
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mVOwner:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method setActiveDisplayId(I)V
    .registers 2

    .line 109
    iput p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mActiveDisplayId:I

    return-void
.end method

.method public setKeyHandler(Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;)V
    .registers 2

    .line 69
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mKeyHandler:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;

    return-void
.end method

.method public setOnFindFocusCallback(Ljava/lang/Runnable;)V
    .registers 3

    .line 417
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mOnFindFocusCallbackLock:Ljava/lang/Object;

    monitor-enter v0

    .line 418
    :try_start_3
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mOnFindFocusCallback:Ljava/lang/Runnable;

    .line 419
    monitor-exit v0

    return-void

    :catchall_7
    move-exception p1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw p1
.end method

.method public surfaceChanged(IIII)V
    .registers 7

    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SurfaceChanged. id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " width = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " height = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " format = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "CommonMapView"

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    iget-object p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    invoke-virtual {p2, p3, p4}, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->setSize(II)V

    .line 159
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->setActiveDisplayId(I)V

    const/4 p2, 0x1

    .line 160
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaceReinitNeeded:Z

    .line 161
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->paintTaskActive:Z

    .line 162
    sget-object p2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {p2, p1, p3, p4}, Lcom/navngo/igo/javaclient/Application;->surfaceSizeChanged(III)V

    .line 163
    sget-object p1, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {p1}, Lcom/navngo/igo/javaclient/ResumeHandler;->surfaceChanged()V

    return-void
.end method

.method public surfaceCreated(Landroid/view/Surface;I)V
    .registers 5

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceCreated() id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonMapView"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    new-instance v1, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    invoke-direct {v1, p0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;-><init>(Lcom/navngo/igo/javaclient/view/CommonMapView;Landroid/view/Surface;)V

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public surfaceDestroyed(I)V
    .registers 5

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceDestroyed() id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "CommonMapView"

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/view/CommonMapView;->getSurfaceData(I)Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;

    move-result-object v0

    .line 169
    iget-object v2, v0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mSurface:Landroid/view/Surface;

    if-eqz v2, :cond_2a

    .line 170
    iget-object v0, v0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 172
    :cond_2a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 173
    iget-object v0, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->mSurfaces:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-nez v0, :cond_39

    .line 174
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView;->paintTaskActive:Z

    .line 175
    :cond_39
    sget-object v0, Lcom/navngo/igo/javaclient/ResumeHandler;->INSTANCE:Lcom/navngo/igo/javaclient/ResumeHandler;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/ResumeHandler;->surfaceChanged()V

    .line 176
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/Application;->surfaceDestroyed(I)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.view.CommonMapView.KeyHandler (com.navngo.igo.javaclient.view.CommonMapView$KeyHandler)
.class public Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;
.super Ljava/lang/Object;
.source "CommonMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/view/CommonMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KeyHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;
    }
.end annotation


# static fields
.field private static final resultPrototype:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 54
    new-instance v0, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;-><init>(ZZ)V

    sput-object v0, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;->resultPrototype:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleKeyDown(ILandroid/view/KeyEvent;)Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;
    .registers 3

    .line 58
    sget-object p1, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;->resultPrototype:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;

    return-object p1
.end method

.method public handleKeyUp(ILandroid/view/KeyEvent;)Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;
    .registers 3

    .line 63
    sget-object p1, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;->resultPrototype:Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;

    return-object p1
.end method

###### Class com.navngo.igo.javaclient.view.CommonMapView.KeyHandler.Result (com.navngo.igo.javaclient.view.CommonMapView$KeyHandler$Result)
.class public Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;
.super Ljava/lang/Object;
.source "CommonMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation


# instance fields
.field public final eventHandled:Z

.field public final preventDefault:Z


# direct methods
.method public constructor <init>(ZZ)V
    .registers 3

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;->preventDefault:Z

    .line 50
    iput-boolean p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$KeyHandler$Result;->eventHandled:Z

    return-void
.end method

###### Class com.navngo.igo.javaclient.view.CommonMapView.NativeSurfaceData (com.navngo.igo.javaclient.view.CommonMapView$NativeSurfaceData)
.class public Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;
.super Ljava/lang/Object;
.source "CommonMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/view/CommonMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NativeSurfaceData"
.end annotation


# instance fields
.field public mHeight:I

.field public mSurface:Landroid/view/Surface;

.field public mWidth:I

.field final synthetic this$0:Lcom/navngo/igo/javaclient/view/CommonMapView;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/view/CommonMapView;IILandroid/view/Surface;)V
    .registers 5

    .line 80
    iput-object p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->this$0:Lcom/navngo/igo/javaclient/view/CommonMapView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mWidth:I

    .line 82
    iput p3, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mHeight:I

    .line 83
    iput-object p4, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mSurface:Landroid/view/Surface;

    return-void
.end method

.method constructor <init>(Lcom/navngo/igo/javaclient/view/CommonMapView;Landroid/view/Surface;)V
    .registers 4

    const/4 v0, 0x0

    .line 86
    invoke-direct {p0, p1, v0, v0, p2}, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;-><init>(Lcom/navngo/igo/javaclient/view/CommonMapView;IILandroid/view/Surface;)V

    return-void
.end method


# virtual methods
.method public setSize(II)V
    .registers 3

    .line 89
    iput p1, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mWidth:I

    .line 90
    iput p2, p0, Lcom/navngo/igo/javaclient/view/CommonMapView$NativeSurfaceData;->mHeight:I

    return-void
.end method
