package com.navngo.igo.javaclient.androidgo;

import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Batch {
    public static final String BATCH = "BATCH";
    AndroidGo.IActionSucceeded mSuccessCallback;
    private boolean mStarted = true;
    private int mRunningTasks = 0;
    private boolean mSucceeded = true;

    public Batch(AndroidGo.IActionSucceeded iActionSucceeded) {
        this.mSuccessCallback = iActionSucceeded;
        if (iActionSucceeded == null) {
            DebugLogger.D2(getClass().toString(), "WARNING: endBatch callback is null. It doesn't have much use with null value :). You can't detect the end of the Batch...");
        }
    }

    public void startTask() {
        this.mRunningTasks++;
    }

    public void taskCompleted(boolean z) {
        boolean z2 = true;
        this.mRunningTasks--;
        if (!this.mSucceeded && !z) {
            z2 = false;
        }
        this.mSucceeded = z2;
        checkAndCallSuccessCallback();
    }

    public void end() {
        this.mStarted = false;
        checkAndCallSuccessCallback();
    }

    private void checkAndCallSuccessCallback() {
        AndroidGo.IActionSucceeded iActionSucceeded;
        if (this.mStarted || this.mRunningTasks != 0 || (iActionSucceeded = this.mSuccessCallback) == null) {
            return;
        }
        iActionSucceeded.actionSucceeded(BATCH, this.mSucceeded);
    }
}
