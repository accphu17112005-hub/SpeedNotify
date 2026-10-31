package com.navngo.igo.javaclient;

import android.content.Intent;
import android.os.Build;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class ServiceRunner {
    private static final String logname = "ServiceRunner";
    private ServiceState mMainServiceState;
    private ServiceState mSlapiServiceState;
    private Intent serviceintent1;
    private Intent serviceintent2;

    public enum ServiceState {
        STARTING,
        RUNNING,
        STOPPING,
        STOPPED
    }

    synchronized void setMainServiceState(ServiceState serviceState) {
        this.mMainServiceState = serviceState;
    }

    public synchronized ServiceState getMainServiceState() {
        return this.mMainServiceState;
    }

    public synchronized ServiceState getSlapiServiceState() {
        return this.mSlapiServiceState;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0010  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public synchronized boolean isMainServiceRunningOrStarting() {
        /*
            r2 = this;
            monitor-enter(r2)
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r0 = r2.mMainServiceState     // Catch: java.lang.Throwable -> L13
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r1 = com.navngo.igo.javaclient.ServiceRunner.ServiceState.RUNNING     // Catch: java.lang.Throwable -> L13
            if (r0 == r1) goto L10
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r0 = r2.mMainServiceState     // Catch: java.lang.Throwable -> L13
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r1 = com.navngo.igo.javaclient.ServiceRunner.ServiceState.STARTING     // Catch: java.lang.Throwable -> L13
            if (r0 != r1) goto Le
            goto L10
        Le:
            r0 = 0
            goto L11
        L10:
            r0 = 1
        L11:
            monitor-exit(r2)
            return r0
        L13:
            r0 = move-exception
            monitor-exit(r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ServiceRunner.isMainServiceRunningOrStarting():boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0010  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public synchronized boolean isSlapiServiceRunningOrStarting() {
        /*
            r2 = this;
            monitor-enter(r2)
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r0 = r2.mSlapiServiceState     // Catch: java.lang.Throwable -> L13
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r1 = com.navngo.igo.javaclient.ServiceRunner.ServiceState.RUNNING     // Catch: java.lang.Throwable -> L13
            if (r0 == r1) goto L10
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r0 = r2.mSlapiServiceState     // Catch: java.lang.Throwable -> L13
            com.navngo.igo.javaclient.ServiceRunner$ServiceState r1 = com.navngo.igo.javaclient.ServiceRunner.ServiceState.STARTING     // Catch: java.lang.Throwable -> L13
            if (r0 != r1) goto Le
            goto L10
        Le:
            r0 = 0
            goto L11
        L10:
            r0 = 1
        L11:
            monitor-exit(r2)
            return r0
        L13:
            r0 = move-exception
            monitor-exit(r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.ServiceRunner.isSlapiServiceRunningOrStarting():boolean");
    }

    public ServiceRunner() {
        this.serviceintent1 = null;
        this.serviceintent2 = null;
        Intent intent = new Intent("com.navngo.igo.javaclient.MAINSERVICE");
        this.serviceintent1 = intent;
        intent.setPackage(Application.anApplication.getPackageName());
        Intent intent2 = new Intent("com.navngo.igo.javaclient.SLAPI_SERVER");
        this.serviceintent2 = intent2;
        intent2.setPackage(Application.anApplication.getPackageName());
        this.mMainServiceState = ServiceState.STOPPED;
        this.mSlapiServiceState = ServiceState.STOPPED;
    }

    public synchronized void startMainService(boolean z) {
        if (this.serviceintent1 != null) {
            if (Build.VERSION.SDK_INT >= 26 && z) {
                this.serviceintent1.putExtra(MainService.showNotificationKey, true);
                Application.anApplication.getApplicationContext().startForegroundService(this.serviceintent1);
            } else {
                Application.anApplication.getApplicationContext().startService(this.serviceintent1);
            }
        } else {
            DebugLogger.D3(logname, "Could not start MAINSERVICE");
        }
        if (this.mMainServiceState == ServiceState.STOPPED) {
            this.mMainServiceState = ServiceState.STARTING;
        }
    }

    public synchronized void startSlapiService() {
        if (this.serviceintent2 != null) {
            Application.anApplication.getApplicationContext().startService(this.serviceintent2);
        } else {
            DebugLogger.D3(logname, "Could not start SLAPI_SERVER");
        }
        this.mSlapiServiceState = ServiceState.RUNNING;
    }

    public synchronized void startServices(boolean z) {
        startMainService(z);
        startSlapiService();
    }

    public synchronized void stopServices() {
        Application.anApplication.getApplicationContext().stopService(this.serviceintent1);
        Application.anApplication.getApplicationContext().stopService(this.serviceintent2);
        this.mMainServiceState = ServiceState.STOPPING;
        this.mSlapiServiceState = ServiceState.STOPPED;
    }

    public void showBGNotification(boolean z) {
        Intent intent = new Intent(this.serviceintent1);
        intent.putExtra(MainService.showNotificationKey, z);
        try {
            Application.anApplication.getApplicationContext().startService(intent);
        } catch (IllegalStateException unused) {
            DebugLogger.D3(logname, "showBGNotification: prevented startService crash, show=" + z);
        }
    }
}
