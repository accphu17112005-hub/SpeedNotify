package com.navngo.igo.javaclient;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class InsertSDCard extends Activity {
    public static final String ACTION_CLEAR = "com.navngo.igo.javaclient.InsertSDCard.CLEAR";
    public static final String ACTION_DEFAULT = "com.navngo.igo.javaclient.InsertSDCard.DEFAULT";
    private static final String logname = "InsertSDCard";

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        DebugLogger.D5(logname, "onCreate");
        Application.setInsertSDCard(this);
        processIntent(getIntent(), true);
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        processIntent(intent, false);
    }

    private void processIntent(Intent intent, boolean z) {
        String action = intent.getAction();
        if (action.equals(ACTION_DEFAULT)) {
            DebugLogger.D5(logname, "Saying: insert SD card");
            if (z) {
                requestWindowFeature(3);
                setContentView(R.layout.insert_sd_card);
                Button button = (Button) findViewById(R.id.insert_sd_card_button);
                if (button != null) {
                    button.setOnClickListener(new View.OnClickListener() { // from class: com.navngo.igo.javaclient.InsertSDCard.1
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            this.finish();
                        }
                    });
                }
                getWindow().setFeatureDrawableResource(3, Application.APPICON_ID);
                return;
            }
            return;
        }
        if (action.equals(ACTION_CLEAR)) {
            DebugLogger.D5(logname, "SD card warning cleared");
            Application.setSDNotificationCleared(true);
            finish();
            return;
        }
        finish();
    }

    public static void show() {
        if (Application.getIgoActivity() != null) {
            Application.getIgoActivity().mNoSystemExit = true;
        }
        Intent intent = new Intent(ACTION_DEFAULT);
        intent.setPackage(Application.anApplication.getPackageName());
        intent.setFlags(805306368);
        Application.anApplication.startActivity(intent);
    }
}
