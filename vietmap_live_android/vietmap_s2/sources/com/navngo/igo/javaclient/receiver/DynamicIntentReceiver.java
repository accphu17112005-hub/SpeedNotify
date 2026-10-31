package com.navngo.igo.javaclient.receiver;

import android.content.IntentFilter;
import com.navngo.igo.javaclient.Application;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public abstract class DynamicIntentReceiver extends CustomIntentReceiver implements IReceiver {
    private boolean registered = false;

    protected abstract String[] action();

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void register() {
        if (this.registered) {
            return;
        }
        IntentFilter intentFilter = new IntentFilter();
        for (String str : action()) {
            intentFilter.addAction(str);
        }
        Application.anApplication.registerReceiver(this, intentFilter);
        this.registered = true;
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public void unregister() {
        if (this.registered) {
            Application.anApplication.unregisterReceiver(this);
            this.registered = false;
        }
    }
}
