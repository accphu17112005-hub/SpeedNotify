package com.navngo.igo.javaclient.login.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatImageView;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.login.LoginActivity;
import com.navngo.igo.javaclient.login.api.LoginApi;
import com.navngo.igo.javaclient.login.api.LoginError;
import com.navngo.igo.javaclient.login.api.LoginResponse;
import com.navngo.igo.javaclient.login.api.Observable;
import com.navngo.igo.javaclient.refprod.R;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class RegisterPhoneView extends PhoneFragment {
    private AppCompatImageView clearButton;
    private Button continueButton;
    private TextView errorMessage;
    private OnTextChangeListener inputChangeListener = new OnTextChangeListener() { // from class: com.navngo.igo.javaclient.login.fragments.RegisterPhoneView.1
        @Override // com.navngo.igo.javaclient.login.fragments.OnTextChangeListener
        public void onChange(CharSequence charSequence, int i) {
            RegisterPhoneView.this.continueButton.setEnabled(charSequence.length() == 10);
            LoginApi.getInstance().phone.setValue(charSequence.toString());
            LoginApi.getInstance().code.setValue(Config.def_additional_assets);
        }
    };
    private Observable.OnChangeListener<String> phoneChangeListener = new Observable.OnChangeListener<String>() { // from class: com.navngo.igo.javaclient.login.fragments.RegisterPhoneView.2
        @Override // com.navngo.igo.javaclient.login.api.Observable.OnChangeListener
        public void onChange(Observable<String> observable, String str) {
            RegisterPhoneView.this.phoneInput.setText(str);
        }
    };
    private EditText phoneInput;
    private View view;

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.fragment_register_phone, viewGroup, false);
        this.view = viewInflate;
        this.phoneInput = (EditText) viewInflate.findViewById(R.id.phoneInput);
        this.clearButton = (AppCompatImageView) this.view.findViewById(R.id.clearButton);
        this.errorMessage = (TextView) this.view.findViewById(R.id.errorMessage);
        this.continueButton = (Button) this.view.findViewById(R.id.continueButton);
        this.clearButton.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m8lambda$onCreateView$0$comnavngoigojavaclientloginfragmentsRegisterPhoneView(view);
            }
        });
        this.phoneInput.setOnFocusChangeListener(this.onFocusChangeListener);
        this.phoneInput.addTextChangedListener(this.inputChangeListener);
        this.continueButton.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m9lambda$onCreateView$1$comnavngoigojavaclientloginfragmentsRegisterPhoneView(view);
            }
        });
        return this.view;
    }

    /* JADX INFO: renamed from: lambda$onCreateView$0$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView, reason: not valid java name */
    /* synthetic */ void m8lambda$onCreateView$0$comnavngoigojavaclientloginfragmentsRegisterPhoneView(View view) {
        this.phoneInput.setText(Config.def_additional_assets);
        this.continueButton.setEnabled(false);
    }

    /* JADX INFO: renamed from: lambda$onCreateView$1$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView, reason: not valid java name */
    /* synthetic */ void m9lambda$onCreateView$1$comnavngoigojavaclientloginfragmentsRegisterPhoneView(View view) {
        sendPhoneRequest();
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        LoginApi.getInstance().phone.addAndExecuteOnChangeListener(this.phoneChangeListener);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        LoginApi.getInstance().phone.removeOnChangeListener(this.phoneChangeListener);
        super.onStop();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendPhoneRequest() {
        hideKeyboard(this.phoneInput);
        getLoginActivity().onProgressStart();
        LoginApi.getInstance().registerPhoneRequest(getContext(), new AnonymousClass3());
    }

    /* JADX INFO: renamed from: com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$3, reason: invalid class name */
    class AnonymousClass3 implements LoginResponse {
        AnonymousClass3() {
        }

        @Override // com.navngo.igo.javaclient.login.api.LoginResponse
        public void onSuccess() {
            LoginApi.getInstance().phone.postValue();
            RegisterPhoneView.this.getLoginActivity().onProgressDone();
            RegisterPhoneView.this.getLoginActivity().onPage(LoginActivity.State.VERIFY);
        }

        /* JADX INFO: renamed from: lambda$onError$0$com-navngo-igo-javaclient-login-fragments-RegisterPhoneView$3, reason: not valid java name */
        /* synthetic */ void m10lambda$onError$0$comnavngoigojavaclientloginfragmentsRegisterPhoneView$3(View view) {
            RegisterPhoneView.this.sendPhoneRequest();
        }

        @Override // com.navngo.igo.javaclient.login.api.LoginResponse
        public void onError(LoginError loginError) {
            RegisterPhoneView.this.getLoginActivity().onProgressError(loginError, new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.RegisterPhoneView$3$$ExternalSyntheticLambda0
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.f$0.m10lambda$onError$0$comnavngoigojavaclientloginfragmentsRegisterPhoneView$3(view);
                }
            });
        }
    }
}
