###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR (com.navngo.igo.javaclient.voice_recognition.GoogleVR)
.class public final Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Landroid/speech/RecognitionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;,
        Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;,
        Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GoogleVR"


# instance fields
.field go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

.field igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

.field mDoDebugLogging:Z

.field mError:I

.field mLangModel:Ljava/lang/String;

.field mLocaleName:Ljava/lang/String;

.field mMaxResults:I

.field mMaxSilenceMillis:J

.field mMinSilenceMillis:J

.field mMinSpeechMillis:J

.field mResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;",
            ">;"
        }
    .end annotation
.end field

.field mSoundLevel:I

.field mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field mSupportedLocales:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field packageName:Ljava/lang/String;

.field sr:Landroid/speech/SpeechRecognizer;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    .line 92
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const/4 v0, 0x0

    .line 93
    iput v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mError:I

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    const/4 v0, 0x1

    .line 96
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mDoDebugLogging:Z

    const-string v0, ""

    .line 104
    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLocaleName:Ljava/lang/String;

    const-string v0, "web_search"

    .line 105
    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLangModel:Ljava/lang/String;

    const/4 v0, 0x5

    .line 106
    iput v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxResults:I

    const-wide/16 v0, 0x3e8

    .line 107
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSpeechMillis:J

    const-wide/16 v0, 0x12c

    .line 108
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSilenceMillis:J

    const-wide/16 v0, 0x1f4

    .line 109
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxSilenceMillis:J

    const-string v0, "GoogleVR.GoogleVR started"

    .line 144
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 145
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getStatus"

    const-string v2, "getStatus"

    .line 147
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getError"

    const-string v2, "getError"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getLocale"

    const-string v2, "getLocale"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.setLocale"

    const-string v2, "setLocale"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getNumSupportedLocales"

    const-string v2, "getNumSupportedLocales"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 152
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getSupportedLocale"

    const-string v2, "getSupportedLocale"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.IsLocaleSupported"

    const-string v2, "IsLocaleSupported"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getLangModel"

    const-string v2, "getLangModel"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.setLangModel"

    const-string v2, "setLangModel"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getMaxResults"

    const-string v2, "getMaxResults"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.setMaxResults"

    const-string v2, "setMaxResults"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getMinSpeechMillis"

    const-string v2, "getMinSpeechMillis"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.setMinSpeechMillis"

    const-string v2, "setMinSpeechMillis"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 160
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getMinSilenceMillis"

    const-string v2, "getMinSilenceMillis"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 161
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.setMinSilenceMillis"

    const-string v2, "setMinSilenceMillis"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getMaxSilenceMillis"

    const-string v2, "getMaxSilenceMillis"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.setMaxSilenceMillis"

    const-string v2, "setMaxSilenceMillis"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 164
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getNumResults"

    const-string v2, "getNumResults"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 165
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getResult"

    const-string v2, "getResult"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 166
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.getScore"

    const-string v2, "getScore"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 168
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.init"

    const-string v2, "init"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 169
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.start"

    const-string v2, "start"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.stop"

    const-string v2, "stop"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 171
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.reset"

    const-string v2, "reset"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 172
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const-string v1, "google_vr.shutdown"

    const-string v2, "shutdown"

    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 1

    .line 30
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->startInternal()V

    return-void
.end method

.method private cancel()V
    .registers 3

    .line 249
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private setupRecognizer()V
    .registers 3

    const-string v0, "GoogleVR.init started"

    .line 188
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 189
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-ne v0, v1, :cond_60

    const-string v0, "GoogleVR.init status = down"

    .line 190
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 191
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->packageName:Ljava/lang/String;

    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleVR.init package name = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 193
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleVR.init igoActivity created: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    if-nez v1, :cond_4a

    const-string v1, "no"

    goto :goto_4c

    :cond_4a
    const-string v1, "yes"

    :goto_4c
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 195
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_60
    const-string v0, "GoogleVR.init done"

    .line 208
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void
.end method

.method private startInternal()V
    .registers 3

    const-string v0, "GoogleVR.startInternal started"

    .line 274
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 275
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->reset()V

    const-string v0, "GoogleVR.startInternal #1"

    .line 276
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 277
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_28

    const-string v0, "Starting;"

    .line 278
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 279
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->STARTED:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    const/4 v0, 0x0

    .line 280
    iput v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mError:I

    .line 281
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_28
    const-string v0, "GoogleVR.startInternal done"

    .line 300
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public IsLocaleSupported(Ljava/lang/String;)Z
    .registers 3

    .line 120
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public debugLog(Ljava/lang/String;)V
    .registers 3

    .line 99
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mDoDebugLogging:Z

    if-eqz v0, :cond_9

    const-string v0, "GoogleVR"

    .line 100
    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method dumpResult(Ljava/lang/String;F)V
    .registers 5

    .line 359
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Result; text=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\', score=\'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void
.end method

.method public getError()I
    .registers 2

    .line 113
    iget v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mError:I

    return v0
.end method

.method public getLangModel()Ljava/lang/String;
    .registers 2

    .line 123
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLangModel:Ljava/lang/String;

    return-object v0
.end method

.method public getLocale()Ljava/lang/String;
    .registers 2

    .line 114
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLocaleName:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxResults()I
    .registers 2

    .line 125
    iget v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxResults:I

    return v0
.end method

.method public getMaxSilenceMillis()J
    .registers 3

    .line 131
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxSilenceMillis:J

    return-wide v0
.end method

.method public getMinSilenceMillis()J
    .registers 3

    .line 129
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSilenceMillis:J

    return-wide v0
.end method

.method public getMinSpeechMillis()J
    .registers 3

    .line 127
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSpeechMillis:J

    return-wide v0
.end method

.method public getNumResults()I
    .registers 2

    .line 133
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getNumSupportedLocales()I
    .registers 3

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getNumSupportedLocales="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getResult(I)Ljava/lang/String;
    .registers 3

    .line 134
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;

    iget-object p1, p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;->text:Ljava/lang/String;

    return-object p1
.end method

.method public getScore(I)I
    .registers 3

    .line 136
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;

    iget p1, p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;->score:F

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_11

    const/4 p1, 0x0

    return p1

    :cond_11
    const/high16 v0, 0x42c80000    # 100.0f

    mul-float p1, p1, v0

    .line 140
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->intValue()I

    move-result p1

    return p1
.end method

.method public getStatus()I
    .registers 2

    .line 112
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v0

    return v0
.end method

.method public getSupportedLocale(I)Lcom/navngo/igo/javaclient/androidgo/types/CString;
    .registers 4

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getSupportedLocale("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, p1}, Lcom/navngo/igo/javaclient/androidgo/types/CString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public init(Z)V
    .registers 2

    .line 183
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mDoDebugLogging:Z

    .line 184
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setupRecognizer()V

    return-void
.end method

.method public onBeginningOfSpeech()V
    .registers 2

    const-string v0, "The user has started to speak;"

    .line 340
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 341
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    return-void
.end method

.method public onBufferReceived([B)V
    .registers 2

    return-void
.end method

.method public onEndOfSpeech()V
    .registers 5

    const-string v0, "The user has stopped speaking;"

    .line 353
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 354
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DONE_SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    .line 355
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "asr.freetext.on_speech_ended"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public onError(I)V
    .registers 6

    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleVR.error; status=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', error=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 318
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-ne v0, v1, :cond_3b

    const-string p1, "Ignoring error: Status is STARTED or IDLE"

    .line 319
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void

    .line 322
    :cond_3b
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->STARTED:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-ne v0, v1, :cond_4d

    const-string p1, "Restart listening because it does not started yet"

    .line 323
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 324
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->stop()V

    .line 325
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->start()V

    return-void

    .line 328
    :cond_4d
    iput p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mError:I

    .line 329
    sget-object p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 330
    iget-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v0, 0x0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mError:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "asr.freetext.on_error"

    invoke-virtual {p1, v2, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public onEvent(ILandroid/os/Bundle;)V
    .registers 3

    const-string p1, "GoogleVR"

    const-string p2, "Unwanted onEvent arrived"

    .line 422
    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onPartialResults(Landroid/os/Bundle;)V
    .registers 3

    const-string p1, "GoogleVR"

    const-string v0, "Unwanted onPartialResults arrived"

    .line 349
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onReadyForSpeech(Landroid/os/Bundle;)V
    .registers 5

    const-string p1, "The endpointer is ready for the user to start speaking;"

    .line 334
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 335
    sget-object p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->MAY_SPEAK:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    .line 336
    iget-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "asr.freetext.on_ready_for_speech"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public onResults(Landroid/os/Bundle;)V
    .registers 12

    const-string v0, "results_recognition"

    .line 363
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "confidence_scores"

    .line 364
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object p1

    const-string v1, "\'"

    const/4 v2, 0x0

    if-nez v0, :cond_1f

    .line 369
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    const-string p1, "GoogleVR.results none;"

    .line 370
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    goto/16 :goto_dc

    :cond_1f
    const/high16 v3, -0x40800000    # -1.0f

    const-string v4, "GoogleVR.result; s=\'"

    if-nez p1, :cond_65

    const-string p1, "GoogleVR.results without scores;"

    .line 373
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 374
    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {p1, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    .line 375
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 376
    :goto_39
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_dc

    .line 377
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 378
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 379
    iget-object v5, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    new-instance v6, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;

    invoke-direct {v6, p0, v0, v3}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;Ljava/lang/String;F)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_39

    :cond_65
    const-string v5, "GoogleVR.results with scores;"

    .line 384
    invoke-virtual {p0, v5}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 385
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    .line 386
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v5, 0x0

    .line 388
    :goto_7a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_dc

    .line 389
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 390
    array-length v7, p1

    if-ge v5, v7, :cond_bc

    .line 391
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "\', score=\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v8, p1, v5

    invoke-static {v8}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 392
    iget-object v7, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    new-instance v8, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;

    add-int/lit8 v9, v5, 0x1

    aget v5, p1, v5

    invoke-direct {v8, p0, v6, v5}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;Ljava/lang/String;F)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v5, v9

    goto :goto_7a

    .line 396
    :cond_bc
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 397
    iget-object v7, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    new-instance v8, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;

    invoke-direct {v8, p0, v6, v3}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;Ljava/lang/String;F)V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7a

    .line 402
    :cond_dc
    :goto_dc
    sget-object p1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->READY:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    .line 404
    iget-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    if-nez p1, :cond_ec

    const-string p1, "AndroidGo is null"

    .line 405
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    goto/16 :goto_16a

    :cond_ec
    const-string p1, "GoogleVR.result calling asr.freetext.on_begin_results"

    .line 408
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 409
    iget-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    new-array v0, v2, [Ljava/lang/Object;

    const-string v3, "asr.freetext.on_begin_results"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    const-string p1, "GoogleVR.result enumerating results"

    .line 410
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 411
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->getNumResults()I

    move-result p1

    const/4 v0, 0x0

    :goto_105
    if-ge v0, p1, :cond_15c

    .line 413
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GoogleVR.result calling asr.freetext.on_add_result "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "; score="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->getScore(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ", result=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->getResult(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 414
    iget-object v3, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->getScore(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->getResult(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    const-string v6, "asr.freetext.on_add_result"

    invoke-virtual {v3, v6, v4, v5}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_105

    :cond_15c
    const-string p1, "GoogleVR.result calling asr.freetext.on_end_results"

    .line 416
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 417
    iget-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    new-array v0, v2, [Ljava/lang/Object;

    const-string v1, "asr.freetext.on_end_results"

    invoke-virtual {p1, v1, v4, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :goto_16a
    return-void
.end method

.method public onRmsChanged(F)V
    .registers 5

    const/high16 v0, 0x40000000    # 2.0f

    add-float/2addr p1, v0

    const/high16 v0, 0x41400000    # 12.0f

    div-float/2addr p1, v0

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    const/16 v0, 0xff

    .line 427
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSoundLevel:I

    .line 428
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v0

    const-string p1, "asr.freetext.on_rms_changed"

    const/4 v0, 0x0

    invoke-virtual {v1, p1, v0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method public reset()V
    .registers 3

    .line 223
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleVR.reset; status=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 224
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4e

    goto :goto_47

    .line 241
    :pswitch_31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mResults:Ljava/util/ArrayList;

    goto :goto_47

    :pswitch_39
    const-string v0, "Cancelling;"

    .line 236
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 237
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->cancel()V

    goto :goto_47

    :pswitch_42
    return-void

    .line 226
    :pswitch_43
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setupRecognizer()V

    return-void

    .line 245
    :goto_47
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    return-void

    nop

    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_43
        :pswitch_42
        :pswitch_39
        :pswitch_39
        :pswitch_39
        :pswitch_39
        :pswitch_31
    .end packed-switch
.end method

.method public setLangModel(Ljava/lang/String;)V
    .registers 2

    .line 124
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLangModel:Ljava/lang/String;

    return-void
.end method

.method public setLocale(Ljava/lang/String;)V
    .registers 2

    .line 115
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLocaleName:Ljava/lang/String;

    return-void
.end method

.method public setMaxResults(I)V
    .registers 2

    .line 126
    iput p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxResults:I

    return-void
.end method

.method public setMaxSilenceMillis(J)V
    .registers 3

    .line 132
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxSilenceMillis:J

    return-void
.end method

.method public setMinSilenceMillis(J)V
    .registers 3

    .line 130
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSilenceMillis:J

    return-void
.end method

.method public setMinSpeechMillis(J)V
    .registers 3

    .line 128
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSpeechMillis:J

    return-void
.end method

.method setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V
    .registers 3

    .line 176
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-eq v0, p1, :cond_6

    .line 177
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    :cond_6
    return-void
.end method

.method public shutdown()V
    .registers 3

    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleVR.shutdown; status=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 213
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-eq v0, v1, :cond_38

    .line 214
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$2;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$2;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 218
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    :cond_38
    return-void
.end method

.method public start()V
    .registers 5

    const-string v0, "GoogleVR.start"

    .line 257
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 258
    invoke-static {}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->get()Lcom/navngo/igo/javaclient/permission/PermissionHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    const-string v3, "android.permission.RECORD_AUDIO"

    invoke-virtual {v0, v1, v3, v2}, Lcom/navngo/igo/javaclient/permission/PermissionHandler;->requestPermission(Landroid/app/Activity;Ljava/lang/String;Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;)V

    return-void
.end method

.method public stop()V
    .registers 3

    .line 304
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GoogleVR.stop; status=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 305
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_47

    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->MAY_SPEAK:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-eq v0, v1, :cond_33

    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    if-ne v0, v1, :cond_47

    :cond_33
    const-string v0, "Stopping;"

    .line 306
    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 307
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$6;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$6;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 310
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DONE_SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    :cond_47
    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass1 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$1)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setupRecognizer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 195
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .line 196
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.init running on ui thread"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 197
    new-instance v3, Landroid/content/Intent;

    const-string v0, "android.speech.action.GET_LANGUAGE_DETAILS"

    invoke-direct {v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.google.android.googlequicksearchbox"

    .line 198
    invoke-virtual {v3, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 199
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.init intent created"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 200
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v2, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    new-instance v5, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {v5, v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;-><init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Lcom/navngo/igo/javaclient/IgoActivity;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 201
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.init bcast sent"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 202
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v1, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->igoActivity:Lcom/navngo/igo/javaclient/IgoActivity;

    invoke-static {v1}, Landroid/speech/SpeechRecognizer;->createSpeechRecognizer(Landroid/content/Context;)Landroid/speech/SpeechRecognizer;

    move-result-object v1

    iput-object v1, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    .line 203
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.init recognizer created"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 204
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-virtual {v0, v1}, Landroid/speech/SpeechRecognizer;->setRecognitionListener(Landroid/speech/RecognitionListener;)V

    .line 205
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$1;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.init recognizer listener set"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass2 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$2)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$2;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->shutdown()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 214
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$2;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 215
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$2;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_d

    .line 216
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$2;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->destroy()V

    :cond_d
    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass3 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$3)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->cancel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 249
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 250
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    if-eqz v0, :cond_d

    .line 251
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->cancel()V

    .line 252
    :cond_d
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$3;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "Cancelled;"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass4 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$4)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/permission/PermissionHandler$CallbackForOne;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 258
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionDenied()V
    .registers 3

    .line 267
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "onPermissionDenied"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 268
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->onError(I)V

    return-void
.end method

.method public onPermissionGranted()V
    .registers 3

    .line 261
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "onPermissionGranted"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 262
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$4;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->access$000(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass5 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$5)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->startInternal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 281
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 282
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 283
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLocaleName:Ljava/lang/String;

    const-string v2, "android.speech.extra.LANGUAGE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "android.speech.extra.EXTRA_ADDITIONAL_LANGUAGES"

    .line 287
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 288
    iget-object v2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLangModel:Ljava/lang/String;

    const-string v3, "android.speech.extra.LANGUAGE_MODEL"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 289
    iget-object v2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget v2, v2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxResults:I

    const-string v3, "android.speech.extra.MAX_RESULTS"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "android.speech.extra.PARTIAL_RESULTS"

    .line 290
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 292
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-wide v1, v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSpeechMillis:J

    const-string v3, "android.speech.extras.SPEECH_INPUT_MINIMUM_LENGTH_MILLIS"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 293
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-wide v1, v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMinSilenceMillis:J

    const-string v3, "android.speech.extras.SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 294
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-wide v1, v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mMaxSilenceMillis:J

    const-string v3, "android.speech.extras.SPEECH_INPUT_COMPLETE_SILENCE_LENGTH_MILLIS"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 295
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->packageName:Ljava/lang/String;

    const-string v2, "calling_package"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 296
    iget-object v1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v1, v0}, Landroid/speech/SpeechRecognizer;->startListening(Landroid/content/Intent;)V

    .line 297
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GoogleVR.started listening; status=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$5;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mStatus:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass6 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$6)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$6;
.super Ljava/lang/Object;
.source "GoogleVR.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->stop()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 307
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$6;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 308
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$6;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v0, v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->sr:Landroid/speech/SpeechRecognizer;

    invoke-virtual {v0}, Landroid/speech/SpeechRecognizer;->stopListening()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.AnonymousClass7 (com.navngo.igo.javaclient.voice_recognition.GoogleVR$7)
.class synthetic Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;
.super Ljava/lang/Object;
.source "GoogleVR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 224
    invoke-static {}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->values()[Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    :try_start_9
    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_1d} :catch_1d

    :catch_1d
    :try_start_1d
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->STARTED:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_28
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1d .. :try_end_28} :catch_28

    :catch_28
    :try_start_28
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->MAY_SPEAK:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_33

    :catch_33
    :try_start_33
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3e

    :catch_3e
    :try_start_3e
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DONE_SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_49
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_49} :catch_49

    :catch_49
    :try_start_49
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$7;->$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status:[I

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->READY:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_54
    .catch Ljava/lang/NoSuchFieldError; {:try_start_49 .. :try_end_54} :catch_54

    :catch_54
    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.Result (com.navngo.igo.javaclient.voice_recognition.GoogleVR$Result)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;
.super Ljava/lang/Object;
.source "GoogleVR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Result"
.end annotation


# instance fields
.field score:F

.field text:Ljava/lang/String;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;Ljava/lang/String;F)V
    .registers 4

    .line 82
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;->text:Ljava/lang/String;

    iput p3, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Result;->score:F

    return-void
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.Status (com.navngo.igo.javaclient.voice_recognition.GoogleVR$Status)
.class final enum Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;
.super Ljava/lang/Enum;
.source "GoogleVR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum DONE_SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum MAY_SPEAK:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum READY:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

.field public static final enum STARTED:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    .line 35
    new-instance v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v1, "DOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DOWN:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 36
    new-instance v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v3, "IDLE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 37
    new-instance v3, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v5, "STARTED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->STARTED:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 38
    new-instance v5, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v7, "MAY_SPEAK"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->MAY_SPEAK:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 39
    new-instance v7, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v9, "SPEAKING"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 40
    new-instance v9, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v11, "DONE_SPEAKING"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->DONE_SPEAKING:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    .line 41
    new-instance v11, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const-string v13, "READY"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->READY:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    const/4 v13, 0x7

    new-array v13, v13, [Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    .line 34
    sput-object v13, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->$VALUES:[Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;
    .registers 2

    .line 34
    const-class v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;
    .registers 1

    .line 34
    sget-object v0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->$VALUES:[Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.voice_recognition.GoogleVR.VRLangReceiver (com.navngo.igo.javaclient.voice_recognition.GoogleVR$VRLangReceiver)
.class Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;
.super Landroid/content/BroadcastReceiver;
.source "GoogleVR.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VRLangReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;)V
    .registers 2

    .line 44
    iput-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 11

    .line 46
    iget-object p1, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string p2, "GoogleVR.VRLangReceiver called"

    invoke-virtual {p1, p2}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 47
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->getResultExtras(Z)Landroid/os/Bundle;

    move-result-object p2

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GoogleVR.VRLangReceiver extras: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    const/4 v0, 0x0

    if-eqz p2, :cond_42

    const-string v1, "android.speech.extra.SUPPORTED_LANGUAGES"

    .line 51
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 52
    iget-object v2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GoogleVR.VRLangReceiver EXTRA_SUPPORTED_LANGUAGES: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    goto :goto_43

    :cond_42
    move-object v1, v0

    .line 54
    :goto_43
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->getResultCode()I

    move-result v2

    const/4 v3, -0x1

    const-string v4, "asr.freetext.init_done"

    const/4 v5, 0x0

    if-ne v2, v3, :cond_ce

    if-nez v1, :cond_51

    goto/16 :goto_ce

    .line 59
    :cond_51
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_55
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7f

    .line 61
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 62
    iget-object v3, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Supported locale: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 63
    iget-object v3, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v3, v3, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mSupportedLocales:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_55

    :cond_7f
    const-string v1, "android.speech.extra.LANGUAGE_PREFERENCE"

    .line 66
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a9

    .line 68
    iget-object v2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, v2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLocaleName:Ljava/lang/String;

    .line 69
    iget-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Current locale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->mLocaleName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 71
    :cond_a9
    iget-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.VRLangReceiver setting idle status"

    invoke-virtual {p2, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 72
    iget-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    sget-object v1, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;->IDLE:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;

    invoke-virtual {p2, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->setStatus(Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$Status;)V

    .line 73
    iget-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    const-string v1, "GoogleVR.VRLangReceiver done"

    invoke-virtual {p2, v1}, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->debugLog(Ljava/lang/String;)V

    .line 74
    iget-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object p2, p2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    new-array v1, p1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v1, v5

    invoke-virtual {p2, v4, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void

    :cond_ce
    :goto_ce
    const-string p2, "GoogleVR"

    const-string v1, "VR Init failed"

    .line 55
    invoke-static {p2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object p2, p0, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR$VRLangReceiver;->this$0:Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;

    iget-object p2, p2, Lcom/navngo/igo/javaclient/voice_recognition/GoogleVR;->go:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, p1, v5

    invoke-virtual {p2, v4, v0, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method
