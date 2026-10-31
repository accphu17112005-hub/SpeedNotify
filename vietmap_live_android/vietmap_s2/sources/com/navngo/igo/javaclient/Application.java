package com.navngo.igo.javaclient;

import android.app.ActivityManager;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Point;
import android.location.Geocoder;
import android.media.AudioManager;
import android.os.Build;
import android.os.Process;
import android.os.SystemClock;
import android.view.WindowManager;
import android.widget.Toast;
import androidx.core.app.NotificationCompat;
import com.navngo.igo.javaclient.ServiceRunner;
import com.navngo.igo.javaclient.activityresulthandler.TTSSupportedLangResultHandler;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.OutArgs;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.igo.javaclient.observer.IObserver;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import com.navngo.igo.javaclient.receiver.IReceiver;
import com.navngo.igo.javaclient.receiver.NetworkStatusReceiver;
import com.navngo.igo.javaclient.receiver.PhoneIntentReceiver;
import com.navngo.igo.javaclient.receiver.SynctoolCommandReceiver;
import com.navngo.igo.javaclient.receiver.TimeReceiver;
import com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator;
import com.navngo.igo.javaclient.tts.TTSSpeaker;
import com.navngo.igo.javaclient.tts.TTSSpeakerFactory;
import com.navngo.igo.javaclient.utils.AntHttpUtility;
import com.navngo.igo.javaclient.utils.HttpUtility;
import com.navngo.igo.javaclient.utils.NotificationCreator;
import com.navngo.igo.javaclient.utils.SensorUtility;
import com.navngo.igo.javaclient.utils.StreamUtility;
import com.navngo.igo.javaclient.view.GLMapView;
import com.navngo.igo.javaclient.view.IMapView;
import com.navngo.igo.javaclient.view.MapView;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Application {
    public static final int NOTIFY_ID_MISSING_SDCARD = 1;
    public static final int NOTIFY_ID_RUNNING_IN_BACKGROUND = 2;
    public static final int SAT_AZIMUTH = 3;
    public static final int SAT_DATA_COUNT = 5;
    public static final int SAT_ELEVATION = 4;
    public static final int SAT_PRN = 0;
    public static final int SAT_SNR = 2;
    public static final int SAT_USED = 1;
    private static final String logname = "Application";
    private int lastSurfaceHeight;
    private int lastSurfaceWidth;
    public static final int APPICON_ID = R.drawable.appicon;
    public static Application anApplication = new Application();
    public static ServiceRunner serviceRunner = null;
    public static boolean exitOnDestroy = false;
    private static boolean hasPendingSDNotification = false;
    private static final String shortLock = new String("shortLock: please DO NOT call any locking stuff under this lock!");
    private static IgoActivity theIgoActivity = null;
    private static MainService theMainService = null;
    private static final String mainServiceLock = new String("mainServiceLock");
    private static IMapView theMapView = null;
    private static final String createMapViewLock = new String("createMapViewLock");
    private static TTSSpeaker mTtsSpeaker = null;
    private static AudioManager mAudioManager = null;
    private static ASRRecognizer mAsrRecognizer = null;
    private static HttpUtility httpUtility = null;
    private static AntHttpUtility antHttpUtility = null;
    private static InsertSDCard theInsertSDCard = null;
    private static long bootTime = -1;
    private static SensorUtility theSensorUtility = null;
    private static long mediascanning_timestamp = 0;
    private static final String mediascanning_event = new String("MEDIA_SCANNER_FINISHED");
    private static Geocoder theGeocoder = null;
    private static String savedOSLocale = null;
    private static String oslangcodes_ini_builtin = null;
    private static String oslangcodes_ini_content = Config.def_additional_assets;
    private static int[] satellites = null;
    public static volatile boolean NNG_FullyLoaded = false;
    public static volatile boolean NNG_shouldMessageBoxOnRebuildDataDirFailure = true;
    public static volatile int[] bufferB_ARGB8888 = null;
    private Context applicationContext = null;
    private boolean mInitialized = false;
    private boolean guiSurfaceCreated = false;
    private boolean mainSurfacePresent = false;
    private List<GuiSurfaceCreatedCallback> mGuiSurfaceCreatedCallbacks = new ArrayList();
    private String surfaceSizeTransferLockObj = "surfaceSizeTransferLockObj";
    private List<IActivityCommand> mActivityCommands = new ArrayList();
    private List<IReceiver> mReceivers = new ArrayList();
    private List<IObserver> mContentObservers = new ArrayList();

    public interface GuiSurfaceCreatedCallback {
        void onGuiSurfaceCreated();
    }

    interface IActivityCommand {
        void run(IgoActivity igoActivity);
    }

    public static void debugSleep(int i) {
    }

    public void registerGuiSurfaceCreatedCallback(GuiSurfaceCreatedCallback guiSurfaceCreatedCallback) {
        this.mGuiSurfaceCreatedCallbacks.add(guiSurfaceCreatedCallback);
    }

    public boolean isGuiSurfaceCreated() {
        return this.guiSurfaceCreated;
    }

    public Context getApplicationContext() {
        return this.applicationContext;
    }

    public ApplicationInfo getApplicationInfo() {
        return this.applicationContext.getApplicationInfo();
    }

    public String getAndroidPackageName() {
        return this.applicationContext.getPackageName();
    }

    public int getOSVersion() {
        return Build.VERSION.SDK_INT;
    }

    public ContentResolver getContentResolver() {
        return this.applicationContext.getContentResolver();
    }

    public File[] getExternalFilesDirs(String str) {
        return Build.VERSION.SDK_INT >= 19 ? this.applicationContext.getExternalFilesDirs(str) : new File[0];
    }

    public File getFilesDir() {
        return this.applicationContext.getFilesDir();
    }

    public PackageManager getPackageManager() {
        return this.applicationContext.getPackageManager();
    }

    public String getPackageName() {
        return this.applicationContext.getPackageName();
    }

    public Resources getResources() {
        return this.applicationContext.getResources();
    }

    public SharedPreferences getSharedPreferences(String str, int i) {
        return this.applicationContext.getSharedPreferences(str, i);
    }

    public String getString(int i) {
        return this.applicationContext.getString(i);
    }

    public Object getSystemService(String str) {
        return this.applicationContext.getSystemService(str);
    }

    public void sendBroadcast(Intent intent) {
        this.applicationContext.sendBroadcast(intent);
    }

    public void startActivity(Intent intent) {
        this.applicationContext.startActivity(intent);
    }

    public Intent registerReceiver(BroadcastReceiver broadcastReceiver, IntentFilter intentFilter) {
        return this.applicationContext.registerReceiver(broadcastReceiver, intentFilter);
    }

    public void unregisterReceiver(BroadcastReceiver broadcastReceiver) {
        this.applicationContext.unregisterReceiver(broadcastReceiver);
    }

    public void registerApplicationFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.wantGpsListener", this, "uiWantGpsListener");
        androidGo.registerFunctor("android.getdisplaydensity", this, "getDisplayDensityDpi");
        androidGo.registerFunctor("android.display.get_multitouch_support", this, "getDisplayMultitouchSupport");
        androidGo.registerFunctor("android.activity.request_orientation", this, "requestActivityOrientation");
        androidGo.registerFunctor("android.getSurfaceSize", this, "getSurfaceSize");
        androidGo.registerFunctor("android.getDeviceDependentMaxMemory", this, "getDeviceDependentMaxMemory");
        androidGo.registerFunctor("android.onGuiSurfaceCreated", this, "onGuiSurfaceCreated");
        androidGo.registerFunctor("android.is_gles2_supported", this, "is_gles2_supported");
        androidGo.registerFunctor("android.startInForeground", this, "startMainActivityInForeground");
        androidGo.registerFunctor("android.sendCurrentTimeZone", this, "sendCurrentTimeZone");
        androidGo.registerFunctor("android.getPackageName", this, "getAndroidPackageName");
        androidGo.registerFunctor("android.setSleepMode", this, "setSleepMode");
        androidGo.registerFunctor("android.setShutdownBlock", this, "setShutdownBlock");
        androidGo.registerFunctor("android.generateHapticFeedback", this, "generateHapticFeedback");
        androidGo.registerFunctor("android.get_android_os_version", this, "getOSVersion");
        androidGo.registerFunctor("android.rollback", this, "rollback");
        androidGo.registerFunctor("android.syncdirs", this, "syncDirsThenExit");
        androidGo.registerFunctor("android.showMessageBox", this, "showMessageBox");
        ShinyLocationListenerCommunicator.INSTANCE.registerFunctors();
    }

    public void setApplicationContext(Context context) throws Throwable {
        Context context2 = this.applicationContext;
        if (context2 == null) {
            this.applicationContext = context.getApplicationContext();
        } else if (!context2.equals(context.getApplicationContext())) {
            DebugLogger.D2(logname, "Application context changed");
            this.applicationContext = context.getApplicationContext();
        }
        Config.loadConfigFromApk();
        serviceRunner = new ServiceRunner();
    }

    public void Initialize() {
        if (this.mInitialized) {
            return;
        }
        this.mInitialized = true;
        DebugLogger.init();
        Config.initialize();
        NNG.setParams();
        Resources resources = anApplication.getResources();
        if (!NNG.chdir(Config.serverStartDir)) {
            NNG.MessageBox(anApplication.getString(R.string.missing_or_incomplete_folder) + "\n" + Config.serverStartDir, resources.getString(R.string.app_name), 0);
            return;
        }
        boolean zTimeStampMatch = true ^ timeStampMatch();
        if (zTimeStampMatch) {
            saveBuildTimeStamp();
        }
        try {
            e = DataInstaller.RebuildDataDir(resources, zTimeStampMatch);
            Config.reload(5);
        } catch (Exception e) {
            e = e;
        }
        NNG.showRebuildError(resources, e);
        anApplication.resetScreenSizes();
    }

    public void onPermissionsGranted() {
        Initialize();
        checkForSDCard(false);
        if (Config.getBool("debug", "gdb", false)) {
            try {
                DebugLogger.D3(logname, "trying to start gdb");
                DataInstaller.unpackDebugger(getResources());
                killOldDebugger();
                DebugLogger.D4(logname, "native load start");
                if (!NNG_FullyLoaded) {
                    NNG.reInit();
                }
                DebugLogger.D4(logname, "native load done, waiting for debugger...");
                Runtime.getRuntime().exec(new String[]{Config.serverFolder + "gdbserver", ":1234", "--attach", Config.def_additional_assets + Process.myPid()});
                Thread.sleep((long) Config.getInt("android", "wait_for_gdbserver", 60000));
                DebugLogger.D4(logname, "debugger wait done");
            } catch (Exception e) {
                DebugLogger.D3(logname, e.getMessage());
            }
        }
    }

    public boolean isAppInForeground() {
        Context applicationContext = getApplicationContext();
        if (applicationContext == null) {
            DebugLogger.D3(logname, "isAppInForeground: context is null");
            return false;
        }
        ActivityManager activityManager = (ActivityManager) applicationContext.getSystemService("activity");
        if (activityManager == null) {
            DebugLogger.D3(logname, "isAppInForeground: failed to get ACTIVITY_SERVICE");
            return false;
        }
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses = activityManager.getRunningAppProcesses();
        if (runningAppProcesses == null) {
            DebugLogger.D3(logname, "isAppInForeground: getRunningAppProcesses() returned null!");
            return false;
        }
        DebugLogger.D5(logname, "isAppInForeground: getRunningAppProcesses() returned " + runningAppProcesses.size() + " item(s)");
        Iterator<ActivityManager.RunningAppProcessInfo> it = runningAppProcesses.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ActivityManager.RunningAppProcessInfo next = it.next();
            if (next.pid == Process.myPid()) {
                z = next.importance <= 100;
                DebugLogger.D5(logname, "isAppInForeground: pid=" + next.pid + ", importance=" + next.importance + ", isForeground=" + z);
            }
        }
        return z;
    }

    public void onGuiSurfaceCreated() {
        this.guiSurfaceCreated = true;
        Iterator<GuiSurfaceCreatedCallback> it = this.mGuiSurfaceCreatedCallbacks.iterator();
        while (it.hasNext()) {
            it.next().onGuiSurfaceCreated();
        }
    }

    public void sendCurrentTimeZone(int i) {
        char c = i < 0 ? '-' : '+';
        int iAbs = Math.abs(i);
        String str = String.format(Locale.US, "GMT%c%02d:%02d", Character.valueOf(c), Integer.valueOf(iAbs / 60), Integer.valueOf(iAbs % 60));
        DebugLogger.D3(logname, "Setting timeZone to \"" + str + "\"");
        if (!PermissionHandler.get().isPermissionGranted("android.permission.SET_TIME_ZONE")) {
            DebugLogger.D2(logname, "Missing SET_TIME_ZONE permission");
        } else {
            ((AlarmManager) getSystemService(NotificationCompat.CATEGORY_ALARM)).setTimeZone(str);
        }
    }

    public void setSleepMode(boolean z) {
        IgoActivity igoActivity = getIgoActivity();
        if (igoActivity != null) {
            DebugLogger.D3(logname, "setSleepMode " + z + " igo: " + igoActivity);
            igoActivity.SetSleepMode(z);
        }
    }

    public void setShutdownBlock(boolean z) {
        DebugLogger.D3(logname, "setShutdownBlock " + z);
        ResumeHandler.INSTANCE.setShutdownBlock(z);
    }

    public void surfaceSizeChanged(int i, int i2, int i3) {
        synchronized (this.surfaceSizeTransferLockObj) {
            if (this.guiSurfaceCreated) {
                AndroidGo.getInstance().callIgoSync("android.surface_size_changed", Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(i3));
            }
            if (i == 0) {
                this.lastSurfaceWidth = i2;
                this.lastSurfaceHeight = i3;
                this.mainSurfacePresent = true;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x000c A[Catch: all -> 0x0020, TryCatch #0 {, blocks: (B:6:0x0006, B:7:0x0008, B:9:0x000c, B:10:0x001e), top: B:15:0x0006 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public void surfaceDestroyed(int r6) {
        /*
            r5 = this;
            java.lang.String r0 = r5.surfaceSizeTransferLockObj
            monitor-enter(r0)
            r1 = 0
            if (r6 != 0) goto L8
            r5.mainSurfacePresent = r1     // Catch: java.lang.Throwable -> L20
        L8:
            boolean r2 = r5.guiSurfaceCreated     // Catch: java.lang.Throwable -> L20
            if (r2 == 0) goto L1e
            com.navngo.igo.javaclient.androidgo.AndroidGo r2 = com.navngo.igo.javaclient.androidgo.AndroidGo.getInstance()     // Catch: java.lang.Throwable -> L20
            java.lang.String r3 = "android.surface_destroyed"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch: java.lang.Throwable -> L20
            java.lang.Integer r6 = java.lang.Integer.valueOf(r6)     // Catch: java.lang.Throwable -> L20
            r4[r1] = r6     // Catch: java.lang.Throwable -> L20
            r2.callIgoSync(r3, r4)     // Catch: java.lang.Throwable -> L20
        L1e:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L20
            return
        L20:
            r6 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L20
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.Application.surfaceDestroyed(int):void");
    }

    public void showMessageBox(String str) {
        NNG.MessageBox(str, getResources().getString(R.string.app_name), 0);
    }

    public void alert(String str) {
        DebugLogger.D4(logname, "alert: " + str);
        Intent intent = new Intent(WarnerBrothers.ACTION_DEFAULT);
        intent.setPackage(getPackageName());
        intent.setFlags(805306368);
        intent.putExtra("android.intent.extra.TEXT", str);
        startActivity(intent);
    }

    public void alert(String str, int i, String str2, int i2, String... strArr) {
        DebugLogger.D4(logname, "alert: " + str);
        Intent intent = new Intent(WarnerBrothers.ACTION_DEFAULT);
        intent.setPackage(getPackageName());
        intent.setFlags(805306368);
        intent.putExtra("android.intent.extra.TEXT", str);
        intent.putExtra("ClientId", i);
        intent.putExtra("Intent", str2);
        intent.putExtra("Timeout", i2);
        int i3 = 0;
        for (String str3 : strArr) {
            if (str3 == null || str3.equals(Config.def_additional_assets)) {
                break;
            }
            i3++;
            intent.putExtra("Button" + i3, str3);
            if (i3 == 3) {
                break;
            }
        }
        intent.putExtra("NofUserButtons", i3);
        startActivity(intent);
    }

    public void alert(int i) {
        alert(getResources().getString(i));
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0028 A[Catch: all -> 0x001b, TryCatch #1 {, blocks: (B:5:0x0005, B:7:0x000d, B:16:0x0028, B:18:0x0042, B:19:0x0046, B:21:0x004f, B:13:0x001e), top: B:26:0x0005, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0046 A[Catch: all -> 0x001b, TryCatch #1 {, blocks: (B:5:0x0005, B:7:0x000d, B:16:0x0028, B:18:0x0042, B:19:0x0046, B:21:0x004f, B:13:0x001e), top: B:26:0x0005, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static synchronized boolean checkForSDCard(boolean r6) {
        /*
            java.lang.Class<com.navngo.igo.javaclient.Application> r0 = com.navngo.igo.javaclient.Application.class
            monitor-enter(r0)
            r1 = 1
            r2 = 0
            java.lang.String r3 = com.navngo.igo.javaclient.Config.sdcardDir     // Catch: java.lang.Throwable -> L1b java.lang.Exception -> L1d
            boolean r3 = com.navngo.igo.javaclient.utils.StreamUtility.isDirectory(r3)     // Catch: java.lang.Throwable -> L1b java.lang.Exception -> L1d
            if (r3 != 0) goto L19
            java.lang.String r3 = android.os.Environment.getExternalStorageState()     // Catch: java.lang.Throwable -> L1b java.lang.Exception -> L1d
            java.lang.String r4 = "mounted"
            boolean r3 = r3.equals(r4)     // Catch: java.lang.Throwable -> L1b java.lang.Exception -> L1d
            if (r3 == 0) goto L25
        L19:
            r3 = 1
            goto L26
        L1b:
            r6 = move-exception
            goto L5c
        L1d:
            r3 = move-exception
            java.lang.String r4 = "Application"
            java.lang.String r5 = "checkForSDCard: unwanted exception"
            com.navngo.igo.javaclient.DebugLogger.D2(r4, r5, r3)     // Catch: java.lang.Throwable -> L1b
        L25:
            r3 = 0
        L26:
            if (r3 != 0) goto L46
            java.lang.String r2 = "Application"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L1b
            r4.<init>()     // Catch: java.lang.Throwable -> L1b
            java.lang.String r5 = "SD card missing: "
            r4.append(r5)     // Catch: java.lang.Throwable -> L1b
            java.lang.String r5 = com.navngo.igo.javaclient.Config.sdcardDir     // Catch: java.lang.Throwable -> L1b
            r4.append(r5)     // Catch: java.lang.Throwable -> L1b
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> L1b
            com.navngo.igo.javaclient.DebugLogger.D3(r2, r4)     // Catch: java.lang.Throwable -> L1b
            if (r6 == 0) goto L5a
            showSDNotification(r1)     // Catch: java.lang.Throwable -> L1b
            goto L5a
        L46:
            showSDNotification(r2)     // Catch: java.lang.Throwable -> L1b
            com.navngo.igo.javaclient.InsertSDCard r6 = getInsertSDCard()     // Catch: java.lang.Throwable -> L1b
            if (r6 == 0) goto L5a
            com.navngo.igo.javaclient.InsertSDCard r6 = getInsertSDCard()     // Catch: java.lang.Throwable -> L1b
            r6.finish()     // Catch: java.lang.Throwable -> L1b
            r6 = 0
            setInsertSDCard(r6)     // Catch: java.lang.Throwable -> L1b
        L5a:
            monitor-exit(r0)
            return r3
        L5c:
            monitor-exit(r0)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.Application.checkForSDCard(boolean):boolean");
    }

    private static void showSDNotification(boolean z) {
        NotificationManager notificationManager = (NotificationManager) anApplication.getSystemService("notification");
        if (isThereSDNotification() == z) {
            return;
        }
        if (z) {
            String string = anApplication.getString(R.string.sdcard_missing);
            Intent intent = new Intent(InsertSDCard.ACTION_DEFAULT);
            intent.addFlags(872415236);
            Notification notificationCreate = NotificationCreator.create(anApplication.getApplicationContext(), anApplication.getString(R.string.app_name), string, PendingIntent.getActivity(anApplication.getApplicationContext(), 0, intent, 67108864));
            Intent intent2 = new Intent(InsertSDCard.ACTION_CLEAR);
            intent2.addFlags(603979780);
            notificationCreate.deleteIntent = PendingIntent.getActivity(anApplication.getApplicationContext(), 0, intent2, 67108864);
            notificationCreate.defaults = 0;
            notificationManager.notify(1, notificationCreate);
        } else {
            notificationManager.cancel(1);
        }
        hasPendingSDNotification = z;
    }

    public static synchronized boolean isThereSDNotification() {
        return hasPendingSDNotification;
    }

    public static synchronized void setSDNotificationCleared(boolean z) {
        hasPendingSDNotification = !z;
    }

    public void startMainActivityInForeground() {
        IgoActivity.startInForeground(0);
    }

    public void uiWantGpsListener(int i) {
        DebugLogger.D5(logname, "uiWantGpsListener: " + i);
        ServerRunner.uiWantGpsListener(i != 0);
    }

    public final class ScreenSizes {
        boolean mOrientationIsFixed;
        public int mSize_x;
        public int mSize_x2;
        public int mSize_y;
        public int mSize_y2;

        private ScreenSizes() {
        }

        public boolean isOrientationFixed() {
            return this.mOrientationIsFixed;
        }
    }

    public void resetScreenSizes() {
        WindowManager windowManager = (WindowManager) getSystemService("window");
        Point point = new Point(NNG.NNG_ENGINE_STOPPED, 480);
        try {
            windowManager.getDefaultDisplay().getSize(point);
        } catch (Exception e) {
            DebugLogger.D1(logname, "Could not get screen sizes", e);
        }
        this.lastSurfaceWidth = point.x;
        this.lastSurfaceHeight = point.y;
    }

    public ScreenSizes getScreenSizes() {
        boolean z;
        int i;
        int i2;
        int i3;
        int i4;
        ScreenSizes screenSizes;
        Pattern pattern;
        int i5;
        ScreenSizes screenSizes2;
        boolean z2;
        long j;
        ScreenSizes screenSizes3 = new ScreenSizes();
        int i6 = this.lastSurfaceWidth;
        int i7 = this.lastSurfaceHeight;
        int i8 = i6 % 2;
        if (i8 != 0 || i7 % 2 != 0) {
            DebugLogger.D2(logname, "getScreenSizes: odd display size reported by getDisplayResolution(): (" + i6 + "x" + i7 + "), correcting");
            i6 += i8 != 0 ? 2 - i8 : 0;
            int i9 = i7 % 2;
            i7 += i9 != 0 ? 2 - i9 : 0;
        }
        DebugLogger.D3(logname, String.format(null, "getScreenSizes: Display: width=%d height=%d", Integer.valueOf(i6), Integer.valueOf(i7)));
        String string = Config.getString("rawdisplay", "screen_xy", "auto");
        if (string.equalsIgnoreCase("auto")) {
            i = this.lastSurfaceWidth;
            i4 = this.lastSurfaceHeight;
            int i10 = i % 2;
            if (i10 != 0 || i4 % 2 != 0) {
                DebugLogger.D2(logname, "getScreenSizes: odd size reported by getAvailableScreenSize(true): (" + i + "x" + i4 + "), correcting");
                i += i10 != 0 ? 2 - i10 : 0;
                int i11 = i4 % 2;
                i4 += i11 != 0 ? 2 - i11 : 0;
            }
            i3 = this.lastSurfaceWidth;
            i2 = this.lastSurfaceHeight;
            int i12 = i2 % 2;
            if (i12 != 0 || i3 % 2 != 0) {
                DebugLogger.D2(logname, "getScreenSizes: odd size reported by getAvailableScreenSize(false): (" + i2 + "x" + i3 + "), correcting");
                i2 += i12 != 0 ? 2 - i12 : 0;
                int i13 = i3 % 2;
                i3 += i13 != 0 ? 2 - i13 : 0;
            }
            screenSizes = screenSizes3;
        } else {
            long j2 = 0;
            boolean zEquals = Config.fullscreen;
            if (i6 < i7) {
                int i14 = i6 ^ i7;
                i7 ^= i14;
                i6 = i14 ^ i7;
                z = true;
            } else {
                z = false;
            }
            String[] strArrSplit = string.split(",");
            Pattern patternCompile = Pattern.compile("(\\d+)_(\\d+):(\\d+)x(\\d+)/(\\d+)x(\\d+)((:fullscreen)?)");
            int length = strArrSplit.length;
            int i15 = 0;
            int i16 = 0;
            int i17 = 0;
            int i18 = 0;
            int i19 = 0;
            while (i15 < length) {
                String str = strArrSplit[i15];
                Matcher matcher = patternCompile.matcher(str);
                if (!matcher.matches()) {
                    DebugLogger.D2(logname, "getScreenSizes screen_xy entry: (" + str + ")");
                    screenSizes2 = screenSizes3;
                    z2 = zEquals;
                    j = j2;
                    pattern = patternCompile;
                    i5 = length;
                } else {
                    int i20 = Integer.parseInt(matcher.group(1));
                    int i21 = Integer.parseInt(matcher.group(2));
                    pattern = patternCompile;
                    i5 = length;
                    screenSizes2 = screenSizes3;
                    z2 = zEquals;
                    long j3 = ((long) i20) * ((long) i21);
                    if (i6 < i20 || i7 < i21 || j3 < j2) {
                        j = j2;
                        DebugLogger.D2(logname, String.format(null, "getScreenSizes: display (%dx%d) is smaller than required (%dx%d)", Integer.valueOf(i6), Integer.valueOf(i7), Integer.valueOf(i16), Integer.valueOf(i19)));
                        if (i16 == 0) {
                            DebugLogger.D2(logname, String.format("getScreenSizes: display was detected 0x0, choosing the first one", new Object[0]));
                            i16 = Integer.parseInt(matcher.group(3));
                            i19 = Integer.parseInt(matcher.group(4));
                            i17 = Integer.parseInt(matcher.group(5));
                            i18 = Integer.parseInt(matcher.group(6));
                            boolean zEquals2 = matcher.group(7).equals(":fullscreen");
                            DebugLogger.D2(logname, String.format(null, "getScreenSizes: display (%dx%d) is smaller than required (%dx%d)", Integer.valueOf(i6), Integer.valueOf(i7), Integer.valueOf(i20), Integer.valueOf(i21)));
                            zEquals = zEquals2;
                        }
                    } else {
                        i16 = Integer.parseInt(matcher.group(3));
                        i19 = Integer.parseInt(matcher.group(4));
                        i17 = Integer.parseInt(matcher.group(5));
                        i18 = Integer.parseInt(matcher.group(6));
                        zEquals = matcher.group(7).equals(":fullscreen");
                    }
                    j2 = j3;
                    i15++;
                    patternCompile = pattern;
                    length = i5;
                    screenSizes3 = screenSizes2;
                }
                zEquals = z2;
                j2 = j;
                i15++;
                patternCompile = pattern;
                length = i5;
                screenSizes3 = screenSizes2;
            }
            ScreenSizes screenSizes4 = screenSizes3;
            boolean z3 = zEquals;
            if (z) {
                int i22 = i16 ^ i17;
                int i23 = i17 ^ i22;
                int i24 = i18 ^ i19;
                int i25 = i19 ^ i24;
                i3 = i24 ^ i25;
                i = i22 ^ i23;
                i2 = i23;
                i4 = i25;
            } else {
                i = i16;
                i2 = i17;
                i3 = i18;
                i4 = i19;
            }
            Config.fullscreen = z3;
            screenSizes = screenSizes4;
            screenSizes.mSize_x = i;
            screenSizes.mSize_y = i4;
            screenSizes.mSize_x2 = i2;
            screenSizes.mSize_y2 = i3;
            screenSizes.mOrientationIsFixed = (i2 == 0 && i != i4) || (i == 0 && i2 != i3);
        }
        screenSizes.mOrientationIsFixed = (Config.getInt("rawdisplay", "orientation", -1) != -1) | screenSizes.mOrientationIsFixed;
        DebugLogger.D3(logname, String.format(null, "getScreenSizes: %d,%d --> %d,%d %d,%d is_orientation_fixed: %b", Integer.valueOf(i6), Integer.valueOf(i7), Integer.valueOf(i), Integer.valueOf(i4), Integer.valueOf(i2), Integer.valueOf(i3), Boolean.valueOf(screenSizes.isOrientationFixed())));
        return screenSizes;
    }

    public int getDisplayDensityDpi() {
        return Resources.getSystem().getDisplayMetrics().densityDpi;
    }

    enum MultitouchSupport {
        None(0),
        Basic(1),
        Distinct(2),
        JazzHand(3);

        public final int code;

        MultitouchSupport(int i) {
            this.code = i;
        }
    }

    public int getDisplayMultitouchSupport() {
        PackageManager packageManager = getPackageManager();
        return packageManager.hasSystemFeature("android.hardware.touchscreen.multitouch.jazzhand") ? MultitouchSupport.JazzHand.code : packageManager.hasSystemFeature("android.hardware.touchscreen.multitouch.distinct") ? MultitouchSupport.Distinct.code : packageManager.hasSystemFeature("android.hardware.touchscreen.multitouch") ? MultitouchSupport.Basic.code : MultitouchSupport.None.code;
    }

    public OutArgs getSurfaceSize() {
        return new OutArgs(Integer.valueOf(this.lastSurfaceWidth), Integer.valueOf(this.lastSurfaceHeight), Boolean.valueOf(this.mainSurfacePresent));
    }

    public int getDeviceDependentMaxMemory() {
        float fMaxMemory = maxMemory();
        float f = Config.getInt("gtmc", "reference_resolution", 384000);
        float f2 = Config.getInt("gtmc", "reference_memory", 536870912);
        if (this.lastSurfaceWidth <= 0 || this.lastSurfaceHeight <= 0 || fMaxMemory <= 0.0f || f <= 0.0f || f2 <= 0.0f) {
            return -1;
        }
        return Math.min((int) ((Config.getInt("gtmc", "memory_per_resolution_ratio", 16777216) * ((this.lastSurfaceWidth * this.lastSurfaceHeight) / f)) + (Config.getInt("gtmc", "memory_per_max_memory_ratio", 83886080) * (fMaxMemory / f2))), Config.getInt("gtmc", "max_memory_limit", 314572800));
    }

    public void generateHapticFeedback(boolean z) {
        getMapView().asView().performHapticFeedback(z ? 1 : 8, 1);
    }

    public boolean is_gles2_supported() {
        return ((ActivityManager) getSystemService("activity")).getDeviceConfigurationInfo().reqGlEsVersion >= 131072;
    }

    public void requestActivityOrientation(final int i) {
        runActivityCommand(new IActivityCommand() { // from class: com.navngo.igo.javaclient.Application.1
            @Override // com.navngo.igo.javaclient.Application.IActivityCommand
            public void run(IgoActivity igoActivity) {
                igoActivity.requestOrientation(i);
            }
        });
    }

    public static void setIgoActivity(IgoActivity igoActivity, boolean z) {
        synchronized (shortLock) {
            theIgoActivity = igoActivity;
        }
        if (igoActivity == null || !z) {
            return;
        }
        anApplication.runActivityCommands();
    }

    public static IgoActivity getIgoActivity() {
        IgoActivity igoActivity;
        synchronized (shortLock) {
            igoActivity = theIgoActivity;
        }
        return igoActivity;
    }

    public synchronized void runActivityCommand(final IActivityCommand iActivityCommand) {
        final IgoActivity igoActivity = getIgoActivity();
        if (igoActivity != null) {
            igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.Application.2
                @Override // java.lang.Runnable
                public void run() {
                    iActivityCommand.run(igoActivity);
                }
            });
        } else {
            this.mActivityCommands.add(iActivityCommand);
        }
    }

    private synchronized void runActivityCommands() {
        final IgoActivity igoActivity = getIgoActivity();
        final ArrayList arrayList = new ArrayList(this.mActivityCommands);
        this.mActivityCommands.clear();
        igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.Application.3
            @Override // java.lang.Runnable
            public void run() {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    ((IActivityCommand) it.next()).run(igoActivity);
                }
            }
        });
    }

    public static void setMainService(MainService mainService) {
        String str = mainServiceLock;
        synchronized (str) {
            theMainService = mainService;
            if (mainService != null) {
                serviceRunner.setMainServiceState(ServiceRunner.ServiceState.RUNNING);
            } else {
                serviceRunner.setMainServiceState(ServiceRunner.ServiceState.STOPPED);
            }
            str.notify();
        }
    }

    public static void setMapView(IMapView iMapView) {
        synchronized (shortLock) {
            DebugLogger.D5(logname, iMapView == null ? "setMapView NULL" : "setMapView VALID");
            theMapView = iMapView;
        }
    }

    public final IMapView createMapView() {
        IMapView mapView;
        synchronized (createMapViewLock) {
            mapView = getMapView();
            if (mapView == null) {
                String upperCase = Config.getString("rawdisplay", "driver", Config.def_additional_assets).toUpperCase(Locale.ROOT);
                if ((upperCase.isEmpty() || upperCase.contains("GLES")) && is_gles2_supported()) {
                    mapView = new GLMapView(getApplicationContext());
                } else {
                    mapView = new MapView(getApplicationContext());
                }
                setMapView(mapView);
            }
        }
        return mapView;
    }

    public static IMapView getMapView() {
        IMapView iMapView;
        synchronized (shortLock) {
            iMapView = theMapView;
        }
        return iMapView;
    }

    public static int getSoundStream() {
        int i;
        synchronized (shortLock) {
            i = Sound.getInstance().mSoundStream;
        }
        return i;
    }

    public static TTSSpeaker getTTSSpeaker() {
        TTSSpeaker tTSSpeaker;
        synchronized (shortLock) {
            if (mTtsSpeaker == null) {
                mTtsSpeaker = TTSSpeakerFactory.newInstance();
                anApplication.runActivityCommand(new IActivityCommand() { // from class: com.navngo.igo.javaclient.Application.4
                    @Override // com.navngo.igo.javaclient.Application.IActivityCommand
                    public void run(IgoActivity igoActivity) {
                        igoActivity.addActivityResultHandler(new TTSSupportedLangResultHandler(Application.mTtsSpeaker));
                    }
                });
            }
            tTSSpeaker = mTtsSpeaker;
        }
        return tTSSpeaker;
    }

    public static AudioManager getAudioManager() {
        AudioManager audioManager;
        synchronized (shortLock) {
            if (mAudioManager == null) {
                mAudioManager = (AudioManager) anApplication.getSystemService("audio");
            }
            audioManager = mAudioManager;
        }
        return audioManager;
    }

    public static ASRRecognizer getASRRecognizer() {
        if (mAsrRecognizer == null && getIgoActivity() != null) {
            getIgoActivity().runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.Application.5
                @Override // java.lang.Runnable
                public void run() {
                    ASRRecognizer unused = Application.mAsrRecognizer = new ASRRecognizer();
                }
            });
        }
        return mAsrRecognizer;
    }

    public static int TTS_TestLanguageAndVoice(String str, String str2) {
        return getTTSSpeaker().testLanguageAndVoice(str, str2) ? 1 : 0;
    }

    public static HttpUtility getHttpUtility() {
        HttpUtility httpUtility2;
        synchronized (shortLock) {
            if (httpUtility == null) {
                httpUtility = new HttpUtility();
            }
            httpUtility2 = httpUtility;
        }
        return httpUtility2;
    }

    public static void dropHttpUtility() {
        HttpUtility httpUtility2;
        synchronized (shortLock) {
            httpUtility2 = httpUtility;
            httpUtility = null;
        }
        if (httpUtility2 != null) {
            httpUtility2.close();
        }
    }

    public static AntHttpUtility getAntHttpUtility() {
        AntHttpUtility antHttpUtility2;
        synchronized (shortLock) {
            if (antHttpUtility == null) {
                antHttpUtility = new AntHttpUtility();
            }
            antHttpUtility2 = antHttpUtility;
        }
        return antHttpUtility2;
    }

    public static void dropAntHttpUtility() {
        AntHttpUtility antHttpUtility2;
        synchronized (shortLock) {
            antHttpUtility2 = antHttpUtility;
            antHttpUtility = null;
        }
        if (antHttpUtility2 != null) {
            antHttpUtility2.close();
        }
    }

    public static void setInsertSDCard(InsertSDCard insertSDCard) {
        synchronized (shortLock) {
            theInsertSDCard = insertSDCard;
        }
    }

    public static InsertSDCard getInsertSDCard() {
        InsertSDCard insertSDCard;
        synchronized (shortLock) {
            insertSDCard = theInsertSDCard;
        }
        return insertSDCard;
    }

    public static void setBootTime(long j) {
        synchronized (shortLock) {
            bootTime = j;
        }
    }

    public static long getBootTime() {
        long j;
        synchronized (shortLock) {
            j = bootTime;
        }
        return j;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14 */
    /* JADX WARN: Type inference failed for: r0v2 */
    /* JADX WARN: Type inference failed for: r0v6, types: [int] */
    /* JADX WARN: Type inference failed for: r0v7, types: [int] */
    /* JADX WARN: Type inference failed for: r0v8 */
    public static int freeMemory() throws Throwable {
        FileInputStream fileInputStream;
        ?? FreeMemory = "/proc/meminfo";
        FileInputStream fileInputStream2 = null;
        try {
            try {
                try {
                    if (!Config.silent_startup) {
                        DebugLogger.D4(logname, "Trying to open /proc/meminfo fd");
                    }
                    fileInputStream = new FileInputStream("/proc/meminfo");
                } catch (IOException e) {
                    DebugLogger.D2(logname, "closing /proc/meminfo", e);
                }
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            int i = Integer.parseInt(new String(StreamUtility.readInputStream(fileInputStream, 2000)).replaceFirst("(?s).*MemFree:\\s+(\\d+).*", "$1")) << 10;
            fileInputStream.close();
            FreeMemory = i;
        } catch (Exception e3) {
            e = e3;
            fileInputStream2 = fileInputStream;
            DebugLogger.D2(logname, "/proc/meminfo", e);
            FreeMemory = (int) Runtime.getRuntime().freeMemory();
            if (fileInputStream2 != null) {
                fileInputStream2.close();
                FreeMemory = FreeMemory;
            }
            return FreeMemory;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream2 = fileInputStream;
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (IOException e4) {
                    DebugLogger.D2(logname, "closing /proc/meminfo", e4);
                }
            }
            throw th;
        }
        return FreeMemory;
    }

    public static long maxMemory() throws Throwable {
        long j;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2 = null;
        try {
            try {
                try {
                    if (!Config.silent_startup) {
                        DebugLogger.D4(logname, "Trying to open /proc/meminfo fd");
                    }
                    fileInputStream = new FileInputStream("/proc/meminfo");
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Exception e) {
                e = e;
            }
        } catch (IOException e2) {
            DebugLogger.D2(logname, "closing /proc/meminfo", e2);
        }
        try {
            j = Long.parseLong(new String(StreamUtility.readInputStream(fileInputStream, 2000)).replaceFirst("(?s).*MemTotal:\\s+(\\d+).*", "$1")) << 10;
            fileInputStream.close();
        } catch (Exception e3) {
            e = e3;
            fileInputStream2 = fileInputStream;
            DebugLogger.D2(logname, "/proc/meminfo; maxMemory set to 1 GB", e);
            j = 1073741824;
            if (fileInputStream2 != null) {
                fileInputStream2.close();
            }
            return j;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream2 = fileInputStream;
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (IOException e4) {
                    DebugLogger.D2(logname, "closing /proc/meminfo", e4);
                }
            }
            throw th;
        }
        return j;
    }

    public static void startSensors() {
        if (Config.getBool("gps", "sensors_on", false)) {
            getSensorUtility().startSensors();
        }
    }

    public static void stopSensors() {
        SensorUtility sensorUtility;
        synchronized (shortLock) {
            sensorUtility = theSensorUtility;
        }
        if (sensorUtility != null) {
            sensorUtility.stopSensors();
        }
    }

    private static SensorUtility getSensorUtility() {
        SensorUtility sensorUtility;
        synchronized (shortLock) {
            if (theSensorUtility == null) {
                theSensorUtility = new SensorUtility();
            }
            sensorUtility = theSensorUtility;
        }
        return sensorUtility;
    }

    public static void setMediaScanning(boolean z) {
        long jElapsedRealtime;
        synchronized (shortLock) {
            if (z) {
                try {
                    jElapsedRealtime = SystemClock.elapsedRealtime();
                } finally {
                }
            } else {
                jElapsedRealtime = 0;
            }
            mediascanning_timestamp = jElapsedRealtime;
        }
        if (z) {
            return;
        }
        String str = mediascanning_event;
        synchronized (str) {
            str.notifyAll();
        }
    }

    public static void waitMediaScanning() {
        long j;
        synchronized (shortLock) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            long j2 = mediascanning_timestamp;
            j = j2 > 0 ? jElapsedRealtime - (j2 + ((long) Config.getInt("android", "mediascanning_timeout", Config.def_mediascanning_timeout))) : 0L;
        }
        if (j > 0) {
            String str = mediascanning_event;
            synchronized (str) {
                try {
                    str.wait(j);
                } catch (InterruptedException unused) {
                }
            }
        }
    }

    public static void setupAudioPath(AudioManager audioManager) {
        if (Config.getBool("android", "setup_audio_path", false)) {
            int i = Config.getInt("android", "bt_route", 16);
            boolean bool = Config.getBool("android", "bt_sco_on", (i & 20) != 0);
            boolean bool2 = Config.getBool("android", "speakerphone_on", (i & 2) != 0);
            audioManager.setMode(0);
            DebugLogger.D5(logname, "SCO BT before: " + audioManager.isBluetoothScoOn());
            if (bool) {
                audioManager.startBluetoothSco();
            }
            audioManager.setBluetoothScoOn(bool);
            if (!bool) {
                audioManager.stopBluetoothSco();
            }
            DebugLogger.D5(logname, "SCO BT after: " + audioManager.isBluetoothScoOn());
            DebugLogger.D5(logname, "Speakerphone before: " + audioManager.isSpeakerphoneOn());
            audioManager.setSpeakerphoneOn(bool2);
            DebugLogger.D5(logname, "Speakerphone after: " + audioManager.isSpeakerphoneOn());
        }
    }

    public static Geocoder getGeocoder() {
        if (theGeocoder == null) {
            theGeocoder = new Geocoder(anApplication.getApplicationContext());
        }
        return theGeocoder;
    }

    public boolean timeStampMatch() {
        return getSharedPreferences("PREVIOUS_TIMESTAMP", 0).getLong("build_timestamp", 0L) == BuildConfig.TIMESTAMP;
    }

    private void saveBuildTimeStamp() {
        SharedPreferences.Editor editorEdit = getSharedPreferences("PREVIOUS_TIMESTAMP", 0).edit();
        editorEdit.putLong("build_timestamp", BuildConfig.TIMESTAMP);
        editorEdit.apply();
    }

    public static boolean localeHasBeenChanged() {
        String str = savedOSLocale;
        return (str == null || str.equals(getOSLocale())) ? false : true;
    }

    public static String getOSLanguageKeys() {
        String oSLocale = getOSLocale();
        String strLocale2LanguageKey = locale2LanguageKey(oSLocale);
        int iIndexOf = oSLocale.indexOf(95);
        String strLocale2LanguageKey2 = iIndexOf >= 0 ? locale2LanguageKey(oSLocale.substring(0, iIndexOf)) : null;
        if (strLocale2LanguageKey == null) {
            strLocale2LanguageKey = strLocale2LanguageKey2 != null ? strLocale2LanguageKey2 : "english US";
        } else if (strLocale2LanguageKey2 != null) {
            strLocale2LanguageKey = strLocale2LanguageKey + "," + strLocale2LanguageKey2;
        }
        DebugLogger.D5(logname, "getOSLanguageKeys: " + oSLocale + " => " + strLocale2LanguageKey);
        return strLocale2LanguageKey;
    }

    public static boolean saveCurrentLocale() {
        savedOSLocale = getOSLocale();
        return true;
    }

    public static String getOSLocale() {
        String string;
        try {
            string = anApplication.getResources().getConfiguration().locale.toString();
        } catch (Exception unused) {
            DebugLogger.D2(logname, "Locale is not available, returning default");
            string = "en_US";
        }
        DebugLogger.D5(logname, "getOSLocale: " + string);
        return string;
    }

    private static String locale2LanguageKey(String str) {
        String strGroup;
        if (oslangcodes_ini_builtin == null) {
            if (!NNG_FullyLoaded) {
                NNG.reInit();
            }
            try {
                oslangcodes_ini_builtin = StreamUtility.readFile(anApplication.getApplicationContext(), R.raw.oslangcodes);
            } catch (Exception e) {
                DebugLogger.D1(logname, "locale2LanguageKey", e);
            }
            try {
                oslangcodes_ini_content = Config.def_additional_assets;
                oslangcodes_ini_content = StreamUtility.readFile(Config.sdcardDir + Config.oslangcodes_ini);
            } catch (Exception unused) {
                DebugLogger.D5(logname, "locale2LanguageKey: content/config/oslangcodes.ini not found, using defaults");
            }
        }
        Pattern patternCompile = Pattern.compile("^\\s*aLanguage\\s*=\\s*(\"?)([^\"]*)\\1".replaceFirst("aLanguage", Pattern.quote(str).replace("\\", "\\\\")), 8);
        Matcher matcher = patternCompile.matcher(oslangcodes_ini_content);
        if (matcher.find()) {
            strGroup = matcher.group(2);
        } else {
            Matcher matcher2 = patternCompile.matcher(oslangcodes_ini_builtin);
            strGroup = matcher2.find() ? matcher2.group(2) : null;
        }
        DebugLogger.D5(logname, "locale2LanguageKey: " + str + " = " + strGroup);
        return strGroup;
    }

    public static void setSatellites(int[] iArr) {
        synchronized (shortLock) {
            satellites = iArr;
        }
        ServerRunner.onSatellitesChanged();
    }

    public static void clearSatellites() {
        synchronized (shortLock) {
            satellites = new int[0];
        }
        ServerRunner.onSatellitesChanged();
    }

    public static int[] getSatellites() {
        int[] iArr;
        synchronized (shortLock) {
            int[] iArr2 = satellites;
            iArr = new int[iArr2.length];
            System.arraycopy(iArr2, 0, iArr, 0, iArr2.length);
        }
        return iArr;
    }

    public static void logBuild() {
        DebugLogger.D3("Application:logBuild", "BOARD = " + Build.BOARD);
        DebugLogger.D3("Application:logBuild", "BRAND = " + Build.BRAND);
        DebugLogger.D3("Application:logBuild", "DEVICE = " + Build.DEVICE);
        DebugLogger.D3("Application:logBuild", "DISPLAY = " + Build.DISPLAY);
        DebugLogger.D3("Application:logBuild", "FINGERPRINT = " + Build.FINGERPRINT);
        DebugLogger.D3("Application:logBuild", "HOST = " + Build.HOST);
        DebugLogger.D3("Application:logBuild", "ID = " + Build.ID);
        DebugLogger.D3("Application:logBuild", "MODEL = " + Build.MODEL);
        DebugLogger.D3("Application:logBuild", "PRODUCT = " + Build.PRODUCT);
        if (Build.VERSION.SDK_INT >= 9) {
            DebugLogger.D3("Application:logBuild", "SERIAL = " + Build.SERIAL);
        }
        DebugLogger.D3("Application:logBuild", "TAGS = " + Build.TAGS);
        DebugLogger.D3("Application:logBuild", "TIME = " + Build.TIME);
        DebugLogger.D3("Application:logBuild", "TYPE = " + Build.TYPE);
        DebugLogger.D3("Application:logBuild", "USER = " + Build.USER);
        DebugLogger.D3("Application:logBuild", "VERSION.INCREMENTAL = " + Build.VERSION.INCREMENTAL);
        DebugLogger.D3("Application:logBuild", "VERSION.RELEASE = " + Build.VERSION.RELEASE);
        DebugLogger.D3("Application:logBuild", "VERSION.SDK = " + Build.VERSION.SDK_INT);
    }

    public static void reInit() {
        oslangcodes_ini_builtin = null;
        oslangcodes_ini_content = Config.def_additional_assets;
        Config.reload(1);
        NNG.reInit();
    }

    public static void exit(boolean z) {
        exitOnDestroy = z;
        if (ServerRunner.tryGetStatusThread() != null) {
            if (z) {
                ServerRunner.stopServer();
            } else {
                ServerRunner.suspendServer();
            }
        }
        final IgoActivity igoActivity = getIgoActivity();
        if (igoActivity != null) {
            igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.Application.6
                @Override // java.lang.Runnable
                public void run() {
                    igoActivity.finish();
                    Application.NNG_shouldMessageBoxOnRebuildDataDirFailure = true;
                }
            });
        }
        ServiceRunner serviceRunner2 = serviceRunner;
        if (serviceRunner2 != null) {
            serviceRunner2.stopServices();
        }
    }

    public void rollback() {
        DebugLogger.D3(logname, "Rollback called");
        String string = Config.getString("folders", "content_store", Config.def_additional_assets);
        if (!new File(string).exists()) {
            DebugLogger.D3(logname, "Content store not found");
        } else {
            syncDirsThenExit(string, Config.sdcardDir);
        }
    }

    public void syncDirsThenExit(String str, String str2) {
        String[] strArrSplit = str.split("\\&");
        String[] strArrSplit2 = str2.split("\\&");
        if (strArrSplit.length != strArrSplit2.length) {
            DebugLogger.D2(logname, "file sync failed unequal number of input and output file paths");
            return;
        }
        exit(true);
        ServerRunner.waitForClosingIgo();
        for (int i = 0; i < strArrSplit.length; i++) {
            try {
                DebugLogger.D3(logname, "Sync from [" + strArrSplit[i] + "] to [" + strArrSplit2[i] + "]");
                DataInstaller.SyncDirs(new File(strArrSplit[i]), new File(strArrSplit2[i]));
            } catch (IOException e) {
                DebugLogger.D2(logname, "Exception while sync files:", e);
            }
        }
        DebugLogger.D3(logname, "File sync completed, exiting...");
        IgoActivity igoActivity = getIgoActivity();
        if (igoActivity != null) {
            igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.Application.7
                @Override // java.lang.Runnable
                public void run() {
                    Toast.makeText(Application.this.getApplicationContext(), "File sync completed", 1).show();
                }
            });
        }
        System.exit(0);
    }

    public static void blockWhileExit(boolean z) {
        DebugLogger.D3(logname, "Exiting iGO...");
        exit(z);
        DebugLogger.D3(logname, "Blocking system shutdown until iGO has successfully exited.");
        ServerRunner.waitForClosingIgo();
        DebugLogger.D3(logname, "iGO closed successfully.");
        System.exit(0);
    }

    public static void dropServices(boolean z) {
        if (z) {
            DebugLogger.D5(logname, "dropServices: request queued");
            new Thread(new Runnable() { // from class: com.navngo.igo.javaclient.Application.8
                @Override // java.lang.Runnable
                public void run() {
                    Application.dropServices(false);
                }
            }, "dropServices");
        } else {
            DebugLogger.D5(logname, "dropServices: dropHttpUtility");
            dropHttpUtility();
            DebugLogger.D5(logname, "dropServices: dropAntHttpUtility");
            dropAntHttpUtility();
        }
    }

    private void killOldDebugger() {
        new File("/proc").listFiles(new FilenameFilter() { // from class: com.navngo.igo.javaclient.Application.9
            @Override // java.io.FilenameFilter
            public boolean accept(File file, String str) throws Throwable {
                try {
                    int i = Integer.parseInt(str);
                    String file2 = StreamUtility.readFile(new File(new File(file, str), "cmdline").getPath());
                    int iIndexOf = file2.indexOf(0);
                    if (iIndexOf < 0 || !file2.substring(0, iIndexOf).endsWith("gdbserver")) {
                        return false;
                    }
                    DebugLogger.D2(Application.logname, "killing old debugger. pid = " + i);
                    Process.killProcess(i);
                } catch (Exception unused) {
                }
                return false;
            }
        });
    }

    public final void registerInterfaces() {
        DebugLogger.D4(logname, "registerInterfaces()");
        registerApplicationFunctors();
        synchronized (mainServiceLock) {
            while (theMainService == null) {
                try {
                    DebugLogger.D3(logname, "registerInterfaces(): waiting for MainService");
                    mainServiceLock.wait(1000L);
                } catch (InterruptedException unused) {
                }
            }
            DebugLogger.D3(logname, "registerInterfaces(): MainService created");
        }
        MainService mainService = theMainService;
        if (mainService != null) {
            mainService.registerInterfaces();
        }
    }

    public final void unregisterInterfaces() {
        DebugLogger.D3(logname, "unregisterInterfaces()");
        this.guiSurfaceCreated = false;
        anApplication.unregisterObservers(false);
        anApplication.unregisterReceivers(false);
        anApplication.unregisterFunctorCollections();
    }

    public final void registerObserver(IObserver iObserver) {
        ContentResolver contentResolver = getContentResolver();
        this.mContentObservers.add(iObserver);
        iObserver.registerContentObserver(contentResolver);
    }

    public final void unregisterObservers(boolean z) {
        ContentResolver contentResolver = getContentResolver();
        Iterator<IObserver> it = this.mContentObservers.iterator();
        while (it.hasNext()) {
            it.next().unregisterContentObserver(contentResolver);
        }
    }

    public final void registerReceiver(IReceiver iReceiver) {
        this.mReceivers.add(iReceiver);
        iReceiver.register();
    }

    public final void unregisterReceivers(boolean z) {
        Iterator<IReceiver> it = this.mReceivers.iterator();
        while (it.hasNext()) {
            try {
                it.next().unregister();
            } catch (IllegalArgumentException unused) {
            }
        }
        this.mReceivers.clear();
    }

    public final void registerCommonReceivers() {
        if (Config.getBool("android", "notify_network_status", Config.def_notify_network_status)) {
            registerReceiver(NetworkStatusReceiver.instance);
        }
        registerReceiver(PhoneIntentReceiver.instance);
        PhoneIntentReceiver.processState(PhoneIntentReceiver.getState());
        registerReceiver(TimeReceiver.instance);
        registerReceiver(Sound.getInstance());
        registerReceiver(BatteryStatusReceiver.INSTANCE);
        registerReceiver(AndroidOSEventsBridge.instance);
        registerReceiver(SynctoolCommandReceiver.instance);
    }

    public final void registerFunctorCollection(IFunctorCollection iFunctorCollection) {
        iFunctorCollection.registerFunctors();
    }

    public final void unregisterFunctorCollections() {
        AndroidGo.destroy();
    }
}
