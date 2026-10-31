package com.navngo.igo.javaclient.downloadmanager;

import android.app.DownloadManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import androidx.core.app.NotificationCompat;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.receiver.IReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class DownloadBroadcastReceiver extends BroadcastReceiver implements IReceiver {
    public static final int DLM_ERROR_DISK_IS_FULL = 2;
    public static final int DLM_ERROR_FILESYSTEM = 1;
    public static final int DLM_ERROR_FILE_INCONSISTENT = 3;
    public static final int DLM_ERROR_INTERNAL = 5;
    public static final int DLM_ERROR_NETWORK = 4;
    public static final int DLM_ERROR_NO_ERROR = 0;
    private static final String logname = "DownloadBroadcastReceiver";
    private static boolean mRegistered = false;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        DebugLogger.D3(logname, "onReceive intent: " + action);
        if ("android.intent.action.DOWNLOAD_COMPLETE".equals(action)) {
            onDownloadComplete(context, intent);
        }
    }

    private void onDownloadComplete(Context context, Intent intent) {
        long j = context.getSharedPreferences(NativeDownloadmanager.DOWNLOADER_RECORDS, 0).getLong(NativeDownloadmanager.REFERENCE_ID, -1L);
        long j2 = intent.getExtras().getLong("extra_download_id", -1L);
        DebugLogger.D5(logname, "savedReferenceId: " + j + "; referenceId: " + j2);
        if (j != j2 || j == -1) {
            return;
        }
        int i = 1;
        Cursor cursorQuery = ((DownloadManager) context.getSystemService("download")).query(new DownloadManager.Query().setFilterById(j2));
        if (cursorQuery != null && cursorQuery.moveToFirst()) {
            int i2 = cursorQuery.getInt(cursorQuery.getColumnIndex(NotificationCompat.CATEGORY_STATUS));
            DebugLogger.D5(logname, "status: " + i2);
            if (i2 == 1 || i2 == 2 || i2 == 4) {
                DebugLogger.D3(logname, "Not finished");
            } else if (i2 == 8) {
                DebugLogger.D3(logname, "STATUS_SUCCESSFUL");
                NativeDownloadmanager.getInstance().onDownloadSuccess(j2);
            } else if (i2 == 16) {
                int i3 = cursorQuery.getInt(cursorQuery.getColumnIndex("reason"));
                DebugLogger.D3(logname, "Error: Download Failed, reason=" + i3);
                if (i3 != 1001 && i3 != 1009) {
                    if (i3 == 1006) {
                        i = 2;
                    } else if (i3 != 1007) {
                        i = 4;
                    }
                }
                NativeDownloadmanager.getInstance().onDownloadFailed(j2, i);
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (mRegistered) {
            return;
        }
        Application.anApplication.registerReceiver(this, new IntentFilter("android.intent.action.DOWNLOAD_COMPLETE"));
        mRegistered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (mRegistered) {
            Application.anApplication.unregisterReceiver(this);
            mRegistered = false;
        }
    }
}
