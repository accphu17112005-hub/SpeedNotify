package com.navngo.igo.javaclient;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.receiver.IReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class AndroidOSEventsBridge extends BroadcastReceiver implements IReceiver {
    public static AndroidOSEventsBridge instance = new AndroidOSEventsBridge();
    private static final String logname = "AndroidOSEventsBridge";

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        DebugLogger.D5(logname, "Received event: IntentContent is: " + intent.toString());
        String action = intent.getAction();
        if (action.equals("android.intent.action.MEDIA_EJECT") || action.equals("android.intent.action.MEDIA_MOUNTED")) {
            exernalMemoryChangedEvent(intent);
            return;
        }
        DebugLogger.D2(logname, "Got wrong intent. Please implement it. Action = " + action);
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        DebugLogger.D3(logname, "Registering!");
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_EJECT");
        intentFilter.addDataScheme("file");
        Application.anApplication.registerReceiver(this, intentFilter);
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        Application.anApplication.unregisterReceiver(this);
    }

    private void exernalMemoryChangedEvent(Intent intent) {
        if (Application.getIgoActivity() == null) {
            DebugLogger.D1(logname, "MainActivity is null!", null);
            return;
        }
        String encodedPath = intent.getData().getEncodedPath();
        DebugLogger.D5(logname, "File is = " + encodedPath + " sdCardDir is = " + Config.sdcardDir.toString());
        String str = Config.sdcardDir;
        StringBuilder sb = new StringBuilder();
        sb.append(encodedPath);
        sb.append("/");
        boolean zStartsWith = str.startsWith(sb.toString());
        boolean z = !intent.getAction().equals("android.intent.action.MEDIA_MOUNTED");
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Sending ");
        sb2.append(zStartsWith ? "SDCARD_CHANGED_EVENT" : "REMOVABLE_STORAGE_DEVICE_EVENT");
        sb2.append(" with removal = ");
        sb2.append(z);
        sb2.append(" path =\"");
        sb2.append(encodedPath);
        sb2.append("\"");
        DebugLogger.D3(logname, sb2.toString());
        AndroidGo androidGo = AndroidGo.getInstance();
        if (zStartsWith) {
            androidGo.callIgo("os.event.sdcard_changed", null, Boolean.valueOf(z));
        } else {
            androidGo.callIgo("os.event.removable_storage_device_changed", null, Boolean.valueOf(z), encodedPath);
        }
    }
}
