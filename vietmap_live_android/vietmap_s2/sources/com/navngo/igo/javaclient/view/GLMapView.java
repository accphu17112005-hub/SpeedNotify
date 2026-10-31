package com.navngo.igo.javaclient.view;

import android.content.Context;
import android.graphics.PointF;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import java.nio.ShortBuffer;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class GLMapView extends SurfaceView implements SurfaceHolder.Callback2, IMapView {
    private static final int[] attribsToQuery = {12422, 12329, 12339, 12324, 12323, 12322, 12321, 12320, 12327, 12328, 12325, 12333, 12335, 12338, 12337, 12326, 12352, 12340, 12343, 12342, 12341};
    private static final String[] attribsToQueryNames = {"EGL_RENDER_BUFFER", "EGL_LEVEL", "EGL_SURFACE_TYPE", "EGL_RED_SIZE", "EGL_GREEN_SIZE", "EGL_BLUE_SIZE", "EGL_ALPHA_SIZE", "EGL_BUFFER_SIZE", "EGL_CONFIG_CAVEAT", "EGL_CONFIG_ID", "EGL_DEPTH_SIZE", "EGL_NATIVE_RENDERABLE", "EGL_NATIVE_VISUAL_TYPE", "EGL_SAMPLE_BUFFERS", "EGL_SAMPLES", "EGL_STENCIL_SIZE", "EGL_RENDERABLE_TYPE", "EGL_TRANSPARENT_TYPE", "EGL_TRANSPARENT_RED_VALUE", "EGL_TRANSPARENT_GREEN_VALUE", "EGL_TRANSPARENT_BLUE_VALUE"};
    private static final boolean bDrawTest = false;
    private static final String logname = "GLMapView";
    private int frameCount;
    protected CommonMapView mCommon;
    private OffscreenPresentListener mOffscreenPresentListener;
    private Renderer mRenderer;

    public interface OffscreenPresentListener {
        void onEndPaint(int i, EGLSurfaceData eGLSurfaceData);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static native boolean GrabSurfaceFast(int i, ByteBuffer byteBuffer);

    @Override // com.navngo.igo.javaclient.view.IMapView
    public View asView() {
        return this;
    }

    @Override // android.view.SurfaceHolder.Callback2
    public void surfaceRedrawNeeded(SurfaceHolder surfaceHolder) {
    }

    public static class EGLSurfaceData {
        public EGLSurface mEGLSurface;
        public int mHeight;
        public int mNativeSurfaceID;
        public boolean mOnScreen;
        public ByteBuffer mScreenBuffer;
        public int mWidth;

        EGLSurfaceData(int i, int i2, boolean z, EGLSurface eGLSurface, int i3) {
            this.mWidth = i;
            this.mHeight = i2;
            this.mOnScreen = z;
            this.mEGLSurface = eGLSurface;
            this.mNativeSurfaceID = i3;
            if (z) {
                this.mScreenBuffer = null;
                return;
            }
            ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(i * i2 * 4);
            this.mScreenBuffer = byteBufferAllocateDirect;
            byteBufferAllocateDirect.order(ByteOrder.nativeOrder());
        }
    }

    public void setOffscreenPresentListener(OffscreenPresentListener offscreenPresentListener) {
        this.mOffscreenPresentListener = offscreenPresentListener;
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public CommonMapView getCommonInterface() {
        return this.mCommon;
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder surfaceHolder) {
        surfaceCreated(surfaceHolder.getSurface(), 0);
    }

    public void surfaceCreated(Surface surface, int i) {
        this.mCommon.surfaceCreated(surface, i);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
        surfaceChanged(0, i, i2, i3);
    }

    public void surfaceChanged(int i, int i2, int i3, int i4) {
        this.mRenderer.surfaceChanged(i, i3, i4);
        this.mCommon.surfaceChanged(i, i2, i3, i4);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        surfaceDestroyed(0);
    }

    public void surfaceDestroyed(int i) {
        this.mCommon.surfaceDestroyed(i);
    }

    @Override // android.view.SurfaceHolder.Callback2
    public void surfaceRedrawNeededAsync(SurfaceHolder surfaceHolder, Runnable runnable) {
        this.mRenderer.surfaceRedrawNeededAsync(runnable);
    }

    public GLMapView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.frameCount = 0;
        this.mOffscreenPresentListener = null;
        init();
    }

    public GLMapView(Context context) {
        super(context);
        this.frameCount = 0;
        this.mOffscreenPresentListener = null;
        init();
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public void onPaintCallback(int i, int i2, int i3, int i4, int i5, int i6) {
        DebugLogger.D2(logname, "onPaintCallback: should not be called");
    }

    public boolean OpenGL_CreateBuffers() {
        DebugLogger.D3(logname, "OpenGL_CreateBuffers");
        if (this.mRenderer == null) {
            return false;
        }
        if (!hasValidSurface()) {
            DebugLogger.D2(logname, "createContext failed - there is no valid surface");
            return false;
        }
        try {
            return this.mRenderer.createContext();
        } catch (InterruptedException unused) {
            return false;
        }
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public boolean BeginPaint() {
        if (this.mRenderer == null) {
            DebugLogger.D2(logname, "No renderer present");
            return false;
        }
        if (!hasValidSurface()) {
            DebugLogger.D2(logname, "BeginPaint inactive/invalid");
            return false;
        }
        try {
            return this.mRenderer.my_beginPaint();
        } catch (InterruptedException unused) {
            return false;
        }
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public void EndPaint() {
        try {
            if (this.mRenderer == null) {
                DebugLogger.D2(logname, "No renderer present");
                return;
            }
            if (!hasValidSurface()) {
                DebugLogger.D2(logname, "EndPaint inactive/invalid");
                return;
            }
            this.mRenderer.my_endPaint();
            int i = this.frameCount + 1;
            this.frameCount = i;
            if (i == 2) {
                NNG.SendFirstFrameEvent();
            }
        } catch (Exception e) {
            DebugLogger.D2(logname, "Exception in GLMapView.EndPaint: " + e.getMessage(), e);
        }
    }

    public boolean OpenGL_DeleteBuffers() {
        DebugLogger.D4(logname, "OpenGL_DeleteBuffers");
        Renderer renderer = this.mRenderer;
        if (renderer == null) {
            return false;
        }
        renderer.deinitGL();
        this.frameCount = 0;
        return true;
    }

    public boolean OpenGL_CreateSurface(int i, int i2, int i3, boolean z, int i4) {
        DebugLogger.D3(logname, "OpenGL_CreateSurface");
        Renderer renderer = this.mRenderer;
        if (renderer == null) {
            return false;
        }
        return renderer.createSurface(i, i2, i3, z, i4);
    }

    public void OpenGL_DeleteSurface(int i) {
        DebugLogger.D3(logname, "OpenGL_DeleteSurface");
        Renderer renderer = this.mRenderer;
        if (renderer == null) {
            return;
        }
        renderer.deleteSurface(i);
    }

    public void OpenGL_ChangeHWDisplay(int i) {
        Renderer renderer = this.mRenderer;
        if (renderer == null) {
            return;
        }
        renderer.changeHWDisplay(i);
    }

    public void OpenGL_SwapBuffers(int i) {
        Renderer renderer = this.mRenderer;
        if (renderer == null) {
            return;
        }
        renderer.swapBuffers(i);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public boolean hasValidSurface() {
        return this.mRenderer != null && this.mCommon.hasValidSurface() && this.mCommon.paintTaskActive;
    }

    private synchronized void init() {
        CommonMapView commonMapView = new CommonMapView(this);
        this.mCommon = commonMapView;
        commonMapView.init();
        this.mRenderer = new Renderer();
        getHolder().addCallback(this);
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public void onPause() {
        onPause(0);
    }

    public void onPause(int i) {
        DebugLogger.D4(logname, "onPause");
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public void onResume() {
        onResume(0);
    }

    public void onResume(int i) {
        DebugLogger.D4(logname, "onResume");
    }

    @Override // android.view.SurfaceView, android.view.View
    protected synchronized void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mCommon.onDetachedFromWindow();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        super.onTouchEvent(motionEvent);
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

    class Renderer {
        private static final int EGL_CONTEXT_CLIENT_VERSION = 12440;
        private static final int EGL_RECORDABLE_ANDROID = 12610;
        private static final int INVALID_SURFACE_ID = -1;
        private static final String logname = "GLMapView.Renderer";
        private EGL10 egl;
        private EGLConfig eglConfig;
        private EGLContext eglContext;
        private EGLDisplay eglDisplay;
        private GL10 gl;
        private ByteBuffer mColorArray;
        private SparseArray<EGLSurfaceData> mSurfaceMap;
        private ShortBuffer mVertexArray;
        private boolean inited = false;
        private Runnable mDrawingFinishedRunnable = null;
        private boolean mTestInited = false;
        private int mRotation = 0;
        private int mCurrentSurfaceID = -1;

        private int FixedFromInt(int i) {
            return i << 16;
        }

        private void deinitTest() {
        }

        private void drawTest(GL10 gl10) {
        }

        public void my_endPaint() {
        }

        public void stepTest() {
        }

        Renderer() {
            this.mSurfaceMap = null;
            this.mSurfaceMap = new SparseArray<>();
        }

        public EGLSurfaceData getEGLSurfaceData(int i) {
            return this.mSurfaceMap.get(i);
        }

        public EGLSurface getSurface(int i) {
            EGLSurfaceData eGLSurfaceData = getEGLSurfaceData(i);
            if (eGLSurfaceData == null) {
                return null;
            }
            return eGLSurfaceData.mEGLSurface;
        }

        public EGLSurface getCurrentSurface() {
            return getSurface(this.mCurrentSurfaceID);
        }

        public boolean createContext() throws InterruptedException {
            DebugLogger.D3(logname, "createContext BEGIN");
            if (this.egl == null) {
                this.egl = (EGL10) EGLContext.getEGL();
            }
            if (!tryInitGL()) {
                return false;
            }
            initTest(this.gl);
            return true;
        }

        private boolean tryInitGL() {
            DebugLogger.D3(logname, "tryInitGL:");
            try {
                if (initGL()) {
                    DebugLogger.D2(logname, "tryInitGL succeed.");
                    return true;
                }
            } catch (Exception e) {
                DebugLogger.D1(logname, "Exception during initGL:", e);
                e.printStackTrace();
            }
            DebugLogger.D2(logname, "tryInitGL failed.");
            deinitGL();
            DebugLogger.D5(logname, "tryInitGL END");
            return false;
        }

        public boolean my_beginPaint() throws InterruptedException {
            if (this.inited && this.egl != null) {
                return true;
            }
            DebugLogger.D2(logname, "my_beginPaint GL not inited");
            return false;
        }

        public void testPaint() {
            drawTest(this.gl);
        }

        private void GL_Error() {
            String str;
            int iGlGetError = this.gl.glGetError();
            if (iGlGetError == 0) {
                return;
            }
            switch (iGlGetError) {
                case 1280:
                    str = "GL_INVALID_ENUM";
                    break;
                case 1281:
                    str = "GL_INVALID_VALUE";
                    break;
                case 1282:
                    str = "GL_INVALID_OPERATION";
                    break;
                default:
                    str = String.format("GL error code: 0x%x", Integer.valueOf(iGlGetError));
                    break;
            }
            DebugLogger.D2(logname, str);
        }

        private void EGL_Error() {
            String str;
            int iEglGetError = this.egl.eglGetError();
            if (iEglGetError == 12288) {
                return;
            }
            switch (iEglGetError) {
                case 12289:
                    str = "EGL_NOT_INITIALIZED";
                    break;
                case 12290:
                    str = "EGL_BAD_ACCESS";
                    break;
                case 12291:
                    str = "EGL_BAD_ALLOC";
                    break;
                case 12292:
                    str = "EGL_BAD_ATTRIBUTE";
                    break;
                case 12293:
                    str = "EGL_BAD_CONFIG";
                    break;
                case 12294:
                    str = "EGL_BAD_CONTEXT";
                    break;
                case 12295:
                    str = "EGL_BAD_CURRENT_SURFACE";
                    break;
                case 12296:
                    str = "EGL_BAD_DISPLAY";
                    break;
                case 12297:
                    str = "EGL_BAD_MATCH";
                    break;
                case 12298:
                    str = "EGL_BAD_NATIVE_PIXMAP";
                    break;
                case 12299:
                    str = "EGL_BAD_NATIVE_WINDOW";
                    break;
                case 12300:
                    str = "EGL_BAD_PARAMETER";
                    break;
                case 12301:
                    str = "EGL_BAD_SURFACE";
                    break;
                default:
                    str = String.format("unknown EGL error:0x%x", Integer.valueOf(iEglGetError));
                    break;
            }
            DebugLogger.D2(logname, str);
        }

        private boolean tryGetEGLConfig(int[] iArr, EGLConfig[] eGLConfigArr, int[] iArr2) {
            if (!this.egl.eglChooseConfig(this.eglDisplay, iArr, eGLConfigArr, eGLConfigArr.length, iArr2)) {
                DebugLogger.D2(logname, "initGL: No config present.");
                return false;
            }
            DebugLogger.D3(logname, "initGL:" + iArr2[0] + " config(s) present.");
            return iArr2[0] > 0;
        }

        boolean createSurface(int i, int i2, int i3, boolean z, int i4) {
            EGLSurface eGLSurfaceEglCreatePbufferSurface;
            DebugLogger.D3(logname, "createSurface: id=" + i + " width=" + i2 + " height=" + i3 + " onscreen=" + z);
            if (getEGLSurfaceData(i) != null) {
                DebugLogger.D3(logname, "createSurface: surface with id=" + i + " already exists!");
                return false;
            }
            if (z) {
                eGLSurfaceEglCreatePbufferSurface = this.egl.eglCreateWindowSurface(this.eglDisplay, this.eglConfig, GLMapView.this.mCommon.getSurfaceData(i4).mSurface, null);
            } else {
                eGLSurfaceEglCreatePbufferSurface = this.egl.eglCreatePbufferSurface(this.eglDisplay, this.eglConfig, new int[]{12375, i2, 12374, i3, 12344});
            }
            EGLSurface eGLSurface = eGLSurfaceEglCreatePbufferSurface;
            EGL_Error();
            if (eGLSurface.equals(EGL10.EGL_NO_SURFACE)) {
                DebugLogger.D3(logname, "createSurface: eglCreateWindowSurface returned EGL_NO_SURFACE!");
                return false;
            }
            EGLSurfaceData eGLSurfaceData = new EGLSurfaceData(i2, i3, z, eGLSurface, i4);
            if (this.mSurfaceMap.size() == 0) {
                makeCurrentGL(eGLSurfaceData);
                this.mCurrentSurfaceID = i;
                GLMapView.this.mCommon.setActiveDisplayId(i4);
                dumpGLInfo(eGLSurfaceData);
            }
            this.mSurfaceMap.append(i, eGLSurfaceData);
            return true;
        }

        void deleteSurface(int i) {
            DebugLogger.D3(logname, "deleteSurface: id=" + i);
            EGLSurfaceData eGLSurfaceData = this.mSurfaceMap.get(i);
            if (eGLSurfaceData != null) {
                deinitSurface(eGLSurfaceData.mEGLSurface, this.mCurrentSurfaceID == i);
                this.mSurfaceMap.delete(i);
            } else {
                DebugLogger.D2(logname, "deleteSurface: invalid surface ID: " + i);
            }
        }

        void changeHWDisplay(int i) {
            EGLSurfaceData eGLSurfaceData = getEGLSurfaceData(i);
            if (eGLSurfaceData != null && eGLSurfaceData.mEGLSurface != null) {
                makeCurrentGL(eGLSurfaceData);
                this.mCurrentSurfaceID = i;
                GLMapView.this.mCommon.setActiveDisplayId(eGLSurfaceData.mNativeSurfaceID);
            } else {
                DebugLogger.D2(logname, "changeHWDisplay: no surface with ID: " + i);
            }
        }

        void surfaceChanged(int i, int i2, int i3) {
            EGLSurfaceData eGLSurfaceData = getEGLSurfaceData(i);
            if (eGLSurfaceData != null) {
                eGLSurfaceData.mWidth = i2;
                eGLSurfaceData.mHeight = i3;
            } else {
                DebugLogger.D3(logname, "surfaceChanged: no surface found with ID:" + i);
            }
        }

        void surfaceRedrawNeededAsync(Runnable runnable) {
            Runnable runnable2 = this.mDrawingFinishedRunnable;
            if (runnable2 != null) {
                runnable2.run();
                this.mDrawingFinishedRunnable = null;
            }
            this.mDrawingFinishedRunnable = runnable;
        }

        void swapBuffers(int i) {
            EGLSurfaceData eGLSurfaceData = getEGLSurfaceData(i);
            if (eGLSurfaceData != null) {
                if (!eGLSurfaceData.mOnScreen) {
                    if (GLMapView.this.mOffscreenPresentListener != null) {
                        if (GLMapView.GrabSurfaceFast(i, eGLSurfaceData.mScreenBuffer)) {
                            GLMapView.this.mOffscreenPresentListener.onEndPaint(i, eGLSurfaceData);
                            return;
                        }
                        DebugLogger.D2(logname, "swapBuffers: grab surface failed! Display id: " + i);
                        return;
                    }
                    return;
                }
                if (eGLSurfaceData.mEGLSurface != null) {
                    Runnable runnable = this.mDrawingFinishedRunnable;
                    if (runnable != null) {
                        runnable.run();
                        this.mDrawingFinishedRunnable = null;
                    }
                    this.egl.eglSwapBuffers(this.eglDisplay, eGLSurfaceData.mEGLSurface);
                    EGL_Error();
                    return;
                }
                DebugLogger.D2(logname, "swapBuffers: no surface with ID: " + i);
                return;
            }
            DebugLogger.D2(logname, "swapBuffers: no surface data for id: " + i);
        }

        private boolean initGL() {
            DebugLogger.D3(logname, "initGL");
            if (this.inited) {
                return true;
            }
            EGL10 egl10 = (EGL10) EGLContext.getEGL();
            this.egl = egl10;
            this.eglDisplay = egl10.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
            EGL_Error();
            if (this.eglDisplay.equals(EGL10.EGL_NO_DISPLAY)) {
                DebugLogger.D2(logname, "initGL: eglGetDisplay returned EGL_NO_DISPLAY!");
                return false;
            }
            int[] iArr = new int[2];
            this.egl.eglInitialize(this.eglDisplay, iArr);
            EGL_Error();
            DebugLogger.D3(logname, "EGL: ver = " + iArr[0] + "." + iArr[1]);
            boolean bool = Config.getBool("android", "egl_recordable", false);
            int i = bool ? 1 : -1;
            int i2 = bool ? 5 : 4;
            int i3 = Config.getInt("rawdisplay", "subsamples", 4);
            int i4 = Config.getInt("rawdisplay", "alpha_size", 0);
            if (i4 > 0) {
                GLMapView.this.getHolder().setFormat(-3);
            }
            int[][] iArr2 = new int[4][];
            int[] iArr3 = new int[23];
            iArr3[0] = 12325;
            iArr3[1] = 16;
            iArr3[2] = 12339;
            iArr3[3] = i2;
            iArr3[4] = 12338;
            iArr3[5] = i3 != 0 ? 1 : 0;
            iArr3[6] = 12337;
            iArr3[7] = i3;
            iArr3[8] = 12324;
            iArr3[9] = 8;
            iArr3[10] = 12323;
            iArr3[11] = 8;
            iArr3[12] = 12322;
            iArr3[13] = 8;
            iArr3[14] = 12321;
            iArr3[15] = i4;
            iArr3[16] = 12326;
            iArr3[17] = 8;
            iArr3[18] = 12352;
            iArr3[19] = 4;
            iArr3[20] = EGL_RECORDABLE_ANDROID;
            iArr3[21] = i;
            iArr3[22] = 12344;
            iArr2[0] = iArr3;
            iArr2[1] = new int[]{12325, 16, 12339, i2, 12324, 8, 12323, 8, 12322, 8, 12321, i4, 12326, 8, 12352, 4, EGL_RECORDABLE_ANDROID, i, 12344};
            int[] iArr4 = new int[21];
            iArr4[0] = 12325;
            iArr4[1] = 16;
            iArr4[2] = 12339;
            iArr4[3] = i2;
            iArr4[4] = 12338;
            iArr4[5] = i3 != 0 ? 1 : 0;
            iArr4[6] = 12337;
            iArr4[7] = i3;
            iArr4[8] = 12324;
            iArr4[9] = 4;
            iArr4[10] = 12323;
            iArr4[11] = 4;
            iArr4[12] = 12322;
            iArr4[13] = 4;
            iArr4[14] = 12321;
            iArr4[15] = i4;
            iArr4[16] = 12352;
            iArr4[17] = 4;
            iArr4[18] = EGL_RECORDABLE_ANDROID;
            iArr4[19] = i;
            iArr4[20] = 12344;
            iArr2[2] = iArr4;
            iArr2[3] = new int[]{12325, 16, 12339, i2, 12324, 4, 12323, 4, 12322, 4, 12321, i4, 12352, 4, EGL_RECORDABLE_ANDROID, i, 12344};
            EGLConfig[] eGLConfigArr = new EGLConfig[100];
            int[] iArr5 = new int[1];
            boolean z = false;
            for (int i5 = 0; !z && i5 < 4; i5++) {
                if (tryGetEGLConfig(iArr2[i5], eGLConfigArr, iArr5)) {
                    z = true;
                } else {
                    DebugLogger.D2(logname, "No proper EGL config present! (ConfigSet " + i5 + ")");
                }
            }
            if (!z) {
                DebugLogger.D2(logname, "No proper EGL config present!");
                return false;
            }
            int[] iArr6 = {EGL_CONTEXT_CLIENT_VERSION, 2, 12344};
            for (int i6 = 0; i6 < iArr5[0]; i6++) {
                EGLConfig eGLConfig = eGLConfigArr[i6];
                this.eglConfig = eGLConfig;
                this.eglContext = this.egl.eglCreateContext(this.eglDisplay, eGLConfig, EGL10.EGL_NO_CONTEXT, iArr6);
                EGL_Error();
                if (!this.eglContext.equals(EGL10.EGL_NO_CONTEXT)) {
                    break;
                }
            }
            if (this.eglContext.equals(EGL10.EGL_NO_CONTEXT)) {
                DebugLogger.D2(logname, "initGL: eglCreateContext returned EGL_NO_CONTEXT!");
                return false;
            }
            this.gl = (GL10) this.eglContext.getGL();
            EGL_Error();
            this.inited = true;
            return true;
        }

        private void dumpGLInfo(EGLSurfaceData eGLSurfaceData) {
            DebugLogger.D3(logname, "initGl D " + this.eglDisplay + " S " + eGLSurfaceData.mEGLSurface + " C " + this.eglContext);
            StringBuilder sb = new StringBuilder();
            sb.append("initGL: VENDOR = ");
            sb.append(this.gl.glGetString(7936));
            DebugLogger.D3(logname, sb.toString());
            DebugLogger.D3(logname, "initGL: RENDERER = " + this.gl.glGetString(7937));
            DebugLogger.D3(logname, "initGL: VERSION = " + this.gl.glGetString(7938));
            DebugLogger.D3(logname, "initGL: EXTENSIONS = " + this.gl.glGetString(7939));
            IntBuffer intBufferAllocate = IntBuffer.allocate(1);
            this.gl.glGetIntegerv(3410, intBufferAllocate);
            DebugLogger.D3(logname, "initGL: RED_BITS = " + intBufferAllocate.get(0));
            this.gl.glGetIntegerv(3411, intBufferAllocate);
            DebugLogger.D3(logname, "initGL: GREEN_BITS = " + intBufferAllocate.get(0));
            this.gl.glGetIntegerv(3412, intBufferAllocate);
            DebugLogger.D3(logname, "initGL: BLUE_BITS = " + intBufferAllocate.get(0));
            this.gl.glGetIntegerv(3413, intBufferAllocate);
            DebugLogger.D3(logname, "initGL: ALPHA_BITS = " + intBufferAllocate.get(0));
            this.gl.glGetIntegerv(3414, intBufferAllocate);
            DebugLogger.D3(logname, "initGL: DEPTH_BITS = " + intBufferAllocate.get(0));
            this.gl.glGetIntegerv(3415, intBufferAllocate);
            DebugLogger.D3(logname, "initGL: STENCIL_BITS = " + intBufferAllocate.get(0));
            int length = GLMapView.attribsToQuery.length;
            while (true) {
                int i = length - 1;
                if (length <= 0) {
                    return;
                }
                int[] iArr = new int[1];
                if (this.egl.eglGetConfigAttrib(this.eglDisplay, this.eglConfig, GLMapView.attribsToQuery[i], iArr)) {
                    DebugLogger.D3(logname, "initGL: " + GLMapView.attribsToQueryNames[i] + " = " + iArr[0]);
                } else {
                    DebugLogger.D3(logname, "initGL: " + GLMapView.attribsToQueryNames[i] + " N/A ");
                }
                length = i;
            }
        }

        private void makeCurrentGL(EGLSurfaceData eGLSurfaceData) {
            if (!this.inited) {
                DebugLogger.D2(logname, "makecurrent called without an initGL");
            } else {
                this.egl.eglMakeCurrent(this.eglDisplay, eGLSurfaceData.mEGLSurface, eGLSurfaceData.mEGLSurface, this.eglContext);
                EGL_Error();
            }
        }

        public void releaseContext() {
            EGLDisplay eGLDisplay = this.eglDisplay;
            if (eGLDisplay != null) {
                this.egl.eglMakeCurrent(eGLDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                EGL_Error();
            }
        }

        public void deinitSurface(EGLSurface eGLSurface, boolean z) {
            DebugLogger.D5(logname, "deinitSurface");
            if (eGLSurface != null) {
                if (z) {
                    DebugLogger.D5(logname, "DeinitSurface:eglMakeCurrent");
                    this.egl.eglMakeCurrent(this.eglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
                    EGL_Error();
                }
                DebugLogger.D4(logname, "deinitSurface:eglDestroySurface");
                this.egl.eglDestroySurface(this.eglDisplay, eGLSurface);
                EGL_Error();
            }
        }

        public void deinitGL() {
            DebugLogger.D4(logname, "deinitGL");
            deinitTest();
            this.inited = false;
            EGLDisplay eGLDisplay = this.eglDisplay;
            if (eGLDisplay != null && !eGLDisplay.equals(EGL10.EGL_NO_DISPLAY)) {
                EGLContext eGLContext = this.eglContext;
                if (eGLContext != null && !eGLContext.equals(EGL10.EGL_NO_CONTEXT)) {
                    DebugLogger.D4(logname, "deinitContext:eglDestroyContext");
                    releaseContext();
                    this.egl.eglDestroyContext(this.eglDisplay, this.eglContext);
                    EGL_Error();
                }
                DebugLogger.D4(logname, "deinitContext:eglTerminate");
                this.egl.eglTerminate(this.eglDisplay);
            }
            this.gl = null;
            this.egl = null;
            this.eglDisplay = null;
            this.eglConfig = null;
            this.eglContext = null;
            this.mCurrentSurfaceID = -1;
        }

        private void initTest(GL10 gl10) {
            if (this.mTestInited) {
                return;
            }
            this.mTestInited = true;
        }
    }

    @Override // com.navngo.igo.javaclient.view.IMapView
    public PointF mapMousePoints(float f, float f2) {
        return new PointF(f, f2);
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
