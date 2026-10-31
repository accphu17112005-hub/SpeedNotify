package com.navngo.igo.primo;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.Encryptor;
import com.navngo.igo.javaclient.IExternalResumeLogic;
import com.navngo.igo.javaclient.ResumeHandler;
import com.navngo.igo.javaclient.activityresulthandler.ContactPickerResultHandler;
import com.navngo.igo.javaclient.activityresulthandler.EditContactResultHandler;
import com.navngo.igo.javaclient.activityresulthandler.PicturePickerResultHandler;
import com.navngo.igo.javaclient.functors.MailSmsContacts;
import com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay;
import com.navngo.igo.javaclient.intentprocessers.HTCContactAddressProcesser;
import com.navngo.igo.javaclient.intentprocessers.OldFormatContactAddressProcesser;
import com.navngo.igo.javaclient.intentprocessers.ViewContactAddressProcesser;
import com.navngo.igo.javaclient.login.LoginActivity;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PrimoActivityGooglePlay extends IgoActivityGooglePlay {
    private static final String logname = "PrimoActivityGooglePlay";
    private SharedPreferences preferences;
    private boolean init_done = false;
    private boolean resumed = false;
    private final String SHARED_PREFERENCES_NAME = "PrimoServiceSharedPreferences";
    private final String PHONE_NUMBER = "phoneNumber";

    @Override // com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay
    protected byte[] getXorKey() {
        byte[] bArr = {-15, 72, -114, 93, 54, -18, -105, -33, -16, -103, 77, 89, 38, 34, -109, -97};
        for (int i = 0; i < 16; i++) {
            bArr[i] = (byte) ((bArr[i] * 5) + 4);
        }
        return bArr;
    }

    @Override // com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay, com.navngo.igo.javaclient.IgoActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) throws Throwable {
        DebugLogger.D4(logname, "onCreate");
        super.onCreate(bundle);
        ResumeHandler.INSTANCE.setExternalLogic(new IExternalResumeLogic() { // from class: com.navngo.igo.primo.PrimoActivityGooglePlay.1
            @Override // com.navngo.igo.javaclient.IExternalResumeLogic
            public boolean handleScreenOn() {
                return true;
            }

            @Override // com.navngo.igo.javaclient.IExternalResumeLogic
            public boolean resumeIgo() {
                return PrimoActivityGooglePlay.this.init_done;
            }

            @Override // com.navngo.igo.javaclient.IExternalResumeLogic
            public boolean pauseIgo() {
                return PrimoActivityGooglePlay.this.init_done;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isPhoneNumberSaved() {
        SharedPreferences sharedPreferences = getSharedPreferences("PrimoServiceSharedPreferences", 0);
        this.preferences = sharedPreferences;
        String strDecrypt = Encryptor.decrypt(sharedPreferences.getString("phoneNumber", Config.def_additional_assets));
        return (strDecrypt == null || strDecrypt.isEmpty()) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startLoginActivity() {
        startActivity(new Intent(this, (Class<?>) LoginActivity.class));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.navngo.igo.primo.PrimoActivityGooglePlay$2] */
    public void startDataInstall() {
        new Thread("DataInstallerThread") { // from class: com.navngo.igo.primo.PrimoActivityGooglePlay.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                Application.anApplication.onPermissionsGranted();
                PrimoActivityGooglePlay.this.runOnUiThread(new Runnable() { // from class: com.navngo.igo.primo.PrimoActivityGooglePlay.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        PrimoActivityGooglePlay.this.onPermissionsGranted();
                        PrimoActivityGooglePlay.this.init_done = true;
                        if (PrimoActivityGooglePlay.this.resumed) {
                            ResumeHandler.INSTANCE.resumeCalled();
                        }
                    }
                });
            }
        }.start();
        showLoadAnimation();
    }

    @Override // com.navngo.igo.javaclient.IgoActivity
    public void requestPermissions() {
        final List<String> criticalPermissions = PermissionHandler.get().getCriticalPermissions();
        List<String> optionalPermissions = PermissionHandler.get().getOptionalPermissions();
        ArrayList arrayList = new ArrayList(criticalPermissions);
        arrayList.addAll(optionalPermissions);
        PermissionHandler.get().requestPermissions(this, arrayList, new PermissionHandler.CallbackForMultiple() { // from class: com.navngo.igo.primo.PrimoActivityGooglePlay.3
            @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForMultiple
            public void onAllPermissionsGranted() {
                if (PrimoActivityGooglePlay.this.isPhoneNumberSaved()) {
                    PrimoActivityGooglePlay.this.startDataInstall();
                } else {
                    PrimoActivityGooglePlay.this.startLoginActivity();
                }
            }

            @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForMultiple
            public void onSomePermissionsDenied(Map<String, Integer> map) {
                for (Map.Entry<String, Integer> entry : map.entrySet()) {
                    String str = PrimoActivityGooglePlay.logname;
                    StringBuilder sb = new StringBuilder();
                    sb.append(entry.getKey());
                    sb.append(entry.getValue().intValue() == 0 ? " granted" : " denied");
                    DebugLogger.D3(str, sb.toString());
                    if (criticalPermissions.contains(entry.getKey())) {
                        DebugLogger.D3(PrimoActivityGooglePlay.logname, "critical permission is denied: Application.exit(true)");
                        Application.exit(true);
                    }
                }
            }
        });
    }

    @Override // com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay, com.navngo.igo.javaclient.IgoActivity
    public void onPermissionsGranted() {
        super.onPermissionsGranted();
        if (isFinishing()) {
            return;
        }
        addIntentProcesser(new ViewContactAddressProcesser(this));
        addIntentProcesser(new OldFormatContactAddressProcesser(this));
        addIntentProcesser(new HTCContactAddressProcesser());
        addActivityResultHandler(new ContactPickerResultHandler(this));
        addActivityResultHandler(new EditContactResultHandler(MailSmsContacts.INSTANCE));
        addActivityResultHandler(new PicturePickerResultHandler());
        startLoaderThread();
    }

    @Override // com.navngo.igo.javaclient.IgoActivity, android.app.Activity
    protected void onRestart() {
        super.onRestart();
        if (isPhoneNumberSaved()) {
            startDataInstall();
        } else {
            startLoginActivity();
        }
    }

    @Override // com.navngo.igo.javaclient.IgoActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        DebugLogger.D4(logname, "onResume called");
        this.resumed = true;
    }

    @Override // com.navngo.igo.javaclient.IgoActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
        DebugLogger.D4(logname, "onPause called");
        this.resumed = false;
    }

    @Override // com.navngo.igo.javaclient.googleplay.IgoActivityGooglePlay, com.navngo.igo.javaclient.IgoActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
    }

    @Override // com.navngo.igo.javaclient.IgoActivity
    protected void onLoadingFinished(boolean z) {
        super.onLoadingFinished(z);
    }
}
