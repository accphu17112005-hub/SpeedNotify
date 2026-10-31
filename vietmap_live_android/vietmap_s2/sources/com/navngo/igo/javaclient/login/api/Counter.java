package com.navngo.igo.javaclient.login.api;

import android.os.Handler;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class Counter {
    private int current;
    private final int delay;
    private final int delta;
    private final int from;
    private Handler handler;
    private OnCountListener listener;
    private Runnable runTask;
    private final int to;

    public interface OnCountListener {
        void onCount(int i, boolean z);
    }

    static /* synthetic */ int access$012(Counter counter, int i) {
        int i2 = counter.current + i;
        counter.current = i2;
        return i2;
    }

    public boolean isRunning() {
        return this.handler != null;
    }

    public Counter(int i, int i2, int i3) {
        this.runTask = new Runnable() { // from class: com.navngo.igo.javaclient.login.api.Counter.1
            @Override // java.lang.Runnable
            public void run() {
                Counter counter = Counter.this;
                Counter.access$012(counter, counter.delta);
                if (Counter.this.current > Counter.this.to) {
                    if (Counter.this.listener != null) {
                        Counter.this.listener.onCount(Counter.this.current, true);
                    }
                    Counter.this.handler.postDelayed(this, Counter.this.delay);
                    return;
                }
                Counter.this.stop();
            }
        };
        this.from = i;
        this.to = i2;
        this.delay = i3;
        int i4 = i2 - i;
        this.delta = i4 / Math.abs(i4);
    }

    public Counter(int i) {
        this(0, i, 1000);
    }

    public void setOnCountListener(OnCountListener onCountListener) {
        this.listener = onCountListener;
        onCountListener.onCount(this.current, isRunning());
    }

    public void unsetOnCountListener() {
        this.listener = null;
    }

    public void start() {
        this.current = this.from;
        Handler handler = new Handler();
        this.handler = handler;
        handler.postDelayed(this.runTask, this.delay);
        OnCountListener onCountListener = this.listener;
        if (onCountListener != null) {
            onCountListener.onCount(this.current, true);
        }
    }

    public void stop() {
        this.handler.removeCallbacks(this.runTask);
        this.handler = null;
        OnCountListener onCountListener = this.listener;
        if (onCountListener != null) {
            onCountListener.onCount(this.current, false);
        }
    }
}
