package com.navngo.igo.javaclient.login.fragments;

import android.os.Bundle;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.core.content.ContextCompat;
import androidx.core.view.ViewCompat;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.login.api.Counter;
import com.navngo.igo.javaclient.login.api.LoginApi;
import com.navngo.igo.javaclient.login.api.LoginError;
import com.navngo.igo.javaclient.login.api.LoginResponse;
import com.navngo.igo.javaclient.login.api.Observable;
import com.navngo.igo.javaclient.login.components.CodeItem;
import com.navngo.igo.javaclient.refprod.R;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class VerifyPhoneView extends PhoneFragment {
    private EditText codeInput;
    private LinearLayoutCompat codeList;
    private TextView descText;
    private TextView messageText;
    private Button sendButton;
    private View view;
    private CodeItem[] codeItems = new CodeItem[6];
    private OnTextChangeListener inputChangeListener = new OnTextChangeListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.1
        @Override // com.navngo.igo.javaclient.login.fragments.OnTextChangeListener
        public void onChange(CharSequence charSequence, int i) {
            int length = charSequence.length() - 1;
            if (i == 0) {
                VerifyPhoneView.this.codeItems[length].setCode(charSequence.charAt(length));
                VerifyPhoneView.this.codeItems[length].setCursor(false);
                if (length < 5) {
                    VerifyPhoneView.this.codeItems[length + 1].setCursor(true);
                }
            } else {
                int i2 = length + 1;
                VerifyPhoneView.this.codeItems[i2].clearCode();
                VerifyPhoneView.this.codeItems[i2].setCursor(true);
                if (length < 4) {
                    VerifyPhoneView.this.codeItems[length + 2].setCursor(false);
                }
            }
            VerifyPhoneView.this.sendButton.setEnabled(charSequence.length() == 6);
            LoginApi.getInstance().code.setValue(charSequence.toString());
        }
    };
    private Counter.OnCountListener countListener = new Counter.OnCountListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.4
        @Override // com.navngo.igo.javaclient.login.api.Counter.OnCountListener
        public void onCount(int i, boolean z) {
            if (z) {
                VerifyPhoneView.this.getLoginActivity().disableTitleBarOnBack();
                VerifyPhoneView.this.messageText.setTextColor(ContextCompat.getColor(VerifyPhoneView.this.getContext(), R.color.PrimaryText));
                VerifyPhoneView.this.messageText.setText(Html.fromHtml(VerifyPhoneView.this.getResources().getString(R.string.vm_countDownWarningOTP, VerifyPhoneView.this.countToMinSec(i))));
                return;
            }
            VerifyPhoneView.this.getLoginActivity().enableTitleBarOnBack();
            VerifyPhoneView.this.messageText.setTextColor(ContextCompat.getColor(VerifyPhoneView.this.getContext(), R.color.ActiveBlue));
            VerifyPhoneView.this.messageText.setText(R.string.vm_resendVerifierCode);
            LoginApi.getInstance().code.postValue(Config.def_additional_assets);
            VerifyPhoneView.this.sendButton.setEnabled(false);
            VerifyPhoneView verifyPhoneView = VerifyPhoneView.this;
            verifyPhoneView.hideKeyboard(verifyPhoneView.codeInput);
        }
    };
    private Observable.OnChangeListener<String> phoneChangeListener = new Observable.OnChangeListener<String>() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.5
        @Override // com.navngo.igo.javaclient.login.api.Observable.OnChangeListener
        public void onChange(Observable<String> observable, String str) {
            VerifyPhoneView.this.descText.setText(Html.fromHtml(VerifyPhoneView.this.getResources().getString(R.string.vm_descriptionOTP, "<b>+84" + str + "</b>")));
        }
    };
    private Observable.OnChangeListener<String> codeChangeListener = new Observable.OnChangeListener<String>() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView.6
        @Override // com.navngo.igo.javaclient.login.api.Observable.OnChangeListener
        public void onChange(Observable<String> observable, String str) {
            VerifyPhoneView.this.setCodeInputText(str);
            int iMin = Math.min(str.length(), VerifyPhoneView.this.codeItems.length);
            for (int i = 0; i < VerifyPhoneView.this.codeItems.length; i++) {
                if (i < iMin) {
                    VerifyPhoneView.this.codeItems[i].setCode(str.charAt(i));
                } else {
                    VerifyPhoneView.this.codeItems[i].clearCode();
                }
                VerifyPhoneView.this.codeItems[i].setCursor(false);
            }
            if (iMin < VerifyPhoneView.this.codeItems.length) {
                VerifyPhoneView.this.codeItems[iMin].setCursor(true);
            }
        }
    };

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.fragment_verify_phone, viewGroup, false);
        this.view = viewInflate;
        this.descText = (TextView) viewInflate.findViewById(R.id.descText);
        this.messageText = (TextView) this.view.findViewById(R.id.messageText);
        this.sendButton = (Button) this.view.findViewById(R.id.sendButton);
        this.codeInput = (EditText) this.view.findViewById(R.id.testInput);
        this.codeList = (LinearLayoutCompat) this.view.findViewById(R.id.codeList);
        this.codeItems[0] = (CodeItem) this.view.findViewById(R.id.codeItem_0);
        this.codeItems[1] = (CodeItem) this.view.findViewById(R.id.codeItem_1);
        this.codeItems[2] = (CodeItem) this.view.findViewById(R.id.codeItem_2);
        this.codeItems[3] = (CodeItem) this.view.findViewById(R.id.codeItem_3);
        this.codeItems[4] = (CodeItem) this.view.findViewById(R.id.codeItem_4);
        this.codeItems[5] = (CodeItem) this.view.findViewById(R.id.codeItem_5);
        this.codeItems[0].setCursor(true);
        this.codeInput.addTextChangedListener(this.inputChangeListener);
        this.codeInput.setOnFocusChangeListener(this.onFocusChangeListener);
        this.codeList.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m11lambda$onCreateView$0$comnavngoigojavaclientloginfragmentsVerifyPhoneView(view);
            }
        });
        this.sendButton.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m12lambda$onCreateView$1$comnavngoigojavaclientloginfragmentsVerifyPhoneView(view);
            }
        });
        this.messageText.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m13lambda$onCreateView$2$comnavngoigojavaclientloginfragmentsVerifyPhoneView(view);
            }
        });
        return this.view;
    }

    /* JADX INFO: renamed from: lambda$onCreateView$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView, reason: not valid java name */
    /* synthetic */ void m11lambda$onCreateView$0$comnavngoigojavaclientloginfragmentsVerifyPhoneView(View view) {
        if (LoginApi.getInstance().counter.isRunning()) {
            showKeyboard(this.codeInput);
        }
    }

    /* JADX INFO: renamed from: lambda$onCreateView$1$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView, reason: not valid java name */
    /* synthetic */ void m12lambda$onCreateView$1$comnavngoigojavaclientloginfragmentsVerifyPhoneView(View view) {
        sendVerifyRequest();
    }

    /* JADX INFO: renamed from: lambda$onCreateView$2$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView, reason: not valid java name */
    /* synthetic */ void m13lambda$onCreateView$2$comnavngoigojavaclientloginfragmentsVerifyPhoneView(View view) {
        if (LoginApi.getInstance().counter.isRunning()) {
            return;
        }
        sendPhoneRequest();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCodeInputText(String str) {
        this.codeInput.removeTextChangedListener(this.inputChangeListener);
        this.codeInput.setText(str);
        this.codeInput.addTextChangedListener(this.inputChangeListener);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        LoginApi.getInstance().counter.setOnCountListener(this.countListener);
        LoginApi.getInstance().phone.addAndExecuteOnChangeListener(this.phoneChangeListener);
        LoginApi.getInstance().code.addAndExecuteOnChangeListener(this.codeChangeListener);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        LoginApi.getInstance().phone.removeOnChangeListener(this.phoneChangeListener);
        LoginApi.getInstance().code.removeOnChangeListener(this.codeChangeListener);
        LoginApi.getInstance().counter.unsetOnCountListener();
        super.onStop();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendVerifyRequest() {
        hideKeyboard(this.codeInput);
        getLoginActivity().onProgressStart();
        LoginApi.getInstance().verifyPhoneRequest(getContext(), new AnonymousClass2());
    }

    /* JADX INFO: renamed from: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$2, reason: invalid class name */
    class AnonymousClass2 implements LoginResponse {
        AnonymousClass2() {
        }

        @Override // com.navngo.igo.javaclient.login.api.LoginResponse
        public void onSuccess() {
            VerifyPhoneView.this.getLoginActivity().onProgressDone();
            VerifyPhoneView.this.getLoginActivity().onLoginSuccess(LoginApi.getInstance().phone.getValue(), LoginApi.getInstance().token.getValue());
        }

        @Override // com.navngo.igo.javaclient.login.api.LoginResponse
        public void onError(LoginError loginError) {
            if (loginError.tag.equals("022")) {
                VerifyPhoneView.this.getLoginActivity().onProgressBlock(loginError);
            } else {
                VerifyPhoneView.this.getLoginActivity().onProgressError(loginError, new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$2$$ExternalSyntheticLambda0
                    @Override // android.view.View.OnClickListener
                    public final void onClick(View view) {
                        this.f$0.m14lambda$onError$0$comnavngoigojavaclientloginfragmentsVerifyPhoneView$2(view);
                    }
                });
            }
        }

        /* JADX INFO: renamed from: lambda$onError$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView$2, reason: not valid java name */
        /* synthetic */ void m14lambda$onError$0$comnavngoigojavaclientloginfragmentsVerifyPhoneView$2(View view) {
            VerifyPhoneView.this.sendVerifyRequest();
        }
    }

    /* JADX INFO: renamed from: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$3, reason: invalid class name */
    class AnonymousClass3 implements LoginResponse {
        AnonymousClass3() {
        }

        @Override // com.navngo.igo.javaclient.login.api.LoginResponse
        public void onSuccess() {
            VerifyPhoneView.this.getLoginActivity().onProgressDone();
        }

        /* JADX INFO: renamed from: lambda$onError$0$com-navngo-igo-javaclient-login-fragments-VerifyPhoneView$3, reason: not valid java name */
        /* synthetic */ void m15lambda$onError$0$comnavngoigojavaclientloginfragmentsVerifyPhoneView$3(View view) {
            VerifyPhoneView.this.sendPhoneRequest();
        }

        @Override // com.navngo.igo.javaclient.login.api.LoginResponse
        public void onError(LoginError loginError) {
            VerifyPhoneView.this.getLoginActivity().onProgressError(loginError, new View.OnClickListener() { // from class: com.navngo.igo.javaclient.login.fragments.VerifyPhoneView$3$$ExternalSyntheticLambda0
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    this.f$0.m15lambda$onError$0$comnavngoigojavaclientloginfragmentsVerifyPhoneView$3(view);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendPhoneRequest() {
        getLoginActivity().onProgressStart();
        LoginApi.getInstance().registerPhoneRequest(getContext(), new AnonymousClass3());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String countToMinSec(int i) {
        String string;
        String string2;
        int i2 = i % 60;
        int i3 = (i / 60) % 60;
        if (i2 < 10) {
            string = "0" + i2;
        } else {
            string = Integer.toString(i2);
        }
        if (i3 < 10) {
            string2 = "0" + i3;
        } else {
            string2 = Integer.toString(i3);
        }
        return "<font color=" + String.format("#%06X", Integer.valueOf(ContextCompat.getColor(getContext(), R.color.ActiveBlue) & ViewCompat.MEASURED_SIZE_MASK)) + ">" + string2 + ":" + string + "</font>";
    }
}
