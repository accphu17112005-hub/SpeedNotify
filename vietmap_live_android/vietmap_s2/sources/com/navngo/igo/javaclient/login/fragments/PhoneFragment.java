package com.navngo.igo.javaclient.login.fragments;

import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import androidx.fragment.app.Fragment;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.login.LoginActivity;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PhoneFragment extends Fragment {
    private final int minDelta = NNG.NNG_ENGINE_RESTARTING;
    private long focusTime = 0;
    private View focusTarget = null;
    protected View.OnFocusChangeListener onFocusChangeListener = new View.OnFocusChangeListener() { // from class: com.navngo.igo.javaclient.login.fragments.PhoneFragment.1
        @Override // android.view.View.OnFocusChangeListener
        public void onFocusChange(View view, boolean z) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            long j = jCurrentTimeMillis - PhoneFragment.this.focusTime;
            if (z) {
                if (j > 300) {
                    PhoneFragment.this.focusTime = jCurrentTimeMillis;
                    PhoneFragment.this.focusTarget = view;
                    return;
                }
                return;
            }
            if (j > 300 || view != PhoneFragment.this.focusTarget) {
                return;
            }
            PhoneFragment.this.focusTarget.post(new Runnable() { // from class: com.navngo.igo.javaclient.login.fragments.PhoneFragment.1.1
                @Override // java.lang.Runnable
                public void run() {
                    PhoneFragment.this.focusTarget.requestFocus();
                }
            });
        }
    };

    protected LoginActivity getLoginActivity() {
        return (LoginActivity) getActivity();
    }

    protected void showKeyboard(EditText editText) {
        editText.requestFocus();
        ((InputMethodManager) getActivity().getSystemService("input_method")).showSoftInput(editText, 2);
    }

    protected void hideKeyboard(EditText editText) {
        editText.clearFocus();
        ((InputMethodManager) getActivity().getSystemService("input_method")).hideSoftInputFromWindow(editText.getWindowToken(), 0);
        editText.setOnFocusChangeListener(null);
    }
}
