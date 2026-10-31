package com.navngo.igo.javaclient.functors;

import android.content.Intent;
import android.net.Uri;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class BrowserFunctors implements IFunctorCollection {
    public void openWebPage(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        String strTrim = str.trim();
        if (!strTrim.startsWith("http://") && !strTrim.startsWith("https://")) {
            strTrim = "http://" + strTrim;
        }
        intent.setData(Uri.parse(strTrim));
        intent.addCategory("android.intent.category.BROWSABLE");
        Application.getIgoActivity().startActivity(intent);
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("android.open_webpage", this, "openWebPage");
    }
}
