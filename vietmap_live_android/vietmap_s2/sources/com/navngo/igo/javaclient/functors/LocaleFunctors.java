package com.navngo.igo.javaclient.functors;

import com.navngo.igo.javaclient.androidgo.AndroidGo;
import java.util.Locale;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class LocaleFunctors implements IFunctorCollection {
    public String getLocale() {
        return Locale.getDefault().toString();
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("android.get_locale", this, "getLocale");
    }
}
