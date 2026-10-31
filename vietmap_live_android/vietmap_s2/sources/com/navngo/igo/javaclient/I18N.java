package com.navngo.igo.javaclient;

import android.content.Context;
import android.os.AsyncTask;
import android.widget.TextView;
import android.widget.Toast;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class I18N {

    public interface Callback {
        void onTranslated(String str);
    }

    static class AsyncI18N extends AsyncTask<String, Void, String> {
        Callback callback;

        public AsyncI18N(Callback callback) {
            this.callback = callback;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public String doInBackground(String... strArr) {
            return NNG.I18N(strArr[0]);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(String str) {
            this.callback.onTranslated(str);
        }
    }

    public static void showToast(final Context context, String str, final int i) {
        new AsyncI18N(new Callback() { // from class: com.navngo.igo.javaclient.I18N.1
            @Override // com.navngo.igo.javaclient.I18N.Callback
            public void onTranslated(String str2) {
                Toast.makeText(context, str2, i).show();
            }
        }).execute(str);
    }

    public static void setText(final TextView textView, String str) {
        new AsyncI18N(new Callback() { // from class: com.navngo.igo.javaclient.I18N.2
            @Override // com.navngo.igo.javaclient.I18N.Callback
            public void onTranslated(String str2) {
                textView.setText(str2);
            }
        }).execute(str);
    }

    public static void translate(String str, Callback callback) {
        new AsyncI18N(callback).execute(str);
    }

    public static String translate(String str) {
        return NNG.I18N(str);
    }
}
