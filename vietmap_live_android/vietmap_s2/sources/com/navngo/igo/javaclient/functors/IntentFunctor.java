package com.navngo.igo.javaclient.functors;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IntentFunctor implements IFunctorCollection {
    private static final String logname = "IntentFunctor";
    private Context mContext = Application.anApplication.getApplicationContext();

    public void sendBroadcast(String str) {
        DebugLogger.D3(logname, "sendBroadcast sent " + str);
        this.mContext.sendBroadcast(new Intent(str));
    }

    public void sendBroadcastWithExtra(String str, String str2, String str3) {
        DebugLogger.D3(logname, "sendBroadcastWithExtra sent " + str + " with extra:" + str3);
        Intent intent = new Intent(str);
        intent.putExtra(str2, str3);
        this.mContext.sendBroadcast(intent);
    }

    public void startAction(String str) {
        DebugLogger.D3(logname, "startAction started: " + str);
        launchActivity(new Intent(str));
    }

    public void startActivity(String str) {
        DebugLogger.D3(logname, "startActivity started: " + str);
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.setComponent(ComponentName.unflattenFromString(str));
        launchActivity(intent);
    }

    public void launchApplication() {
        DebugLogger.D3(logname, "launchApplication");
        String string = Config.getString("android", "package_to_launch", null);
        if (string != null) {
            launchApplicationWithPackageName(string);
        }
    }

    public void launchApplicationWithPackageName(String str) {
        launchActivity(this.mContext.getPackageManager().getLaunchIntentForPackage(str));
        DebugLogger.D3(logname, "App started with package name: " + str);
    }

    private void launchActivity(Intent intent) {
        try {
            intent.addFlags(268435456);
            this.mContext.startActivity(intent);
        } catch (Exception e) {
            DebugLogger.D3(logname, "exception: " + e.toString());
        }
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.intent.send_broadcast", this, "sendBroadcast");
        androidGo.registerFunctor("android.intent.send_broadcast_with_extra", this, "sendBroadcastWithExtra");
        androidGo.registerFunctor("android.intent.start_action", this, "startAction");
        androidGo.registerFunctor("android.intent.start_activity", this, "startActivity");
        androidGo.registerFunctor("android.simple_start_intent", this, "startActivity");
        androidGo.registerFunctor("android.intent.launch_application", this, "launchApplication");
        DebugLogger.D3(logname, "android.simple_start_intent registered");
    }
}
