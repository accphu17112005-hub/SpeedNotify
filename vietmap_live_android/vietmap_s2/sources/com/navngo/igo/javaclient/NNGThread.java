package com.navngo.igo.javaclient;

import android.os.Process;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Vector;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class NNGThread implements Runnable {
    static Map<Long, Integer> framePointers = new HashMap();
    private static final String logname = "NNGThread";
    private long mStackSize;
    private long mCallback = 0;
    private int mTid = -1;
    private int mPriority = 0;
    private boolean mRunningCallback = false;
    private Thread mThread = null;
    private String mName = "iGO daemon";

    public NNGThread(long j) {
        this.mStackSize = j;
    }

    public synchronized void start(long j) {
        Thread thread = this.mThread;
        if (thread != null && thread.isAlive()) {
            DebugLogger.D2(logname, "Error: someone was trying to start a thread that is already running.");
            return;
        }
        Thread thread2 = new Thread(null, this, this.mName, this.mStackSize);
        this.mThread = thread2;
        thread2.setDaemon(true);
        this.mCallback = j;
        this.mTid = Process.myTid();
        this.mThread.start();
    }

    @Override // java.lang.Runnable
    public void run() {
        long j = this.mCallback;
        if (j == 0 || j == -1) {
            return;
        }
        this.mRunningCallback = true;
        setThreadPriority(this.mPriority);
        NNG.callFunctor(this.mCallback);
        this.mRunningCallback = false;
    }

    public void setThreadPriority(int i) {
        try {
            this.mPriority = i;
            Thread thread = this.mThread;
            String str = "setThreadPriority: th=" + (thread == null ? this.mTid : thread.getId()) + " pri=" + i;
            if (this.mRunningCallback) {
                DebugLogger.D5(logname, str);
                Process.setThreadPriority(this.mTid, i);
            } else {
                DebugLogger.D5(logname, str + " delayed");
            }
        } catch (Exception e) {
            DebugLogger.D1(logname, "Exception in NNGThread.setThreadPriority: ", e);
        }
    }

    public void join() {
        try {
            this.mThread.join();
        } catch (Exception e) {
            DebugLogger.D1(logname, "Exception in NNGThread.join: ", e);
        }
    }

    public void join(long j) {
        try {
            this.mThread.join(j);
        } catch (Exception e) {
            DebugLogger.D1(logname, "Exception in NNGThread.join: ", e);
        }
    }

    public void setName(String str) {
        this.mName = str;
        Thread thread = this.mThread;
        if (thread != null) {
            thread.setName(str);
        }
    }

    public static long getCurrentThreadId() {
        return Thread.currentThread().getId();
    }

    public static void SaveFramePointer(int i) {
        synchronized (framePointers) {
            framePointers.put(Long.valueOf(getCurrentThreadId()), Integer.valueOf(i));
        }
    }

    public static long[] GetFramePointers() {
        Thread[] threadArr;
        int iEnumerate;
        long[] jArr;
        synchronized (framePointers) {
            int iActiveCount = Thread.activeCount() + 1;
            do {
                iActiveCount *= 2;
                threadArr = new Thread[iActiveCount];
                iEnumerate = Thread.enumerate(threadArr);
            } while (iEnumerate >= iActiveCount);
            HashSet hashSet = new HashSet(iEnumerate);
            int i = iEnumerate;
            while (true) {
                int i2 = i - 1;
                if (i <= 0) {
                    break;
                }
                hashSet.add(Long.valueOf(threadArr[i2].getId()));
                i = i2;
            }
            Vector vector = new Vector(iEnumerate * 2);
            for (Long l : framePointers.keySet()) {
                int iIntValue = framePointers.get(l).intValue();
                if (hashSet.contains(l)) {
                    if (iIntValue != 0) {
                        vector.add(l);
                        vector.add(Long.valueOf(iIntValue));
                        DebugLogger.D4(logname, String.format(null, "GetFramePointers: threadid = %d fp = 0x%08x", l, Integer.valueOf(iIntValue)));
                    }
                } else if (iIntValue != 0) {
                    DebugLogger.D2(logname, String.format(null, "Saved fp = 0x%08x  for nonexistent thread %d", Integer.valueOf(iIntValue), l));
                }
            }
            int size = vector.size();
            jArr = new long[size];
            while (true) {
                int i3 = size - 1;
                if (size > 0) {
                    jArr[i3] = ((Long) vector.get(i3)).longValue();
                    size = i3;
                }
            }
        }
        return jArr;
    }
}
