package com.navngo.igo.javaclient.activityresulthandler;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import androidx.exifinterface.media.ExifInterface;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.GCoor;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PicturePickerResultHandler implements IActivityResultHandler {
    public static final int REQUEST_CODE = 23563;
    private static final String logname = "PicturePickerResultHandler";

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public int getHandledRequestCode() {
        return REQUEST_CODE;
    }

    private enum Result {
        ERR_NO_ERROR(0),
        ERR_SOURCE_UNAVAILABLE(1),
        ERR_USER_CANCELLED(2),
        ERR_NO_LOCATION_INFO(3),
        ERR_ACCESS_DENIED(4);

        public final int value;

        Result(int i) {
            this.value = i;
        }
    }

    public PicturePickerResultHandler() {
        registerFunctors();
    }

    private void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("android.openPicturePicker", this, "openPicturePicker");
    }

    public void openPicturePicker() {
        DebugLogger.D3(logname, "openPicturePicker");
        if (Build.VERSION.SDK_INT >= 29) {
            DebugLogger.D3(logname, "requesting ACCESS_MEDIA_LOCATION permission...");
            PermissionHandler.get().requestPermission(Application.getIgoActivity(), "android.permission.ACCESS_MEDIA_LOCATION", new PermissionHandler.CallbackForOne() { // from class: com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler.1
                @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForOne
                public void onPermissionGranted() {
                    DebugLogger.D3(PicturePickerResultHandler.logname, "ACCESS_MEDIA_LOCATION permission is granted");
                    PicturePickerResultHandler.this.openPicturePickerInternal();
                }

                @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForOne
                public void onPermissionDenied() {
                    DebugLogger.D3(PicturePickerResultHandler.logname, "ACCESS_MEDIA_LOCATION permission was denied");
                    PicturePickerResultHandler.this.openPicturePickerInternal();
                }
            });
        } else {
            openPicturePickerInternal();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openPicturePickerInternal() {
        DebugLogger.D3(logname, "openPicturePickerInternal");
        Intent intent = new Intent("android.intent.action.PICK");
        intent.setType("image/*");
        Application.getIgoActivity().startActivityForResult(intent, REQUEST_CODE);
    }

    private InputStream getInputStreamFromURI(Context context, Uri uri) {
        try {
            return context.getContentResolver().openInputStream(uri);
        } catch (FileNotFoundException unused) {
            return null;
        }
    }

    @Override // com.navngo.igo.javaclient.activityresulthandler.IActivityResultHandler
    public void handleActivityResult(int i, Intent intent) {
        double[] latLong;
        GCoor gCoor = new GCoor();
        if (i == 0) {
            AndroidGo.getInstance().callIgo("other.picture_navigation.select_picture_from_android", null, gCoor, Integer.valueOf(Result.ERR_USER_CANCELLED.value));
            return;
        }
        if (-1 != i) {
            AndroidGo.getInstance().callIgo("other.picture_navigation.select_picture_from_android", null, gCoor, Integer.valueOf(Result.ERR_SOURCE_UNAVAILABLE.value));
            return;
        }
        try {
            InputStream inputStreamFromURI = getInputStreamFromURI(Application.getIgoActivity(), intent.getData());
            if (inputStreamFromURI != null) {
                try {
                    latLong = new ExifInterface(inputStreamFromURI).getLatLong();
                    inputStreamFromURI.close();
                } catch (Throwable th) {
                    inputStreamFromURI.close();
                    throw th;
                }
            } else {
                latLong = null;
            }
            if (latLong != null) {
                GCoor gCoor2 = new GCoor(latLong[0], latLong[1]);
                DebugLogger.D3(logname, "handleActivityResult(): coordinates in image: " + gCoor2);
                AndroidGo.getInstance().callIgo("other.picture_navigation.select_picture_from_android", null, gCoor2, Integer.valueOf(Result.ERR_NO_ERROR.value));
                return;
            }
            DebugLogger.D3(logname, "handleActivityResult(): getLatLong() returned null");
            AndroidGo.getInstance().callIgo("other.picture_navigation.select_picture_from_android", null, gCoor, Integer.valueOf(Result.ERR_NO_LOCATION_INFO.value));
        } catch (IOException e) {
            DebugLogger.D3(logname, "handleActivityResult(): IOException, message: " + e.getMessage());
        }
    }
}
