package com.navngo.igo.javaclient.permission;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.ServerRunner;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PermissionHandler {
    private static volatile PermissionHandler INSTANCE;
    private static int requestCode;
    private HashMap<Integer, CallbackForMultiple> multipleCallbacks = new HashMap<>();
    private HashMap<Integer, CallbackForOne> callbacks = new HashMap<>();

    public interface CallbackForMultiple {
        void onAllPermissionsGranted();

        void onSomePermissionsDenied(Map<String, Integer> map);
    }

    public interface CallbackForOne {
        void onPermissionDenied();

        void onPermissionGranted();
    }

    private PermissionHandler() {
    }

    public static PermissionHandler get() {
        if (INSTANCE == null) {
            synchronized (PermissionHandler.class) {
                if (INSTANCE == null) {
                    INSTANCE = new PermissionHandler();
                }
            }
        }
        return INSTANCE;
    }

    public void requestPermissions(Activity activity, List<String> list, CallbackForMultiple callbackForMultiple) {
        this.multipleCallbacks.put(Integer.valueOf(requestCode), callbackForMultiple);
        filterPermissions(activity.getApplicationContext(), list);
        if (list.size() > 0) {
            ActivityCompat.requestPermissions(activity, (String[]) list.toArray(new String[0]), requestCode);
            requestCode++;
        } else {
            callbackForMultiple.onAllPermissionsGranted();
        }
    }

    public void requestPermission(Activity activity, String str, CallbackForOne callbackForOne) {
        this.callbacks.put(Integer.valueOf(requestCode), callbackForOne);
        if (ContextCompat.checkSelfPermission(activity.getApplicationContext(), str) != 0) {
            ActivityCompat.requestPermissions(activity, new String[]{str}, requestCode);
            requestCode++;
        } else {
            callbackForOne.onPermissionGranted();
        }
    }

    public boolean isPermissionGranted(String str) {
        return ContextCompat.checkSelfPermission(Application.anApplication.getApplicationContext(), str) == 0;
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (this.callbacks.containsKey(Integer.valueOf(i))) {
            if (isAllGranted(iArr)) {
                this.callbacks.get(Integer.valueOf(i)).onPermissionGranted();
            } else {
                this.callbacks.get(Integer.valueOf(i)).onPermissionDenied();
            }
            this.callbacks.remove(Integer.valueOf(i));
            return;
        }
        if (this.multipleCallbacks.containsKey(Integer.valueOf(i))) {
            if (isAllGranted(iArr)) {
                this.multipleCallbacks.get(Integer.valueOf(i)).onAllPermissionsGranted();
            } else {
                HashMap map = new HashMap();
                for (int i2 = 0; i2 < strArr.length; i2++) {
                    map.put(strArr[i2], Integer.valueOf(iArr[i2]));
                }
                this.multipleCallbacks.get(Integer.valueOf(i)).onSomePermissionsDenied(map);
            }
            this.multipleCallbacks.remove(Integer.valueOf(i));
        }
    }

    public List<String> getCriticalPermissions() {
        ArrayList arrayList = new ArrayList();
        arrayList.add("android.permission.ACCESS_FINE_LOCATION");
        if (Build.VERSION.SDK_INT >= 31) {
            arrayList.add("android.permission.ACCESS_COARSE_LOCATION");
        }
        if ("imei".equalsIgnoreCase(ServerRunner.getLockedTo())) {
            arrayList.add("android.permission.READ_PHONE_STATE");
        }
        arrayList.add("android.permission.WRITE_EXTERNAL_STORAGE");
        return arrayList;
    }

    public List<String> getOptionalPermissions() {
        return new ArrayList();
    }

    private void filterPermissions(Context context, List<String> list) {
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            if (ContextCompat.checkSelfPermission(context, it.next()) == 0) {
                it.remove();
            }
        }
    }

    private boolean isAllGranted(int[] iArr) {
        if (iArr.length == 0) {
            return false;
        }
        for (int i : iArr) {
            if (i == -1) {
                return false;
            }
        }
        return true;
    }
}
