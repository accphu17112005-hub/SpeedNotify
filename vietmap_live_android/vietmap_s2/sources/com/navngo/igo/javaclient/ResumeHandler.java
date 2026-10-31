package com.navngo.igo.javaclient;

import android.app.Activity;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.SystemClock;
import com.navngo.igo.javaclient.matek.GeoArea;
import java.util.Iterator;
import java.util.Vector;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum ResumeHandler {
    INSTANCE;

    private static final String logname = "ResumeHandler";
    private GeoArea backgroundWalkArea;
    private HandlerWithWalltime mHandler;
    private KeyguardManager mKeyguardManager;
    private Runnable mRetestRunnable;
    private long should_not_had_shutdown_at;
    private Runnable mIsOnTheRoadRunnable = new IsOnTheRoadRunnable();
    private IExternalResumeLogic mExternalLogic = null;
    private boolean mNativeLoaded = false;
    private boolean mResumed = false;
    private boolean mScreenOn = true;
    private boolean mIgnoreKeyGuard = Config.getBool("android", "ignore_keyguard", false);
    private String mPhoneState = Config.def_additional_assets;
    private PhoneInterrupt mInterruptedByPhone = PhoneInterrupt.IBP_NO;
    private long ontheroad_was_true_at = 0;
    private long ontheroad_was_false_at = 0;
    private CopyOnWriteArrayList<OnActivityStateChangeListener> mListeners = new CopyOnWriteArrayList<>();
    private State mState = State.BACKGROUND;
    BroadcastReceiver mUserPresentReceiver = new BroadcastReceiver() { // from class: com.navngo.igo.javaclient.ResumeHandler.3
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            ResumeHandler.this.userPresent();
        }
    };
    BroadcastReceiver mScreenReceiver = new BroadcastReceiver() { // from class: com.navngo.igo.javaclient.ResumeHandler.4
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (action.equals("android.intent.action.SCREEN_OFF")) {
                ResumeHandler.this.handleScreenOn(false);
            } else if (action.equals("android.intent.action.SCREEN_ON")) {
                ResumeHandler.this.handleScreenOn(true);
            }
        }
    };
    private boolean shutdownBlockedBySleepManager = false;

    public interface OnActivityStateChangeListener {
        void onPause();

        void onResume();
    }

    private enum PhoneInterrupt {
        IBP_NO,
        IBP_BG,
        IBP_FG
    }

    public enum State {
        FOREGROUND,
        FOREGROUND_BLOCKED_BY_KEYGUARD,
        BACKGROUND,
        FULLY_PAUSED
    }

    ResumeHandler() {
    }

    private boolean isKeyGuardOn() {
        KeyguardManager keyguardManager = this.mKeyguardManager;
        return (keyguardManager == null || this.mIgnoreKeyGuard || !keyguardManager.inKeyguardRestrictedInputMode()) ? false : true;
    }

    public synchronized void start(Activity activity) {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        HandlerWithWalltime handlerWithWalltime = this.mHandler;
        if (handlerWithWalltime != null) {
            handlerWithWalltime.close();
        }
        this.mHandler = new HandlerWithWalltime(activity);
        this.mRetestRunnable = new RetestRunnable();
        this.mKeyguardManager = (KeyguardManager) Application.anApplication.getSystemService("keyguard");
        this.mState = State.BACKGROUND;
        this.mNativeLoaded = false;
        this.mScreenOn = true;
        this.backgroundWalkArea = null;
        startRetestTimer(jElapsedRealtime);
        resetMoving(SystemClock.elapsedRealtime());
        Application.anApplication.registerReceiver(this.mUserPresentReceiver, new IntentFilter("android.intent.action.USER_PRESENT"));
        IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        Application.anApplication.registerReceiver(this.mScreenReceiver, intentFilter);
    }

    public synchronized void stop() {
        if (this.mHandler == null) {
            return;
        }
        killRetestTimer();
        this.mHandler.close();
        Application.anApplication.unregisterReceiver(this.mScreenReceiver);
        Application.anApplication.unregisterReceiver(this.mUserPresentReceiver);
    }

    public synchronized State getState() {
        return this.mState;
    }

    public State getState_NOTSYNCHRONIZED() {
        Application.getIgoActivity();
        return this.mState;
    }

    public synchronized void resumeCalled() {
        IExternalResumeLogic iExternalResumeLogic;
        if (this.mResumed || (iExternalResumeLogic = this.mExternalLogic) == null || iExternalResumeLogic.resumeIgo()) {
            log("onResume START. Current state: " + this.mState);
            this.mResumed = true;
            doTheJob();
            Iterator<OnActivityStateChangeListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                it.next().onResume();
            }
            log("onResume END. Current state: " + this.mState);
        }
    }

    public synchronized void pauseCalled() {
        IExternalResumeLogic iExternalResumeLogic;
        if (!this.mResumed || (iExternalResumeLogic = this.mExternalLogic) == null || iExternalResumeLogic.pauseIgo()) {
            log("onPause START. Current state: " + this.mState);
            this.mResumed = false;
            doTheJob();
            Iterator<OnActivityStateChangeListener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                it.next().onPause();
            }
            log("onPause END. Current state: " + this.mState);
        }
    }

    public synchronized void surfaceChanged() {
        doTheJob();
    }

    public void setExternalLogic(IExternalResumeLogic iExternalResumeLogic) {
        this.mExternalLogic = iExternalResumeLogic;
    }

    public void addListener(OnActivityStateChangeListener onActivityStateChangeListener) {
        log("OnResume listener added");
        this.mListeners.add(onActivityStateChangeListener);
        if (this.mResumed) {
            onActivityStateChangeListener.onResume();
        } else {
            onActivityStateChangeListener.onPause();
        }
    }

    public void removeListener(OnActivityStateChangeListener onActivityStateChangeListener) {
        log("OnResume listener removed");
        this.mListeners.remove(onActivityStateChangeListener);
    }

    public synchronized boolean isResumed() {
        return this.mResumed;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public synchronized void onLocationChanged(android.location.Location r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            r0 = 0
            if (r4 == 0) goto L13
            java.lang.String r1 = "gps"
            java.lang.String r2 = r4.getProvider()     // Catch: java.lang.Throwable -> L11
            boolean r1 = r1.equalsIgnoreCase(r2)     // Catch: java.lang.Throwable -> L11
            if (r1 == 0) goto L13
            goto L14
        L11:
            r4 = move-exception
            goto L25
        L13:
            r4 = r0
        L14:
            com.navngo.igo.javaclient.matek.GeoArea r0 = r3.backgroundWalkArea     // Catch: java.lang.Throwable -> L11
            if (r0 == 0) goto L1c
            r0.extend(r4)     // Catch: java.lang.Throwable -> L11
            goto L23
        L1c:
            com.navngo.igo.javaclient.matek.GeoArea r0 = new com.navngo.igo.javaclient.matek.GeoArea     // Catch: java.lang.Throwable -> L11
            r0.<init>(r4)     // Catch: java.lang.Throwable -> L11
            r3.backgroundWalkArea = r0     // Catch: java.lang.Throwable -> L11
        L23:
            monitor-exit(r3)
            return
        L25:
            monitor-exit(r3)
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ResumeHandler.onLocationChanged(android.location.Location):void");
    }

    public synchronized void nativeLoaded() {
        this.mNativeLoaded = true;
        log("Native Loaded: " + this.mNativeLoaded + ". Current state: " + this.mState);
        IgoActivity igoActivity = Application.getIgoActivity();
        if (igoActivity != null) {
            igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.ResumeHandler.1
                @Override // java.lang.Runnable
                public void run() {
                    ResumeHandler.this.doTheJob();
                }
            });
        } else {
            doTheJob();
        }
        log("Native Loaded END. Current state: " + this.mState);
    }

    public synchronized void setPhoneState(String str) {
        log("setPhoneState START. Current state: " + this.mState);
        PhoneInterrupt phoneInterrupt = this.mInterruptedByPhone;
        boolean z = "RINGING".equals(this.mPhoneState) || "OFFHOOK".equals(this.mPhoneState);
        boolean z2 = "RINGING".equals(str) || "OFFHOOK".equals(str);
        if (!z2 && !"IDLE".equals(str)) {
            DebugLogger.D4(logname, "setPhoneState END. Ignoring unknown phone state: " + str);
            return;
        }
        log("setPhoneState " + this.mPhoneState + " -> " + str);
        if (z2) {
            Sound.getInstance().getMutingDevice().OnAudioFocusLoss();
        }
        if (z) {
            if (!z2) {
                PhoneInterrupt phoneInterrupt2 = PhoneInterrupt.IBP_NO;
                if (phoneInterrupt != PhoneInterrupt.IBP_NO) {
                    resetMoving(SystemClock.elapsedRealtime());
                }
                phoneInterrupt = phoneInterrupt2;
            }
        } else if (z2) {
            if (phoneInterrupt == PhoneInterrupt.IBP_NO) {
                int i = AnonymousClass5.$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State[this.mState.ordinal()];
                phoneInterrupt = (i == 1 || i == 2) ? PhoneInterrupt.IBP_FG : i != 3 ? PhoneInterrupt.IBP_NO : PhoneInterrupt.IBP_BG;
            }
        } else {
            phoneInterrupt = PhoneInterrupt.IBP_NO;
        }
        setInterruptedByPhone(phoneInterrupt, z2);
        this.mPhoneState = str;
        doTheJob();
        log("setPhoneState END. Current state: " + this.mState);
    }

    private void resumeApp() {
        log("resumeApp");
        ServerRunner.resumeServer();
        Application.startSensors();
        Sound.getInstance().OnResume();
    }

    private void pauseApp() {
        log("pauseApp");
        Application.stopSensors();
        ServerRunner.suspendServer();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleScreenOn(boolean z) {
        IExternalResumeLogic iExternalResumeLogic = this.mExternalLogic;
        if (iExternalResumeLogic == null || iExternalResumeLogic.handleScreenOn()) {
            StringBuilder sb = new StringBuilder();
            sb.append("Screen :");
            sb.append(z ? "on" : "off");
            sb.append(" START. Current state: ");
            sb.append(this.mState);
            log(sb.toString());
            this.mScreenOn = z;
            doTheJob();
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Screen :");
            sb2.append(z ? "on" : "off");
            sb2.append(" END. Current state: ");
            sb2.append(this.mState);
            log(sb2.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void userPresent() {
        log("User Present START. Current state: " + this.mState);
        doTheJob();
        log("User Present END. Current state: " + this.mState);
    }

    private void setInterruptedByPhone(PhoneInterrupt phoneInterrupt, boolean z) {
        DebugLogger.D4(logname, "setInterruptedByPhone: " + this.mInterruptedByPhone + " -> " + phoneInterrupt);
        IgoActivity igoActivity = Application.getIgoActivity();
        int i = AnonymousClass5.$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt[this.mInterruptedByPhone.ordinal()];
        if (i != 2) {
            if (i != 3) {
                int i2 = AnonymousClass5.$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt[phoneInterrupt.ordinal()];
            } else {
                int i3 = AnonymousClass5.$SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt[phoneInterrupt.ordinal()];
                if (i3 != 2 && i3 != 3) {
                    if (z) {
                        DebugLogger.D4(logname, "setInterruptedByPhone: NOT coming back");
                    } else if (Config.getBool("android", "restart_after_phone_call", false)) {
                        DebugLogger.D4(logname, "setInterruptedByPhone: coming back");
                        if (igoActivity == null) {
                            IgoActivity.startInForeground(2000);
                        } else {
                            igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.ResumeHandler.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    IgoActivity.startInForeground(2000);
                                }
                            });
                        }
                    }
                }
            }
        }
        this.mInterruptedByPhone = phoneInterrupt;
    }

    /* JADX INFO: renamed from: com.navngo.igo.javaclient.ResumeHandler$5, reason: invalid class name */
    static /* synthetic */ class AnonymousClass5 {
        static final /* synthetic */ int[] $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt;
        static final /* synthetic */ int[] $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State;

        static {
            int[] iArr = new int[PhoneInterrupt.values().length];
            $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt = iArr;
            try {
                iArr[PhoneInterrupt.IBP_NO.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt[PhoneInterrupt.IBP_BG.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$PhoneInterrupt[PhoneInterrupt.IBP_FG.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            int[] iArr2 = new int[State.values().length];
            $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State = iArr2;
            try {
                iArr2[State.FOREGROUND.ordinal()] = 1;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State[State.FOREGROUND_BLOCKED_BY_KEYGUARD.ordinal()] = 2;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State[State.BACKGROUND.ordinal()] = 3;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$ResumeHandler$State[State.FULLY_PAUSED.ordinal()] = 4;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void log(String str) {
        DebugLogger.D4(logname, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void doTheJob() {
        State state;
        if (!this.mNativeLoaded) {
            DebugLogger.D4(logname, "doTheJob: native not loaded");
            this.mState = State.FULLY_PAUSED;
            return;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if ((this.mResumed || Application.anApplication.createMapView().hasValidSurface()) && this.mScreenOn) {
            if (isKeyGuardOn()) {
                DebugLogger.D4(logname, "doTheJob: resumed  &&  screen on  &&  keyguard");
                state = State.FOREGROUND_BLOCKED_BY_KEYGUARD;
            } else {
                DebugLogger.D4(logname, "doTheJob: resumed  &&  screen on  && no keyguard");
                state = State.FOREGROUND;
            }
        } else if (this.mInterruptedByPhone != PhoneInterrupt.IBP_NO) {
            DebugLogger.D4(logname, "doTheJob: interrupted by phone");
            state = State.BACKGROUND;
        } else if (this.mScreenOn) {
            if (shouldShutdown(jElapsedRealtime)) {
                DebugLogger.D4(logname, "doTheJob: nothing to do in the background");
                state = State.FULLY_PAUSED;
            } else {
                DebugLogger.D4(logname, "doTheJob: screen on");
                state = State.BACKGROUND;
            }
        } else if (this.mResumed) {
            DebugLogger.D4(logname, "doTheJob: resumed, this should be a transient state only");
            return;
        } else if (ServerRunner.background_navigation) {
            DebugLogger.D4(logname, "doTheJob: screen off, running in background");
            state = State.BACKGROUND;
        } else {
            DebugLogger.D4(logname, "doTheJob: nothing to do");
            state = State.FULLY_PAUSED;
        }
        boolean z = this.mState != state;
        this.mState = state;
        if (state == State.FOREGROUND) {
            resetMoving(jElapsedRealtime);
            if (z) {
                resumeApp();
            }
        } else if (z) {
            pauseApp();
        }
        if (this.mState != State.FULLY_PAUSED) {
            startRetestTimer(jElapsedRealtime);
        }
    }

    public void setShutdownBlock(boolean z) {
        this.shutdownBlockedBySleepManager = z;
    }

    private boolean shouldShutdown(long j) {
        if (this.shutdownBlockedBySleepManager || Config.background_shutdown_timeout <= 0) {
            return false;
        }
        boolean zIsOnTheRoad = isOnTheRoad(j);
        if (!zIsOnTheRoad) {
            if (this.mState != State.FULLY_PAUSED) {
                DebugLogger.D4("ResumeHandler:shouldShutdown", "Not on the road: going to sleep");
            }
            return true;
        }
        boolean zIsMoving = isMoving();
        if (zIsOnTheRoad && zIsMoving) {
            resetMoving(j);
            DebugLogger.D4("ResumeHandler:shouldShutdown", "On the road and moving");
            return false;
        }
        if (this.should_not_had_shutdown_at + ((long) Config.background_shutdown_timeout) > j) {
            return false;
        }
        DebugLogger.D4("ResumeHandler:shouldShutdown", "nothing happened for a while --> iGO is forgotten --> going to sleep.");
        return true;
    }

    private boolean isOnTheRoad(long j) {
        if (this.ontheroad_was_true_at + 5000 > j) {
            DebugLogger.D4(logname, "ontheroad cached true");
            return true;
        }
        if (this.ontheroad_was_false_at + 5000 > j) {
            DebugLogger.D4(logname, "ontheroad cached false");
            return false;
        }
        ServerRunner.callNNG(this.mIsOnTheRoadRunnable, ServerRunner.getEngineIndex());
        DebugLogger.D4(logname, "ontheroad faked true, will be recached soon");
        return true;
    }

    private final class IsOnTheRoadRunnable implements Runnable {
        private IsOnTheRoadRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (ResumeHandler.this) {
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                if (NNG.isOnTheRoad()) {
                    ResumeHandler.this.ontheroad_was_true_at = jElapsedRealtime;
                } else {
                    ResumeHandler.this.ontheroad_was_false_at = jElapsedRealtime;
                }
                ResumeHandler.this.doTheJob();
            }
        }
    }

    private boolean isMoving() {
        GeoArea geoArea = this.backgroundWalkArea;
        return geoArea != null && geoArea.metricRadius() > ((double) Config.background_shutdown_distance);
    }

    private void resetMoving(long j) {
        this.should_not_had_shutdown_at = j;
        this.backgroundWalkArea = null;
    }

    private void startRetestTimer(long j) {
        killRetestTimer();
        long jMax = Math.max(this.should_not_had_shutdown_at + ((long) Config.background_shutdown_timeout), 30000 + j);
        StringBuilder sb = new StringBuilder();
        sb.append("startRetestTimer: ");
        long j2 = jMax - j;
        sb.append(j2 / 1000);
        sb.append(" secs from now on.");
        DebugLogger.D5(logname, sb.toString());
        HandlerWithWalltime handlerWithWalltime = this.mHandler;
        if (handlerWithWalltime == null || handlerWithWalltime.postDelayed(this.mRetestRunnable, j2)) {
            return;
        }
        DebugLogger.D2(logname, "startRetestTimer:postAtTime FAILED");
    }

    private void killRetestTimer() {
        HandlerWithWalltime handlerWithWalltime = this.mHandler;
        if (handlerWithWalltime != null) {
            handlerWithWalltime.removeCallbacks(this.mRetestRunnable);
        }
    }

    public void retest(long j) {
        HandlerWithWalltime handlerWithWalltime = this.mHandler;
        if (handlerWithWalltime != null) {
            handlerWithWalltime.postDelayed(this.mRetestRunnable, j);
        }
    }

    private final class RetestRunnable implements Runnable {
        private RetestRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (ResumeHandler.this) {
                ResumeHandler.log("RetestRunnable.run START. Current state: " + ResumeHandler.this.mState);
                ResumeHandler.this.doTheJob();
                ResumeHandler.log("RetestRunnable.run END. Current state: " + ResumeHandler.this.mState);
            }
        }
    }

    private static final class HandlerWithWalltime {
        private final Activity mActivity;
        private Thread mTimerThread = null;
        private final Vector<Entry> mTasks = new Vector<>();
        private final String mSignal = new String("HandlerWithWalltime.mSignal");
        private long mDelayBase = 0;
        private final Runnable mTimerRunnable = new Runnable() { // from class: com.navngo.igo.javaclient.ResumeHandler.HandlerWithWalltime.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (HandlerWithWalltime.this.mSignal) {
                    while (true) {
                        try {
                            if (HandlerWithWalltime.this.mTasks.size() == 0) {
                                HandlerWithWalltime.this.mSignal.wait();
                            } else {
                                HandlerWithWalltime.this.adjustDelays(System.currentTimeMillis());
                                long j = ((Entry) HandlerWithWalltime.this.mTasks.get(0)).delay;
                                if (j > 0) {
                                    HandlerWithWalltime.this.mSignal.wait(j);
                                } else {
                                    HandlerWithWalltime.this.mActivity.runOnUiThread(((Entry) HandlerWithWalltime.this.mTasks.remove(0)).runnable);
                                }
                            }
                        } catch (InterruptedException unused) {
                            HandlerWithWalltime.this.mTimerThread = null;
                            return;
                        }
                    }
                }
            }
        };

        private static final class Entry {
            public long delay;
            public Runnable runnable;

            public Entry(long j, Runnable runnable) {
                this.delay = j;
                this.runnable = runnable;
            }
        }

        public HandlerWithWalltime(Activity activity) {
            this.mActivity = activity;
        }

        public void close() {
            synchronized (this.mSignal) {
                this.mTasks.removeAllElements();
                Thread thread = this.mTimerThread;
                if (thread != null) {
                    thread.interrupt();
                }
            }
        }

        public void removeCallbacks(Runnable runnable) {
            synchronized (this.mSignal) {
                int size = this.mTasks.size();
                while (true) {
                    int i = size - 1;
                    if (size > 0) {
                        if (this.mTasks.get(i).runnable == runnable) {
                            this.mTasks.remove(i);
                        }
                        size = i;
                    } else {
                        this.mSignal.notify();
                    }
                }
            }
        }

        public boolean postDelayed(Runnable runnable, long j) {
            int i;
            synchronized (this.mSignal) {
                adjustDelays(System.currentTimeMillis());
                int size = this.mTasks.size();
                while (true) {
                    i = size - 1;
                    if (size <= 0 || j >= this.mTasks.get(i).delay) {
                        break;
                    }
                    size = i;
                }
                this.mTasks.insertElementAt(new Entry(j, runnable), i + 1);
                if (this.mTimerThread == null) {
                    Thread thread = new Thread(this.mTimerRunnable, "HandlerWithWalltime.mTimerThread");
                    this.mTimerThread = thread;
                    thread.start();
                }
                this.mSignal.notify();
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void adjustDelays(long j) {
            long j2 = this.mDelayBase;
            if (j < j2) {
                this.mDelayBase = j;
                return;
            }
            if (j > j2) {
                long j3 = j - j2;
                Iterator<Entry> it = this.mTasks.iterator();
                while (it.hasNext()) {
                    it.next().delay -= j3;
                }
                this.mDelayBase += j3;
            }
        }
    }
}
