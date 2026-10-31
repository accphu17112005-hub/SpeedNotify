package com.navngo.igo.javaclient.login;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.provider.Settings;
import android.view.View;
import androidx.fragment.app.FragmentActivity;
import androidx.viewpager2.adapter.FragmentStateAdapter;
import androidx.viewpager2.widget.ViewPager2;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.Encryptor;
import com.navngo.igo.javaclient.locking.ManufacturerIDProvider;
import com.navngo.igo.javaclient.login.api.LoginError;
import com.navngo.igo.javaclient.login.components.ProgressCover;
import com.navngo.igo.javaclient.login.components.TitleBar;
import com.navngo.igo.javaclient.refprod.R;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LoginActivity extends FragmentActivity {
    private FragmentStateAdapter pagerAdapter;
    private SharedPreferences preferences;
    private ProgressCover progressCover;
    private TitleBar titleBar;
    private ViewPager2 viewPager;
    private final String logname = "LoginActivity";
    private final String SHARED_PREFERENCES_NAME = "PrimoServiceSharedPreferences";
    private final String PHONE_NUMBER = "phoneNumber";
    private final String TOKEN = "token";

    public enum State {
        REGISTER,
        VERIFY
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_login);
        DebugLogger.D3("LoginActivity", "onCreate");
        SharedPreferences sharedPreferences = getSharedPreferences("PrimoServiceSharedPreferences", 0);
        this.preferences = sharedPreferences;
        Encryptor.decrypt(sharedPreferences.getString("phoneNumber", Config.def_additional_assets));
        ViewPager2 viewPager2 = (ViewPager2) findViewById(R.id.pager);
        this.viewPager = viewPager2;
        viewPager2.setUserInputEnabled(false);
        CustomPagerAdapter customPagerAdapter = new CustomPagerAdapter(this);
        this.pagerAdapter = customPagerAdapter;
        this.viewPager.setAdapter(customPagerAdapter);
        this.viewPager.setPageTransformer(new ZoomOutPageTransformer());
        this.titleBar = (TitleBar) findViewById(R.id.titleBar);
        this.progressCover = (ProgressCover) findViewById(R.id.progressCover);
        setUpTitleBar(R.string.vm_loginSDTPlaceHolder);
    }

    public void setUpTitleBar(int i) {
        this.titleBar.setTitle(i);
        this.titleBar.clearOnBack();
    }

    public void setUpTitleBar(int i, View.OnClickListener onClickListener) {
        this.titleBar.setTitle(i);
        this.titleBar.setOnBack(onClickListener);
    }

    public void disableTitleBarOnBack() {
        this.titleBar.disableOnBack();
    }

    public void enableTitleBarOnBack() {
        this.titleBar.enableOnBack();
    }

    public void onProgressStart() {
        this.progressCover.onProgress();
    }

    public void onProgressDone() {
        this.progressCover.onDone();
    }

    public void onProgressError(LoginError loginError, View.OnClickListener onClickListener) {
        this.progressCover.onError(loginError, onClickListener);
    }

    public void onProgressBlock(LoginError loginError) {
        this.progressCover.onError(loginError, new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.LoginActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Application application = Application.anApplication;
                Application.exit(true);
            }
        });
    }

    public void onPage(State state) {
        if (state.equals(State.REGISTER)) {
            setUpTitleBar(R.string.vm_loginSDTPlaceHolder);
            this.viewPager.setCurrentItem(0);
        } else if (state.equals(State.VERIFY)) {
            setUpTitleBar(R.string.vm_verifyPhoneNumber, new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.LoginActivity.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    LoginActivity.this.onBackPressed();
                }
            });
            this.viewPager.setCurrentItem(1);
        }
    }

    public void onLoginSuccess(String str, String str2) {
        DebugLogger.D3("LoginActivity", "onLoginSuccess");
        SharedPreferences.Editor editorEdit = this.preferences.edit();
        String strEncrypt = Encryptor.encrypt(str);
        String strEncrypt2 = Encryptor.encrypt(str2);
        editorEdit.putString("phoneNumber", strEncrypt);
        editorEdit.putString("token", strEncrypt2);
        editorEdit.commit();
        String string = Settings.Secure.getString(Application.anApplication.getContentResolver(), "android_id");
        ManufacturerIDProvider.getInstace().setID(string + "+" + str);
        finish();
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        if (this.titleBar.isBackEnabled()) {
            if (this.viewPager.getCurrentItem() == 0) {
                super.onBackPressed();
                Application application = Application.anApplication;
                Application.exit(true);
            } else {
                setUpTitleBar(R.string.vm_loginSDTPlaceHolder);
                this.viewPager.setCurrentItem(0);
            }
        }
    }
}
