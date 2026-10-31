###### Class com.navngo.igo.javaclient.view.IMapView (com.navngo.igo.javaclient.view.IMapView)
.class public interface abstract Lcom/navngo/igo/javaclient/view/IMapView;
.super Ljava/lang/Object;
.source "IMapView.java"


# virtual methods
.method public abstract BeginPaint()Z
.end method

.method public abstract EndPaint()V
.end method

.method public abstract asView()Landroid/view/View;
.end method

.method public abstract getCommonInterface()Lcom/navngo/igo/javaclient/view/CommonMapView;
.end method

.method public abstract get_Height()I
.end method

.method public abstract get_Width()I
.end method

.method public abstract hasValidSurface()Z
.end method

.method public abstract mapMousePoints(FF)Landroid/graphics/PointF;
.end method

.method public abstract onPaintCallback(IIIIII)V
.end method

.method public abstract onPause()V
.end method

.method public abstract onResume()V
.end method

.method public abstract superonKeyDown(ILandroid/view/KeyEvent;)Z
.end method

.method public abstract superonKeyUp(ILandroid/view/KeyEvent;)Z
.end method
