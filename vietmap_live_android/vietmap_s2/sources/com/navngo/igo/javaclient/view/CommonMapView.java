package com.navngo.igo.javaclient.view;

import android.media.AudioManager;
import android.util.SparseArray;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.View;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.R;
import com.navngo.igo.javaclient.ResumeHandler;
import com.navngo.igo.javaclient.ServerRunner;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class CommonMapView {
    public static final int IGO_KEYCODE_BACKSPACE = 8;
    public static final int IGO_KEYCODE_DOWN = 40;
    public static final int IGO_KEYCODE_ENTER = 13;
    public static final int IGO_KEYCODE_LEFT = 37;
    public static final int IGO_KEYCODE_MENU = 200;
    public static final int IGO_KEYCODE_PREVSCREEN = 4;
    public static final int IGO_KEYCODE_RIGHT = 39;
    public static final int IGO_KEYCODE_UNICODE = 65536;
    public static final int IGO_KEYCODE_UP = 38;
    private static final String logname = "CommonMapView";
    private final IMapView mIOwner;
    private KeyHandler mKeyHandler;
    private SparseArray<NativeSurfaceData> mSurfaces;
    private final View mVOwner;
    volatile boolean paintTaskActive = false;
    private boolean altPressed = false;
    private boolean shiftPressed = false;
    private KeyCharacterMap km = KeyCharacterMap.load(0);
    private int mActiveDisplayId = 0;
    private boolean mSurfaceReinitNeeded = false;
    private long last_drag = 0;
    private Runnable mOnFindFocusCallback = null;
    private final Object mOnFindFocusCallbackLock = new Object();

    public static class KeyHandler {
        private static final Result resultPrototype = new Result(false, true);

        public static class Result {
            public final boolean eventHandled;
            public final boolean preventDefault;

            public Result(boolean z, boolean z2) {
                this.preventDefault = z;
                this.eventHandled = z2;
            }
        }

        public Result handleKeyDown(int i, KeyEvent keyEvent) {
            return resultPrototype;
        }

        public Result handleKeyUp(int i, KeyEvent keyEvent) {
            return resultPrototype;
        }
    }

    public void setKeyHandler(KeyHandler keyHandler) {
        this.mKeyHandler = keyHandler;
    }

    public KeyHandler getKeyHandler() {
        return this.mKeyHandler;
    }

    public class NativeSurfaceData {
        public int mHeight;
        public Surface mSurface;
        public int mWidth;

        NativeSurfaceData(int i, int i2, Surface surface) {
            this.mWidth = i;
            this.mHeight = i2;
            this.mSurface = surface;
        }

        NativeSurfaceData(CommonMapView commonMapView, Surface surface) {
            this(0, 0, surface);
        }

        public void setSize(int i, int i2) {
            this.mWidth = i;
            this.mHeight = i2;
        }
    }

    int getActiveDisplayId() {
        return this.mActiveDisplayId;
    }

    void setActiveDisplayId(int i) {
        this.mActiveDisplayId = i;
    }

    NativeSurfaceData getSurfaceData(int i) {
        return this.mSurfaces.get(i);
    }

    NativeSurfaceData getActiveSurfaceData() {
        return this.mSurfaces.get(this.mActiveDisplayId);
    }

    /* JADX WARN: Multi-variable type inference failed */
    CommonMapView(IMapView iMapView) {
        this.mSurfaces = null;
        this.mIOwner = iMapView;
        View view = (View) iMapView;
        this.mVOwner = view;
        view.setId(R.id.iMapView);
        this.mSurfaces = new SparseArray<>();
    }

    void init() {
        DebugLogger.D3(logname, "init()");
        Application.setMapView(this.mIOwner);
        requestFocus();
    }

    public void requestFocus() {
        this.mVOwner.setFocusable(true);
        this.mVOwner.setFocusableInTouchMode(true);
        this.mVOwner.requestFocus();
    }

    public boolean hasValidSurface() {
        for (int i = 0; i < this.mSurfaces.size(); i++) {
            NativeSurfaceData nativeSurfaceDataValueAt = this.mSurfaces.valueAt(i);
            if (nativeSurfaceDataValueAt != null && nativeSurfaceDataValueAt.mSurface != null && nativeSurfaceDataValueAt.mSurface.isValid()) {
                return true;
            }
        }
        return false;
    }

    public boolean CheckForSurfaceChange() {
        boolean z = this.mSurfaceReinitNeeded;
        this.mSurfaceReinitNeeded = false;
        return z;
    }

    public void surfaceCreated(Surface surface, int i) {
        DebugLogger.D3(logname, String.format("surfaceCreated() id = " + i, new Object[0]));
        this.mSurfaces.put(i, new NativeSurfaceData(this, surface));
    }

    public void surfaceChanged(int i, int i2, int i3, int i4) {
        DebugLogger.D3(logname, String.format("SurfaceChanged. id = " + i + " width = " + i3 + " height = " + i4 + " format = " + i2, new Object[0]));
        this.mSurfaces.get(i).setSize(i3, i4);
        setActiveDisplayId(i);
        this.mSurfaceReinitNeeded = true;
        this.paintTaskActive = true;
        Application.anApplication.surfaceSizeChanged(i, i3, i4);
        ResumeHandler.INSTANCE.surfaceChanged();
    }

    public void surfaceDestroyed(int i) {
        DebugLogger.D3(logname, String.format("surfaceDestroyed() id = " + i, new Object[0]));
        NativeSurfaceData surfaceData = getSurfaceData(i);
        if (surfaceData.mSurface != null) {
            surfaceData.mSurface.release();
        }
        this.mSurfaces.delete(i);
        if (this.mSurfaces.size() == 0) {
            this.paintTaskActive = false;
        }
        ResumeHandler.INSTANCE.surfaceChanged();
        Application.anApplication.surfaceDestroyed(i);
    }

    synchronized void onDetachedFromWindow() {
        DebugLogger.D5(logname, "onDetachedFromWindow");
    }

    boolean onTouchEvent(MotionEvent motionEvent) {
        return onTouchEvent(0, motionEvent);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x00a9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public boolean onTouchEvent(int r13, android.view.MotionEvent r14) {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump change 'Code comments level' option to 'DEBUG'
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.view.CommonMapView.onTouchEvent(int, android.view.MotionEvent):boolean");
    }

    boolean onKeyUp(int i, KeyEvent keyEvent) {
        DebugLogger.D4(logname, "onKeyUp: " + i + "," + keyEvent);
        return onKeyEvent(i, keyEvent, ServerRunner.KeyState.UP);
    }

    boolean onKeyDown(int i, KeyEvent keyEvent) {
        DebugLogger.D4(logname, "onKeyDown: " + i + "," + keyEvent);
        return onKeyEvent(i, keyEvent, ServerRunner.KeyState.DOWN);
    }

    private boolean keyToOwner(int i, KeyEvent keyEvent, ServerRunner.KeyState keyState) {
        return keyState == ServerRunner.KeyState.DOWN ? this.mIOwner.superonKeyDown(i, keyEvent) : this.mIOwner.superonKeyUp(i, keyEvent);
    }

    public boolean onKeyEvent(int i, KeyEvent keyEvent, ServerRunner.KeyState keyState) {
        boolean z;
        if (this.mKeyHandler != null) {
            KeyHandler.Result resultHandleKeyDown = keyState == ServerRunner.KeyState.DOWN ? this.mKeyHandler.handleKeyDown(i, keyEvent) : this.mKeyHandler.handleKeyUp(i, keyEvent);
            z = resultHandleKeyDown.eventHandled;
            if (resultHandleKeyDown.preventDefault) {
                return z;
            }
        } else {
            z = true;
        }
        int i2 = 0;
        if ((keyEvent.getFlags() & 8) == 0 && Config.ignore_spoofed_keys) {
            return keyToOwner(i, keyEvent, keyState) && z;
        }
        if (i == 4) {
            ServerRunner.Key(4, keyState);
            return z;
        }
        if (i == 82) {
            ServerRunner.Key(200, keyState);
            return z;
        }
        if (i == 24 || i == 25) {
            if (Config.getInt("sound", "android_muting_device", 2) == 2) {
                DebugLogger.D3(logname, "Let android handle to volume keys.");
                return false;
            }
            DebugLogger.D3(logname, "Handling volume keys from igo.");
            handleVolumeKeys(i, keyState);
            return z;
        }
        if (i == 66) {
            ServerRunner.Key(13, keyState);
            return z;
        }
        if (i != 67) {
            switch (i) {
                case 19:
                    ServerRunner.Key(38, keyState);
                    return z;
                case 20:
                    ServerRunner.Key(40, keyState);
                    return z;
                case 21:
                    ServerRunner.Key(37, keyState);
                    return z;
                case 22:
                    ServerRunner.Key(39, keyState);
                    return z;
                default:
                    switch (i) {
                        case 57:
                        case 58:
                        case 59:
                        case 60:
                            handleMetaKeys(i, keyState);
                            return keyState == ServerRunner.KeyState.DOWN ? this.mIOwner.superonKeyDown(i, keyEvent) : this.mIOwner.superonKeyUp(i, keyEvent);
                        default:
                            if (keyEvent.isSystem()) {
                                return keyState == ServerRunner.KeyState.DOWN ? this.mIOwner.superonKeyDown(i, keyEvent) : this.mIOwner.superonKeyUp(i, keyEvent);
                            }
                            do {
                                int iCharToSend = charToSend(i, keyEvent);
                                if (iCharToSend != 0) {
                                    ServerRunner.Key(iCharToSend | 65536, keyState);
                                } else {
                                    ServerRunner.Key(i, keyState);
                                }
                                i2++;
                            } while (i2 < keyEvent.getRepeatCount());
                            return z;
                    }
            }
        }
        ServerRunner.Key(8, keyState);
        return z;
    }

    private void handleMetaKeys(int i, ServerRunner.KeyState keyState) {
        if (keyState == ServerRunner.KeyState.DOWN) {
            switch (i) {
                case 57:
                case 58:
                    this.altPressed = true;
                    break;
                case 59:
                case 60:
                    this.shiftPressed = true;
                    break;
            }
        }
        if (keyState == ServerRunner.KeyState.UP) {
            this.altPressed = false;
            this.shiftPressed = false;
        }
    }

    private int charToSend(int i, KeyEvent keyEvent) {
        if (this.altPressed) {
            return this.km.get(i, 2);
        }
        if (this.shiftPressed) {
            return this.km.get(i, 1);
        }
        return keyEvent.getUnicodeChar();
    }

    private void handleVolumeKeys(int i, ServerRunner.KeyState keyState) {
        if (keyState != ServerRunner.KeyState.DOWN) {
            return;
        }
        int i2 = 0;
        if (i == 24) {
            i2 = 1;
        } else if (i == 25) {
            i2 = -1;
        }
        adjustVolume(i2);
    }

    private void adjustVolume(int i) {
        ((AudioManager) this.mVOwner.getContext().getSystemService("audio")).adjustStreamVolume(Application.getSoundStream(), i, 5);
    }

    public void findFocus() {
        synchronized (this.mOnFindFocusCallbackLock) {
            Runnable runnable = this.mOnFindFocusCallback;
            if (runnable != null) {
                runnable.run();
            }
        }
    }

    public void setOnFindFocusCallback(Runnable runnable) {
        synchronized (this.mOnFindFocusCallbackLock) {
            this.mOnFindFocusCallback = runnable;
        }
    }
}
