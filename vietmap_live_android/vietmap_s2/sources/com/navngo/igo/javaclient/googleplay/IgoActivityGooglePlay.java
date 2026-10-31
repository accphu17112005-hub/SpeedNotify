package com.navngo.igo.javaclient.googleplay;

import android.app.ProgressDialog;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.provider.Settings;
import android.widget.Toast;
import com.google.android.vending.licensing.AESObfuscator;
import com.google.android.vending.licensing.LicenseChecker;
import com.google.android.vending.licensing.LicenseCheckerCallback;
import com.google.android.vending.licensing.Policy;
import com.google.android.vending.licensing.ServerManagedPolicy;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.IgoActivity;
import com.navngo.igo.javaclient.R;
import java.io.File;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class IgoActivityGooglePlay extends IgoActivity {
    public static final int CONNECT_TO_INTERNET = 2;
    private static final String Logname = "IgoActivityGooglePlay";
    public static final int NOT_LICENSED = 1;
    public static final int UNKNOWN = 0;
    private Handler mHandler;
    private LicenseChecker mLicenseChecker;
    private LicenseCheckerCallback mLicenseCheckerCallback;
    private boolean mStartPrimoCalled;
    private ProgressDialog progressDialog = null;
    byte[] mSalt = {-17, 110, 37, 11, 63, 90, -95, 25, -110, -14, -127, -125, 126, 50, -99, 25, -7, -60, 25, -113};

    protected abstract byte[] getXorKey();

    @Override // com.navngo.igo.javaclient.IgoActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) throws Throwable {
        super.onCreate(bundle);
        if (isFinishing()) {
            return;
        }
        requestWindowFeature(2);
        requestWindowFeature(5);
    }

    @Override // com.navngo.igo.javaclient.IgoActivity
    protected void onPermissionsGranted() {
        super.onPermissionsGranted();
        if (isFinishing()) {
            return;
        }
        this.mStartPrimoCalled = false;
        StringBuilder sb = new StringBuilder(Settings.Secure.getString(getContentResolver(), "android_id") + Build.MODEL + Build.MANUFACTURER);
        int i = 0;
        while (true) {
            byte[] bArr = this.mSalt;
            if (i >= bArr.length) {
                break;
            }
            bArr[i] = (byte) (bArr[i] ^ ((byte) sb.charAt(i % sb.length())));
            i++;
        }
        if (Config.publicKeyDecodeNeeded) {
            byte[] xorKey = getXorKey();
            for (int i2 = 0; i2 < Config.playStorePublicKey.length; i2++) {
                byte[] bArr2 = Config.playStorePublicKey;
                bArr2[i2] = (byte) (bArr2[i2] ^ xorKey[i2 % xorKey.length]);
            }
            Config.publicKeyDecodeNeeded = false;
        }
        this.mHandler = new Handler();
        this.mLicenseCheckerCallback = new PlayLicenseCheckerCallback();
        setLicenseChecker(sb.toString());
    }

    protected void setLicenseChecker(String str) {
        LicenseChecker licenseChecker = new LicenseChecker(this, new ServerManagedPolicy(this, new AESObfuscator(this.mSalt, getPackageName(), str)), new String(Config.playStorePublicKey));
        this.mLicenseChecker = licenseChecker;
        licenseChecker.checkAccess(this.mLicenseCheckerCallback);
    }

    @Override // com.navngo.igo.javaclient.IgoActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
    }

    @Override // com.navngo.igo.javaclient.IgoActivity
    protected void showLoadAnimation() {
        this.progressDialog = new ProgressDialog(this);
        String string = getResources().getString(R.string.loading_motonav);
        DebugLogger.D5(Logname, "showLoadAnimation: " + string);
        this.progressDialog.setMessage(string);
        this.progressDialog.setIndeterminate(true);
        this.progressDialog.setCancelable(false);
        this.progressDialog.show();
    }

    @Override // com.navngo.igo.javaclient.IgoActivity
    public void hideLoadAnimation() {
        ProgressDialog progressDialog = this.progressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
            this.progressDialog = null;
        }
    }

    protected void startPrimo() {
        DebugLogger.D5(Logname, "startPrimo()");
        if (this.mStartPrimoCalled) {
            return;
        }
        this.mStartPrimoCalled = true;
        runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.1
            @Override // java.lang.Runnable
            public void run() {
                IgoActivityGooglePlay.this.showLoadAnimation();
                IgoActivityGooglePlay.this.startLoaderThread();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void playAllow() {
        this.mHandler.post(new Runnable() { // from class: com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.2
            @Override // java.lang.Runnable
            public void run() {
                IgoActivityGooglePlay.this.startPrimo();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void playDontAllow(int i) {
        if (i == 1 || i == 2) {
            final IgoActivity igoActivity = Application.getIgoActivity();
            final int i2 = i == 1 ? R.string.not_licensed : R.string.connect_to_internet;
            igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.3
                @Override // java.lang.Runnable
                public void run() {
                    Toast.makeText(igoActivity, i2, 1).show();
                }
            });
            try {
                Thread.sleep(5000L);
            } catch (InterruptedException unused) {
            }
        }
        this.mHandler.post(new Runnable() { // from class: com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay.4
            @Override // java.lang.Runnable
            public void run() {
                IgoActivityGooglePlay.this.finish();
            }
        });
    }

    private class PlayLicenseCheckerCallback implements LicenseCheckerCallback {
        private PlayLicenseCheckerCallback() {
        }

        @Override // com.google.android.vending.licensing.LicenseCheckerCallback
        public void allow(int i) {
            if (i == 256) {
                IgoActivityGooglePlay.this.playAllow();
            } else if (i == 291) {
                IgoActivityGooglePlay.this.playAllow();
            } else {
                IgoActivityGooglePlay.this.playDontAllow(0);
            }
        }

        @Override // com.google.android.vending.licensing.LicenseCheckerCallback
        public void dontAllow(int i) {
            if (i == 561) {
                IgoActivityGooglePlay.this.playDontAllow(1);
            } else if (i == 291) {
                IgoActivityGooglePlay.this.playDontAllow(2);
            } else {
                IgoActivityGooglePlay.this.playDontAllow(0);
            }
        }

        @Override // com.google.android.vending.licensing.LicenseCheckerCallback
        public void applicationError(int i) {
            String str;
            switch (i) {
                case 1:
                    str = "ERROR_INVALID_PACKAGE_NAME";
                    break;
                case 2:
                    str = "ERROR_NON_MATCHING_UID";
                    break;
                case 3:
                    str = "ERROR_NOT_MARKET_MANAGED";
                    break;
                case 4:
                    str = "ERROR_CHECK_IN_PROGRESS";
                    break;
                case 5:
                    str = "ERROR_INVALID_PUBLIC_KEY";
                    break;
                case 6:
                    str = "ERROR_MISSING_PERMISSION";
                    break;
                default:
                    str = "unknown error";
                    break;
            }
            DebugLogger.D5(IgoActivityGooglePlay.Logname, String.format("response: application error %d: %s", Integer.valueOf(i), str));
            dontAllow(Policy.NOT_LICENSED);
        }
    }

    public void clearDownloadDatabase() {
        File parentFile = getCacheDir().getParentFile();
        if (parentFile == null || !parentFile.exists()) {
            return;
        }
        File file = new File(parentFile, "databases");
        if (file.exists()) {
            if (new File(file, "DownloadsDB").delete()) {
                DebugLogger.D3(Logname, "clearDownloadDatabase() " + file.getAbsolutePath() + "/DownloadsDB deleted");
            }
            if (new File(file, "DownloadsDB-journal").delete()) {
                DebugLogger.D3(Logname, "clearDownloadDatabase() " + file.getAbsolutePath() + "/DownloadsDB-journal deleted");
            }
        }
    }
}
