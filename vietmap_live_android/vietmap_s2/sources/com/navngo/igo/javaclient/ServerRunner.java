package com.navngo.igo.javaclient;

import android.content.pm.ApplicationInfo;
import android.location.Location;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import android.widget.Toast;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.ResumeHandler;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.locking.ManufacturerIDProvider;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import com.navngo.igo.javaclient.sdcard.Mount;
import com.navngo.igo.javaclient.view.IMapView;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class ServerRunner {
    public static final int GPS_CONNECTED = 1;
    public static final int GPS_DENIED = 3;
    public static final int GPS_DISCONNECTED = 0;
    public static final int GPS_ENABLED = 4;
    public static final int GPS_LOST = 2;
    public static volatile boolean background_navigation = false;
    private static volatile int engineIndex = 0;
    private static final String logname = "ServerRunner";
    private static volatile StatusThread statusThread;
    public static final List<Runnable> postStartEngineHooks = new ArrayList();
    private static List<Runnable> sEngineStoppedCallbacks = new CopyOnWriteArrayList();
    private static ArrayList<IForwardedNmeaListener> forwardedNmeaListeners = new ArrayList<>();

    interface IForwardedNmeaListener {
        void onNmeaForwardedToEngine(long j, String str);
    }

    public enum KeyState {
        DOWN,
        UP
    }

    public static String getLockedTo() {
        return "android_id";
    }

    static /* synthetic */ int access$1008() {
        int i = engineIndex;
        engineIndex = i + 1;
        return i;
    }

    public static StatusThread tryGetStatusThread() {
        return statusThread;
    }

    public static synchronized StatusThread getStatusThread() {
        if (statusThread == null) {
            DebugLogger.D4(logname, "Creating status thread");
            statusThread = new StatusThread();
            statusThread.start();
            synchronized (statusThread) {
                statusThread.notifyStatusThread();
            }
        }
        return statusThread;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static synchronized void setStatusThread(StatusThread statusThread2) {
        statusThread = statusThread2;
    }

    public static void waitForClosingIgo() {
        StatusThread statusThreadTryGetStatusThread = tryGetStatusThread();
        if (statusThreadTryGetStatusThread == null || !statusThreadTryGetStatusThread.isStopping()) {
            return;
        }
        try {
            synchronized (statusThreadTryGetStatusThread) {
                while (statusThreadTryGetStatusThread.isStopping()) {
                    statusThreadTryGetStatusThread.wait(10L);
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static boolean isEngineStopping() {
        StatusThread statusThread2 = statusThread;
        return statusThread2 == null || statusThread2.isShuttingDown();
    }

    public static boolean waitForEngineStatus(int i, long j) throws InterruptedException {
        StatusThread statusThreadTryGetStatusThread = tryGetStatusThread();
        if (statusThreadTryGetStatusThread == null && (i == 800 || i == 900)) {
            return true;
        }
        long jElapsedRealtime = j <= 0 ? Long.MAX_VALUE : j + SystemClock.elapsedRealtime();
        if (statusThreadTryGetStatusThread == null) {
            DebugLogger.D4(logname, "Waiting for status thread to be created");
            while (statusThreadTryGetStatusThread == null) {
                Thread.sleep(10L);
                if (jElapsedRealtime < SystemClock.elapsedRealtime()) {
                    return false;
                }
                statusThreadTryGetStatusThread = tryGetStatusThread();
            }
            DebugLogger.D4(logname, "Status thread to be created");
        }
        if (statusThreadTryGetStatusThread.mCurrent.status != i) {
            DebugLogger.D4(logname, "Waiting to reach status: " + EngineStatusName(i));
            synchronized (statusThreadTryGetStatusThread) {
                while (statusThreadTryGetStatusThread.mCurrent.status != i) {
                    statusThreadTryGetStatusThread.wait(jElapsedRealtime - SystemClock.elapsedRealtime());
                    if (statusThreadTryGetStatusThread.mCurrent.status != i && jElapsedRealtime < SystemClock.elapsedRealtime()) {
                        return false;
                    }
                }
                DebugLogger.D4(logname, "Status reached: " + EngineStatusName(i));
            }
        }
        return true;
    }

    private static class NmeaEvent implements Cloneable {
        long received;
        String sentence;
        long timestamp;

        NmeaEvent(long j, long j2, String str) {
            this.received = j;
            this.timestamp = j2;
            this.sentence = str;
        }
    }

    public static void addEngineStoppedCallback(Runnable runnable) {
        sEngineStoppedCallbacks.add(runnable);
    }

    private static final class Wanted implements Cloneable {
        boolean combined_gpslistener;
        boolean gpsListener;
        int gpsStatus;
        Location loc;
        long loc_requested_at;
        boolean lowMemory;
        boolean network_provider;
        Queue<NmeaEvent> nmeaQueue;
        long nmea_requested_at;
        volatile int orientation;
        boolean prechecked_androidgo;
        ResumeHandler.State prechecked_resumedStatus;
        long sats_requested_at;
        Queue<Integer> statusQueue;
        boolean timeChange;
        boolean ui_gpsListener;

        private Wanted() {
            this.statusQueue = new ArrayDeque();
            this.nmeaQueue = new ArrayDeque();
            this.gpsStatus = 0;
            this.lowMemory = false;
            this.orientation = -1;
            this.gpsListener = false;
            this.ui_gpsListener = true;
            this.timeChange = false;
        }

        public Wanted copy() {
            try {
                return (Wanted) clone();
            } catch (CloneNotSupportedException e) {
                DebugLogger.D1(ServerRunner.logname, "should not ever happen", e);
                e.printStackTrace();
                return null;
            }
        }
    }

    private static final class Current implements Cloneable {
        int gpsStatus;
        int status;

        private Current() {
            this.status = 100;
            this.gpsStatus = 0;
        }

        public boolean isListening() {
            return LocationListenerImpl.isListening() && NmeaListenerImpl.isListening();
        }

        public Current copy() {
            try {
                return (Current) clone();
            } catch (CloneNotSupportedException e) {
                DebugLogger.D1(ServerRunner.logname, "should not ever happen", e);
                e.printStackTrace();
                return null;
            }
        }

        public boolean isCallable() {
            int i = this.status;
            return i == 450 || i == 500 || i == 600 || i == 2100 || i == 2200 || i == 2300 || i == 2400;
        }

        public boolean isRunning() {
            int i = this.status;
            return i == 450 || i == 500 || i == 2100 || i == 2200 || i == 2300 || i == 2400;
        }

        public boolean isStarting() {
            int i = this.status;
            return i == 100 || i == 200 || i == 300 || i == 400 || i == 450;
        }

        public boolean isInForeground() {
            int i = this.status;
            return i == 450 || i == 500 || i == 2200;
        }

        public boolean isChanging() {
            int i = this.status;
            return (i == 100 || i == 450 || i == 500 || i == 800 || i == 900 || i == 2200 || i == 2400) ? false : true;
        }
    }

    public static void AddForwardedNmeaListener(IForwardedNmeaListener iForwardedNmeaListener) {
        forwardedNmeaListeners.add(iForwardedNmeaListener);
    }

    public static void RemoveForwardedNmeaListener(IForwardedNmeaListener iForwardedNmeaListener) {
        forwardedNmeaListeners.remove(iForwardedNmeaListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    static final class StatusThread extends Thread {
        private static final int DO_ANDROIDGO = 23;
        private static final int DO_ASSUME_GPS_CONNECTED = 16;
        private static final int DO_CALLNNG = 21;
        private static final int DO_ENGINESTATUS_TIMEOUT = 9;
        private static final int DO_GARBAGECOLLECT = 22;
        private static final int DO_GPSSTATUS = 15;
        private static final int DO_INTERRUPTED = 24;
        private static final int DO_LOCCHANGED_GPS = 18;
        private static final int DO_LOCCHANGED_NETWORK = 17;
        private static final int DO_LOWMEMORY = 1;
        private static final int DO_ORIENTATIONCHANGED = 19;
        private static final int DO_POLL_GPS_ENABLED = 25;
        private static final int DO_RESUMEENGINE = 6;
        private static final int DO_RUNCYCLE = 12;
        private static final int DO_SATSCHANGED_GPS = 26;
        private static final int DO_SETLOCATIONLISTENER = 13;
        private static final int DO_SLEEP = 8;
        private static final int DO_STARTENGINE = 3;
        private static final int DO_STOPENGINE = 5;
        private static final int DO_SUSPENDENGINE = 7;
        private static final int DO_TIMECHANGE = 20;
        private static final int min_setlistener_timeout = 1000;
        private static final int min_timeout_foreground = 100;
        private boolean first_position_processed;
        private boolean interrupted;
        private long locChanged_processed_at;
        private long locChanged_valid_processed_at;
        private final Current mCurrent;
        private Handler mHandler;
        private HandlerThread mHandlerThread;
        private final Wanted mWanted;
        private int max_timeout_foreground;
        private long memorywatcher_last;
        private long nmeaReceived_processed_at;
        private boolean no_locchanged_yet;
        private boolean notified;
        private long ontheroad_was_false_at;
        private long ontheroad_was_true_at;
        private int orientation_current;
        private long resumed_at;
        private long satsChanged_processed_at;
        private long setLocationListener_processed_at;
        private boolean[] sleepEvent;
        int sleepIndex;
        int sleepTestIndex_poll_gps_enabled;
        private boolean sleep_well;
        private long status_changing_started_at;
        private boolean terminateThreadRequested;
        private final Queue<Runnable> wantCallNNG;

        public static String EngineStatusName(int i) {
            switch (i) {
                case 100:
                    return "NNG_ENGINE_CREATED";
                case 200:
                    return "NNG_ENGINE_STARTING";
                case NNG.NNG_ENGINE_RESTARTING /* 300 */:
                    return "NNG_ENGINE_RESTARTING";
                case NNG.NNG_ENGINE_JUSTENTERINGMAINLOOP /* 400 */:
                    return "NNG_ENGINE_JUSTENTERINGMAINLOOP";
                case NNG.NNG_ENGINE_ALMOST_STARTED /* 450 */:
                    return "NNG_ENGINE_ALMOST_STARTED";
                case NNG.NNG_ENGINE_STARTED /* 500 */:
                    return "NNG_ENGINE_STARTED";
                case NNG.NNG_ENGINE_JUSTLEAVINGMAINLOOP /* 600 */:
                    return "NNG_ENGINE_JUSTLEAVINGMAINLOOP";
                case NNG.NNG_ENGINE_STOPPING /* 700 */:
                    return "NNG_ENGINE_STOPPING";
                case NNG.NNG_ENGINE_STOPPED /* 800 */:
                    return "NNG_ENGINE_STOPPED";
                case NNG.NNG_ENGINE_DESTROYED /* 900 */:
                    return "NNG_ENGINE_DESTROYED";
                case NNG.NNG_ENGINE_SETTING_FOCUS /* 2100 */:
                    return "NNG_ENGINE_SETTING_FOCUS";
                case NNG.NNG_ENGINE_SET_FOCUS /* 2200 */:
                    return "NNG_ENGINE_SET_FOCUS";
                case NNG.NNG_ENGINE_LOSING_FOCUS /* 2300 */:
                    return "NNG_ENGINE_LOSING_FOCUS";
                case NNG.NNG_ENGINE_LOST_FOCUS /* 2400 */:
                    return "NNG_ENGINE_LOST_FOCUS";
                default:
                    return "<update this table>";
            }
        }

        StatusThread() {
            super(ServerRunner.logname);
            this.mWanted = new Wanted();
            this.mCurrent = new Current();
            this.wantCallNNG = new ArrayDeque();
            this.notified = false;
            this.interrupted = false;
            this.terminateThreadRequested = false;
            this.setLocationListener_processed_at = 0L;
            this.ontheroad_was_true_at = 0L;
            this.ontheroad_was_false_at = 0L;
            this.resumed_at = 0L;
            this.max_timeout_foreground = 0;
            this.memorywatcher_last = SystemClock.elapsedRealtime();
            this.no_locchanged_yet = true;
            this.sleepTestIndex_poll_gps_enabled = 0;
            this.sleepIndex = 0;
            this.sleepEvent = new boolean[]{false};
            this.orientation_current = -1;
            this.max_timeout_foreground = Math.max(100, Math.min(Config.update_denied_timeout_foreground, Config.memorywatcher_timeout_foreground));
            resetGpsStatusVariables();
            HandlerThread handlerThread = new HandlerThread("EmptyHandlerThread");
            this.mHandlerThread = handlerThread;
            handlerThread.start();
            this.mHandler = new Handler(this.mHandlerThread.getLooper());
        }

        private void resetGpsStatusVariables() {
            DebugLogger.D5(ServerRunner.logname, "resetGpsStatusVariables");
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            this.mCurrent.gpsStatus = 0;
            this.mWanted.gpsStatus = 0;
            long j = jElapsedRealtime - 1;
            this.satsChanged_processed_at = j;
            this.locChanged_processed_at = j;
            this.nmeaReceived_processed_at = 0L;
            this.locChanged_valid_processed_at = (jElapsedRealtime - ((long) Config.network_jelre_fanyalodunk_timeout)) - 1;
            this.first_position_processed = false;
            this.mWanted.loc_requested_at = this.locChanged_processed_at;
            this.mWanted.nmea_requested_at = this.nmeaReceived_processed_at;
            this.mWanted.nmeaQueue.clear();
            this.mWanted.sats_requested_at = this.satsChanged_processed_at;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (!this.terminateThreadRequested && runCycle()) {
                try {
                } catch (Throwable th) {
                    this.mHandlerThread.quit();
                    ServerRunner.setStatusThread(null);
                    DebugLogger.D4(ServerRunner.logname, "Status thread stopped.");
                    this.terminateThreadRequested = false;
                    synchronized (this.sleepEvent) {
                        boolean[] zArr = this.sleepEvent;
                        zArr[0] = true;
                        zArr.notifyAll();
                        throw th;
                    }
                }
            }
            this.mHandlerThread.quit();
            ServerRunner.setStatusThread(null);
            DebugLogger.D4(ServerRunner.logname, "Status thread stopped.");
            this.terminateThreadRequested = false;
            synchronized (this.sleepEvent) {
                boolean[] zArr2 = this.sleepEvent;
                zArr2[0] = true;
                zArr2.notifyAll();
            }
        }

        public boolean isEngineRunning() {
            return this.mCurrent.isRunning();
        }

        public boolean isEngineStarting() {
            return this.mCurrent.isStarting();
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        private boolean runCycle() throws Throwable {
            int i;
            Runnable runnablePeek;
            int iCheckSleep;
            Wanted wantedCopy;
            Current currentCopy;
            IMapView mapView = Application.getMapView();
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            this.mWanted.prechecked_androidgo = this.mCurrent.isCallable() && NNG.IsIntroEnded() && AndroidGo.getInstance().hasActionsToProcess();
            this.mWanted.prechecked_resumedStatus = ResumeHandler.INSTANCE.getState();
            synchronized (this) {
                i = this.mCurrent.gpsStatus;
                checkAbnormalStatus();
                runnablePeek = this.wantCallNNG.peek();
                iCheckSleep = checkSleep(checkStatus(runnablePeek, jElapsedRealtime, mapView));
                if (iCheckSleep == 8) {
                    do_sleep();
                    iCheckSleep = 12;
                }
                updateStatus(iCheckSleep);
                wantedCopy = this.mWanted.copy();
                currentCopy = this.mCurrent.copy();
            }
            loggingStatus(iCheckSleep);
            if (iCheckSleep == 1) {
                int iFreeMemory = Application.freeMemory();
                int i2 = Config.getInt("android", "on_low_memory", Config.def_on_low_memory);
                DebugLogger.D4(ServerRunner.logname, "onLowMemory started: freeMemory = " + (iFreeMemory >> 10) + " KB wanted = " + (i2 >> 10) + " KB");
                NNG.SetJavaFreeMemory(iFreeMemory);
                NNG.garbageCollect(i2, true);
                DebugLogger.D4(ServerRunner.logname, "onLowMemory finished: freeMemory = " + (Application.freeMemory() >> 10) + " KB");
            } else if (iCheckSleep == 3) {
                do_startengine(currentCopy);
            } else if (iCheckSleep == 13) {
                do_setlocationlistener(wantedCopy);
            } else if (iCheckSleep == 26) {
                do_satschanged_gps(wantedCopy);
            } else if (iCheckSleep == 5) {
                do_stopengine();
            } else if (iCheckSleep == 6) {
                do_resumeengine(jElapsedRealtime);
            } else if (iCheckSleep == 7) {
                do_suspendengine();
            } else {
                switch (iCheckSleep) {
                    case 15:
                        DebugLogger.D5(ServerRunner.logname, "do_gpsstatus: " + ServerRunner.gpsStatusText(i) + " -> " + ServerRunner.gpsStatusText(wantedCopy.gpsStatus));
                        do_gpsstatus(wantedCopy);
                        break;
                    case 16:
                        do_assume_gps_connected(wantedCopy);
                        break;
                    case 17:
                        do_locchanged_network(wantedCopy, jElapsedRealtime);
                        break;
                    case 18:
                        do_locchanged_gps(wantedCopy, jElapsedRealtime);
                        break;
                    case 19:
                        do_orientationchanged(wantedCopy, mapView);
                        break;
                    case 20:
                        do_timechange();
                        break;
                    case 21:
                        runnablePeek.run();
                        break;
                    case 22:
                        do_garbagecollect(jElapsedRealtime);
                        break;
                    case 23:
                        AndroidGo.getInstance().process();
                        break;
                    case 24:
                        return false;
                }
            }
            return true;
        }

        private void checkAbnormalStatus() {
            if (this.interrupted) {
                want(NNG.NNG_ENGINE_STOPPED);
            }
        }

        private int checkStatus(Runnable runnable, long j, IMapView iMapView) {
            String provider;
            Wanted wanted = this.mWanted;
            boolean z = false;
            wanted.combined_gpslistener = wanted.gpsListener && this.mWanted.ui_gpsListener;
            Wanted wanted2 = this.mWanted;
            if (wanted2.loc != null) {
                provider = this.mWanted.loc.getProvider();
                if (provider != null && provider.equals("network")) {
                    z = true;
                }
            } else {
                provider = null;
            }
            wanted2.network_provider = z;
            if (this.mCurrent.isChanging() && isStopping()) {
                DebugLogger.D5(ServerRunner.logname, "StopEngine would not be called now.");
            }
            if (this.mCurrent.isChanging() && this.status_changing_started_at + ((long) Config.getInt("debug", "startengine_timeout", Config.def_startengine_timeout)) < j) {
                return 9;
            }
            if (this.mCurrent.isChanging() && !isStopping()) {
                return 8;
            }
            if (this.mWanted.lowMemory && this.mCurrent.isRunning()) {
                return 1;
            }
            if (!this.mWanted.statusQueue.isEmpty()) {
                int iIntValue = this.mWanted.statusQueue.remove().intValue();
                if (iIntValue != 450 && iIntValue != 500) {
                    if (iIntValue == 800) {
                        return 5;
                    }
                    if (iIntValue == 900) {
                        return this.mCurrent.isRunning() ? 5 : 8;
                    }
                    if (iIntValue != 2200) {
                        if (iIntValue == 2400 && this.mCurrent.isRunning()) {
                            return 7;
                        }
                    }
                }
                return this.mCurrent.isRunning() ? 6 : 3;
            }
            if (this.mWanted.prechecked_androidgo && this.mCurrent.isCallable()) {
                return 23;
            }
            if (this.mWanted.combined_gpslistener != this.mCurrent.isListening() && this.setLocationListener_processed_at + 1000 < j) {
                return 13;
            }
            if (!this.mWanted.gpsListener && this.mWanted.ui_gpsListener && !this.mCurrent.isListening() && this.mCurrent.isInForeground()) {
                this.mWanted.gpsListener = true;
                return 12;
            }
            if (!this.mCurrent.isRunning()) {
                return this.interrupted ? 24 : 8;
            }
            if (this.mCurrent.status != 450) {
                if (this.mWanted.gpsStatus != this.mCurrent.gpsStatus) {
                    return 15;
                }
                if (this.mWanted.loc_requested_at != this.locChanged_processed_at && this.mWanted.loc != null) {
                    if (provider == null || ((this.mWanted.network_provider && !this.no_locchanged_yet) || this.mCurrent.gpsStatus == 1)) {
                        return this.mWanted.network_provider ? 17 : 18;
                    }
                    return 16;
                }
                if (this.mWanted.nmea_requested_at != this.nmeaReceived_processed_at && !this.mWanted.nmeaQueue.isEmpty()) {
                    return (!this.no_locchanged_yet || this.mCurrent.gpsStatus == 1) ? 18 : 16;
                }
                if (this.mWanted.sats_requested_at != this.satsChanged_processed_at) {
                    return 26;
                }
            }
            if (this.mCurrent.gpsStatus == 1 && this.locChanged_valid_processed_at + ((long) Config.gps_lost_timeout) < j && this.resumed_at + 30000 < j) {
                this.mWanted.gpsStatus = 2;
                DebugLogger.D5(ServerRunner.logname, "locChanged_valid_processed timed out");
                return 12;
            }
            if (this.mWanted.orientation != this.orientation_current && this.mCurrent.isInForeground() && iMapView != null) {
                return 19;
            }
            if (this.mWanted.timeChange) {
                return 20;
            }
            if (runnable != null) {
                return 21;
            }
            return this.memorywatcher_last + ((long) Config.memorywatcher_timeout_foreground) < j ? 22 : 8;
        }

        private int checkSleep(int i) {
            this.sleep_well = false;
            if (i == 8) {
                if (this.mCurrent.isInForeground() || this.mCurrent.isChanging()) {
                    this.sleep_well = false;
                } else if (this.mWanted.prechecked_resumedStatus == ResumeHandler.State.FULLY_PAUSED) {
                    DebugLogger.D5(ServerRunner.logname, "...fully paused, sleep well = true");
                    this.sleep_well = true;
                } else if (!this.mCurrent.isRunning()) {
                    DebugLogger.D5(ServerRunner.logname, "...engine is not running, sleep well = true");
                    this.sleep_well = true;
                }
                if (this.sleep_well && this.mCurrent.isListening()) {
                    this.mWanted.gpsListener = false;
                    return 12;
                }
            }
            if (i != 8 || this.sleepTestIndex_poll_gps_enabled == this.sleepIndex || !Application.NNG_FullyLoaded || !this.mCurrent.isRunning() || this.mCurrent.isChanging() || this.mCurrent.isListening()) {
                return i;
            }
            this.sleepTestIndex_poll_gps_enabled = this.sleepIndex;
            return 25;
        }

        private void updateStatus(int i) {
            if (i == 1) {
                this.mWanted.lowMemory = false;
                return;
            }
            if (i == 3) {
                update_denied();
                return;
            }
            if (i == 6) {
                update_denied();
                return;
            }
            if (i == 9) {
                DebugLogger.D2(ServerRunner.logname, EngineStatusName(this.mCurrent.status) + " TIMEOUT");
                EngineStatus(100);
                return;
            }
            if (i == 18) {
                remove_stale_nmea();
                return;
            }
            if (i == 25) {
                update_denied();
                return;
            }
            if (i == 15) {
                this.mCurrent.gpsStatus = this.mWanted.gpsStatus;
            } else if (i == 16) {
                this.mWanted.gpsStatus = 1;
            } else if (i == 20) {
                this.mWanted.timeChange = false;
            } else {
                if (i != 21) {
                    return;
                }
                this.wantCallNNG.poll();
            }
        }

        private void remove_stale_nmea() {
            while (!this.mWanted.nmeaQueue.isEmpty() && this.mWanted.nmeaQueue.element().received <= this.nmeaReceived_processed_at) {
                this.mWanted.nmeaQueue.remove();
            }
        }

        private void update_denied() {
            boolean z = LocationListenerImpl.isGpsDenied() && NmeaListenerImpl.isGpsDenied();
            DebugLogger.D5(ServerRunner.logname, "update_denied: isGpsDenied = " + z + ", ui_gpsListener = " + this.mWanted.ui_gpsListener + ", gpsStatus = " + this.mCurrent.gpsStatus + ", mWanted.gpsListener = " + this.mWanted.gpsListener);
            if (z) {
                DebugLogger.D5(ServerRunner.logname, "user had turned GPS off, while iGO was suspended");
                this.mWanted.gpsStatus = 3;
            } else if (this.mWanted.gpsStatus == 3) {
                DebugLogger.D5(ServerRunner.logname, "user had turned GPS on, while iGO was suspended");
                this.mWanted.gpsStatus = 4;
            }
        }

        private static void loggingStatus(int i) {
            String str;
            switch (i) {
                case 1:
                    str = "DO_LOWMEMORY";
                    break;
                case 2:
                case 4:
                case 10:
                case 11:
                case 14:
                default:
                    str = "todoName: <update this table>";
                    break;
                case 3:
                    str = "DO_STARTENGINE";
                    break;
                case 5:
                    str = "DO_STOPENGINE";
                    break;
                case 6:
                    str = "DO_RESUMEENGINE";
                    break;
                case 7:
                    str = "DO_SUSPENDENGINE";
                    break;
                case 8:
                    str = "DO_SLEEP";
                    break;
                case 9:
                    str = "DO_ENGINESTATUS_TIMEOUT";
                    break;
                case 12:
                    return;
                case 13:
                    str = "DO_SETLOCATIONLISTENER";
                    break;
                case 15:
                    str = "DO_GPSSTATUS";
                    break;
                case 16:
                    str = "DO_ASSUME_GPS_CONNECTED";
                    break;
                case 17:
                    str = "DO_LOCCHANGED_NETWORK";
                    break;
                case 18:
                    str = "DO_LOCCHANGED_GPS";
                    break;
                case 19:
                    str = "DO_ORIENTATIONCHANGED";
                    break;
                case 20:
                    str = "DO_TIMECHANGE";
                    break;
                case 21:
                    str = "DO_CALLNNG";
                    break;
                case 22:
                    str = "DO_GARBAGECOLLECT";
                    break;
                case 23:
                    str = "DO_ANDROIDGO";
                    break;
                case 24:
                    str = "DO_INTERRUPTED";
                    break;
                case 25:
                    str = "DO_POLL_GPS_ENABLED";
                    break;
                case 26:
                    return;
            }
            DebugLogger.D5(ServerRunner.logname, "todo: " + str);
        }

        /* JADX WARN: Code restructure failed: missing block: B:75:0x01c1, code lost:
        
            sleep(100);
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        private void do_startengine(com.navngo.igo.javaclient.ServerRunner.Current r9) {
            /*
                Method dump skipped, instruction units count: 571
                To view this dump change 'Code comments level' option to 'DEBUG'
            */
            throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ServerRunner.StatusThread.do_startengine(com.navngo.igo.javaclient.ServerRunner$Current):void");
        }

        private void do_stopengine() {
            NNG.StopEngine();
            NNG.CacheAssetManager(null);
            NNG.SetIntroEnded(false);
            Application.anApplication.unregisterInterfaces();
            Iterator it = ServerRunner.sEngineStoppedCallbacks.iterator();
            while (it.hasNext()) {
                ((Runnable) it.next()).run();
            }
            ServerRunner.sEngineStoppedCallbacks.clear();
            DebugLogger.D3(ServerRunner.logname, "NNG.StopEngine done");
            this.terminateThreadRequested = true;
        }

        private void do_resumeengine(long j) {
            DebugLogger.D5(ServerRunner.logname, "NNG.Resume prepare");
            NNG.Resume();
            DebugLogger.D5(ServerRunner.logname, "NNG.Resume done");
            IgoActivity igoActivity = Application.getIgoActivity();
            if (igoActivity != null) {
                igoActivity.hideLoadAnimation();
            }
            this.resumed_at = j;
        }

        private void do_suspendengine() {
            NNG.Suspend();
            DebugLogger.D4(ServerRunner.logname, "NNG.Suspend done: freeMemory = " + (Application.freeMemory() >> 10) + " KB");
        }

        private void do_gpsstatus(Wanted wanted) {
            int i = wanted.gpsStatus;
            if (i == 0) {
                DebugLogger.D5(ServerRunner.logname, "NNG.GpsConnect(false)");
                NNG.GpsConnect(false);
                return;
            }
            if (i == 1) {
                DebugLogger.D5(ServerRunner.logname, "NNG.GpsConnect(true)");
                NNG.GpsConnect(true);
                return;
            }
            if (i == 2) {
                DebugLogger.D5(ServerRunner.logname, "NNG.GpsLost");
                NNG.GpsLost();
                return;
            }
            if (i == 3) {
                DebugLogger.D5(ServerRunner.logname, "NNG.GpsDenied");
                NNG.GpsDenied();
            } else {
                if (i != 4) {
                    return;
                }
                synchronized (this) {
                    this.mWanted.gpsStatus = 1;
                    this.mCurrent.gpsStatus = 1;
                }
                DebugLogger.D5(ServerRunner.logname, "NNG.GpsEnabled");
                NNG.GpsEnabled();
            }
        }

        private void do_setlocationlistener(Wanted wanted) {
            LocationListenerImpl.setLocationListener(wanted.combined_gpslistener);
            NmeaListenerImpl.setNmeaListener(wanted.combined_gpslistener);
            this.setLocationListener_processed_at = SystemClock.elapsedRealtime();
        }

        private void do_assume_gps_connected(Wanted wanted) {
            DebugLogger.D5(ServerRunner.logname, "GPS now assumed connected");
            this.no_locchanged_yet = false;
            if (wanted.network_provider) {
                return;
            }
            this.locChanged_valid_processed_at = wanted.loc_requested_at;
        }

        public void runOnHandlerThread(Runnable runnable) {
            if (Thread.currentThread() == this.mHandlerThread) {
                runnable.run();
            } else {
                this.mHandler.post(runnable);
            }
        }

        private void do_locchanged_network(Wanted wanted, long j) {
            if (isOnTheRoad(j)) {
                DebugLogger.D5(ServerRunner.logname, "Network position not used for navigation");
            } else if (this.first_position_processed && this.locChanged_valid_processed_at + ((long) Config.network_jelre_fanyalodunk_timeout) > j) {
                DebugLogger.D5(ServerRunner.logname, "Dropping network position as we have fresh GPS signal");
            } else {
                wanted.loc.setSpeed(0.0f);
                NNG.onLocationChanged(wanted.loc);
                DebugLogger.D5(ServerRunner.logname, "network position processed. It will not affect our expiration timer.");
                DebugLogger.D5(ServerRunner.logname, String.format(null, "proc time: %d, now: %d., delta: %d. First pos processed: %b", Long.valueOf(this.locChanged_valid_processed_at + ((long) Config.network_jelre_fanyalodunk_timeout)), Long.valueOf(j), Long.valueOf((this.locChanged_valid_processed_at + ((long) Config.network_jelre_fanyalodunk_timeout)) - j), Boolean.valueOf(this.first_position_processed)));
                this.first_position_processed = true;
            }
            this.locChanged_processed_at = wanted.loc_requested_at;
        }

        private void do_locchanged_gps(Wanted wanted, long j) {
            if (wanted.loc_requested_at != this.locChanged_processed_at) {
                this.locChanged_processed_at = wanted.loc_requested_at;
                this.locChanged_valid_processed_at = wanted.loc_requested_at;
                NNG.onLocationChanged(wanted.loc);
            }
            if (wanted.nmea_requested_at != this.nmeaReceived_processed_at) {
                NmeaEvent nmeaEventElement = wanted.nmeaQueue.element();
                this.nmeaReceived_processed_at = nmeaEventElement.received;
                this.locChanged_valid_processed_at = j;
                Iterator it = ServerRunner.forwardedNmeaListeners.iterator();
                while (it.hasNext()) {
                    ((IForwardedNmeaListener) it.next()).onNmeaForwardedToEngine(nmeaEventElement.timestamp, nmeaEventElement.sentence);
                }
                NNG.onNmeaReceived(nmeaEventElement.timestamp, nmeaEventElement.sentence);
            }
            this.first_position_processed = true;
        }

        private void do_satschanged_gps(Wanted wanted) {
            if (wanted.sats_requested_at != this.satsChanged_processed_at) {
                this.satsChanged_processed_at = wanted.sats_requested_at;
                NNG.onSatellitesChanged();
            }
        }

        private void do_orientationchanged(Wanted wanted, IMapView iMapView) {
            DebugLogger.D5(ServerRunner.logname, "do_orientationchanged: " + this.orientation_current + " -> " + wanted.orientation);
            if (this.orientation_current != wanted.orientation && NNG.IsIntroEnded()) {
                NNG.OrientationChanged(wanted.orientation);
                DebugLogger.D5(ServerRunner.logname, "NNG.OrientationChanged completed");
            }
            this.orientation_current = wanted.orientation;
        }

        private void do_timechange() {
            NNG.SendTimeChangedEvent();
        }

        private void do_garbagecollect(long j) throws Throwable {
            int iFreeMemory = Application.freeMemory();
            DebugLogger.D5(ServerRunner.logname, "Free memory = " + (iFreeMemory >> 10) + " KB");
            NNG.SetJavaFreeMemory(iFreeMemory);
            int iFreeMemory2 = Application.freeMemory();
            DebugLogger.D5(ServerRunner.logname, "After freeing = " + (iFreeMemory2 >> 10) + " KB  (Gain: " + (((((double) iFreeMemory2) + 0.0d) - ((double) iFreeMemory)) / 1024.0d) + " KB)");
            this.memorywatcher_last = j;
        }

        /* JADX WARN: Removed duplicated region for block: B:32:0x004b  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        private void do_sleep() throws java.lang.Throwable {
            /*
                r9 = this;
                boolean[] r0 = r9.sleepEvent
                monitor-enter(r0)
                boolean[] r1 = r9.sleepEvent     // Catch: java.lang.Throwable -> L67
                r2 = 1
                r3 = 0
                r1[r3] = r2     // Catch: java.lang.Throwable -> L67
                r1.notifyAll()     // Catch: java.lang.Throwable -> L67
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L67
                boolean r0 = r9.notified
                if (r0 == 0) goto L14
                r9.notified = r3
                return
            L14:
                boolean r0 = r9.sleep_well     // Catch: java.lang.Throwable -> L43 java.lang.InterruptedException -> L46
                if (r0 != 0) goto L20
                int r0 = r9.max_timeout_foreground     // Catch: java.lang.Throwable -> L43 java.lang.InterruptedException -> L46
                long r0 = (long) r0     // Catch: java.lang.Throwable -> L43 java.lang.InterruptedException -> L46
                r9.wait(r0)     // Catch: java.lang.Throwable -> L43 java.lang.InterruptedException -> L46
                r0 = 0
                goto L40
            L20:
                boolean r0 = com.navngo.igo.javaclient.Application.NNG_FullyLoaded     // Catch: java.lang.Throwable -> L43 java.lang.InterruptedException -> L46
                if (r0 == 0) goto L2e
                com.navngo.igo.javaclient.NNG.setWaitInfinitely(r2)     // Catch: java.lang.Throwable -> L29 java.lang.InterruptedException -> L2c
                r0 = 1
                goto L2f
            L29:
                r0 = move-exception
                r1 = 1
                goto L5a
            L2c:
                r0 = 1
                goto L47
            L2e:
                r0 = 0
            L2f:
                long r4 = com.navngo.igo.javaclient.Config.memorywatcher_timeout_background     // Catch: java.lang.InterruptedException -> L47 java.lang.Throwable -> L56
                r6 = 0
                int r1 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
                if (r1 <= 0) goto L3d
                long r4 = com.navngo.igo.javaclient.Config.memorywatcher_timeout_background     // Catch: java.lang.InterruptedException -> L47 java.lang.Throwable -> L56
                r9.wait(r4)     // Catch: java.lang.InterruptedException -> L47 java.lang.Throwable -> L56
                goto L40
            L3d:
                r9.wait()     // Catch: java.lang.InterruptedException -> L47 java.lang.Throwable -> L56
            L40:
                if (r0 == 0) goto L4e
                goto L4b
            L43:
                r0 = move-exception
                r1 = 0
                goto L5a
            L46:
                r0 = 0
            L47:
                r9.interrupted = r2     // Catch: java.lang.Throwable -> L56
                if (r0 == 0) goto L4e
            L4b:
                com.navngo.igo.javaclient.NNG.setWaitInfinitely(r3)
            L4e:
                r9.notified = r3
                int r0 = r9.sleepIndex
                int r0 = r0 + r2
                r9.sleepIndex = r0
                return
            L56:
                r1 = move-exception
                r8 = r1
                r1 = r0
                r0 = r8
            L5a:
                if (r1 == 0) goto L5f
                com.navngo.igo.javaclient.NNG.setWaitInfinitely(r3)
            L5f:
                r9.notified = r3
                int r1 = r9.sleepIndex
                int r1 = r1 + r2
                r9.sleepIndex = r1
                throw r0
            L67:
                r1 = move-exception
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L67
                throw r1
            */
            throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ServerRunner.StatusThread.do_sleep():void");
        }

        private void setStartEngineIntParams(IgoActivity igoActivity) {
            Application.ScreenSizes screenSizes = Application.anApplication.getScreenSizes();
            ApplicationInfo applicationInfo = Application.anApplication.getApplicationInfo();
            NNG.intParams[2] = Config.getInt("debug", "startengine_timeout", Config.def_startengine_timeout);
            NNG.intParams[1] = Config.getInt("debug", "cache_size", Config.def_cache_size);
            NNG.intParams[4] = screenSizes.mSize_x;
            NNG.intParams[5] = screenSizes.mSize_y;
            NNG.intParams[6] = screenSizes.mSize_x2;
            NNG.intParams[7] = screenSizes.mSize_y2;
            NNG.intParams[8] = applicationInfo.flags;
            NNG.intParams[9] = Build.VERSION.SDK_INT;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void notifyStatusThread() {
            this.notified = true;
            notify();
        }

        private boolean isOnTheRoad(long j) {
            if (this.ontheroad_was_true_at + 5000 > j) {
                DebugLogger.D5(ServerRunner.logname, "ontheroad cached true");
                return true;
            }
            if (this.ontheroad_was_false_at + 5000 > j) {
                DebugLogger.D5(ServerRunner.logname, "ontheroad cached false");
                return false;
            }
            boolean zIsOnTheRoad = NNG.isOnTheRoad();
            if (zIsOnTheRoad) {
                this.ontheroad_was_true_at = j;
            } else {
                this.ontheroad_was_false_at = j;
            }
            return zIsOnTheRoad;
        }

        public synchronized void callNNG(Runnable runnable, int i) {
            if (i == ServerRunner.engineIndex) {
                this.wantCallNNG.add(runnable);
            } else {
                DebugLogger.D5(ServerRunner.logname, "callNNG: dropped rotten callback " + i + " vs. " + ServerRunner.engineIndex);
            }
            notifyStatusThread();
        }

        public synchronized void want(int i) {
            DebugLogger.D5(ServerRunner.logname, "wantedStatus: " + EngineStatusName(i));
            this.mWanted.statusQueue.add(Integer.valueOf(i));
            notifyStatusThread();
        }

        public synchronized void onLocationChanged(Location location) {
            this.mWanted.loc_requested_at = SystemClock.elapsedRealtime();
            this.mWanted.loc = location;
            notifyStatusThread();
        }

        public synchronized void onSatellitesChanged() {
            this.mWanted.sats_requested_at = SystemClock.elapsedRealtime();
            notifyStatusThread();
        }

        public synchronized void onNmeaReceived(long j, String str) {
            Queue<NmeaEvent> queue = this.mWanted.nmeaQueue;
            Wanted wanted = this.mWanted;
            long j2 = wanted.nmea_requested_at + 1;
            wanted.nmea_requested_at = j2;
            queue.add(new NmeaEvent(j2, j, str));
            notifyStatusThread();
        }

        public synchronized void wantGpsStatus(int i) {
            this.mWanted.gpsStatus = i;
            notifyStatusThread();
        }

        synchronized void uiWantGpsListener(boolean z) {
            DebugLogger.D5(ServerRunner.logname, "uiWantGpsListener(" + z + ")");
            if (z && LocationListenerImpl.isGpsDenied() && NmeaListenerImpl.isGpsDenied()) {
                this.mCurrent.gpsStatus = 1;
                this.mWanted.gpsStatus = 3;
            } else {
                this.mWanted.ui_gpsListener = z;
            }
            notifyStatusThread();
        }

        public synchronized void onLowMemory() {
            this.mWanted.lowMemory = true;
            notifyStatusThread();
        }

        public synchronized void wantOrientation(int i) {
            this.mWanted.orientation = i;
            notifyStatusThread();
        }

        /* JADX WARN: Removed duplicated region for block: B:43:0x00c1 A[Catch: all -> 0x0144, TryCatch #0 {, blocks: (B:3:0x0001, B:19:0x0030, B:21:0x0065, B:26:0x0071, B:29:0x007d, B:59:0x010f, B:57:0x00e7, B:58:0x00eb, B:53:0x00df, B:46:0x00c7, B:38:0x0096, B:39:0x00a6, B:41:0x00ac, B:42:0x00b6, B:43:0x00c1, B:62:0x0114), top: B:68:0x0001 }] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        public synchronized void EngineStatus(int r10) {
            /*
                Method dump skipped, instruction units count: 327
                To view this dump change 'Code comments level' option to 'DEBUG'
            */
            throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ServerRunner.StatusThread.EngineStatus(int):void");
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized Current getCurrent() {
            return this.mCurrent.copy();
        }

        public synchronized void requestTimeChange() {
            this.mWanted.timeChange = true;
            notifyStatusThread();
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x001b, code lost:
        
            r5.sleepEvent.wait(r6);
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        public void waitForWait(long r6) {
            /*
                r5 = this;
                boolean[] r0 = r5.sleepEvent
                monitor-enter(r0)
                boolean[] r1 = r5.sleepEvent     // Catch: java.lang.Throwable -> L32
                r2 = 0
                r1[r2] = r2     // Catch: java.lang.Throwable -> L32
            L8:
                boolean[] r1 = r5.sleepEvent     // Catch: java.lang.Throwable -> L32
                boolean r1 = r1[r2]     // Catch: java.lang.Throwable -> L32
                if (r1 != 0) goto L29
                java.lang.String r1 = "ServerRunner"
                java.lang.String r3 = "waitForWait begin"
                com.navngo.igo.javaclient.DebugLogger.D5(r1, r3)     // Catch: java.lang.Throwable -> L32
                r3 = 0
                int r1 = (r6 > r3 ? 1 : (r6 == r3 ? 0 : -1))
                if (r1 <= 0) goto L21
                boolean[] r1 = r5.sleepEvent     // Catch: java.lang.InterruptedException -> L27 java.lang.Throwable -> L32
                r1.wait(r6)     // Catch: java.lang.InterruptedException -> L27 java.lang.Throwable -> L32
                goto L29
            L21:
                boolean[] r1 = r5.sleepEvent     // Catch: java.lang.InterruptedException -> L27 java.lang.Throwable -> L32
                r1.wait()     // Catch: java.lang.InterruptedException -> L27 java.lang.Throwable -> L32
                goto L8
            L27:
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L32
                return
            L29:
                java.lang.String r6 = "ServerRunner"
                java.lang.String r7 = "waitForWait end"
                com.navngo.igo.javaclient.DebugLogger.D5(r6, r7)     // Catch: java.lang.Throwable -> L32
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L32
                return
            L32:
                r6 = move-exception
                monitor-exit(r0)     // Catch: java.lang.Throwable -> L32
                throw r6
            */
            throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ServerRunner.StatusThread.waitForWait(long):void");
        }

        public synchronized void setGpsListener(boolean z) {
            this.mWanted.gpsListener = z;
            notifyStatusThread();
        }

        public boolean isStopping() {
            return this.mCurrent.status > 500 && this.mCurrent.status < 800;
        }

        public boolean isShuttingDown() {
            return isStopping() || this.mCurrent.status == 800 || this.mCurrent.status == 900;
        }
    }

    public static String EngineStatusName(int i) {
        return StatusThread.EngineStatusName(i);
    }

    public static String getImei(IgoActivity igoActivity) {
        Method method;
        String str;
        String str2;
        Exception e;
        String lockedTo = getLockedTo();
        if (lockedTo != null && !"imei".equalsIgnoreCase(lockedTo)) {
            DebugLogger.D3(logname, "imei: null, locked to: " + lockedTo);
            return null;
        }
        TelephonyManager telephonyManager = (TelephonyManager) Application.anApplication.getSystemService("phone");
        int i = Config.getInt("android", "getdeviceid_trycount", 5);
        if (Config.getdeviceid_gemini) {
            try {
                method = telephonyManager.getClass().getMethod("getDeviceIdGemini", Integer.TYPE);
            } catch (NoSuchMethodException e2) {
                DebugLogger.D1(logname, "no getDeviceIdGemini method", e2);
                method = null;
            }
        } else {
            method = null;
        }
        String strTrim = null;
        int i2 = 0;
        boolean z = false;
        while (true) {
            str = "null";
            if (i2 >= i) {
                break;
            }
            if (method != null) {
                try {
                    str2 = (String) method.invoke(telephonyManager, 0);
                } catch (Exception e3) {
                    str2 = strTrim;
                    e = e3;
                }
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("getDeviceIdGemini(0) = ");
                    sb.append(str2 == null ? "null" : str2);
                    DebugLogger.D5(logname, sb.toString());
                } catch (Exception e4) {
                    e = e4;
                    DebugLogger.D1(logname, "getDeviceIdGemini() invoke exception", e);
                }
                strTrim = str2;
            } else if (PermissionHandler.get().isPermissionGranted("android.permission.READ_PHONE_STATE")) {
                try {
                    strTrim = telephonyManager.getDeviceId();
                } catch (Exception e5) {
                    DebugLogger.D3(logname, "Failed getDeviceId() call, exception = " + e5.getMessage());
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("getDeviceId() = ");
                sb2.append(strTrim == null ? "null" : strTrim);
                DebugLogger.D5(logname, sb2.toString());
            } else {
                DebugLogger.D5(logname, "No permission (READ_PHONE_STATE), to read imei");
                return null;
            }
            if (strTrim != null) {
                strTrim = strTrim.trim();
                break;
            }
            DebugLogger.D2(logname, "do_startengine: Retrying getDeviceId");
            if (!z && igoActivity != null) {
                showToast(igoActivity);
                z = true;
            }
            try {
                Thread.sleep(1000L);
                i2++;
            } catch (InterruptedException unused) {
            }
        }
        String str3 = (strTrim == null || !strTrim.startsWith("0000000")) ? strTrim : null;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("imei: ");
        if (str3 != null) {
            str = "\"" + str3 + "\"";
        }
        sb3.append(str);
        DebugLogger.D3(logname, sb3.toString());
        return str3;
    }

    private static void showToast(final IgoActivity igoActivity) {
        igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.ServerRunner.1
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(igoActivity, R.string.querying_device_id, 1).show();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getSDID(boolean z) {
        String strCID2SDId;
        boolean z2 = true;
        Set<String> cIDs = Mount.getCIDs(true);
        StringBuilder sb = new StringBuilder();
        for (String str : cIDs) {
            if (z2) {
                z2 = false;
            } else {
                sb.append(",");
            }
            sb.append(str);
            if (z && (strCID2SDId = CID2SDId(str)) != null) {
                sb.append(",");
                sb.append(strCID2SDId);
            }
        }
        String string = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("SD ID list: ");
        sb2.append(string.length() == 0 ? "null" : string);
        DebugLogger.D3(logname, sb2.toString());
        if (string.length() == 0) {
            return null;
        }
        return string;
    }

    private static String CID2SDId(String str) {
        if (str == null || str.length() < 26) {
            return null;
        }
        return str.substring(0, 2) + str.substring(18, 26);
    }

    public static String getAndroidId(IgoActivity igoActivity) {
        String lockedTo = getLockedTo();
        if (lockedTo != null && !"android_id".equalsIgnoreCase(lockedTo)) {
            DebugLogger.D3(logname, "android_id: null, locked_to: " + lockedTo);
            return null;
        }
        String string = Settings.Secure.getString(igoActivity != null ? igoActivity.getContentResolver() : Application.anApplication.getContentResolver(), "android_id");
        StringBuilder sb = new StringBuilder();
        sb.append("androidId: ");
        sb.append(string == null ? "null" : string);
        DebugLogger.D3(logname, sb.toString());
        return string;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getCpuSerial() {
        String strTrim = null;
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(new File("/proc/cpuinfo")));
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                if (line.startsWith("Serial")) {
                    String[] strArrSplit = line.split(":");
                    if (strArrSplit.length > 1) {
                        strTrim = strArrSplit[1].trim();
                    }
                }
            }
        } catch (IOException e) {
            DebugLogger.D1(logname, "/proc/cpuinfo reading failed, returning with null", e);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("cpu_serial: ");
        sb.append(strTrim);
        DebugLogger.D3(logname, sb.toString() == null ? "null" : strTrim);
        return strTrim;
    }

    public static void callNNG(Runnable runnable, int i) {
        getStatusThread().callNNG(runnable, i);
    }

    public static int getEngineIndex() {
        return engineIndex;
    }

    public static void startServer() {
        DebugLogger.D4(logname, "startServer");
        getStatusThread().want(NNG.NNG_ENGINE_STARTED);
    }

    public static void stopServer() {
        DebugLogger.D4(logname, "stopServer");
        getStatusThread().want(NNG.NNG_ENGINE_STOPPED);
    }

    public static void suspendServer() {
        getStatusThread().want(NNG.NNG_ENGINE_LOST_FOCUS);
    }

    public static void resumeServer() {
        getStatusThread().want(NNG.NNG_ENGINE_SET_FOCUS);
    }

    public static void onLocationChanged(Location location) {
        getStatusThread().onLocationChanged(location);
    }

    public static void onSatellitesChanged() {
        getStatusThread().onSatellitesChanged();
    }

    public static void onNmeaReceived(long j, String str) {
        getStatusThread().onNmeaReceived(j, str);
    }

    public static void wantGpsStatus(int i) {
        DebugLogger.D5(logname, "wantGpsStatus(" + gpsStatusText(i) + ") called");
        getStatusThread().wantGpsStatus(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String gpsStatusText(int i) {
        if (i == 0) {
            return "GPS_DISCONNECTED";
        }
        if (i == 1) {
            return "GPS_CONNECTED";
        }
        if (i == 2) {
            return "GPS_LOST";
        }
        if (i == 3) {
            return "GPS_DENIED";
        }
        if (i == 4) {
            return "GPS_ENABLED";
        }
        return Config.def_additional_assets + i;
    }

    public static void uiWantGpsListener(boolean z) {
        DebugLogger.D5(logname, "uiWantGpsListener: " + z);
        getStatusThread().uiWantGpsListener(z);
    }

    public static void onLowMemory() {
        getStatusThread().onLowMemory();
    }

    public static void setOrientation(int i) {
        DebugLogger.D5(logname, "setOrientation: " + i);
        if (i != 2) {
            OrientationChanged(0);
        } else {
            OrientationChanged(1);
        }
    }

    private static void OrientationChanged(int i) {
        getStatusThread().wantOrientation(i);
    }

    public static int GetOrientation() {
        return getStatusThread().mWanted.orientation;
    }

    public static void notifyStatusThread() {
        StatusThread statusThread2 = getStatusThread();
        synchronized (statusThread2) {
            statusThread2.notifyStatusThread();
        }
    }

    public static void Key(int i, KeyState keyState) {
        if (Application.NNG_FullyLoaded) {
            if (keyState == KeyState.DOWN) {
                NNG.KeyDown(i);
            } else {
                NNG.KeyUp(i);
            }
            notifyStatusThread();
        }
    }

    public enum TouchAction {
        ACTION_DOWN(4),
        ACTION_MOVE(3),
        ACTION_UP(5),
        ACTION_CANCEL(9);

        public final int actionCode;

        TouchAction(int i) {
            this.actionCode = i;
        }
    }

    public static void SendTouch(int i, int i2, TouchAction touchAction, int i3, int i4, long j) {
        if (Application.NNG_FullyLoaded) {
            NNG.SendTouch(i, i2, touchAction.actionCode, i3, i4, j);
        }
    }

    public static void waitForWait(long j) {
        getStatusThread().waitForWait(j);
    }

    public static void EngineStatus(int i) {
        getStatusThread().EngineStatus(i);
    }

    public static boolean isEngineStarting() {
        StatusThread statusThreadTryGetStatusThread = tryGetStatusThread();
        return statusThreadTryGetStatusThread != null && statusThreadTryGetStatusThread.getCurrent().isStarting();
    }

    public static boolean isEngineCallable() {
        StatusThread statusThreadTryGetStatusThread = tryGetStatusThread();
        return statusThreadTryGetStatusThread != null && statusThreadTryGetStatusThread.getCurrent().isCallable();
    }

    public static boolean isEngineRunning() {
        StatusThread statusThreadTryGetStatusThread = tryGetStatusThread();
        return statusThreadTryGetStatusThread != null && statusThreadTryGetStatusThread.getCurrent().isRunning();
    }

    public static String getEngineStatusName() {
        return StatusThread.EngineStatusName(getStatusThread().getCurrent().status);
    }

    public static void requestTimeChange() {
        getStatusThread().requestTimeChange();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.navngo.igo.javaclient.ServerRunner$2] */
    public static void startServerAfterMediaScan(final boolean z) {
        new Thread("ServerRunner.startServerAfterMediaScan") { // from class: com.navngo.igo.javaclient.ServerRunner.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                Config.reload(6);
                Application.waitMediaScanning();
                Config.reload(7);
                if (Application.checkForSDCard(false)) {
                    ServerRunner.startServer();
                    if (z) {
                        ServerRunner.waitForWait(30000L);
                        if (Application.getIgoActivity() == null) {
                            DebugLogger.D4(ServerRunner.logname, "We are still in background: calling suspendServer");
                            ServerRunner.suspendServer();
                        }
                    }
                }
            }
        }.start();
    }

    public static void setGpsListener(boolean z) {
        getStatusThread().setGpsListener(z);
    }

    public static String getDeviceIDs() {
        StringBuilder sb = new StringBuilder();
        IgoActivity igoActivity = Application.getIgoActivity();
        String imei = getImei(igoActivity);
        String str = ",";
        String str2 = Config.def_additional_assets;
        if (imei != null && !imei.isEmpty()) {
            sb.append(Config.def_additional_assets + imei);
            str2 = ",";
        }
        String androidId = getAndroidId(igoActivity);
        if (androidId == null || androidId.isEmpty()) {
            str = str2;
        } else {
            sb.append(str2 + androidId);
        }
        String sdid = getSDID(true);
        if (sdid != null && !sdid.isEmpty()) {
            sb.append(str + sdid);
        }
        ManufacturerIDProvider instace = ManufacturerIDProvider.getInstace();
        if (instace.isValid()) {
            sb.append(str + instace.getID());
        }
        String string = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Device ids: ");
        sb2.append(string.length() == 0 ? "null" : string);
        DebugLogger.D2(logname, sb2.toString());
        return string;
    }

    public static void runOnHandlerThread(Runnable runnable) {
        getStatusThread().runOnHandlerThread(runnable);
    }
}
