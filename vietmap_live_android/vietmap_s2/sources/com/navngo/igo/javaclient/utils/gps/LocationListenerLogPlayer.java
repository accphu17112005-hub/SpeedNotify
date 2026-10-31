package com.navngo.igo.javaclient.utils.gps;

import android.location.LocationListener;
import android.os.SystemClock;
import com.navngo.igo.javaclient.DebugLogger;
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocationListenerLogPlayer extends Thread {
    private static final String logname = "LocationListenerLogPlayer";
    boolean autoRepeat;
    private volatile boolean doStop = false;
    private volatile boolean dropRecords = false;
    LocationListener listener;
    File sourceFile;

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        DebugLogger.D3(logname, "Starting log playback.");
        do {
            try {
                LocationListenerLogReader locationListenerLogReader = new LocationListenerLogReader(this.listener, new ObjectInputStream(new FileInputStream(this.sourceFile)));
                long j = 0;
                long j2 = 0;
                while (!locationListenerLogReader.isEOF() && !this.doStop) {
                    long nextTimestamp = locationListenerLogReader.readNextTimestamp();
                    long jElapsedRealtime = SystemClock.elapsedRealtime();
                    long j3 = (nextTimestamp - j) / 1000000;
                    long j4 = j == 0 ? 0L : j3 - (jElapsedRealtime - j2);
                    if (j4 > 0) {
                        j2 += j3;
                    } else {
                        j4 = 0;
                        j2 = jElapsedRealtime;
                    }
                    if (j4 > 2000) {
                        DebugLogger.D4(logname, "Waiting before next command " + j4 + " ms");
                    }
                    Thread.sleep(j4);
                    locationListenerLogReader.readNextRecord(this.dropRecords);
                    j = nextTimestamp;
                }
                if (!this.autoRepeat) {
                    break;
                }
            } catch (Exception e) {
                DebugLogger.D3(logname, "Exception during log playback:" + e);
            }
        } while (!this.doStop);
        DebugLogger.D3(logname, "Log playback finished.");
    }

    public LocationListenerLogPlayer(LocationListener locationListener, File file, boolean z) {
        try {
            this.sourceFile = file;
            this.autoRepeat = z;
            this.listener = locationListener;
            start();
        } catch (Exception e) {
            throw new Error(e);
        }
    }

    public void StopPlayer() {
        this.doStop = true;
        interrupt();
    }

    public void enable(boolean z) {
        this.dropRecords = !z;
    }
}
