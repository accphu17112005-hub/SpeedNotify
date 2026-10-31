###### Class com.navngo.igo.javaclient.tts.cyberon.TTSCyberon (com.navngo.igo.javaclient.tts.cyberon.TTSCyberon)
.class public Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;
.super Ljava/lang/Object;
.source "TTSCyberon.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# static fields
.field private static final tag:Ljava/lang/String; = "TTSCyberon"


# instance fields
.field private libHandle:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 16
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    .line 19
    sget-object v0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;->INSTANCE:Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;

    sput-object v0, Lcom/cyberon/engine/CReaderHL;->mCallback:Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;

    return-void
.end method

.method static synthetic lambda$new$0(J[Ljava/lang/Object;IJ[B)I
    .registers 7

    .line 20
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    .line 21
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p3, 0x0

    aput-object p2, p1, p3

    const-string p2, "tts.cyberon.callback_play"

    const/4 p4, 0x0

    invoke-virtual {p0, p2, p4, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return p3
.end method


# virtual methods
.method public getErrorMessage(I)Ljava/lang/String;
    .registers 2

    .line 86
    invoke-static {p1}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_GetErrorMessage(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getVersion()Ljava/lang/String;
    .registers 4

    const/16 v0, 0x400

    new-array v0, v0, [C

    .line 74
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    invoke-static {v1, v2, v0}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_GetVersion(J[C)I

    move-result v1

    if-gez v1, :cond_31

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error code: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "message: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->getErrorMessage(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TTSCyberon"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ""

    return-object v0

    :cond_31
    const/4 v2, 0x0

    .line 81
    invoke-static {v0, v2, v1}, Ljava/lang/String;->copyValueOf([CII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init([BILjava/lang/String;)I
    .registers 10

    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 33
    iget-wide v1, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    const-wide/16 v3, 0x0

    cmp-long v5, v3, v1

    if-gez v5, :cond_e

    .line 34
    invoke-static {v1, v2}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_Release(J)I

    .line 37
    :cond_e
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1, p2, p3, v0}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_Init(Ljava/lang/Object;[BILjava/lang/String;[I)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    const-string p3, "TTSCyberon"

    cmp-long v1, v3, p1

    if-eqz v1, :cond_26

    const-string p1, "CReaderHL created"

    .line 40
    invoke-static {p3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2b

    :cond_26
    const-string p1, "Failed to create CReaderHL"

    .line 43
    invoke-static {p3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2b
    const/4 p1, 0x0

    aget p1, v0, p1

    return p1
.end method

.method public isPlaying()Z
    .registers 3

    .line 69
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    invoke-static {v0, v1}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_IsPlaying(J)Z

    move-result v0

    return v0
.end method

.method public loadLibrary()Z
    .registers 2

    .line 27
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/cyberon/engine/CReaderHL;->loadLibrary(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public play(Ljava/lang/String;)I
    .registers 6

    .line 54
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_AddToPlaylist(J[B)I

    move-result p1

    if-gez p1, :cond_23

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TTSCyberon"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return p1

    .line 61
    :cond_23
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_Play(JJ)I

    move-result p1

    return p1
.end method

.method public registerFunctors()V
    .registers 4

    .line 92
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "tts.cyberon.load_library"

    const-string v2, "loadLibrary"

    .line 94
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.init"

    const-string v2, "init"

    .line 95
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.set_speed"

    const-string v2, "setSpeed"

    .line 96
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.play"

    const-string v2, "play"

    .line 97
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.stop"

    const-string v2, "stop"

    .line 98
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.is_playing"

    const-string v2, "isPlaying"

    .line 99
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.get_version"

    const-string v2, "getVersion"

    .line 100
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "tts.cyberon.get_error_message"

    const-string v2, "getErrorMessage"

    .line 101
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public setSpeed(I)I
    .registers 4

    .line 50
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    invoke-static {v0, v1, p1}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_SetSpeed(JI)I

    move-result p1

    return p1
.end method

.method public stop()I
    .registers 3

    .line 65
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->libHandle:J

    invoke-static {v0, v1}, Lcom/cyberon/engine/CReaderHL;->CReaderHL_Stop(J)I

    move-result v0

    return v0
.end method

###### Class com.navngo.igo.javaclient.tts.cyberon.TTSCyberon$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.tts.cyberon.TTSCyberon$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;


# static fields
.field public static final synthetic INSTANCE:Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;->INSTANCE:Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon$$ExternalSyntheticLambda0;

    return-void
.end method

.method private synthetic constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final PlayCallbackMethod(J[Ljava/lang/Object;IJ[B)I
    .registers 8

    invoke-static/range {p1 .. p7}, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->lambda$new$0(J[Ljava/lang/Object;IJ[B)I

    move-result p1

    return p1
.end method
