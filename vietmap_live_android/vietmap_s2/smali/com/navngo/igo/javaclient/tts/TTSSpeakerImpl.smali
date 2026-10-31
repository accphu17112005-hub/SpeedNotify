###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl (com.navngo.igo.javaclient.tts.TTSSpeakerImpl)
.class final Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;
.source "TTSSpeakerImpl.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;
.implements Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;,
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxPicoEngineSpecific;,
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;,
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;,
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;,
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;,
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "TTSSpeakerImpl"


# instance fields
.field private ISO639_2_to_2T:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private iGOLocale:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/Locale;",
            ">;"
        }
    .end annotation
.end field

.field private mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

.field private final mCollectLanguagesLock:Ljava/lang/String;

.field private mCurrentRequestIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mInitDone:Z

.field private mInitDoneLock:Ljava/lang/Object;

.field private mLocale:Ljava/util/Locale;

.field private mPitch:F

.field private mReadyToSpeak:Z

.field private mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

.field private mSpeechRate:F

.field private mSupportedLocales:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTTSEngine:Landroid/speech/tts/TextToSpeech;

.field private final mTTSLock:Ljava/lang/String;

.field private mVoice:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 15

    .line 360
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerAndroidGo;-><init>()V

    .line 37
    new-instance v0, Ljava/lang/String;

    const-string v1, "TTSLock"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    const/4 v0, 0x0

    .line 344
    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    .line 345
    new-instance v1, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-direct {v1, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    const/4 v1, 0x0

    .line 346
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    const/high16 v2, 0x3f800000    # 1.0f

    .line 347
    iput v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpeechRate:F

    .line 348
    iput v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mPitch:F

    .line 349
    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    .line 350
    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mVoice:Ljava/lang/String;

    .line 351
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    .line 352
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    .line 353
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCurrentRequestIds:Ljava/util/ArrayList;

    .line 354
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDoneLock:Ljava/lang/Object;

    .line 355
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDone:Z

    .line 357
    new-instance v0, Ljava/lang/String;

    const-string v1, "CollectLanguagesLock"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCollectLanguagesLock:Ljava/lang/String;

    .line 358
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSupportedLocales:Ljava/util/HashSet;

    .line 368
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "sq"

    const-string v3, "AL"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "ALB"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "ar"

    const-string v3, "AE"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "ARA"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "en"

    const-string v3, "AU"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "AUS"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "be"

    const-string v5, "BY"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v6, "BEL"

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v6, "Latin"

    invoke-direct {v1, v4, v5, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "BET"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "bs"

    const-string v5, "BA"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "BOS"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "pt"

    const-string v5, "BR"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "BRA"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "bg"

    const-string v8, "BG"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "BUL"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "ca"

    const-string v8, "AD"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "CAT"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "zh"

    const-string v8, "CN"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "CHI"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "CHT"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "hr"

    const-string v8, "HR"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "CRO"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "cs"

    const-string v8, "CZ"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "CZE"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "da"

    const-string v8, "DK"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "DAN"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "nl"

    const-string v8, "NL"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "DUT"

    invoke-virtual {v0, v9, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v9, "ZA"

    invoke-direct {v1, v7, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "DUZ"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "ENA"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "GB"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "ENG"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v2, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "ENS"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "US"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "ENU"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "et"

    const-string v9, "EE"

    invoke-direct {v1, v3, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "EST"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "fi"

    const-string v9, "FI"

    invoke-direct {v1, v3, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "FIN"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "fr"

    const-string v9, "FR"

    invoke-direct {v1, v3, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "FRA"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v3, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "FRE"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "sv"

    const-string v9, "SE"

    invoke-direct {v1, v3, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "FSW"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "de"

    const-string v11, "DE"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "GER"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "ga"

    const-string v11, "IE"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "GLE"

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v12, "el"

    const-string v13, "GR"

    invoke-direct {v1, v12, v13}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "GRE"

    invoke-virtual {v0, v13, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v13, "GR"

    invoke-direct {v1, v12, v13, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "GRL"

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v12, "he"

    const-string v13, "IL"

    invoke-direct {v1, v12, v13}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "HEB"

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v12, "hu"

    const-string v13, "HU"

    invoke-direct {v1, v12, v13}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "HUN"

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v12, "is"

    const-string v13, "IS"

    invoke-direct {v1, v12, v13}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "ICE"

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v12, "hi"

    const-string v13, "IN"

    invoke-direct {v1, v12, v13}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "IND"

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "IRE"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "it"

    const-string v11, "IT"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "ITA"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "ja"

    const-string v11, "JP"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "JPN"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "ko"

    const-string v11, "KR"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "KOR"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "lv"

    const-string v11, "LV"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "LAT"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "ms"

    const-string v11, "MY"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "MAL"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v10, "mt"

    const-string v11, "MT"

    invoke-direct {v1, v10, v11}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "MLT"

    invoke-virtual {v0, v10, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "NED"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v7, "no"

    const-string v8, "NO"

    invoke-direct {v1, v7, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "NOR"

    invoke-virtual {v0, v7, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "POB"

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v5, "pl"

    const-string v7, "PL"

    invoke-direct {v1, v5, v7}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "POL"

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v5, "PT"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "POR"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "ro"

    const-string v5, "RO"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "ROM"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "ru"

    const-string v5, "RU"

    invoke-direct {v1, v4, v5, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "RUL"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "ru"

    const-string v5, "RU"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "RUS"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "SG"

    invoke-direct {v1, v2, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "SEN"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "sr"

    const-string v5, "RS"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "SER"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "sk"

    const-string v5, "SK"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "SLO"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "sl"

    const-string v5, "SI"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "SLV"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v4, "es"

    const-string v5, "ES"

    invoke-direct {v1, v4, v5}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "SPA"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    invoke-direct {v1, v3, v9}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "SWE"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "th"

    const-string v4, "TH"

    invoke-direct {v1, v3, v4}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "THA"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v3, "TH"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "THE"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "tr"

    const-string v3, "TR"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "TUR"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "uk"

    const-string v3, "UA"

    invoke-direct {v1, v2, v3}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "UKR"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    new-instance v1, Ljava/util/Locale;

    const-string v2, "uk"

    const-string v3, "UA"

    invoke-direct {v1, v2, v3, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "URL"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "bod"

    const-string v2, "tib"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "ces"

    const-string v2, "cze"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "cym"

    const-string v2, "wel"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "deu"

    const-string v2, "ger"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "ell"

    const-string v2, "gre"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "eus"

    const-string v2, "baq"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "fas"

    const-string v2, "per"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "fra"

    const-string v2, "fre"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "hye"

    const-string v2, "arm"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "isl"

    const-string v2, "ice"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "kat"

    const-string v2, "geo"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "mkd"

    const-string v2, "mac"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "mri"

    const-string v2, "mao"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "msa"

    const-string v2, "may"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "mya"

    const-string v2, "bur"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "nld"

    const-string v2, "dut"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "ron"

    const-string v2, "rum"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "slk"

    const-string v2, "slo"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "sqi"

    const-string v2, "alb"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    const-string v1, "zho"

    const-string v2, "chi"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    return-void
.end method

.method static synthetic access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;
    .registers 1

    .line 34
    iget-object p0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    return-object p0
.end method

.method static synthetic access$100(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/HashMap;
    .registers 1

    .line 34
    iget-object p0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iGOLocale:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$200(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/ArrayList;
    .registers 1

    .line 34
    iget-object p0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCurrentRequestIds:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$300(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;II)V
    .registers 3

    .line 34
    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->reportCompletion(II)V

    return-void
.end method

.method static synthetic access$400(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/lang/String;
    .registers 1

    .line 34
    iget-object p0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCollectLanguagesLock:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/HashSet;
    .registers 1

    .line 34
    iget-object p0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSupportedLocales:Ljava/util/HashSet;

    return-object p0
.end method

.method private reportCompletion(II)V
    .registers 5

    .line 481
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "calling TTS_Finished: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "TTSSpeakerImpl"

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    iget-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mAndroidGo:Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "sound.tts_ssml.sound_finished_callback"

    const/4 v1, 0x0

    invoke-virtual {p2, p1, v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method private resolveTag(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 719
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/16 v1, 0x1b

    .line 721
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_14

    .line 723
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-virtual {v1, p1, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->resolveTag(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_14
    add-int/lit8 v3, v2, 0x1

    :goto_16
    const/16 v4, 0x3d

    .line 727
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    if-gez v4, :cond_37

    .line 731
    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    const-string v5, ""

    if-gez v4, :cond_2e

    .line 733
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4a

    .line 737
    :cond_2e
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b4

    :cond_37
    add-int/lit8 v5, v4, 0x1

    .line 741
    invoke-virtual {p1, v1, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    if-gez v6, :cond_a8

    .line 743
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_4a
    const/4 v1, 0x0

    .line 754
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const-string v1, "item"

    .line 756
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a1

    .line 760
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "resolveItem; a=\'"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', ph=\'"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "ph"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', ort=\'"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "ort"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "TTSSpeakerImpl"

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 761
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-virtual {p1, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->resolveItem(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 764
    :cond_a1
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-virtual {v1, p1, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->resolveTag(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 747
    :cond_a8
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v4, v6

    :goto_b4
    add-int/lit8 v3, v4, 0x1

    goto/16 :goto_16
.end method


# virtual methods
.method public GetSupportedLanguages()Lcom/navngo/igo/javaclient/androidgo/types/CString;
    .registers 6

    const-string v0, "TTSSpeakerImpl"

    const-string v1, "TTS onInit getting available locales begin"

    .line 503
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ""

    .line 505
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCollectLanguagesLock:Ljava/lang/String;

    monitor-enter v1

    .line 506
    :try_start_c
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSupportedLocales:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 507
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_26

    move-object v0, v3

    goto :goto_12

    .line 510
    :cond_26
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_12

    .line 513
    :cond_3b
    monitor-exit v1
    :try_end_3c
    .catchall {:try_start_c .. :try_end_3c} :catchall_42

    .line 514
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/types/CString;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/types/CString;-><init>(Ljava/lang/String;)V

    return-object v1

    :catchall_42
    move-exception v0

    .line 513
    :try_start_43
    monitor-exit v1
    :try_end_44
    .catchall {:try_start_43 .. :try_end_44} :catchall_42

    throw v0
.end method

.method public create()V
    .registers 4

    .line 663
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    .line 664
    :try_start_3
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    if-nez v1, :cond_1b

    const-string v1, "TTSSpeakerImpl"

    const-string v2, "create()"

    .line 665
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    new-instance v1, Landroid/speech/tts/TextToSpeech;

    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    .line 668
    :cond_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_41

    .line 670
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDone:Z

    if-eqz v0, :cond_21

    return-void

    :cond_21
    const-string v0, "TTSSpeakerImpl"

    const-string v1, "mInitDone.wait() start"

    .line 673
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    :goto_28
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDone:Z

    if-nez v0, :cond_40

    .line 675
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDoneLock:Ljava/lang/Object;

    monitor-enter v0

    .line 677
    :try_start_2f
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDoneLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_34
    .catch Ljava/lang/InterruptedException; {:try_start_2f .. :try_end_34} :catch_38
    .catchall {:try_start_2f .. :try_end_34} :catchall_36

    .line 682
    :try_start_34
    monitor-exit v0

    goto :goto_28

    :catchall_36
    move-exception v1

    goto :goto_3e

    :catch_38
    move-exception v1

    .line 679
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 680
    monitor-exit v0

    return-void

    .line 682
    :goto_3e
    monitor-exit v0
    :try_end_3f
    .catchall {:try_start_34 .. :try_end_3f} :catchall_36

    throw v1

    :cond_40
    return-void

    :catchall_41
    move-exception v1

    .line 668
    :try_start_42
    monitor-exit v0
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_41

    throw v1
.end method

.method public destroy()V
    .registers 4

    .line 701
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    :try_start_3
    const-string v1, "TTSSpeakerImpl"

    const-string v2, "destroy()"

    .line 702
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 703
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    .line 704
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    const/4 v2, 0x0

    if-eqz v1, :cond_17

    .line 705
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->stop()I

    .line 706
    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    .line 708
    :cond_17
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    if-eqz v1, :cond_20

    .line 709
    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    .line 710
    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    .line 712
    :cond_20
    monitor-exit v0

    return-void

    :catchall_22
    move-exception v1

    monitor-exit v0
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_22

    throw v1
.end method

.method public getVariant()Ljava/lang/String;
    .registers 2

    .line 687
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->create()V

    .line 688
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 689
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_18
    const-string v0, ""

    return-object v0
.end method

.method public getVoiceVolume()I
    .registers 4

    .line 770
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->ROOT_MODEL:Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    const-string v1, "sound.voice_volume"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->getIntModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    move-result-object v0

    .line 771
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 772
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "voiceVolume="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TTSSpeakerImpl"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public iso639_2_to_2T(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x0

    return-object p1

    .line 460
    :cond_4
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->ISO639_2_to_2T:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_f

    goto :goto_10

    :cond_f
    move-object p1, v0

    :goto_10
    return-object p1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 636
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onActivityResult; resultCode=\'"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "TTSSpeakerImpl"

    invoke-static {v0, p3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p3, 0x4e2

    if-ne p1, p3, :cond_63

    const/4 p1, 0x1

    if-eq p2, p1, :cond_43

    .line 639
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "chkdata failed "

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", but anyway, supported="

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    :cond_43
    iget-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    if-eqz p2, :cond_51

    .line 643
    invoke-virtual {p2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p2

    iget-object p3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mVoice:Ljava/lang/String;

    invoke-virtual {p0, p2, p3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->setLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_61

    .line 646
    :cond_51
    iget-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p2}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object p2

    iput-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    if-nez p2, :cond_61

    .line 648
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    iput-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    .line 651
    :cond_61
    :goto_61
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    :cond_63
    return-void
.end method

.method public onInit(I)V
    .registers 10

    const-string v0, "TTSSpeakerImpl"

    .line 519
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TTS onInit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "TTSSpeakerImpl"

    const-string v1, "Source info $HeadURL$"

    .line 520
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "TTSSpeakerImpl"

    const-string v1, "Source rev $Revision$"

    .line 521
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "TTSSpeakerImpl"

    const-string v1, "Source timestamp $Date$"

    .line 522
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    const/4 v1, 0x1

    if-nez p1, :cond_142

    .line 525
    :try_start_31
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p1}, Landroid/speech/tts/TextToSpeech;->getDefaultEngine()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4b

    const-string v2, "TTSSpeakerImpl"

    const-string v3, "TTS onInit default engine is null"

    .line 527
    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 528
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;

    const-string v3, "xsampa"

    invoke-direct {v2, p0, v3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto/16 :goto_da

    :cond_4b
    const-string v2, "TTSSpeakerImpl"

    .line 530
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TTS onInit engine="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "com.svox.pico"

    .line 532
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 533
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxPicoEngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxPicoEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    :cond_71
    const-string v2, "com.svox"

    .line 535
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_81

    .line 536
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    :cond_81
    const-string v2, "com.ivona.tts"

    .line 538
    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_91

    .line 539
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    :cond_91
    const-string v2, "com.parrot.hsti.tts"

    .line 541
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a1

    .line 542
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    :cond_a1
    const-string v2, "edu.cmu.cs.speech.tts.flite"

    .line 544
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b1

    .line 545
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    :cond_b1
    const-string v2, "com.samsung.SMT"

    .line 547
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c1

    .line 548
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    :cond_c1
    const-string v2, "com.google.android.tts"

    .line 550
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d1

    .line 551
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    goto :goto_da

    .line 554
    :cond_d1
    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;

    const-string v3, "xsampa"

    invoke-direct {v2, p0, v3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    .line 558
    :goto_da
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->InitCurrentLocale(Ljava/util/Locale;)V

    .line 560
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    if-eqz v2, :cond_ef

    .line 561
    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mVoice:Ljava/lang/String;

    invoke-virtual {p0, v2, v3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->setLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_ff

    .line 564
    :cond_ef
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v2}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v2

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    if-nez v2, :cond_ff

    .line 566
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    iput-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    .line 569
    :cond_ff
    :goto_ff
    iget v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpeechRate:F

    float-to-double v3, v2

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    cmpl-double v7, v3, v5

    if-eqz v7, :cond_10d

    .line 570
    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v3, v2}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    .line 571
    :cond_10d
    iget v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mPitch:F

    float-to-double v3, v2

    cmpl-double v7, v3, v5

    if-eqz v7, :cond_119

    .line 572
    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v3, v2}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I

    .line 573
    :cond_119
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v2, p0}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceCompletedListener(Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;)I

    .line 575
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 576
    invoke-virtual {v2, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "android.speech.tts.engine.CHECK_TTS_DATA"

    .line 577
    invoke-virtual {v2, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 599
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    const-string p1, "TTSSpeakerImpl"

    const-string v2, "Supported locales start"

    .line 601
    invoke-static {p1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 602
    new-instance p1, Ljava/lang/Thread;

    new-instance v2, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;

    invoke-direct {v2, p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    invoke-direct {p1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 622
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_145

    :cond_142
    const/4 p1, 0x0

    .line 625
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    .line 627
    :goto_145
    monitor-exit v0
    :try_end_146
    .catchall {:try_start_31 .. :try_end_146} :catchall_155

    .line 629
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDoneLock:Ljava/lang/Object;

    monitor-enter p1

    .line 630
    :try_start_149
    iput-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDone:Z

    .line 631
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mInitDoneLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 632
    monitor-exit p1

    return-void

    :catchall_152
    move-exception v0

    monitor-exit p1
    :try_end_154
    .catchall {:try_start_149 .. :try_end_154} :catchall_152

    throw v0

    :catchall_155
    move-exception p1

    .line 627
    :try_start_156
    monitor-exit v0
    :try_end_157
    .catchall {:try_start_156 .. :try_end_157} :catchall_155

    throw p1
.end method

.method public onUtteranceCompleted(Ljava/lang/String;)V
    .registers 8

    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onUtteranceCompleted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TTSSpeakerImpl"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x2c

    .line 487
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v2, 0x0

    .line 488
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v0, v0, 0x1

    .line 489
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 491
    iget-object v4, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCurrentRequestIds:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    const-string v5, "Completed utterance \'"

    if-eqz v4, :cond_51

    .line 492
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\' but the request list is empty"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_76

    .line 493
    :cond_51
    iget-object v4, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCurrentRequestIds:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, v3, :cond_76

    .line 494
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\' is not at the front of the request list"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    :cond_76
    :goto_76
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCurrentRequestIds:Ljava/util/ArrayList;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9a

    .line 497
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\' was not found in the request list"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9f

    :cond_9a
    if-ltz v3, :cond_9f

    .line 499
    invoke-direct {p0, v3, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->reportCompletion(II)V

    :cond_9f
    :goto_9f
    return-void
.end method

.method public parseLocale(Ljava/lang/String;)Ljava/util/Locale;
    .registers 6

    const-string v0, "[-_]"

    .line 466
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 467
    array-length v1, v0

    if-eqz v1, :cond_2e

    const/4 p1, 0x0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_26

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1c

    .line 477
    new-instance v1, Ljava/util/Locale;

    aget-object p1, v0, p1

    aget-object v2, v0, v2

    aget-object v0, v0, v3

    invoke-direct {v1, p1, v2, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 475
    :cond_1c
    new-instance v1, Ljava/util/Locale;

    aget-object p1, v0, p1

    aget-object v0, v0, v2

    invoke-direct {v1, p1, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 472
    :cond_26
    new-instance v1, Ljava/util/Locale;

    aget-object p1, v0, p1

    invoke-direct {v1, p1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 469
    :cond_2e
    new-instance v0, Ljava/util/Locale;

    invoke-direct {v0, p1}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public say(ILjava/lang/String;)V
    .registers 10

    const-string v0, "TTSSpeakerImpl"

    .line 783
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "say("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x1b

    const/16 v3, 0x5e

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 784
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    .line 785
    :try_start_2e
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->setLanguageIfChangedByExternal()V

    .line 786
    monitor-exit v0
    :try_end_34
    .catchall {:try_start_2e .. :try_end_34} :catchall_154

    .line 787
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->create()V

    .line 788
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v1

    .line 789
    :try_start_3a
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    if-eqz v0, :cond_125

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->getVoiceVolume()I

    move-result v0

    if-lez v0, :cond_125

    .line 791
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "streamType"

    .line 792
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getSoundStream()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "utteranceId"

    .line 793
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getEngineIndex()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "volume"

    .line 794
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->getVoiceVolume()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x437f0000    # 255.0f

    div-float/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, ""

    const/4 v3, 0x0

    :goto_a1
    const-string v4, "<\u001b"

    .line 801
    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    if-gez v4, :cond_b2

    .line 803
    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_e5

    .line 807
    :cond_b2
    invoke-virtual {p2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u001b>"

    .line 808
    invoke-virtual {p2, v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-gez v3, :cond_113

    const-string v3, "TTSSpeakerImpl"

    .line 810
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Missing end-of-item marker; \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 811
    invoke-virtual {p2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_e5
    const-string v2, "TTSSpeakerImpl"

    .line 819
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "requestId: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " text = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mCurrentRequestIds:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 821
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    const/4 v2, 0x1

    invoke-virtual {p1, p2, v2, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->speak(Ljava/lang/String;ILjava/util/HashMap;)I

    goto :goto_14f

    :cond_113
    add-int/lit8 v4, v4, 0x2

    .line 815
    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->resolveTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, v3, 0x2

    goto/16 :goto_a1

    :cond_125
    const-string v0, "TTSSpeakerImpl"

    .line 824
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "skipping due to muted state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " text = \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\'"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 826
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getEngineIndex()I

    move-result p2

    invoke-direct {p0, p1, p2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->reportCompletion(II)V

    .line 828
    :goto_14f
    monitor-exit v1

    return-void

    :catchall_151
    move-exception p1

    monitor-exit v1
    :try_end_153
    .catchall {:try_start_3a .. :try_end_153} :catchall_151

    throw p1

    :catchall_154
    move-exception p1

    .line 786
    :try_start_155
    monitor-exit v0
    :try_end_156
    .catchall {:try_start_155 .. :try_end_156} :catchall_154

    throw p1
.end method

.method public setLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7

    const-string v0, "TTSSpeakerImpl"

    .line 866
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLanguageAndVoice("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 868
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    .line 869
    :try_start_26
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->parseLocale(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    .line 870
    iput-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mVoice:Ljava/lang/String;

    .line 871
    iget-boolean p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p2, :cond_57

    const-string p1, "TTSSpeakerImpl"

    .line 872
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deferring TTS language setting; locale=\'"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    invoke-virtual {v3}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\'"

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    goto :goto_83

    .line 874
    :cond_57
    iget-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    invoke-virtual {p2, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->setLanguage(Ljava/util/Locale;)I

    move-result p1

    if-ltz p1, :cond_82

    const-string p1, "TTSSpeakerImpl"

    .line 875
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Setting TTS language; locale=\'"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 876
    monitor-exit v0

    return v2

    :cond_82
    const/4 p1, 0x0

    .line 878
    :goto_83
    monitor-exit v0
    :try_end_84
    .catchall {:try_start_26 .. :try_end_84} :catchall_ac

    if-eqz p1, :cond_8a

    .line 880
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->create()V

    return v2

    :cond_8a
    const-string p1, "TTSSpeakerImpl"

    .line 883
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "No TTS support for this language; locale=\'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mLocale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :catchall_ac
    move-exception p1

    .line 878
    :try_start_ad
    monitor-exit v0
    :try_end_ae
    .catchall {:try_start_ad .. :try_end_ae} :catchall_ac

    throw p1
.end method

.method public setSampleRate(I)V
    .registers 5

    const-string v0, "TTSSpeakerImpl"

    .line 906
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSampleRate("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 907
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    if-lez p1, :cond_26

    int-to-float p1, p1

    const v1, 0x462c4400    # 11025.0f

    div-float/2addr p1, v1

    goto :goto_28

    :cond_26
    const/high16 p1, 0x3f800000    # 1.0f

    .line 909
    :goto_28
    :try_start_28
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    if-eqz v1, :cond_37

    iget v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mPitch:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_37

    .line 910
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1, p1}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I

    .line 911
    :cond_37
    iput p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mPitch:F

    .line 912
    monitor-exit v0

    return-void

    :catchall_3b
    move-exception p1

    monitor-exit v0
    :try_end_3d
    .catchall {:try_start_28 .. :try_end_3d} :catchall_3b

    throw p1
.end method

.method public setSpeed(I)V
    .registers 5

    const-string v0, "TTSSpeakerImpl"

    .line 892
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSpeed("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 893
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    if-lez p1, :cond_25

    int-to-float p1, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p1, v1

    goto :goto_28

    :cond_25
    const p1, 0x3c23d70a    # 0.01f

    .line 895
    :goto_28
    :try_start_28
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    if-eqz v1, :cond_37

    iget v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpeechRate:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_37

    .line 896
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1, p1}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    .line 897
    :cond_37
    iput p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpeechRate:F

    .line 898
    monitor-exit v0

    return-void

    :catchall_3b
    move-exception p1

    monitor-exit v0
    :try_end_3d
    .catchall {:try_start_28 .. :try_end_3d} :catchall_3b

    throw p1
.end method

.method public stop()V
    .registers 4

    .line 918
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0

    :try_start_3
    const-string v1, "TTSSpeakerImpl"

    const-string v2, "stop()"

    .line 919
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 921
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mSpecific:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;

    if-eqz v1, :cond_19

    .line 922
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->stop()I

    const/4 v1, -0x1

    .line 925
    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getEngineIndex()I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->reportCompletion(II)V

    .line 927
    :cond_19
    monitor-exit v0

    return-void

    :catchall_1b
    move-exception v1

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1b

    throw v1
.end method

.method public testLanguageAndVoice(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12

    const-string v0, "TTSSpeakerImpl"

    .line 832
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "testLanguageAndVoice("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 834
    :try_start_24
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSLock:Ljava/lang/String;

    monitor-enter v0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_27} :catch_e4

    .line 835
    :try_start_27
    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mReadyToSpeak:Z

    const/4 v2, 0x1

    if-nez v1, :cond_49

    const-string v1, "TTSSpeakerImpl"

    .line 836
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "TTS language testing not yet available; locale=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 837
    monitor-exit v0

    return v2

    .line 839
    :cond_49
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->parseLocale(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p1

    .line 841
    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v1

    .line 842
    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v3

    .line 843
    invoke-virtual {p1}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v4

    .line 847
    iget-object v5, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->mTTSEngine:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v5, p1}, Landroid/speech/tts/TextToSpeech;->isLanguageAvailable(Ljava/util/Locale;)I

    move-result v5

    const-string v6, "TTSSpeakerImpl"

    .line 849
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "testLanguage(\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', \'"

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', \'"

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\') = "

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-ltz v5, :cond_c0

    const-string v1, "TTSSpeakerImpl"

    .line 852
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Supported TTS language; locale=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\', level=\'"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 853
    monitor-exit v0

    return v2

    :cond_c0
    const-string v1, "TTSSpeakerImpl"

    .line 855
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No TTS support for this language; locale=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 856
    monitor-exit v0

    return p2

    :catchall_e1
    move-exception p1

    .line 857
    monitor-exit v0
    :try_end_e3
    .catchall {:try_start_27 .. :try_end_e3} :catchall_e1

    :try_start_e3
    throw p1
    :try_end_e4
    .catch Ljava/lang/Exception; {:try_start_e3 .. :try_end_e4} :catch_e4

    :catch_e4
    move-exception p1

    .line 860
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return p2
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.AnonymousClass1 (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$1)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;
.super Ljava/lang/Object;
.source "TTSSpeakerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->onInit(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 2

    .line 602
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .line 604
    invoke-static {}, Ljava/util/Locale;->getAvailableLocales()[Ljava/util/Locale;

    move-result-object v0

    const-string v1, "TTSSpeakerImpl"

    const-string v2, "Supported locales: "

    .line 605
    invoke-static {v1, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$400(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/lang/String;

    move-result-object v1

    monitor-enter v1

    .line 607
    :try_start_12
    array-length v2, v0

    const/4 v3, 0x0

    :goto_14
    if-ge v3, v2, :cond_5c

    aget-object v4, v0, v3

    .line 610
    invoke-virtual {v4}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_59

    .line 611
    iget-object v5, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v5}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/speech/tts/TextToSpeech;->isLanguageAvailable(Ljava/util/Locale;)I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_59

    .line 613
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "TTSSpeakerImpl"

    .line 614
    invoke-static {v5, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    iget-object v5, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$1;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v5}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$500(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/HashSet;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 619
    :cond_5c
    monitor-exit v1

    return-void

    :catchall_5e
    move-exception v0

    monitor-exit v1
    :try_end_60
    .catchall {:try_start_12 .. :try_end_60} :catchall_5e

    throw v0
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$EngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;
.super Ljava/lang/Object;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EngineSpecific"
.end annotation


# instance fields
.field currentTTSLocale:Ljava/util/Locale;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 2

    .line 45
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    return-void
.end method


# virtual methods
.method InitCurrentLocale(Ljava/util/Locale;)V
    .registers 2

    .line 48
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    return-void
.end method

.method resolveItem(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "ort"

    .line 53
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_c

    const-string p1, ""

    :cond_c
    return-object p1
.end method

.method resolveTag(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string p1, ""

    return-object p1
.end method

.method setLanguage(Ljava/util/Locale;)I
    .registers 5

    .line 75
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 p1, 0x0

    return p1

    .line 77
    :cond_a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v0

    .line 78
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v1

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v1

    iput-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    .line 79
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLanguage(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\') = "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "TTSSpeakerImpl"

    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method setLanguageIfChangedByExternal()V
    .registers 4

    .line 63
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    if-nez v0, :cond_9

    return-void

    .line 65
    :cond_9
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v1

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "TTSSpeakerImpl"

    if-eqz v0, :cond_23

    const-string v0, "setLanguageIfChangedByExternal() no need to do anything"

    .line 66
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 69
    :cond_23
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->setLanguage(Ljava/util/Locale;)I

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLanguageIfChangedByExternal() language set to "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method speak(Ljava/lang/String;ILjava/util/HashMap;)I
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "speak; text=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz p3, :cond_58

    .line 92
    invoke-virtual {p3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 93
    :goto_20
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_58

    .line 94
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 95
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "=\'"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    :cond_58
    const-string v1, "TTSSpeakerImpl"

    .line 98
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    if-nez v0, :cond_67

    const/4 p1, 0x0

    goto :goto_71

    :cond_67
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I

    move-result p1

    :goto_71
    return p1
.end method

.method stop()I
    .registers 2

    .line 84
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    if-nez v0, :cond_a

    const/4 v0, 0x0

    return v0

    .line 86
    :cond_a
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->stop()I

    move-result v0

    return v0
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.IvonaEngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$IvonaEngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IvonaEngineSpecific"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 2

    .line 200
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    return-void
.end method


# virtual methods
.method formatOrtho(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    if-eqz p2, :cond_27

    .line 205
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_27

    .line 207
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<say-as interpret-as=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\'>"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</say-as>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_27
    :goto_27
    return-object p1
.end method

.method formatOrtho(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    if-eqz p3, :cond_30

    .line 210
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_30

    .line 212
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<say-as interpret-as=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\' format=\'"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\'>"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</say-as>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 211
    :cond_30
    :goto_30
    invoke-virtual {p0, p1, p2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->formatOrtho(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method resolveItem(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "ph"

    .line 216
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ort"

    .line 217
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "otype"

    .line 218
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-nez v2, :cond_1c

    const-string v2, "address"

    :cond_1c
    const-string v3, "lang"

    .line 222
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_33

    .line 224
    iget-object v4, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v4}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$100(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Locale;

    goto :goto_35

    .line 226
    :cond_33
    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    :goto_35
    if-eqz v0, :cond_db

    const-string v4, "\'"

    const-string v5, "_j"

    .line 229
    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "a"

    .line 230
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_4b

    const/4 p1, 0x0

    goto :goto_51

    :cond_4b
    const/16 v4, 0xa

    .line 231
    invoke-static {p1, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p1

    :goto_51
    const-string v4, "x-sampa"

    if-eqz p1, :cond_93

    const/4 v5, 0x2

    if-eq p1, v5, :cond_78

    const/4 v3, 0x6

    if-eq p1, v3, :cond_93

    const/4 v3, 0x7

    if-eq p1, v3, :cond_75

    .line 253
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported alphabet: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v3, "TTSSpeakerImpl"

    invoke-static {v3, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_93

    :cond_75
    const-string v4, "ipa"

    goto :goto_93

    .line 241
    :cond_78
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "nt-sampa-"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-virtual {v3}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->iso639_2_to_2T(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_93
    :goto_93
    const-string p1, "\" ph=\'"

    const-string v3, "<phoneme alphabet=\""

    if-eqz v1, :cond_c0

    .line 258
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'>"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1, v2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->formatOrtho(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</phoneme>"

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 259
    :cond_c0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\'/>"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_db
    if-eqz v1, :cond_e2

    .line 261
    invoke-virtual {p0, v1, v2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$IvonaEngineSpecific;->formatOrtho(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_e4

    :cond_e2
    const-string p1, ""

    :goto_e4
    return-object p1
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.LGEEngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$LGEEngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LGEEngineSpecific"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific$MessageType;
    }
.end annotation


# static fields
.field public static final KEY_PARAM_AUDIO_FORMAT:Ljava/lang/String; = "audioFormat"

.field public static final KEY_PARAM_MESSAGE_TYPE:Ljava/lang/String; = "messageType"


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 2

    .line 265
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    return-void
.end method


# virtual methods
.method resolveItem(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "ph"

    .line 281
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ort"

    .line 282
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "lang"

    .line 283
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_27

    .line 287
    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$100(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Locale;

    goto :goto_28

    :cond_27
    const/4 p1, 0x0

    :goto_28
    if-nez p1, :cond_2c

    .line 289
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    .line 291
    :cond_2c
    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    if-nez v1, :cond_3a

    const-string v1, ""

    :cond_3a
    if-nez v0, :cond_3d

    return-object v1

    .line 296
    :cond_3d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<phoneme alphabet=\"x-L&amp;H\" xml:lang=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" ph=\""

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\\"

    const-string v3, "\\\\"

    invoke-virtual {v0, p1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\""

    const-string v3, "\\\""

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\">"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</phoneme>"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method setLanguage(Ljava/util/Locale;)I
    .registers 4

    .line 301
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 302
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_29

    .line 304
    :cond_25
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    const/4 p1, 0x2

    return p1

    :cond_29
    :goto_29
    const/4 p1, -0x2

    return p1
.end method

.method speak(Ljava/lang/String;ILjava/util/HashMap;)I
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    .line 309
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "messageType"

    invoke-virtual {p3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<speak>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</speak>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;->speak(Ljava/lang/String;ILjava/util/HashMap;)I

    move-result p1

    return p1
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.LGEEngineSpecific.MessageType (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$LGEEngineSpecific$MessageType)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific$MessageType;
.super Ljava/lang/Object;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MessageType"
.end annotation


# static fields
.field public static final ALERT:I = 0x1

.field public static final GUIDANCE:I = 0x0

.field public static final POI:I = 0x2

.field public static final TRAFFIC:I = 0x3


# instance fields
.field final synthetic this$1:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;)V
    .registers 2

    .line 272
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific$MessageType;->this$1:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$LGEEngineSpecific;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.ParrotEngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$ParrotEngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ParrotEngineSpecific"
.end annotation


# instance fields
.field private final alphabetName:[Ljava/lang/String;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 10

    .line 130
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    const-string v0, "x-sampa"

    const-string v1, "x-sampa"

    const-string v2, "x-NAVTEQ-sampa"

    const-string v3, "x-sampa"

    const-string v4, "x-sampa"

    const-string v5, "x-sampa"

    const-string v6, "x-sampa"

    const-string v7, "ipa"

    .line 131
    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->alphabetName:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method resolveItem(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "ph"

    .line 145
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ort"

    .line 146
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v0, :cond_d3

    const-string v2, "\\"

    const-string v3, "\\\\"

    .line 148
    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "\""

    const-string v3, "\\\""

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "a"

    .line 149
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x0

    if-nez v2, :cond_2f

    const/4 v2, 0x0

    goto :goto_35

    :cond_2f
    const/16 v4, 0xa

    .line 150
    invoke-static {v2, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    :goto_35
    if-ltz v2, :cond_8b

    .line 152
    iget-object v4, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->alphabetName:[Ljava/lang/String;

    array-length v5, v4

    if-lt v2, v5, :cond_3d

    goto :goto_8b

    :cond_3d
    const/4 v3, 0x2

    if-ne v2, v3, :cond_88

    const/4 v3, 0x0

    const-string v4, "lang"

    .line 161
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_58

    .line 163
    iget-object v3, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$100(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Ljava/util/Locale;

    :cond_58
    if-nez v3, :cond_5f

    .line 166
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->alphabetName:[Ljava/lang/String;

    aget-object p1, p1, v2

    goto :goto_8f

    .line 168
    :cond_5f
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->alphabetName:[Ljava/lang/String;

    aget-object v2, v4, v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_8f

    .line 172
    :cond_88
    aget-object p1, v4, v2

    goto :goto_8f

    .line 155
    :cond_8b
    :goto_8b
    iget-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->alphabetName:[Ljava/lang/String;

    aget-object p1, p1, v3

    :goto_8f
    const-string v2, "\" ph=\""

    const-string v3, "<phoneme alphabet=\""

    if-eqz v1, :cond_b8

    .line 175
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\">"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</phoneme>"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 176
    :cond_b8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"/>"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_d3
    if-eqz v1, :cond_d6

    goto :goto_d8

    :cond_d6
    const-string v1, ""

    :goto_d8
    return-object v1
.end method

.method setLanguage(Ljava/util/Locale;)I
    .registers 4

    .line 183
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->currentTTSLocale:Ljava/util/Locale;

    .line 184
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$ParrotEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$000(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    if-nez v0, :cond_c

    const/4 p1, 0x0

    return p1

    .line 192
    :cond_c
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 193
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/util/Locale;->getISO3Country()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_31

    goto :goto_33

    :cond_31
    const/4 p1, 0x2

    return p1

    :cond_33
    :goto_33
    const/4 p1, -0x2

    return p1
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.SSMLEngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$SSMLEngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SSMLEngineSpecific"
.end annotation


# instance fields
.field mAlphabet:Ljava/lang/String;

.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;Ljava/lang/String;)V
    .registers 3

    .line 125
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$EngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    .line 126
    iput-object p2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;->mAlphabet:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method resolveItem(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "ph"

    .line 114
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ort"

    .line 115
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz v0, :cond_6a

    const-string v1, "\\"

    const-string v2, "\\\\"

    .line 117
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\""

    const-string v2, "\\\""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\" ph=\""

    const-string v2, "<phoneme alphabet=\""

    if-eqz p1, :cond_4d

    .line 119
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;->mAlphabet:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\">"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</phoneme>"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 120
    :cond_4d
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;->mAlphabet:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\"/>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_6a
    if-eqz p1, :cond_6d

    goto :goto_6f

    :cond_6d
    const-string p1, ""

    :goto_6f
    return-object p1
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.SVoxEngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$SVoxEngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SVoxEngineSpecific"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 3

    .line 327
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    const-string v0, "xsampa"

    .line 328
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method stop()I
    .registers 4

    .line 333
    :goto_0
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$200(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_46

    .line 334
    iget-object v0, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {v0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$200(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 335
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cancelling request \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "TTSSpeakerImpl"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D5(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-static {}, Lcom/navngo/igo/javaclient/ServerRunner;->getEngineIndex()I

    move-result v2

    invoke-static {v1, v0, v2}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;->access$300(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;II)V

    goto :goto_0

    .line 338
    :cond_46
    invoke-super {p0}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SSMLEngineSpecific;->stop()I

    move-result v0

    return v0
.end method

###### Class com.navngo.igo.javaclient.tts.TTSSpeakerImpl.SVoxPicoEngineSpecific (com.navngo.igo.javaclient.tts.TTSSpeakerImpl$SVoxPicoEngineSpecific)
.class Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxPicoEngineSpecific;
.super Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;
.source "TTSSpeakerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SVoxPicoEngineSpecific"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V
    .registers 2

    .line 314
    iput-object p1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxPicoEngineSpecific;->this$0:Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxEngineSpecific;-><init>(Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl;)V

    return-void
.end method


# virtual methods
.method resolveItem(Ljava/util/HashMap;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "ph"

    .line 316
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "ort"

    .line 317
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v1, ""

    if-eqz v0, :cond_4b

    const-string p1, "\\"

    const-string v2, "\\\\"

    .line 319
    invoke-virtual {v0, p1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "\""

    const-string v2, "\\\""

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "#"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 320
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<phoneme alphabet=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/tts/TTSSpeakerImpl$SVoxPicoEngineSpecific;->mAlphabet:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\" ph=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\"/>"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4b
    if-eqz p1, :cond_4e

    goto :goto_4f

    :cond_4e
    move-object p1, v1

    :goto_4f
    return-object p1
.end method
