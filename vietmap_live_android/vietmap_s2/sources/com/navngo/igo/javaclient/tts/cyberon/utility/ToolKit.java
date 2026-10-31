package com.navngo.igo.javaclient.tts.cyberon.utility;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import com.navngo.igo.javaclient.NNG;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ToolKit {
    private static final String LOG_TAG = "ToolKit";
    private static int nOSVer = Integer.MAX_VALUE;

    public static final int getOSVer() {
        int iIntValue = Integer.MAX_VALUE;
        if (nOSVer == Integer.MAX_VALUE) {
            try {
                try {
                    iIntValue = Build.VERSION.class.getDeclaredField("SDK_INT").getInt(null);
                } catch (Exception unused) {
                    iIntValue = Integer.valueOf(Build.VERSION.SDK).intValue();
                }
            } catch (Exception unused2) {
                Log.w(LOG_TAG, "Build.VERSION.SDK = " + Build.VERSION.SDK + " is not integer.");
            }
            switch (iIntValue) {
                case 1:
                    nOSVer = 100;
                    break;
                case 2:
                    nOSVer = 110;
                    break;
                case 3:
                    nOSVer = 150;
                    break;
                case 4:
                    nOSVer = 160;
                    break;
                case 5:
                    nOSVer = 200;
                    break;
                case 6:
                    nOSVer = 201;
                    break;
                case 7:
                    nOSVer = 210;
                    break;
                case 8:
                    nOSVer = 220;
                    break;
                case 9:
                    nOSVer = 230;
                    break;
                case 10:
                    nOSVer = 233;
                    break;
                case 11:
                    nOSVer = NNG.NNG_ENGINE_RESTARTING;
                    break;
                case 12:
                    nOSVer = 310;
                    break;
                case 13:
                    nOSVer = 320;
                    break;
                case 14:
                    nOSVer = NNG.NNG_ENGINE_JUSTENTERINGMAINLOOP;
                    break;
                case 15:
                    nOSVer = 403;
                    break;
                case 16:
                    nOSVer = 410;
                    break;
                case 17:
                    nOSVer = 420;
                    break;
                default:
                    Log.w(LOG_TAG, "Newer SDK version: " + iIntValue);
                    break;
            }
        }
        return nOSVer;
    }

    public static String getNativeLibPath(Context context) {
        String str = context.getApplicationInfo().dataDir + "/lib";
        try {
            if (getOSVer() < 230) {
                return str;
            }
            return Class.forName("android.content.pm.ApplicationInfo").getDeclaredField("nativeLibraryDir").get(context.getApplicationInfo()).toString();
        } catch (Exception unused) {
            return str;
        }
    }

    public static void sleep(int i) {
        try {
            Thread.sleep(i);
        } catch (Exception e) {
            Log.e(LOG_TAG, e.toString());
        }
    }
}
