###### Class com.navngo.igo.javaclient.tts.TTSSpeakerFactory (com.navngo.igo.javaclient.tts.TTSSpeakerFactory)
.class public final Lcom/navngo/igo/javaclient/tts/TTSSpeakerFactory;
.super Ljava/lang/Object;
.source "TTSSpeakerFactory.java"


# static fields
.field private static final logname:Ljava/lang/String; = "TTSSpeakerFactory"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newInstance()Lcom/navngo/igo/javaclient/tts/TTSSpeaker;
    .registers 3

    :try_start_0
    const-string v0, "com.navngo.igo.javaclient.tts.TTSSpeakerImpl"

    .line 18
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/tts/TTSSpeaker;
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_d

    return-object v0

    :catchall_d
    move-exception v0

    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TTS not available: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TTSSpeakerFactory"

    invoke-static {v2, v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    new-instance v0, Lcom/navngo/igo/javaclient/tts/TTSSpeaker_Empty;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeaker_Empty;-><init>()V

    return-object v0
.end method
