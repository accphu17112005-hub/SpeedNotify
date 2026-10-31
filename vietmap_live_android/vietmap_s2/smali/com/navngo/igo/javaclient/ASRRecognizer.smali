###### Class com.navngo.igo.javaclient.ASRRecognizer (com.navngo.igo.javaclient.ASRRecognizer)
.class public Lcom/navngo/igo/javaclient/ASRRecognizer;
.super Ljava/lang/Object;
.source "ASRRecognizer.java"

# interfaces
.implements Landroid/speech/RecognitionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;
    }
.end annotation


# static fields
.field private static final ASR_AVOID:I = 0x4

.field private static final ASR_DELETE_ROUTE:I = 0x3

.field private static final ASR_ERROR:I = 0x9

.field private static final ASR_EXIT:I = 0x8

.field private static final ASR_FIND_GAS_STATION:I = 0x1

.field private static final ASR_FIND_PARKING:I = 0x2

.field private static final ASR_GO_TO_MAP:I = 0x5

.field private static final ASR_HOME:I = 0x0

.field private static final ASR_MUTE_UNMUTE:I = 0x7

.field private static final ASR_OVERVIEW:I = 0x6

.field private static final VOICE_RECOGNITION_REQUEST_CODE:I = 0x4d2

.field private static final logname:Ljava/lang/String; = "ASRRecognizer"


# instance fields
.field private final asrLock:Ljava/lang/String;

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;",
            ">;"
        }
    .end annotation
.end field

.field private mListening:Z

.field protected mRecognizer:Landroid/speech/SpeechRecognizer;

.field private mSpeechRecognitionAvailable:Z


# direct methods
.method constructor <init>()V
    .registers 5

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/lang/String;

    const-string v1, "ASRRecognizer.asrLock"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->asrLock:Ljava/lang/String;

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    .line 51
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mSpeechRecognitionAvailable:Z

    .line 54
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListeners:Ljava/util/ArrayList;

    .line 56
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 57
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 59
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_34

    const/4 v0, 0x1

    :cond_34
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mSpeechRecognitionAvailable:Z

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mSpeechRecognitionAvailable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mSpeechRecognitionAvailable:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ASRRecognizer"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/speech/SpeechRecognizer;->createSpeechRecognizer(Landroid/content/Context;)Landroid/speech/SpeechRecognizer;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mRecognizer:Landroid/speech/SpeechRecognizer;

    .line 64
    invoke-virtual {v0, p0}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    return-void
.end method

.method private sendMessage(I)V
    .registers 5

    .line 229
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    .line 231
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendMessage("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ASRRecognizer"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 232
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "kmop_asr.sc_sendMessage"

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callUI(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method private startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12

    const/4 v0, 0x0

    if-eqz p1, :cond_1f

    if-nez p2, :cond_6

    goto :goto_1f

    .line 157
    :cond_6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v1, v2, :cond_11

    return v0

    :cond_11
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 160
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v4, 0x1

    move-object v3, p1

    move-object v6, p2

    invoke-virtual/range {v3 .. v8}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    return p1

    :cond_1f
    :goto_1f
    if-nez p1, :cond_24

    if-nez p2, :cond_24

    const/4 v0, 0x1

    :cond_24
    return v0
.end method


# virtual methods
.method public listen()V
    .registers 3

    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "listen "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ASRRecognizer"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mSpeechRecognitionAvailable:Z

    if-eqz v0, :cond_34

    .line 239
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    if-nez v0, :cond_30

    .line 240
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/ASRRecognizer$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/ASRRecognizer$1;-><init>(Lcom/navngo/igo/javaclient/ASRRecognizer;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    .line 247
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    goto :goto_3e

    .line 252
    :cond_30
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ASRRecognizer;->stopListening()V

    goto :goto_3e

    :cond_34
    const-string v0, "SpeechRecognition unavailable"

    .line 258
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x9

    .line 259
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    :goto_3e
    return-void
.end method

.method public messageProcessed(II)V
    .registers 5

    .line 282
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "messageProcessed("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "ASRRecognizer"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onBeginningOfSpeech()V
    .registers 3

    const-string v0, "ASRRecognizer"

    const-string v1, "onBeginningOfSpeech()"

    .line 94
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;

    .line 97
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;->onBeginningOfSpeech()V

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public onBufferReceived([B)V
    .registers 3

    const-string p1, "ASRRecognizer"

    const-string v0, "onBufferReceived()"

    .line 104
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onEndOfSpeech()V
    .registers 3

    const-string v0, "ASRRecognizer"

    const-string v1, "onEndOfSpeech()"

    .line 110
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;

    .line 113
    invoke-interface {v1}, Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;->onEndOfSpeech()V

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public onError(I)V
    .registers 4

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onError("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ASRRecognizer"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 121
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    if-nez p1, :cond_24

    const/4 p1, 0x1

    .line 123
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mSpeechRecognitionAvailable:Z

    goto :goto_29

    :cond_24
    const/16 p1, 0x9

    .line 126
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    :goto_29
    return-void
.end method

.method public onEvent(ILandroid/os/Bundle;)V
    .registers 3

    const-string p1, "ASRRecognizer"

    const-string p2, "onEvent()"

    .line 132
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPartialResults(Landroid/os/Bundle;)V
    .registers 3

    const-string p1, "ASRRecognizer"

    const-string v0, "onPartialResults()"

    .line 138
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReadyForSpeech(Landroid/os/Bundle;)V
    .registers 3

    const-string p1, "ASRRecognizer"

    const-string v0, "onReadyForSpeech()"

    .line 144
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;

    .line 147
    invoke-interface {v0}, Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;->onReadyForSpeech()V

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public onResults(Landroid/os/Bundle;)V
    .registers 8

    .line 165
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->asrLock:Ljava/lang/String;

    monitor-enter v0

    const/4 v1, 0x0

    .line 166
    :try_start_4
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    const-string v2, "ASRRecognizer"

    const-string v3, "entering onResults"

    .line 168
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "results_recognition"

    .line 169
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    if-nez p1, :cond_1e

    const-string p1, "ASRRecognizer"

    const-string v1, "onResults: no results "

    .line 171
    invoke-static {p1, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    monitor-exit v0

    return-void

    .line 175
    :cond_1e
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 176
    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_109

    .line 177
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "home"

    .line 178
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_47

    const-string v2, "ASRRecognizer"

    const-string v3, "HOME command recognized"

    .line 179
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    invoke-direct {p0, v1}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto :goto_22

    :cond_47
    const-string v3, "avoid"

    .line 182
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5b

    const-string v2, "ASRRecognizer"

    const-string v3, "AVOID command recognized"

    .line 183
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x4

    .line 184
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto :goto_22

    :cond_5b
    const-string v3, "over"

    .line 186
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6f

    const-string v2, "ASRRecognizer"

    const-string v3, "OVERVIEW command recognized"

    .line 187
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x6

    .line 188
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto :goto_22

    :cond_6f
    const-string v3, "mute"

    .line 190
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_83

    const-string v2, "ASRRecognizer"

    const-string v3, "MUTE/UNMUTE command recognized"

    .line 191
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x7

    .line 192
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto :goto_22

    :cond_83
    const-string v3, "exit"

    .line 194
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_98

    const-string v2, "ASRRecognizer"

    const-string v3, "EXIT command recognized"

    .line 195
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v2, 0x8

    .line 196
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto :goto_22

    :cond_98
    const-string v3, "findgas"

    .line 198
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_ad

    const-string v2, "ASRRecognizer"

    const-string v3, "GAS_STATION command recognized"

    .line 199
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 200
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto/16 :goto_22

    :cond_ad
    const-string v3, "findpark"

    .line 202
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c2

    const-string v2, "ASRRecognizer"

    const-string v3, "PARKING command recognized"

    .line 203
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x2

    .line 204
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto/16 :goto_22

    :cond_c2
    const-string v3, "delete"

    .line 206
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_d7

    const-string v2, "ASRRecognizer"

    const-string v3, "DELETE command recognized"

    .line 207
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x3

    .line 208
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto/16 :goto_22

    :cond_d7
    const-string v3, "go"

    .line 210
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_ec

    const-string v2, "ASRRecognizer"

    const-string v3, "MAP command recognized"

    .line 211
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x5

    .line 212
    invoke-direct {p0, v2}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    goto/16 :goto_22

    :cond_ec
    const-string v3, "ASRRecognizer"

    .line 215
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onResults: Unidentified sentence: \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_22

    .line 218
    :cond_109
    iget-object p1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->asrLock:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    .line 219
    monitor-exit v0

    return-void

    :catchall_110
    move-exception p1

    monitor-exit v0
    :try_end_112
    .catchall {:try_start_4 .. :try_end_112} :catchall_110

    throw p1
.end method

.method public onRmsChanged(F)V
    .registers 3

    const-string p1, "ASRRecognizer"

    const-string v0, "onRmsChanged()"

    .line 224
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public registerSimpleASRListener(Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;)Z
    .registers 3

    .line 84
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public stopListening()V
    .registers 3

    .line 265
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mSpeechRecognitionAvailable:Z

    if-eqz v0, :cond_18

    .line 266
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    if-eqz v0, :cond_24

    .line 268
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    new-instance v1, Lcom/navngo/igo/javaclient/ASRRecognizer$2;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/ASRRecognizer$2;-><init>(Lcom/navngo/igo/javaclient/ASRRecognizer;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    .line 273
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListening:Z

    goto :goto_24

    :cond_18
    const-string v0, "ASRRecognizer"

    const-string v1, "SpeechRecognition unavailable"

    .line 277
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x9

    .line 278
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/ASRRecognizer;->sendMessage(I)V

    :cond_24
    :goto_24
    return-void
.end method

.method public unregisterSimpleASRListener(Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;)Z
    .registers 3

    .line 89
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

###### Class com.navngo.igo.javaclient.ASRRecognizer.AnonymousClass1 (com.navngo.igo.javaclient.ASRRecognizer$1)
.class Lcom/navngo/igo/javaclient/ASRRecognizer$1;
.super Ljava/lang/Object;
.source "ASRRecognizer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ASRRecognizer;->listen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field recogIntent:Landroid/content/Intent;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/ASRRecognizer;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ASRRecognizer;)V
    .registers 3

    .line 240
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer$1;->this$0:Lcom/navngo/igo/javaclient/ASRRecognizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer$1;->recogIntent:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 244
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer$1;->this$0:Lcom/navngo/igo/javaclient/ASRRecognizer;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mRecognizer:Landroid/speech/SpeechRecognizer;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer$1;->recogIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Landroid/speech/SpeechRecognizer;->startListening(Landroid/content/Intent;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ASRRecognizer.AnonymousClass2 (com.navngo.igo.javaclient.ASRRecognizer$2)
.class Lcom/navngo/igo/javaclient/ASRRecognizer$2;
.super Ljava/lang/Object;
.source "ASRRecognizer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/ASRRecognizer;->stopListening()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/ASRRecognizer;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/ASRRecognizer;)V
    .registers 2

    .line 268
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ASRRecognizer$2;->this$0:Lcom/navngo/igo/javaclient/ASRRecognizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 270
    iget-object v0, p0, Lcom/navngo/igo/javaclient/ASRRecognizer$2;->this$0:Lcom/navngo/igo/javaclient/ASRRecognizer;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/ASRRecognizer;->mRecognizer:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->stopListening()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.ASRRecognizer.SimpleASRListener (com.navngo.igo.javaclient.ASRRecognizer$SimpleASRListener)
.class public interface abstract Lcom/navngo/igo/javaclient/ASRRecognizer$SimpleASRListener;
.super Ljava/lang/Object;
.source "ASRRecognizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ASRRecognizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SimpleASRListener"
.end annotation


# virtual methods
.method public abstract onBeginningOfSpeech()V
.end method

.method public abstract onEndOfSpeech()V
.end method

.method public abstract onReadyForSpeech()V
.end method
