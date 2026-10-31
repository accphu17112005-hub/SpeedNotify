package com.navngo.igo.javaclient.functors;

import android.content.Intent;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class MailFunctors implements IFunctorCollection {
    public void onEmail(String str) {
        Intent intent = new Intent("android.intent.action.SEND");
        intent.setType("text/plain");
        intent.putExtra("android.intent.extra.TEXT", str);
        Application.getIgoActivity().startActivity(Intent.createChooser(intent, "Send E-mail via"));
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("android.send_email", this, "onEmail");
    }
}
