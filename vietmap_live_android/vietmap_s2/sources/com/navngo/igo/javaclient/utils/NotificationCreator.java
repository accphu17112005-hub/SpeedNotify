package com.navngo.igo.javaclient.utils;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;
import android.os.Build;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.R;
import com.navngo.igo.javaclient.receiver.ShutdownReceiver;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class NotificationCreator {
    public static final int STATUS_BAR_ICON_ID = R.drawable.sbicon;
    private static final String defaultChannelId = "igo_default_channel_id";
    private static final String defaultchannelDescription = "Default Channel";
    private static final String headsUpChannelId = "igo_heads_up_channel_id";
    private static final String headsUpchannelDescription = "Heads-up Channel";

    public static Notification create(Context context, String str, String str2, PendingIntent pendingIntent) {
        try {
            return createBuilder(context, str, str2, pendingIntent).build();
        } catch (Exception e) {
            DebugLogger.D1("NotificationCreator", "Could not create notification", e);
            return new Notification();
        }
    }

    public static Notification createWithProgressBar(Context context, String str, String str2, PendingIntent pendingIntent, int i, int i2) {
        try {
            return createBuilder(context, str, str2, pendingIntent).setProgress(i, i2, i <= i2).build();
        } catch (Exception e) {
            DebugLogger.D1("NotificationCreator", "Could not create notification", e);
            return new Notification();
        }
    }

    public static Notification createHeadsUpNotification(Context context, String str, PendingIntent pendingIntent) {
        try {
            Notification.Builder builderCreateBuilder = createBuilder(context, context.getString(R.string.app_name), str, pendingIntent);
            if (Build.VERSION.SDK_INT >= 26) {
                builderCreateBuilder.setChannelId(createNotificationChannel(headsUpChannelId, headsUpchannelDescription, 5));
            }
            return builderCreateBuilder.setPriority(2).setDefaults(1).build();
        } catch (Exception e) {
            DebugLogger.D1("NotificationCreator", "Could not create notification", e);
            return new Notification();
        }
    }

    public static Notification createForegroundNotification(Context context) {
        new ShutdownReceiver().register();
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setPackage(context.getPackageName());
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.addFlags(876609540);
        PendingIntent activity = PendingIntent.getActivity(context, 0, intent, 67108864);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, new Intent(ShutdownReceiver.SelfInitiatedShutdown), 335544320);
        try {
            Notification.Builder builderCreateBuilder = createBuilder(context, context.getString(R.string.app_name), Config.def_additional_assets, activity);
            String string = context.getString(R.string.exit);
            return (Build.VERSION.SDK_INT < 23 ? builderCreateBuilder.addAction(0, string, broadcast) : builderCreateBuilder.addAction(new Notification.Action.Builder((Icon) null, string, broadcast).build())).build();
        } catch (Exception e) {
            DebugLogger.D1("NotificationCreator", "Could not create notification", e);
            return new Notification();
        }
    }

    protected static Notification.Builder createBuilder(Context context, String str, String str2, PendingIntent pendingIntent) {
        DebugLogger.D5("NotificationCreator", "title: " + str + " --- content: " + str2);
        Notification.Builder contentIntent = new Notification.Builder(context).setContentTitle(str).setContentText(str2).setSmallIcon(STATUS_BAR_ICON_ID).setContentIntent(pendingIntent);
        return Build.VERSION.SDK_INT >= 26 ? contentIntent.setChannelId(createNotificationChannel(defaultChannelId, defaultchannelDescription, 2)) : contentIntent;
    }

    protected static String createNotificationChannel(String str, String str2, int i) {
        NotificationManager notificationManager = (NotificationManager) Application.anApplication.getSystemService("notification");
        if (notificationManager.getNotificationChannel(str) == null) {
            notificationManager.createNotificationChannel(new NotificationChannel(str, str2, i));
        }
        return str;
    }
}
