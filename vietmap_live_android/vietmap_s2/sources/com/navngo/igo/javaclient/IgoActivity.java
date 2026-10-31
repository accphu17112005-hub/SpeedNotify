package com.navngo.igo.javaclient;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.KeyguardManager;
import android.app.ProgressDialog;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.igo.javaclient.intentprocessers.GeoIntentProcesser;
import com.navngo.igo.javaclient.intentprocessers.IIntentProcesser;
import com.navngo.igo.javaclient.observer.IObserver;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import com.navngo.igo.javaclient.receiver.IReceiver;
import com.navngo.igo.javaclient.view.IMapView;
import com.navngo.igo.javaclient.voice_recognition.GoogleVR;
import com.navngo.program.ProgramPhases;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IgoActivity extends AppCompatActivity {
    private static final int DIALOG_ABORTRETRYIGNORE = 1;
    private static final int DIALOG_OK = 2;
    private static final int DIALOG_OKCANCEL = 3;
    static final String INTENT_HANDLED = "com.navngo.igo.javaclient.INTENT_HANDLED";
    static final String INTENT_STARTLOCKS = "com.navngo.igo.javaclient.STARTLOCKS";
    private static final String logname = "IgoActivity";
    private String dialogMsg;
    private int[] dialogRet;
    private String dialogTitle;
    protected Menu mMenu;
    private static List<OnActivityRecreatedListener> mOnRecreatedListeners = new ArrayList();
    public static String EXTRA_IS_INTERNAL_EVENT = "com.navngo.igo.javaclient.extra.IS_INTERNAL_EVENT";
    private static IgoActivity INSTANCE = null;
    private static final int ICON_ABORTRETRYIGNORE = Application.APPICON_ID;
    private static final int ICON_OK = Application.APPICON_ID;
    private static final int ICON_OKCANCEL = Application.APPICON_ID;
    private List<IIntentProcesser> mIntentProcessers = new ArrayList();
    private Map<Integer, IActivityResultHandler> mActivityResultHandlers = new HashMap();
    private List<OnActivityDestroyedListener> mOnDestroyedListeners = new ArrayList();
    private final String shortLock = new String("shortLock");
    private GoogleVR googleVR = null;
    private boolean destroyed = false;
    private Locale prevLocale = null;
    private boolean mFixedOrientation = false;
    private boolean mOrientationLocked = false;
    public boolean mNoSystemExit = false;
    private Intent mLatestReceivedIntent = null;
    final String mIntentLock = "IntentLock";
    private ProgressDialog progressDialog = null;
    private Set<Object> mStuckWaiters = new HashSet();
    private int mRequestedOrientation = -1;

    public void SetPlatformID() {
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public String getDeviceId() {
        return null;
    }

    protected void onIgoStarted() {
    }

    protected void onMultipleCreateOptionsMenu(Menu menu) {
    }

    protected void onLoadingFinished(boolean z) {
        hideLoadAnimation();
        if (z && NNG.IsIntroEnded()) {
            onIgoStarted();
        }
    }

    public final void addIntentProcesser(IIntentProcesser iIntentProcesser) {
        this.mIntentProcessers.add(iIntentProcesser);
    }

    public final void addIntentProcesser(IIntentProcesser iIntentProcesser, boolean z) {
        addIntentProcesser(iIntentProcesser);
        if (z) {
            Intent intent = getIntent();
            if (iIntentProcesser.matchesIntent(intent)) {
                iIntentProcesser.processIntent(intent);
            }
        }
    }

    public final void addActivityResultHandler(IActivityResultHandler iActivityResultHandler) {
        this.mActivityResultHandlers.put(Integer.valueOf(iActivityResultHandler.getHandledRequestCode()), iActivityResultHandler);
    }

    @Deprecated
    public final void registerObserver(IObserver iObserver) {
        Application.anApplication.registerObserver(iObserver);
    }

    @Deprecated
    public final void registerReceiver(IReceiver iReceiver) {
        Application.anApplication.registerReceiver(iReceiver);
    }

    @Deprecated
    protected final void registerCommonReceivers() {
        Application.anApplication.registerCommonReceivers();
    }

    @Deprecated
    public final void registerFunctorCollection(IFunctorCollection iFunctorCollection) {
        Application.anApplication.registerFunctorCollection(iFunctorCollection);
    }

    public final void registerOnActivityDestroyedListener(OnActivityDestroyedListener onActivityDestroyedListener) {
        this.mOnDestroyedListeners.add(onActivityDestroyedListener);
    }

    public final void registerOnActivityRecreatedListener(OnActivityRecreatedListener onActivityRecreatedListener) {
        mOnRecreatedListeners.add(onActivityRecreatedListener);
    }

    protected void setMapViewAsContentView() {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.1
            @Override // java.lang.Runnable
            public void run() {
                IMapView iMapViewCreateMapView = Application.anApplication.createMapView();
                View viewAsView = iMapViewCreateMapView.asView();
                ViewParent parent = viewAsView.getParent();
                if (parent != null && (parent instanceof ViewGroup)) {
                    ((ViewGroup) parent).removeView(viewAsView);
                }
                int i = Config.getInt("rawdisplay", "screen_x", 0);
                int i2 = Config.getInt("rawdisplay", "screen_y", 0);
                if (i != 0 && i2 != 0) {
                    DebugLogger.D2(IgoActivity.logname, "Overriding screen resolution using a linear layout: [ " + i + " x " + i2 + " ]");
                    LinearLayout linearLayout = new LinearLayout(IgoActivity.this.getApplicationContext());
                    linearLayout.addView(viewAsView, new ViewGroup.LayoutParams(i, i2));
                    int i3 = Config.getInt("rawdisplay", "paddig_left", 0);
                    int i4 = Config.getInt("rawdisplay", "paddig_top", 0);
                    int i5 = Config.getInt("rawdisplay", "padding_right", 0);
                    int i6 = Config.getInt("rawdisplay", "padding_bottom", 0);
                    DebugLogger.D3(IgoActivity.logname, "Padding values for linear layout:  Left: " + i3 + " Top: " + i4 + " Right: " + i5 + " Bottom: " + i6);
                    linearLayout.setPadding(i3, i4, i5, i6);
                    IgoActivity.this.setContentView(linearLayout);
                } else {
                    IgoActivity.this.setContentView(viewAsView);
                }
                if (Config.getBool("sdl", "enabled", false)) {
                    IgoActivity.this.connectToSdl(viewAsView);
                }
                iMapViewCreateMapView.getCommonInterface().requestFocus();
            }
        });
    }

    public void SetSleepMode(final boolean z) {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.2
            @Override // java.lang.Runnable
            public void run() {
                if (z) {
                    IgoActivity.this.getWindow().clearFlags(128);
                } else {
                    IgoActivity.this.getWindow().addFlags(128);
                }
            }
        });
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) throws Throwable {
        DebugLogger.D4(logname, "onCreate");
        super.onCreate(bundle);
        if (INSTANCE != null) {
            DebugLogger.D2(logname, "onCreate: INSTANCE is not null, destroying the old one. value = " + INSTANCE);
            INSTANCE.onDestroy();
        }
        INSTANCE = this;
        Application.anApplication.setApplicationContext(getApplicationContext());
        Application.setIgoActivity(this, false);
        requestPermissions();
        this.prevLocale = getLocale(getResources().getConfiguration());
        if (Application.localeHasBeenChanged()) {
            Application.saveCurrentLocale();
            if (ProgramPhases.getInstance().getPhase().getCode() > ProgramPhases.Phase.LANGUAGE_READY.getCode()) {
                AndroidGo.getInstance().callIgo("android.on_locale_changed", null, this.prevLocale.getLanguage());
            }
        }
    }

    protected void onPermissionsGranted() {
        DebugLogger.D3(logname, "permissions are granted");
        if (!ServerRunner.isEngineRunning() && !ServerRunner.isEngineStarting()) {
            DebugLogger.D2(logname, "Trying to create an activity while the engine is not running or starting.");
        }
        getWindow().addFlags(2097280);
        if (Config.getBool("android", "dismiss_keyguard", true)) {
            getWindow().addFlags(4718592);
        }
        Sound.getInstance().init(this);
        Application.exitOnDestroy = false;
        DebugLogger.D5(logname, "onPermissionsGranted:10");
        Application.setIgoActivity(this, true);
        DebugLogger.D5(logname, "onPermissionsGranted:20");
        try {
            getWindow().addFlags(128);
            ResumeHandler.INSTANCE.start(this);
            Config.reload(3);
            int i = Config.getInt("android", "wait_for_sdcard_on_start", 0);
            if (i > 0) {
                DebugLogger.D3(logname, "waiting " + i + "ms for sdcard");
                while (i > 0 && !Application.checkForSDCard(false)) {
                    int iMin = Math.min(i, NNG.NNG_ENGINE_STARTED);
                    i -= iMin;
                    try {
                        Thread.sleep(iMin);
                    } catch (InterruptedException unused) {
                    }
                }
            }
            if (!Application.checkForSDCard(false)) {
                InsertSDCard.show();
                Application.exit(true);
                return;
            }
            DebugLogger.D5(logname, "onPermissionsGranted:100");
            registerFunctors();
            this.googleVR = new GoogleVR();
            lockCurrentOrientation();
            setScreenSizes();
            if (Config.fullscreen) {
                getWindow().setFlags(1024, 1024);
            }
            DebugLogger.D5(logname, "onPermissionsGranted:200");
            ArrayList arrayList = new ArrayList(mOnRecreatedListeners);
            mOnRecreatedListeners.clear();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                ((OnActivityRecreatedListener) it.next()).onActivityRecreated(this);
            }
            ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.INTROSCREEN, false, new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.3
                @Override // java.lang.Runnable
                public void run() {
                    IgoActivity.this.onLoadingFinished(true);
                }
            });
        } finally {
            isFinishing();
        }
    }

    public void requestPermissions() {
        final List<String> criticalPermissions = PermissionHandler.get().getCriticalPermissions();
        List<String> optionalPermissions = PermissionHandler.get().getOptionalPermissions();
        ArrayList arrayList = new ArrayList(criticalPermissions);
        arrayList.addAll(optionalPermissions);
        PermissionHandler.get().requestPermissions(this, arrayList, new PermissionHandler.CallbackForMultiple() { // from class: com.navngo.igo.javaclient.IgoActivity.4
            @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForMultiple
            public void onAllPermissionsGranted() {
                Application.anApplication.onPermissionsGranted();
                IgoActivity.this.onPermissionsGranted();
            }

            @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForMultiple
            public void onSomePermissionsDenied(Map<String, Integer> map) {
                Iterator<Map.Entry<String, Integer>> it = map.entrySet().iterator();
                boolean z = false;
                while (true) {
                    boolean z2 = true;
                    if (!it.hasNext()) {
                        break;
                    }
                    Map.Entry<String, Integer> next = it.next();
                    StringBuilder sb = new StringBuilder();
                    sb.append(next.getKey());
                    sb.append(next.getValue().intValue() == 0 ? " granted" : " denied");
                    DebugLogger.D3(IgoActivity.logname, sb.toString());
                    if (next.getValue().intValue() == 0 || !criticalPermissions.contains(next.getKey())) {
                        z2 = false;
                    }
                    z |= z2;
                }
                if (z) {
                    DebugLogger.D3(IgoActivity.logname, "critical permission is denied: Application.exit(true)");
                    Application.exit(true);
                } else {
                    onAllPermissionsGranted();
                }
            }
        });
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity, androidx.core.app.ActivityCompat.OnRequestPermissionsResultCallback
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        super.onRequestPermissionsResult(i, strArr, iArr);
        PermissionHandler.get().onRequestPermissionsResult(i, strArr, iArr);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    private void setScreenSizes() {
        /*
            r6 = this;
            com.navngo.igo.javaclient.Application r0 = com.navngo.igo.javaclient.Application.anApplication
            r0.resetScreenSizes()
            com.navngo.igo.javaclient.Application r0 = com.navngo.igo.javaclient.Application.anApplication
            com.navngo.igo.javaclient.Application$ScreenSizes r0 = r0.getScreenSizes()
            boolean r1 = r0.isOrientationFixed()
            r6.mFixedOrientation = r1
            java.lang.String r2 = "IgoActivity"
            if (r1 == 0) goto L50
            java.lang.String r1 = "rawdisplay"
            java.lang.String r3 = "orientation"
            r4 = -1
            int r1 = com.navngo.igo.javaclient.Config.getInt(r1, r3, r4)
            r3 = 7
            r5 = 6
            if (r1 == r4) goto L2b
            if (r1 == 0) goto L29
            r0 = 1
            if (r1 == r0) goto L38
            r3 = 4
            goto L38
        L29:
            r3 = 6
            goto L38
        L2b:
            int r1 = r0.mSize_x
            int r4 = r0.mSize_y
            if (r1 > r4) goto L29
            int r1 = r0.mSize_x2
            int r0 = r0.mSize_y2
            if (r1 <= r0) goto L38
            goto L29
        L38:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "setScreenSizes() mFixedOrientation orientation:"
            r0.append(r1)
            r0.append(r3)
            java.lang.String r0 = r0.toString()
            com.navngo.igo.javaclient.DebugLogger.D3(r2, r0)
            r6.setRequestedOrientation(r3)
            goto L68
        L50:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            r0.<init>()
            java.lang.String r1 = "setScreenSizes() !mFixedOrientation orientation:"
            r0.append(r1)
            int r1 = r6.getCurrentOrientation()
            r0.append(r1)
            java.lang.String r0 = r0.toString()
            com.navngo.igo.javaclient.DebugLogger.D3(r2, r0)
        L68:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.IgoActivity.setScreenSizes():void");
    }

    private Locale getLocale(Configuration configuration) {
        if (Build.VERSION.SDK_INT >= 24) {
            return configuration.getLocales().get(0);
        }
        return configuration.locale;
    }

    public int getCurrentOrientation() {
        return getResources().getConfiguration().orientation == 2 ? 0 : 1;
    }

    protected void connectToSdl(View view) {
        try {
            Class<?> cls = Class.forName("com.navngo.igo.javaclient.sdl.SdlConnection");
            Object objNewInstance = cls.getConstructor(Activity.class).newInstance(this);
            Method method = cls.getMethod("bindSdlService", Intent.class);
            cls.getMethod("setSdlRemoteView", View.class).invoke(objNewInstance, view);
            method.invoke(objNewInstance, getIntent());
        } catch (Exception e) {
            Toast.makeText(this, "exception: " + e.getMessage(), 1).show();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.navngo.igo.javaclient.IgoActivity$5] */
    public void startLoaderThread() {
        new Thread("LoaderThread") { // from class: com.navngo.igo.javaclient.IgoActivity.5
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.000");
                Application.logBuild();
                Application.getTTSSpeaker().create();
                NNG.reInit();
                if (!Application.NNG_FullyLoaded) {
                    IgoActivity.this.onLoadingFinished(false);
                    DebugLogger.D1(IgoActivity.logname, "! NNG_FullyLoaded", new Exception("error loading NNG"));
                    Application.exit(true);
                    return;
                }
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.100");
                ServerRunner.startServerAfterMediaScan(false);
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.400");
                boolean bool = Config.getBool("android", "enable_geo_intents", true);
                if (Config.useDefaultLocation()) {
                    DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.410");
                    ServerRunner.onLocationChanged(null);
                }
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.500");
                ServerRunner.setOrientation(IgoActivity.this.getResources().getConfiguration().orientation);
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.600");
                synchronized ("IntentLock") {
                    Intent intent = IgoActivity.this.mLatestReceivedIntent != null ? IgoActivity.this.mLatestReceivedIntent : IgoActivity.this.getIntent();
                    boolean z = intent != null && intent.getBooleanExtra(IgoActivity.INTENT_HANDLED, false);
                    DebugLogger.D3(IgoActivity.logname, String.format(null, "StartloaderThread intent check: action = %s, handled = %b, flags = %d", intent.getAction(), Boolean.valueOf(z), Integer.valueOf(intent.getFlags())));
                    if (intent != null && !z && !IgoActivity.this.processIntent(intent)) {
                        DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.610");
                    }
                }
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.700");
                Application.setupAudioPath((AudioManager) Application.anApplication.getSystemService("audio"));
                DebugLogger.D5(IgoActivity.logname, "startLoaderThread:300.800");
                IgoActivity.this.setMapViewAsContentView();
                if (bool) {
                    IgoActivity.this.addIntentProcesser(new GeoIntentProcesser());
                }
            }
        }.start();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        DebugLogger.D5(logname, "onDestroy");
        if (this.destroyed) {
            DebugLogger.D2(logname, "onDestroy: this instance is already destroyed, exiting...");
            super.onDestroy();
            return;
        }
        this.destroyed = true;
        for (Object obj : this.mStuckWaiters) {
            DebugLogger.D4(logname, "onDestroy: releasing stuck dialog box");
            synchronized (obj) {
                obj.notify();
            }
            DebugLogger.D5(logname, "onDestroy: released  stuck dialog box");
        }
        hideLoadAnimation();
        ResumeHandler.INSTANCE.stop();
        Iterator<OnActivityDestroyedListener> it = this.mOnDestroyedListeners.iterator();
        while (it.hasNext()) {
            it.next().onActivityDestroyed(this);
        }
        this.mOnDestroyedListeners.clear();
        Application.setIgoActivity(null, false);
        boolean zLocaleHasBeenChanged = Application.localeHasBeenChanged();
        DebugLogger.D5(logname, "onDestroy:100 isFinishing: " + isFinishing() + " localeHasBeenChanged=" + zLocaleHasBeenChanged);
        if (!isFinishing() && !zLocaleHasBeenChanged) {
            DebugLogger.D5(logname, "onDestroy, but not finishing");
            super.onDestroy();
            INSTANCE = null;
            return;
        }
        DebugLogger.D5(logname, "onDestroy:200");
        boolean z = Application.exitOnDestroy;
        if (Application.exitOnDestroy) {
            Application.blockWhileExit(true);
        }
        DebugLogger.D5(logname, "onDestroy:600");
        super.onDestroy();
        DebugLogger.D5(logname, "onDestroy:700");
        if (!this.mNoSystemExit && Config.getBool("android", "call_system_exit", Config.def_callSystemExit) && Application.exitOnDestroy) {
            DebugLogger.D5(logname, "Calling System.exit(0)");
            System.exit(0);
        }
        INSTANCE = null;
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStart() {
        DebugLogger.D5(logname, "onStart called");
        super.onStart();
    }

    @Override // android.app.Activity
    protected void onRestart() {
        DebugLogger.D5(logname, "onRestart called");
        super.onRestart();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        DebugLogger.D5(logname, "onStop called");
        super.onStop();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        DebugLogger.D4(logname, "onNewIntent: " + intent);
        synchronized ("IntentLock") {
            intent.putExtra(INTENT_HANDLED, true);
            this.mLatestReceivedIntent = intent;
            DebugLogger.D4(logname, "onNewIntent");
            if ((intent.getFlags() & 1048576) == 0) {
                processIntent(intent);
            } else {
                DebugLogger.D4(logname, "Activity was launched from history: don't process intent");
            }
            setIntent(intent);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        DebugLogger.D4(logname, "onResume called");
        ResumeHandler.INSTANCE.resumeCalled();
        boolean zIsAppInForeground = Application.anApplication.isAppInForeground();
        if (!Application.serviceRunner.isMainServiceRunningOrStarting()) {
            Application.serviceRunner.startMainService(!zIsAppInForeground);
        } else {
            showBGNotification(false);
        }
        if (!Application.serviceRunner.isSlapiServiceRunningOrStarting()) {
            Application.serviceRunner.startSlapiService();
        }
        DebugLogger.D4(logname, "onResume finished");
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
        DebugLogger.D4(logname, "onPause called");
        ResumeHandler.INSTANCE.pauseCalled();
        showBGNotification(Config.getBool("android", "show_background_notification", true));
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        DebugLogger.D4(logname, "IgoActivity class onConfigurationChanged: " + configuration);
        DebugLogger.D5(logname, "IgoActivity class onConfigurationChanged: BEGIN");
        super.onConfigurationChanged(configuration);
        DebugLogger.D5(logname, "IgoActivity class onConfigurationChanged: MIDDLE");
        ServerRunner.setOrientation(configuration.orientation);
        AndroidGo androidGo = AndroidGo.getInstance();
        Locale locale = getLocale(configuration);
        if (!this.prevLocale.equals(locale)) {
            Application.saveCurrentLocale();
            androidGo.callIgo("android.on_locale_changed", null, locale.getLanguage());
            this.prevLocale = locale;
        }
        DebugLogger.D5(logname, "IgoActivity class onConfigurationChanged: END");
    }

    /* JADX WARN: Type inference failed for: r7v4, types: [com.navngo.igo.javaclient.IgoActivity$6] */
    protected boolean processIntent(Intent intent) {
        boolean z;
        DebugLogger.D3(logname, String.format(null, "processIntent: %s, flags = %d, extras = %s", intent.toString(), Integer.valueOf(intent.getFlags()), intent.getExtras()));
        Iterator<IIntentProcesser> it = this.mIntentProcessers.iterator();
        while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            IIntentProcesser next = it.next();
            if (next.matchesIntent(intent) && next.processIntent(intent)) {
                z = true;
                break;
            }
        }
        if (intent.getBooleanExtra(INTENT_STARTLOCKS, false)) {
            new Thread("INTENT_STARTLOCKS") { // from class: com.navngo.igo.javaclient.IgoActivity.6
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    try {
                        Thread.sleep(1000L);
                        IgoActivity.this.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.6.1
                            @Override // java.lang.Runnable
                            public void run() {
                                DebugLogger.D5(IgoActivity.logname, "executing INTENT_STARTLOCKS");
                                ((KeyguardManager) Application.anApplication.getSystemService("keyguard")).exitKeyguardSecurely(new KeyguardManager.OnKeyguardExitResult() { // from class: com.navngo.igo.javaclient.IgoActivity.6.1.1
                                    @Override // android.app.KeyguardManager.OnKeyguardExitResult
                                    public void onKeyguardExitResult(boolean z2) {
                                        DebugLogger.D4(IgoActivity.logname, "onKeyguardExitResult: success = " + z2);
                                    }
                                });
                                ResumeHandler.INSTANCE.retest(1000L);
                            }
                        });
                    } catch (InterruptedException unused) {
                    }
                }
            }.start();
        }
        DebugLogger.D3(logname, String.format("processIntent success: %b", Boolean.valueOf(z)));
        return z;
    }

    protected void showLoadAnimation() {
        if (ServerRunner.isEngineRunning()) {
            return;
        }
        this.progressDialog = new ProgressDialog(this);
        String string = getResources().getString(R.string.loading_motonav);
        DebugLogger.D5(logname, "showLoadAnimation: " + string);
        this.progressDialog.setMessage(string);
        this.progressDialog.setIndeterminate(true);
        this.progressDialog.setCancelable(false);
        this.progressDialog.setOwnerActivity(this);
        this.progressDialog.requestWindowFeature(2);
        this.progressDialog.requestWindowFeature(5);
        this.progressDialog.show();
    }

    public void hideLoadAnimation() {
        ProgressDialog progressDialog = this.progressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
            this.progressDialog = null;
            DebugLogger.D5(logname, "hideLoadAnimation done.");
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity, android.content.ComponentCallbacks
    public void onLowMemory() {
        DebugLogger.D3(logname, "onLowMemory");
        ServerRunner.onLowMemory();
    }

    private void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.optionsMenu.clear", this, "clearOptionsMenu");
        androidGo.registerFunctor("android.optionsMenu.show", this, "showOptionsMenu");
        androidGo.registerFunctor("android.optionsMenu.hide", this, "hideOptionsMenu");
        androidGo.registerFunctor("android.optionsMenu.addItem", this, "addOptionsMenuItem");
        androidGo.registerFunctor("android.optionsMenu.setItemProperties", this, "setOptionsMenuItemProperties");
        androidGo.registerFunctor("android.activity.setTitle", this, "setTitleBarText");
        androidGo.registerFunctor("android.getCurrentOrientation", this, "getCurrentOrientation");
        if (Config.getBool("android", "register_functors", true)) {
            androidGo.registerFunctor("android.go_to_background", this, "goToBackground");
            androidGo.registerFunctor("android.move_task_to_back", this, "uiMoveTaskToBack");
            androidGo.registerFunctor("android.goToHomeScreen", this, "goToHomeScreen");
            androidGo.registerFunctor("android.throwshutdownreasonexception", this, "throwShutdownReasonException");
        }
    }

    public void goToBackground() {
        DebugLogger.D5(logname, "goToBackground");
        if (Config.getBool("android", "register_functors", true)) {
            moveTaskToBack(true);
        }
    }

    public void uiMoveTaskToBack() {
        DebugLogger.D5(logname, "uiMoveTaskToBack");
        if (Config.getBool("android", "register_functors", true)) {
            moveTaskToBack(true);
        }
    }

    public void goToHomeScreen() {
        DebugLogger.D5(logname, "goToHomeScreen");
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.HOME");
        intent.setFlags(268435456);
        try {
            startActivity(intent);
        } catch (ActivityNotFoundException unused) {
        }
    }

    public void throwShutdownReasonException(String str) {
        DebugLogger.D2(logname, "Throwing RuntimeException to include shoutdown reason into crash report.");
        Application.ScreenSizes screenSizes = Application.anApplication.getScreenSizes();
        final String strReplace = str.replace("<resolutionnotsupported>", String.format(null, "<Resolution not supported: [%dx%d] [%dx%d]>", Integer.valueOf(screenSizes.mSize_x), Integer.valueOf(screenSizes.mSize_y), Integer.valueOf(screenSizes.mSize_x2), Integer.valueOf(screenSizes.mSize_y2)));
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.7
            @Override // java.lang.Runnable
            public void run() {
                throw new RuntimeException(strReplace);
            }
        });
    }

    public int MessageBox(final String str, String str2, int i) {
        final int i2;
        int i3;
        if (str2 == null) {
            str2 = getResources().getString(R.string.app_name);
        }
        final String str3 = str2;
        DebugLogger.D3(logname, "MessageBox: [" + str3 + "] " + str);
        if (i == 0) {
            i2 = 2;
        } else if ((i & 2) != 0) {
            i2 = 1;
        } else {
            if ((i & 1) == 0) {
                DebugLogger.D2(logname, "MessageBox: mb_opts = " + i);
                return 3;
            }
            i2 = 3;
        }
        if (!ResumeHandler.INSTANCE.isResumed()) {
            DebugLogger.D2(logname, "MessageBox can only be displayed if app is in foreground");
            return 5;
        }
        final int[] iArr = new int[1];
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.8
            @Override // java.lang.Runnable
            public void run() {
                IgoActivity.this.dialogMsg = str;
                IgoActivity.this.dialogTitle = str3;
                IgoActivity.this.dialogRet = iArr;
                if (ResumeHandler.INSTANCE.isResumed()) {
                    DebugLogger.D5(IgoActivity.logname, "MessageBox.showDialog");
                    IgoActivity.this.showDialog(i2);
                    return;
                }
                DebugLogger.D2(IgoActivity.logname, "MessageBox: [" + IgoActivity.this.dialogTitle + "] " + IgoActivity.this.dialogMsg);
                synchronized (iArr) {
                    int[] iArr2 = iArr;
                    iArr2[0] = 5;
                    iArr2.notify();
                }
            }
        });
        synchronized (iArr) {
            try {
                try {
                    this.mStuckWaiters.add(iArr);
                    iArr.wait();
                    this.mStuckWaiters.remove(iArr);
                    DebugLogger.D5(logname, "MessageBox returns " + iArr[0]);
                    i3 = iArr[0];
                } finally {
                    this.mStuckWaiters.remove(iArr);
                }
            } catch (InterruptedException unused) {
                return 4;
            }
        }
        return i3;
    }

    public int MessageBox(int i, String str, int i2) {
        return MessageBox(getResources().getString(i), str, i2);
    }

    @Override // android.app.Activity
    protected Dialog onCreateDialog(final int i, Bundle bundle) {
        DebugLogger.D5(logname, "onCreateDialog");
        if (i == 1) {
            return new AlertDialog.Builder(this).setIcon(ICON_ABORTRETRYIGNORE).setNegativeButton("ABORT", new DialogInterface.OnClickListener() { // from class: com.navngo.igo.javaclient.IgoActivity.12
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    IgoActivity.this.endDialog(dialogInterface, i, 3);
                }
            }).setNeutralButton("RETRY", new DialogInterface.OnClickListener() { // from class: com.navngo.igo.javaclient.IgoActivity.11
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    IgoActivity.this.endDialog(dialogInterface, i, 4);
                }
            }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.navngo.igo.javaclient.IgoActivity.10
                @Override // android.content.DialogInterface.OnCancelListener
                public void onCancel(DialogInterface dialogInterface) {
                    IgoActivity.this.endDialog(dialogInterface, i, 5);
                }
            }).setPositiveButton("IGNORE", new DialogInterface.OnClickListener() { // from class: com.navngo.igo.javaclient.IgoActivity.9
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    IgoActivity.this.endDialog(dialogInterface, i, 5);
                }
            }).setMessage(this.dialogMsg).setTitle(this.dialogTitle).create();
        }
        if (i == 2) {
            return new AlertDialog.Builder(this).setIcon(ICON_OK).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.navngo.igo.javaclient.IgoActivity.14
                @Override // android.content.DialogInterface.OnCancelListener
                public void onCancel(DialogInterface dialogInterface) {
                    IgoActivity.this.endDialog(dialogInterface, i, 2);
                }
            }).setPositiveButton("Ok", new DialogInterface.OnClickListener() { // from class: com.navngo.igo.javaclient.IgoActivity.13
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    IgoActivity.this.endDialog(dialogInterface, i, 1);
                }
            }).setMessage(this.dialogMsg).setTitle(this.dialogTitle).create();
        }
        if (i == 3) {
            return new AlertDialog.Builder(this).setIcon(ICON_OKCANCEL).setPositiveButton("Ok", new DialogInterface.OnClickListener() { // from class: com.navngo.igo.javaclient.IgoActivity.17
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    IgoActivity.this.endDialog(dialogInterface, i, 1);
                }
            }).setNegativeButton("Cancel", new DialogInterface.OnClickListener() { // from class: com.navngo.igo.javaclient.IgoActivity.16
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    IgoActivity.this.endDialog(dialogInterface, i, 2);
                }
            }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.navngo.igo.javaclient.IgoActivity.15
                @Override // android.content.DialogInterface.OnCancelListener
                public void onCancel(DialogInterface dialogInterface) {
                    IgoActivity.this.endDialog(dialogInterface, i, 2);
                }
            }).setMessage(this.dialogMsg).setTitle(this.dialogTitle).create();
        }
        return super.onCreateDialog(i, bundle);
    }

    protected void endDialog(DialogInterface dialogInterface, int i, int i2) {
        DebugLogger.D5(logname, "endDialog");
        synchronized (this.dialogRet) {
            int[] iArr = this.dialogRet;
            iArr[0] = i2;
            iArr.notify();
        }
        removeDialog(i);
    }

    public static Intent getMainActivityIntent() {
        try {
            return new Intent(Application.anApplication.getApplicationContext(), Class.forName("com.navngo.igo.javaclient.MainActivity"));
        } catch (ClassNotFoundException e) {
            DebugLogger.D1(logname, "MainActivity not found", e);
            return null;
        }
    }

    public static void startInForeground(int i) {
        startInForegroundExtras(i, null);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [com.navngo.igo.javaclient.IgoActivity$18] */
    public static void startInForegroundExtras(final int i, final Bundle bundle) {
        final IgoActivity igoActivity = Application.getIgoActivity();
        if (i > 0) {
            new Thread() { // from class: com.navngo.igo.javaclient.IgoActivity.18
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    try {
                        Thread.sleep(i);
                        IgoActivity igoActivity2 = igoActivity;
                        if (igoActivity2 != null) {
                            igoActivity2.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.18.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    IgoActivity.startInForegroundExtras(0, bundle);
                                }
                            });
                        } else {
                            IgoActivity.startInForegroundExtras(0, bundle);
                        }
                    } catch (InterruptedException unused) {
                    }
                }
            }.start();
            return;
        }
        DebugLogger.D5(logname, "coming back really");
        if (Build.VERSION.SDK_INT < 31) {
            Application.anApplication.sendBroadcast(new Intent("android.intent.action.CLOSE_SYSTEM_DIALOGS").putExtra(EXTRA_IS_INTERNAL_EVENT, true));
        }
        Intent mainActivityIntent = getMainActivityIntent();
        mainActivityIntent.setAction("android.intent.action.MAIN");
        mainActivityIntent.setFlags(809762816);
        mainActivityIntent.putExtra(INTENT_STARTLOCKS, true);
        if (bundle != null) {
            mainActivityIntent.putExtras(bundle);
        }
        PowerManager powerManager = (PowerManager) Application.anApplication.getSystemService("power");
        DebugLogger.D5(logname, "Creating tmpWakeLock");
        PowerManager.WakeLock wakeLockNewWakeLock = powerManager.newWakeLock(805306378, "iGO:tmpWakeLock");
        DebugLogger.D5(logname, "Acquiring tmpWakeLock");
        wakeLockNewWakeLock.acquire();
        try {
            Application.anApplication.startActivity(mainActivityIntent);
        } finally {
            wakeLockNewWakeLock.release();
            DebugLogger.D5(logname, "tmpWakeLock was released");
        }
    }

    private void showBGNotification(boolean z) {
        if (Application.serviceRunner != null) {
            if (z && !Application.isThereSDNotification()) {
                Application.serviceRunner.showBGNotification(true);
                return;
            } else {
                Application.serviceRunner.showBGNotification(false);
                return;
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("could not ");
        sb.append(z ? "show" : "hide");
        sb.append(" BGNotification");
        DebugLogger.D3(logname, sb.toString());
    }

    public synchronized void lockCurrentOrientation() {
        if (this.mFixedOrientation) {
            return;
        }
        this.mOrientationLocked = true;
        setRequestedOrientation(getCurrentOrientation() == 1 ? 7 : 6);
    }

    public synchronized void releaseFixedOrientation() {
        if (this.mFixedOrientation) {
            return;
        }
        this.mOrientationLocked = false;
        requestOrientation(this.mRequestedOrientation);
    }

    public synchronized void requestOrientation(int i) {
        if (this.mFixedOrientation) {
            return;
        }
        if (i < -1 || i > 10) {
            DebugLogger.D1(logname, Config.def_additional_assets, new IllegalArgumentException(String.format(null, "orientation value: %d is out of range", Integer.valueOf(i))));
        } else {
            this.mRequestedOrientation = i;
            if (!this.mOrientationLocked) {
                setRequestedOrientation(i);
                ServerRunner.setOrientation(getCurrentOrientation());
            }
        }
    }

    public class optionsMenuItem {
        String title = Config.def_additional_assets;
        String icon = Config.def_additional_assets;
        boolean enabled = true;
        boolean visible = true;

        public optionsMenuItem() {
        }
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        if (this.mMenu == null) {
            this.mMenu = menu;
            return true;
        }
        this.mMenu = menu;
        DebugLogger.D2(logname, "onCreateOptionsMenu() is called again! Using new Menu object.");
        onMultipleCreateOptionsMenu(menu);
        return true;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        AndroidGo.getInstance().callUI("sc_on_options_menu_item_selected", null, Integer.valueOf(menuItem.getItemId()));
        return true;
    }

    @Override // android.app.Activity
    public void onOptionsMenuClosed(Menu menu) {
        AndroidGo.getInstance().callUI("sc_on_options_menu_closed", null, new Object[0]);
    }

    public void clearOptionsMenu() {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.19
            @Override // java.lang.Runnable
            public void run() {
                if (IgoActivity.this.mMenu == null) {
                    DebugLogger.D2(IgoActivity.logname, "clearOptionsMenu before mMenu was initialized.");
                } else {
                    IgoActivity.this.mMenu.clear();
                }
            }
        });
    }

    public void addOptionsMenuItem(final String str, final String str2) {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.20
            @Override // java.lang.Runnable
            public void run() {
                if (IgoActivity.this.mMenu == null) {
                    DebugLogger.D2(IgoActivity.logname, "addOptionsMenuItem before mMenu was initialized.");
                } else {
                    IgoActivity.this.mMenu.add(0, IgoActivity.this.mMenu.size(), 0, str).setIcon(NNG.loadImageAsDrawable(str2));
                }
            }
        });
    }

    public void setOptionsMenuItemProperties(final int i, final int i2, final int i3) {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.21
            @Override // java.lang.Runnable
            public void run() {
                if (IgoActivity.this.mMenu == null) {
                    DebugLogger.D2(IgoActivity.logname, "setOptionsMenuItemProperties before mMenu was initialized.");
                    return;
                }
                MenuItem item = IgoActivity.this.mMenu.getItem(i);
                item.setVisible(i3 != 0);
                item.setEnabled(i2 != 0);
            }
        });
    }

    public void showOptionsMenu() {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.22
            @Override // java.lang.Runnable
            public void run() {
                IgoActivity.this.openOptionsMenu();
            }
        });
    }

    public void hideOptionsMenu() {
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.IgoActivity.23
            @Override // java.lang.Runnable
            public void run() {
                IgoActivity.this.closeOptionsMenu();
            }
        });
    }

    public void setTitleBarText(String str) {
        setTitle(str);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        IActivityResultHandler iActivityResultHandler = this.mActivityResultHandlers.get(Integer.valueOf(i));
        if (iActivityResultHandler != null) {
            iActivityResultHandler.handleActivityResult(i2, intent);
        }
    }

    protected Intent getLatestReceivedIntent() {
        return this.mLatestReceivedIntent;
    }
}
