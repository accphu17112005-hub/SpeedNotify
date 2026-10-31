package com.navngo.igo.javaclient.shinylocation;

import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.NNG;
import com.navngo.igo.javaclient.ServerRunner;

/* JADX INFO: compiled from: ShinyLocationListenerCommunicator.java */
/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class ShinyLocationConsumerJNI implements IShinyLocationConsumer {
    private int id;

    public ShinyLocationConsumerJNI(int i) {
        this.id = i;
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyLocationConsumer
    public void JsonDataArrived(final String str) {
        ServerRunner.runOnHandlerThread(new Runnable() { // from class: com.navngo.igo.javaclient.shinylocation.ShinyLocationConsumerJNI$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m19lambda$JsonDataArrived$0$comnavngoigojavaclientshinylocationShinyLocationConsumerJNI(str);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$JsonDataArrived$0$com-navngo-igo-javaclient-shinylocation-ShinyLocationConsumerJNI, reason: not valid java name */
    /* synthetic */ void m19lambda$JsonDataArrived$0$comnavngoigojavaclientshinylocationShinyLocationConsumerJNI(String str) {
        NNG.GpsJsonUpdate(this.id, str);
    }

    @Override // com.navngo.igo.javaclient.shinylocation.IShinyLocationConsumer
    public void LogDebugMessage(String str) {
        DebugLogger.D3("shiny", str);
    }
}
