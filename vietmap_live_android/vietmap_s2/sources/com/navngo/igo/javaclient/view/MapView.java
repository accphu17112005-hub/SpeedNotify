package com.navngo.igo.javaclient.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class MapView extends SurfaceView implements SurfaceHolder.Callback, IMapView {
    private static final String logname = "MapView";
    private volatile int height565;
    private int lastOrientation;
    public long log_fps_counter;
    public long log_fps_counter_logged;
    public long log_fps_tick;
    public long log_fps_tick_logged;
    public long log_fps_tick_start;
    private CommonMapView mCommon;
    volatile Matrix mMouseMatrix;
    private int mSurfaceHeight;
    private int mSurfaceWidth;
    volatile Matrix matrix888;
    private volatile boolean onDrawDetectedRotation;
    private boolean renderBlack;
    private boolean renderBlack_had_timed_out;
    private long renderBlack_started_at;
    private volatile int width565;

    @Override // com.navngo.igo.javaclient.view.IMapView
    public void EndPaint() {
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public View asView() {
        return this;
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public boolean hasValidSurface() {
        return false;
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public CommonMapView getCommonInterface() {
        return this.mCommon;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        this.mCommon.surfaceCreated(surfaceHolder.getSurface(), 0);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        this.mSurfaceWidth = i2;
        this.mSurfaceHeight = i3;
        this.mCommon.surfaceChanged(0, i, i2, i3);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        this.mCommon.surfaceDestroyed(0);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public boolean BeginPaint() {
        SurfaceHolder holder = getHolder();
        if (!this.mCommon.paintTaskActive || holder.getSurface() == null || !holder.getSurface().isValid()) {
            return false;
        }
        int i = this.mSurfaceWidth * this.mSurfaceHeight;
        if (i <= 0) {
            return true;
        }
        if (Application.bufferB_ARGB8888 != null && i <= Application.bufferB_ARGB8888.length) {
            return true;
        }
        DebugLogger.D5(logname, "Reallocating buffer");
        Application.bufferB_ARGB8888 = new int[i];
        NNG.setBuffer888(Application.bufferB_ARGB8888);
        return true;
    }

    public MapView(Context context) {
        super(context);
        this.renderBlack = false;
        this.renderBlack_had_timed_out = false;
        this.lastOrientation = -1;
        this.onDrawDetectedRotation = false;
        this.matrix888 = new Matrix();
        this.mMouseMatrix = new Matrix();
        this.mSurfaceWidth = 0;
        this.mSurfaceHeight = 0;
        this.log_fps_counter = 0L;
        this.log_fps_counter_logged = 0L;
        this.log_fps_tick_start = 0L;
        this.log_fps_tick = 0L;
        this.log_fps_tick_logged = SystemClock.elapsedRealtime();
        this.width565 = 1;
        this.height565 = 1;
        init();
    }

    public MapView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.renderBlack = false;
        this.renderBlack_had_timed_out = false;
        this.lastOrientation = -1;
        this.onDrawDetectedRotation = false;
        this.matrix888 = new Matrix();
        this.mMouseMatrix = new Matrix();
        this.mSurfaceWidth = 0;
        this.mSurfaceHeight = 0;
        this.log_fps_counter = 0L;
        this.log_fps_counter_logged = 0L;
        this.log_fps_tick_start = 0L;
        this.log_fps_tick = 0L;
        this.log_fps_tick_logged = SystemClock.elapsedRealtime();
        this.width565 = 1;
        this.height565 = 1;
        init();
    }

    public MapView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.renderBlack = false;
        this.renderBlack_had_timed_out = false;
        this.lastOrientation = -1;
        this.onDrawDetectedRotation = false;
        this.matrix888 = new Matrix();
        this.mMouseMatrix = new Matrix();
        this.mSurfaceWidth = 0;
        this.mSurfaceHeight = 0;
        this.log_fps_counter = 0L;
        this.log_fps_counter_logged = 0L;
        this.log_fps_tick_start = 0L;
        this.log_fps_tick = 0L;
        this.log_fps_tick_logged = SystemClock.elapsedRealtime();
        this.width565 = 1;
        this.height565 = 1;
        init();
    }

    private synchronized void init() {
        DebugLogger.D3(logname, "init()");
        this.mCommon = new CommonMapView(this);
        getHolder().addCallback(this);
        this.mCommon.init();
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public void onPaintCallback(int i, int i2, int i3, int i4, int i5, int i6) {
        this.width565 = i;
        this.height565 = i2;
        if (this.onDrawDetectedRotation) {
            this.onDrawDetectedRotation = false;
        }
        fullRedraw();
    }

    public boolean OpenGL_CreateBuffers() {
        DebugLogger.D2(logname, "OpenGL_CreateBuffers: should not be called");
        return false;
    }

    public boolean OpenGL_PrepareBuffers() {
        DebugLogger.D2(logname, "OpenGL_PrepareBuffers: should not be called");
        return false;
    }

    public void OpenGL_SwapBuffers(int i, int i2) {
        DebugLogger.D2(logname, "OpenGL_SwapBuffers: should not be called");
    }

    public boolean OpenGL_DeleteBuffers() {
        DebugLogger.D2(logname, "OpenGL_DeleteBuffers: should not be called");
        return false;
    }

    private void fullRedraw() {
        if (this.mCommon.paintTaskActive && isShown()) {
            if (NNG.javaPainting) {
                DebugLogger.D3(logname, "Skipping fullRedraw because we are already doing a fullRedraw");
                return;
            }
            NNG.javaPainting = true;
            SurfaceHolder holder = getHolder();
            Canvas canvasLockCanvas = null;
            try {
                canvasLockCanvas = holder.lockCanvas();
                if (canvasLockCanvas != null) {
                    synchronized (holder) {
                        doDraw(canvasLockCanvas);
                    }
                } else {
                    DebugLogger.D2(logname, "Returned Canvas object null!!!!!");
                }
            } finally {
                if (canvasLockCanvas != null) {
                    holder.unlockCanvasAndPost(canvasLockCanvas);
                }
                NNG.javaPainting = false;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x022a  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x022b A[Catch: all -> 0x0258, TryCatch #1 {, blocks: (B:40:0x00e9, B:44:0x00f2, B:47:0x010e, B:49:0x0112, B:54:0x011c, B:56:0x013a, B:71:0x01c2, B:73:0x01c8, B:75:0x01d0, B:87:0x0226, B:91:0x0234, B:95:0x023b, B:97:0x0256, B:96:0x0252, B:90:0x022b, B:76:0x01df, B:78:0x01ea, B:80:0x01f5, B:81:0x01f8, B:82:0x0200, B:83:0x0211, B:85:0x0216, B:55:0x012a, B:59:0x0165, B:61:0x0169, B:66:0x0173, B:68:0x0192, B:67:0x0185, B:69:0x01b9), top: B:106:0x00e9, outer: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0252 A[Catch: all -> 0x0258, TryCatch #1 {, blocks: (B:40:0x00e9, B:44:0x00f2, B:47:0x010e, B:49:0x0112, B:54:0x011c, B:56:0x013a, B:71:0x01c2, B:73:0x01c8, B:75:0x01d0, B:87:0x0226, B:91:0x0234, B:95:0x023b, B:97:0x0256, B:96:0x0252, B:90:0x022b, B:76:0x01df, B:78:0x01ea, B:80:0x01f5, B:81:0x01f8, B:82:0x0200, B:83:0x0211, B:85:0x0216, B:55:0x012a, B:59:0x0165, B:61:0x0169, B:66:0x0173, B:68:0x0192, B:67:0x0185, B:69:0x01b9), top: B:106:0x00e9, outer: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    protected void doDraw(android.graphics.Canvas r18) {
        /*
            Method dump skipped, instruction units count: 636
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.view.MapView.doDraw(android.graphics.Canvas):void");
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public synchronized void onPause() {
        DebugLogger.D5(logname, "onPause");
        setVisibility(8);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public synchronized void onResume() {
        DebugLogger.D5(logname, "onResume");
        setVisibility(0);
    }

    @Override // android.view.SurfaceView, android.view.View
    protected synchronized void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mCommon.onDetachedFromWindow();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        return this.mCommon.onTouchEvent(motionEvent);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        return this.mCommon.onKeyUp(i, keyEvent);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public boolean superonKeyUp(int i, KeyEvent keyEvent) {
        return super.onKeyUp(i, keyEvent);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return this.mCommon.onKeyDown(i, keyEvent);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public boolean superonKeyDown(int i, KeyEvent keyEvent) {
        return super.onKeyDown(i, keyEvent);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public PointF mapMousePoints(float f, float f2) {
        float[] fArr = {0.0f, 0.0f, f, f2};
        if (Config.mouse_matrix_hack == 3) {
            this.mMouseMatrix.mapPoints(fArr);
            this.matrix888.mapPoints(fArr);
        }
        return new PointF(fArr[2] - fArr[0], fArr[3] - fArr[1]);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public int get_Width() {
        return getWidth();
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public int get_Height() {
        return getHeight();
    }

    @Override // android.view.View
    public View findFocus() {
        this.mCommon.findFocus();
        return super.findFocus();
    }
}
