package com.navngo.igo.javaclient;

import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.program.ProgramPhases;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ValidationFunctors implements IFunctorCollection {
    boolean mMatchingRevisions = false;

    public ValidationFunctors() {
        ProgramPhases.getInstance().waitForPhase(ProgramPhases.Phase.UI_READY, true, new Runnable() { // from class: com.navngo.igo.javaclient.ValidationFunctors.1
            @Override // java.lang.Runnable
            public void run() {
                if (ValidationFunctors.this.mMatchingRevisions) {
                    return;
                }
                Application.exit(true);
            }
        });
    }

    public String getRevision() {
        return com.navngo.igo.javaclient.refprod.BuildConfig.VERSION_NAME.split("\\.")[r0.length - 1];
    }

    public void setMatchValue(boolean z) {
        this.mMatchingRevisions = z;
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo.getInstance().registerFunctor("vietmap.getRevision", this, "getRevision");
        AndroidGo.getInstance().registerFunctor("vietmap.setMatchValue", this, "setMatchValue");
    }
}
