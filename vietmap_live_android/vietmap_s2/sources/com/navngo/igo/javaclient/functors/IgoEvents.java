package com.navngo.igo.javaclient.functors;

import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.androidgo.AndroidGo;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class IgoEvents implements IFunctorCollection {
    private static final String logname = "IgoEvents";

    public void onExitPressed() {
        DebugLogger.D5(logname, "onExitPressed");
        Application.exit(true);
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("android.on_exit_pressed", this, "onExitPressed");
    }
}
