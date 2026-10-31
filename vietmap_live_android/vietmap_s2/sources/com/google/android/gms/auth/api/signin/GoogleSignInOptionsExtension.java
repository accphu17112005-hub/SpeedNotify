package com.google.android.gms.auth.api.signin;

import android.os.Bundle;
import com.google.android.gms.common.api.Scope;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public interface GoogleSignInOptionsExtension {
    public static final int FITNESS = 3;
    public static final int GAMES = 1;

    int getExtensionType();

    List<Scope> getImpliedScopes();

    Bundle toBundle();
}
