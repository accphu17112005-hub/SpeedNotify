package com.navngo.igo.javaclient;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import java.util.Timer;
import java.util.TimerTask;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class WarnerBrothers extends Activity {
    public static final String ACTION_CLEAR = "com.navngo.igo.javaclient.WarnerBrothers.CLEAR";
    public static final String ACTION_DEFAULT = "com.navngo.igo.javaclient.WarnerBrothers.DEFAULT";
    private static final String logname = "WarnerBrothers";
    final WarnerBrothers myself = this;
    private int mClientId = 0;
    private String mIntentStr = Config.def_additional_assets;
    private Timer mTimeoutTimer = null;
    private Button[] mButtons = {null, null, null};
    View.OnClickListener myClickListener = new View.OnClickListener() { // from class: com.navngo.igo.javaclient.WarnerBrothers.1
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            int i;
            int i2 = 0;
            while (true) {
                i = 1;
                if (i2 >= 3) {
                    break;
                }
                if (view.equals(WarnerBrothers.this.mButtons[i2])) {
                    i = 1 + i2;
                    break;
                }
                i2++;
            }
            if (WarnerBrothers.this.mTimeoutTimer != null) {
                WarnerBrothers.this.mTimeoutTimer.cancel();
                WarnerBrothers.this.mTimeoutTimer = null;
            }
            WarnerBrothers.this.informClient(i);
            WarnerBrothers.this.myself.finish();
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    public void informClient(int i) {
        if (this.mClientId == 0 || this.mIntentStr.equals(Config.def_additional_assets)) {
            return;
        }
        DebugLogger.D4(logname, "onClick clientId=" + this.mClientId + " intentStr=" + this.mIntentStr + " id=" + i);
        Intent intent = new Intent(this.mIntentStr);
        intent.putExtra("ClientId", this.mClientId);
        intent.putExtra("Button", i);
        sendBroadcast(intent);
        this.mClientId = 0;
        this.mIntentStr = Config.def_additional_assets;
    }

    private boolean setOnClickListener() {
        this.mButtons[0] = (Button) findViewById(R.id.warner_button1);
        boolean z = true;
        this.mButtons[1] = (Button) findViewById(R.id.warner_button2);
        this.mButtons[2] = (Button) findViewById(R.id.warner_button3);
        for (int i = 0; i < 3; i++) {
            Button[] buttonArr = this.mButtons;
            if (buttonArr[i] != null) {
                buttonArr[i].setOnClickListener(this.myClickListener);
            } else {
                z = false;
            }
        }
        return z;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        DebugLogger.D4(logname, "onCreate");
        processIntent(getIntent(), true);
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        processIntent(intent, false);
    }

    private String getButtonLabelFromIntent(Intent intent, int i) {
        String str = "Button" + i;
        if (intent.hasExtra(str)) {
            return intent.getExtras().getString(str);
        }
        return null;
    }

    private void setButtons(Intent intent) {
        int i = 0;
        int i2 = 0;
        while (i < 3) {
            int i3 = i + 1;
            String buttonLabelFromIntent = getButtonLabelFromIntent(intent, i3);
            if (buttonLabelFromIntent != null) {
                this.mButtons[i].setText(buttonLabelFromIntent);
                this.mButtons[i].setVisibility(0);
                i2++;
            } else {
                this.mButtons[i].setVisibility(8);
            }
            i = i3;
        }
        if (i2 == 0) {
            this.mButtons[0].setText("Dismiss");
            this.mButtons[0].setVisibility(0);
        }
    }

    private boolean startTimeout(int i) {
        if (this.mTimeoutTimer != null) {
            DebugLogger.D4(logname, "Timer is busy, no timeout is possible");
            return false;
        }
        if (i <= 1000) {
            i *= 1000;
        }
        long j = i;
        Timer timer = new Timer();
        this.mTimeoutTimer = timer;
        try {
            timer.schedule(new TimerTask() { // from class: com.navngo.igo.javaclient.WarnerBrothers.2
                @Override // java.util.TimerTask, java.lang.Runnable
                public void run() {
                    WarnerBrothers.this.mTimeoutTimer.cancel();
                    WarnerBrothers.this.informClient(0);
                    WarnerBrothers.this.finish();
                }
            }, j);
            return true;
        } catch (IllegalArgumentException unused) {
            DebugLogger.D4(logname, "Invalid delay:" + j);
            return false;
        } catch (IllegalStateException e) {
            DebugLogger.D4(logname, "Invalid timer state:" + e);
            return false;
        }
    }

    private void processIntent(Intent intent, boolean z) {
        TextView textView;
        int i;
        String action = intent.getAction();
        if (!action.equals(ACTION_DEFAULT)) {
            if (action.equals(ACTION_CLEAR)) {
                finish();
                return;
            } else {
                finish();
                return;
            }
        }
        if (z) {
            Bundle extras = intent.getExtras();
            if (intent.hasExtra("ClientId")) {
                this.mClientId = extras.getInt("ClientId", 0);
                DebugLogger.D4(logname, "ClientId = " + this.mClientId);
            }
            if (intent.hasExtra("Intent")) {
                this.mIntentStr = extras.getString("Intent");
                DebugLogger.D4(logname, "IntentStr = " + this.mIntentStr);
            }
            if (intent.hasExtra("Timeout") && (i = extras.getInt("Timeout")) > 0) {
                DebugLogger.D4(logname, "Timeout = " + i);
                startTimeout(i);
            }
            requestWindowFeature(3);
            setContentView(R.layout.warner_brothers);
            DebugLogger.D3(logname, "Saying ...");
            if (intent.hasExtra("android.intent.extra.TEXT") && (textView = (TextView) findViewById(R.id.warner_message)) != null) {
                CharSequence charSequenceExtra = intent.getCharSequenceExtra("android.intent.extra.TEXT");
                DebugLogger.D3(logname, "... " + ((Object) charSequenceExtra));
                textView.setText(charSequenceExtra);
            }
            if (setOnClickListener()) {
                setButtons(intent);
                getWindow().setFeatureDrawableResource(3, Application.APPICON_ID);
            } else {
                DebugLogger.D2(logname, "Resource error (missing buttons in warner_brothers)");
                finish();
            }
        }
    }
}
