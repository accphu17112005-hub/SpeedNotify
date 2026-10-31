package com.navngo.igo.javaclient.shinylocation;

import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ServerRunner;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public enum ShinyLocationListenerCommunicator {
    INSTANCE;

    public Map<Integer, ShinyLocationListener> listeners = new HashMap();

    ShinyLocationListenerCommunicator() {
    }

    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        androidGo.registerFunctor("android.shiny.createListener", this, "createListener");
        androidGo.registerFunctor("android.shiny.destroyListener", this, "destroyListener");
        androidGo.registerFunctor("android.shiny.startListening", this, "startListening");
        androidGo.registerFunctor("android.shiny.stopListening", this, "stopListening");
    }

    public boolean createListener(int i) {
        if (this.listeners.get(Integer.valueOf(i)) != null) {
            DebugLogger.D1("shiny", "createListener: id " + i + " already exists", null);
            return false;
        }
        this.listeners.put(Integer.valueOf(i), new ShinyLocationListener(new ShinyLocationConsumerJNI(i), Application.anApplication.getApplicationContext()));
        return true;
    }

    public boolean destroyListener(int i) {
        final ShinyLocationListener shinyLocationListenerRemove = this.listeners.remove(Integer.valueOf(i));
        if (shinyLocationListenerRemove == null) {
            DebugLogger.D1("shiny", "destroyListener: unknown id " + i, null);
            return false;
        }
        Objects.requireNonNull(shinyLocationListenerRemove);
        ServerRunner.runOnHandlerThread(new Runnable() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                shinyLocationListenerRemove.done();
            }
        });
        return true;
    }

    public boolean startListening(int i) {
        final ShinyLocationListener shinyLocationListener = this.listeners.get(Integer.valueOf(i));
        if (shinyLocationListener == null) {
            DebugLogger.D1("shiny", "startListening: unknown id " + i, null);
            return false;
        }
        Objects.requireNonNull(shinyLocationListener);
        ServerRunner.runOnHandlerThread(new Runnable() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                shinyLocationListener.startListening();
            }
        });
        return true;
    }

    public boolean stopListening(int i) {
        final ShinyLocationListener shinyLocationListener = this.listeners.get(Integer.valueOf(i));
        if (shinyLocationListener == null) {
            DebugLogger.D1("shiny", "stopListening: unknown id " + i, null);
            return false;
        }
        Objects.requireNonNull(shinyLocationListener);
        ServerRunner.runOnHandlerThread(new Runnable() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyLocationListenerCommunicator$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                shinyLocationListener.stopListening();
            }
        });
        return true;
    }
}
