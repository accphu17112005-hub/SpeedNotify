package com.navngo.igo.javaclient;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.location.Location;
import android.os.Build;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.Batch;
import com.navngo.igo.javaclient.androidgo.IgoModel;
import com.navngo.igo.javaclient.gps.GpsHacks;
import com.navngo.igo.javaclient.receiver.PetzaCommandReceiver;
import com.navngo.igo.javaclient.utils.ByteArrayOutputStreamDirect;
import com.navngo.igo.javaclient.view.GLMapView;
import com.navngo.igo.javaclient.view.IMapView;
import java.io.ByteArrayInputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class NNG {
    public static final int GPSDATA_HEADING_CHANGED = 64;
    public static final int GPSDATA_NOTHING_CHANGED = 0;
    public static final int GPSDATA_POSITION_CHANGED = 1;
    public static final int GPSDATA_PRECISION_CHANGED = 2;
    public static final int GPSDATA_SATELLITES_CHANGED = 4;
    public static final int GPSDATA_SPEED_CHANGED = 32;
    public static final int GPSDATA_STATUS_CHANGED = 16;
    public static final int GPSDATA_TIME_CHANGED = 8;
    public static final int INTPARAM_APPLICATION_INFO_FLAGS = 8;
    public static final int INTPARAM_CACHESIZE = 1;
    public static final int INTPARAM_DELETEPRL = 0;
    public static final int INTPARAM_SDK_INT = 9;
    public static final int INTPARAM_STARTENGINE_TIMEOUT = 2;
    private static final int INTPARAM_count = 10;
    public static final int INTPARAM_screen_x = 4;
    public static final int INTPARAM_screen_x2 = 6;
    public static final int INTPARAM_screen_y = 5;
    public static final int INTPARAM_screen_y2 = 7;
    public static final int NNG_ENGINE_ALMOST_STARTED = 450;
    public static final int NNG_ENGINE_CREATED = 100;
    public static final int NNG_ENGINE_DESTROYED = 900;
    public static final int NNG_ENGINE_JUSTENTERINGMAINLOOP = 400;
    public static final int NNG_ENGINE_JUSTLEAVINGMAINLOOP = 600;
    public static final int NNG_ENGINE_LOSING_FOCUS = 2300;
    public static final int NNG_ENGINE_LOST_FOCUS = 2400;
    public static final int NNG_ENGINE_RESTARTING = 300;
    public static final int NNG_ENGINE_SETTING_FOCUS = 2100;
    public static final int NNG_ENGINE_SET_FOCUS = 2200;
    public static final int NNG_ENGINE_STARTED = 500;
    public static final int NNG_ENGINE_STARTING = 200;
    public static final int NNG_ENGINE_STOPPED = 800;
    public static final int NNG_ENGINE_STOPPING = 700;
    public static final int OBJPARAM_CLIENT_PACKAGE = 9;
    public static final int OBJPARAM_LIBEGL = 1;
    public static final int OBJPARAM_LINKED_ROOT = 8;
    public static final int OBJPARAM_NATIVE_LIBRARY_DIR = 11;
    public static final int OBJPARAM_OSBUILD_DEVICE = 4;
    public static final int OBJPARAM_OSBUILD_PRODUCT = 7;
    public static final int OBJPARAM_OSBUILD_PRODUCTBRAND = 5;
    public static final int OBJPARAM_OSBUILD_PRODUCTMODEL = 6;
    public static final int OBJPARAM_OSBUILD_VERSION_RELEASE = 10;
    public static final int OBJPARAM_SAVEDIR = 0;
    public static final int OBJPARAM_SDCARDDIR = 3;
    public static final int OBJPARAM_SDCARDROOT = 2;
    public static final int OBJPARAM_SYSTEM_LIBRARY_DIR = 12;
    private static final int OBJPARAM_count = 13;
    private static boolean http_enabled = false;
    public static volatile boolean javaPainting = false;
    private static Calendar locCalendar = null;
    private static final String logname = "NNG";
    private static volatile boolean sIntroEnded;
    private static String waitInfinitelyLock;
    private static boolean waitInfinitelySynchronized;
    private static MessageWriter mMsgWriter = new MessageWriter() { // from class: com.navngo.igo.javaclient.NNG.1
        @Override // com.navngo.igo.javaclient.MessageWriter
        public int Write(String str, String str2, String str3, int i) {
            IgoActivity igoActivity = Application.getIgoActivity();
            if (igoActivity != null) {
                return igoActivity.MessageBox(str2, str3, i);
            }
            DebugLogger.D2(str, "MessageBox: [" + str3 + "] " + str2);
            return 5;
        }
    };
    public static final int[] intParams = new int[10];
    public static Object[] objParams = new Object[13];

    public static native void CacheAssetManager(Object obj);

    private static native boolean GetBlockDeviceMajMin(String str, int[] iArr);

    public static native void GpsConnect(boolean z);

    public static native void GpsDataUpdate(double d, double d2, int i, int i2, int i3, int i4, int i5, int i6, int i7, double d3, int i8, int i9, int i10);

    public static native void GpsDenied();

    public static native void GpsEnabled();

    public static native void GpsJsonUpdate(int i, String str);

    public static native void GpsLost();

    public static native void GpsNmeaUpdate(long j, String str);

    public static native void GpsSatellitesUpdate(long j, int[] iArr);

    public static native String I18N(String str);

    public static native synchronized void KeyDown(int i);

    public static native synchronized void KeyUp(int i);

    public static native void OrientationChanged(int i);

    public static native boolean RecreateSoftlink(String str, String str2);

    public static native void Resume();

    public static native void SendFirstFrameEvent();

    public static native void SendTimeChangedEvent();

    public static native void SendTouch(int i, int i2, int i3, int i4, int i5, long j);

    public static native void SetDeviceId(String str);

    public static native void SetJavaFreeMemory(int i);

    public static native void SetPlatformId(String str);

    public static native void Sound_Finished(boolean z, int i, int i2, int[] iArr);

    public static native boolean StartEngine();

    public static native void StopEngine();

    public static native void Suspend();

    public static native void callFunctor(long j);

    public static native boolean callIgo(String str, AndroidGo.IActionSucceeded iActionSucceeded, byte[] bArr, int i, Batch batch, boolean z, boolean z2);

    public static native boolean chdir(String str);

    private static native synchronized void forceCaching();

    public static native void garbageCollect(int i, boolean z);

    public static native byte[] getFromSysConfig(String str, String str2, byte[] bArr, int i);

    public static native String getModelValue(String str, int i);

    public static native boolean isOnTheRoad();

    public static native byte[] loadImage(String str);

    public static native void log(int i, String str, String str2);

    public static native void putHttpBuffer(int i, byte[] bArr, int i2);

    public static native byte[] queryModelValue(IgoModel<?> igoModel, String str, byte b);

    public static native boolean sendBytesSLAPIMessage2iGO(int i, int i2, byte[] bArr, int i3);

    public static native boolean sendComplexSLAPIMessage2iGO(int i, int i2, int i3, int i4, int i5, float f, float f2, String str, String str2);

    public static native boolean sendSimpleSLAPIMessage2iGO(int i, int i2, int i3, int i4);

    public static native void setBuffer888(int[] iArr);

    public static native void setModelValue(IgoModel<?> igoModel, String str, byte[] bArr, int i);

    public static native void setNativeWaitInfinitely(boolean z);

    public static class ImproperContent extends Exception {
        public ImproperContent(String str) {
            super(str);
        }
    }

    static {
        reInit();
        javaPainting = false;
        sIntroEnded = false;
        http_enabled = false;
        waitInfinitelyLock = new String("waitInfinitely");
        waitInfinitelySynchronized = false;
        locCalendar = new GregorianCalendar();
    }

    public static class MajMinNumbers {
        public final int major;
        public final int minor;
        public final boolean valid;

        MajMinNumbers(int i, int i2, boolean z) {
            this.major = i;
            this.minor = i2;
            this.valid = z;
        }
    }

    public static MajMinNumbers GetBlockDeviceMajMin(String str) {
        int[] iArr = new int[2];
        if (GetBlockDeviceMajMin(str, iArr)) {
            return new MajMinNumbers(iArr[0], iArr[1], true);
        }
        return new MajMinNumbers(0, 0, false);
    }

    public static synchronized void reInit() {
        loadNative();
        ResumeHandler.INSTANCE.nativeLoaded();
    }

    public static void setParams() {
        objParams[0] = Config.serverStartDir + PetzaCommandReceiver.PETZA_SAVE;
        objParams[1] = Config.find_libEGL();
        objParams[2] = Config.sdcardRoot;
        objParams[3] = Config.sdcardDir;
        objParams[4] = Build.DEVICE;
        objParams[5] = Build.BRAND;
        objParams[6] = Build.MODEL;
        objParams[7] = Build.PRODUCT;
        objParams[10] = Build.VERSION.RELEASE;
        Object[] objArr = objParams;
        objArr[8] = Config.link_to_sdcard_igo_dir;
        objArr[9] = Config.packageName;
        objParams[11] = Application.anApplication.getApplicationInfo().nativeLibraryDir;
        objParams[12] = System.getProperty("java.library.path");
    }

    private static void loadNative() {
        System.loadLibrary("igo_jni");
        forceCaching();
        Application.NNG_FullyLoaded = true;
    }

    public static void showRebuildError(Resources resources, Exception exc) throws Resources.NotFoundException {
        if (exc != null) {
            DebugLogger.D1(logname, exc.getMessage(), exc);
            if (Application.NNG_shouldMessageBoxOnRebuildDataDirFailure) {
                String string = Config.getString("android", "customMissingContentMessage", Config.def_customMissingContentMessage);
                if (string == Config.def_additional_assets) {
                    string = Application.anApplication.getString(R.string.missing_or_incomplete_folder) + "\n" + exc.getLocalizedMessage();
                }
                if (Application.getIgoActivity() != null) {
                    Application.getIgoActivity().mNoSystemExit = true;
                }
                Application.anApplication.alert(string);
                Application.NNG_shouldMessageBoxOnRebuildDataDirFailure = false;
            }
        }
    }

    public static int getScreenOrientation() {
        return ServerRunner.GetOrientation();
    }

    public static Object getStatusThread() {
        return ServerRunner.getStatusThread();
    }

    public static void startNNGThread(Object obj, long j) {
        ((NNGThread) obj).start(j);
    }

    public static void callOnPaintCallback(int i, int i2, int i3, int i4, int i5, int i6) {
        IMapView mapView = Application.getMapView();
        if (mapView != null) {
            mapView.onPaintCallback(i, i2, i3, i4, i5, i6);
        }
    }

    public static boolean OpenGL_CreateBuffers() {
        IMapView mapView = Application.getMapView();
        if (mapView == null || !(mapView instanceof GLMapView)) {
            return false;
        }
        return ((GLMapView) mapView).OpenGL_CreateBuffers();
    }

    public static boolean BeginPaint() {
        IMapView mapView = Application.getMapView();
        if (mapView != null) {
            return mapView.BeginPaint();
        }
        return false;
    }

    public static void EndPaint() {
        IMapView mapView = Application.getMapView();
        if (mapView != null) {
            mapView.EndPaint();
        }
    }

    public static boolean OpenGL_DeleteBuffers() {
        DebugLogger.D5(logname, "OpenGL_DeleteBuffers");
        IMapView mapView = Application.getMapView();
        if (mapView != null && (mapView instanceof GLMapView)) {
            return ((GLMapView) mapView).OpenGL_DeleteBuffers();
        }
        DebugLogger.D3(logname, "OpenGL_DeleteBuffers: no MapView!");
        return false;
    }

    public static boolean OpenGL_CreateSurface(int i, int i2, int i3, boolean z, int i4) {
        IMapView mapView = Application.getMapView();
        if (mapView == null || !(mapView instanceof GLMapView)) {
            return false;
        }
        return ((GLMapView) mapView).OpenGL_CreateSurface(i, i2, i3, z, i4);
    }

    public static void OpenGL_DeleteSurface(int i) {
        IMapView mapView = Application.getMapView();
        if (mapView == null || !(mapView instanceof GLMapView)) {
            return;
        }
        ((GLMapView) mapView).OpenGL_DeleteSurface(i);
    }

    public static void OpenGL_ChangeHWDisplay(int i) {
        IMapView mapView = Application.getMapView();
        if (mapView == null || !(mapView instanceof GLMapView)) {
            return;
        }
        ((GLMapView) mapView).OpenGL_ChangeHWDisplay(i);
    }

    public static void OpenGL_SwapBuffers(int i) {
        IMapView mapView = Application.getMapView();
        if (mapView == null || !(mapView instanceof GLMapView)) {
            return;
        }
        ((GLMapView) mapView).OpenGL_SwapBuffers(i);
    }

    public static void EngineStatus(int i) {
        ServerRunner.EngineStatus(i);
        if (i == 300) {
            http_enabled = true;
        } else {
            if (i != 600) {
                return;
            }
            http_enabled = false;
        }
    }

    public static int TTS_TestLanguageAndVoice(String str, String str2) {
        return Application.TTS_TestLanguageAndVoice(str, str2);
    }

    public static ByteArrayOutputStreamDirect.ByteArrayRegion onRemoteCall(String str, byte[] bArr) {
        ByteArrayOutputStreamDirect.ByteArrayRegion byteArrayRegionCallFunctor;
        try {
            byteArrayRegionCallFunctor = AndroidGo.getInstance().callFunctor(str, new ByteArrayInputStream(bArr));
        } catch (Exception e) {
            e.printStackTrace();
            byteArrayRegionCallFunctor = null;
        }
        return byteArrayRegionCallFunctor == null ? new ByteArrayOutputStreamDirect.ByteArrayRegion(new byte[2], 2) : byteArrayRegionCallFunctor;
    }

    public static boolean IsIntroEnded() {
        return sIntroEnded;
    }

    public static void SetIntroEnded(boolean z) {
        onIntroStatusChanged(z);
    }

    public static void onIntroStatusChanged(boolean z) {
        DebugLogger.D4(logname, String.format("Intro status changed. Ended = %b", Boolean.valueOf(z)));
        sIntroEnded = z;
        if (z) {
            ServerRunner.notifyStatusThread();
            IgoActivity igoActivity = Application.getIgoActivity();
            if (igoActivity != null) {
                igoActivity.onIgoStarted();
            }
        }
    }

    public static void SendHttpRequest(String str, byte[] bArr, String str2, int i) {
        if (http_enabled) {
            DebugLogger.D5(logname, "SendHttpRequest: " + i + " " + str + "(" + str2 + ")");
            Application.getHttpUtility().getHttpRequest(str, bArr, str2, i);
            return;
        }
        DebugLogger.D5(logname, "SendHttpRequest: Ignored: " + i + " " + str + "(" + str2 + ")");
        putHttpBuffer(i, null, -1);
    }

    public static void waitInfinitely() {
        long id = Thread.currentThread().getId();
        DebugLogger.D4(logname, "waitInfinitely: th = " + id + " BEGIN");
        synchronized (waitInfinitelyLock) {
            try {
                if (waitInfinitelySynchronized) {
                    if (Config.memorywatcher_timeout_background > 0) {
                        waitInfinitelyLock.wait(Config.memorywatcher_timeout_background);
                    } else {
                        waitInfinitelyLock.wait();
                    }
                }
            } catch (InterruptedException unused) {
            }
        }
        DebugLogger.D4(logname, "waitInfinitely: th = " + id + " END");
    }

    public static void setWaitInfinitely(boolean z) {
        synchronized (waitInfinitelyLock) {
            waitInfinitelySynchronized = z;
            setNativeWaitInfinitely(z);
            if (!z) {
                waitInfinitelyLock.notifyAll();
            }
        }
    }

    public static void onLocationChanged(Location location) {
        long jCurrentTimeMillis;
        double latitude;
        double longitude;
        int altitude;
        float accuracy;
        int bearing;
        int speed;
        int i;
        int i2;
        if (location != null) {
            jCurrentTimeMillis = location.getTime();
            if (Config.check_gps_timestamp && jCurrentTimeMillis < 1471228928) {
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                DebugLogger.D4(logname, String.format(null, "Wrong GPS time received (%d). correcting it to: (%d)", Long.valueOf(jCurrentTimeMillis), Long.valueOf(jCurrentTimeMillis2)));
                jCurrentTimeMillis = jCurrentTimeMillis2;
            }
            latitude = location.getLatitude();
            longitude = location.getLongitude();
            altitude = (int) location.getAltitude();
            bearing = (int) location.getBearing();
            speed = (int) ((((double) location.getSpeed()) * 3.6d) + 0.5d);
            int i3 = location.hasSpeed() ? 33 : 1;
            if (location.hasBearing() && location.hasSpeed() && location.getSpeed() > 0.3d) {
                i3 |= 64;
            }
            boolean zEquals = location.getProvider().equals("network");
            if (zEquals) {
                i3 |= 32;
                speed = 0;
            }
            accuracy = location.getAccuracy();
            if (Config.accuracy_workaround && GpsHacks.getOvrHasAccuracy()) {
                accuracy = GpsHacks.getOvrFlAccuracy();
            }
            if (zEquals && accuracy < Config.horizontal_accuracy_treshold) {
                accuracy = Config.horizontal_accuracy_treshold + 10;
            }
            if (location.hasAccuracy() || (Config.accuracy_workaround && GpsHacks.getOvrHasAccuracy() && (latitude != 0.0d || longitude != 0.0d))) {
                i3 |= 2;
            }
            i2 = i3;
            i = location.hasAltitude() ? 2 : 1;
        } else {
            jCurrentTimeMillis = System.currentTimeMillis();
            latitude = Config.default_latitude;
            longitude = Config.default_longitude;
            altitude = 100;
            accuracy = 10.0f;
            bearing = 0;
            speed = 0;
            i = 1;
            i2 = 1;
        }
        locCalendar.clear();
        locCalendar.setTimeZone(TimeZone.getTimeZone("GMT+00:00"));
        locCalendar.set(15, 0);
        locCalendar.set(16, 0);
        locCalendar.setTimeInMillis(jCurrentTimeMillis);
        int i4 = locCalendar.get(1);
        int i5 = locCalendar.get(2) + 1;
        int i6 = locCalendar.get(5);
        locCalendar.set(10, 0);
        locCalendar.set(11, 0);
        locCalendar.set(12, 0);
        locCalendar.set(13, 0);
        locCalendar.set(14, 0);
        GpsDataUpdate(latitude, longitude, altitude, bearing, speed, i4, i5, i6, (int) (jCurrentTimeMillis - locCalendar.getTimeInMillis()), accuracy, i, 99, i2);
    }

    public static void onSatellitesChanged() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        int[] satellites = Application.getSatellites();
        DebugLogger.D5(logname, "calling GpsSatellitesUpdate(" + jCurrentTimeMillis + "," + satellites + ")");
        GpsSatellitesUpdate(jCurrentTimeMillis, satellites);
    }

    public static void onNmeaReceived(long j, String str) {
        GpsNmeaUpdate(j, str);
    }

    public static int MessageBox(String str, String str2, int i) {
        return mMsgWriter.Write(logname, str, str2, i);
    }

    public static String getOSLanguageKeys() {
        return Application.getOSLanguageKeys();
    }

    public static String getDeviceIDs() {
        return ServerRunner.getDeviceIDs();
    }

    public static void gps_started_viewer(int i) {
        DebugLogger.D5(logname, "gps_started_viewer: " + i);
        ServerRunner.uiWantGpsListener(i != 0);
    }

    public static void gps_background_navigation_viewer(int i) {
        DebugLogger.D4(logname, "gps_background_navigation_viewer: " + i);
        ServerRunner.background_navigation = i != 0;
    }

    public static int getJavaTimeZone() {
        Calendar calendar = Calendar.getInstance();
        return (calendar.get(15) + calendar.get(16)) / 1000;
    }

    public static Drawable loadImageAsDrawable(String str) {
        if (str.isEmpty()) {
            return null;
        }
        byte[] bArrLoadImage = loadImage(str);
        Drawable drawableCreateFromStream = bArrLoadImage != null ? Drawable.createFromStream(new ByteArrayInputStream(bArrLoadImage), "menuIcon") : null;
        if (drawableCreateFromStream == null) {
            DebugLogger.D4(logname, "Error loading icon for options menu: " + str);
        }
        return drawableCreateFromStream;
    }

    public static void setWriter(MessageWriter messageWriter) {
        mMsgWriter = messageWriter;
    }
}
