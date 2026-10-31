###### Class com.navngo.igo.primo.PrimoServiceGooglePlay (com.navngo.igo.primo.PrimoServiceGooglePlay)
.class public Lcom/navngo/igo/primo/PrimoServiceGooglePlay;
.super Lcom/navngo/igo/javaclient/MainService;
.source "PrimoServiceGooglePlay.java"


# static fields
.field private static final logname:Ljava/lang/String; = "PrimoServiceGooglePlay"


# instance fields
.field private mExternalCommandReceiver:Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;

.field private mHudInitialiser:Lcom/navngo/igo/javaclient/HudInitialiser;

.field private mPapagoLocationReceiver:Lcom/navngo/igo/javaclient/PapagoLocationReceiver;

.field private final mTTSCyberon:Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 35
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/MainService;-><init>()V

    .line 41
    new-instance v0, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoServiceGooglePlay;->mTTSCyberon:Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;

    return-void
.end method


# virtual methods
.method public onCreate()V
    .registers 5

    .line 45
    invoke-super {p0}, Lcom/navngo/igo/javaclient/MainService;->onCreate()V

    .line 50
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "PrimoServiceSharedPreferences"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/navngo/igo/javaclient/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "phoneNumber"

    const-string v2, ""

    .line 51
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/navngo/igo/javaclient/Encryptor;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2a

    const/4 v2, 0x1

    .line 56
    invoke-static {v2}, Lcom/navngo/igo/javaclient/Application;->exit(Z)V

    :cond_2a
    if-eqz v0, :cond_4d

    .line 59
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4d

    .line 60
    invoke-static {}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->getInstace()Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "+"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->setID(Ljava/lang/String;)V

    :cond_4d
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .line 109
    invoke-super {p0}, Lcom/navngo/igo/javaclient/MainService;->onDestroy()V

    .line 110
    iget-object v0, p0, Lcom/navngo/igo/primo/PrimoServiceGooglePlay;->mExternalCommandReceiver:Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;

    if-eqz v0, :cond_a

    .line 111
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;->unregister()V

    :cond_a
    return-void
.end method

.method public registerInterfaces()V
    .registers 3

    .line 66
    invoke-super {p0}, Lcom/navngo/igo/javaclient/MainService;->registerInterfaces()V

    .line 68
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    .line 71
    sget-object v1, Lcom/navngo/igo/javaclient/functors/MailSmsContacts;->INSTANCE:Lcom/navngo/igo/javaclient/functors/MailSmsContacts;

    .line 72
    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 73
    new-instance v1, Lcom/navngo/igo/javaclient/functors/IgoEvents;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/IgoEvents;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 74
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAntHttpUtility()Lcom/navngo/igo/javaclient/utils/AntHttpUtility;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 75
    new-instance v1, Lcom/navngo/igo/javaclient/functors/GPSFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/GPSFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 76
    new-instance v1, Lcom/navngo/igo/javaclient/functors/SettingIntentFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/SettingIntentFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 77
    new-instance v1, Lcom/navngo/igo/javaclient/functors/IntentFunctor;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/IntentFunctor;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 79
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 80
    invoke-static {}, Lcom/navngo/igo/javaclient/Sound;->getInstance()Lcom/navngo/igo/javaclient/Sound;

    move-result-object v1

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Sound;->getMutingDevice()Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 81
    new-instance v1, Lcom/navngo/igo/javaclient/functors/BrowserFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/BrowserFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 82
    invoke-static {}, Lcom/navngo/igo/javaclient/browser/InAppBrowser;->getInstance()Lcom/navngo/igo/javaclient/browser/InAppBrowser;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 83
    new-instance v1, Lcom/navngo/igo/javaclient/functors/NavfusionFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/NavfusionFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 84
    new-instance v1, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 85
    new-instance v1, Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 86
    new-instance v1, Lcom/navngo/igo/javaclient/functors/LocaleFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/functors/LocaleFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 87
    new-instance v1, Lcom/navngo/igo/javaclient/HttpLogFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/HttpLogFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 88
    new-instance v1, Lcom/navngo/igo/javaclient/ValidationFunctors;

    invoke-direct {v1}, Lcom/navngo/igo/javaclient/ValidationFunctors;-><init>()V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 91
    sget-object v1, Lcom/navngo/igo/javaclient/store/IgoStore;->INSTANCE:Lcom/navngo/igo/javaclient/store/IgoStore;

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->registerFunctorCollection(Lcom/navngo/igo/javaclient/functors/IFunctorCollection;)V

    .line 94
    iget-object v1, p0, Lcom/navngo/igo/primo/PrimoServiceGooglePlay;->mTTSCyberon:Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/tts/cyberon/TTSCyberon;->registerFunctors()V

    .line 97
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/Application;->registerCommonReceivers()V

    .line 98
    new-instance v0, Lcom/navngo/igo/javaclient/PapagoLocationReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/PapagoLocationReceiver;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoServiceGooglePlay;->mPapagoLocationReceiver:Lcom/navngo/igo/javaclient/PapagoLocationReceiver;

    .line 99
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/PapagoLocationReceiver;->register()V

    .line 100
    new-instance v0, Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoServiceGooglePlay;->mExternalCommandReceiver:Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;

    .line 101
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/receiver/ExternalCommandReceiver;->register()V

    .line 103
    new-instance v0, Lcom/navngo/igo/javaclient/HudInitialiser;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/HudInitialiser;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/primo/PrimoServiceGooglePlay;->mHudInitialiser:Lcom/navngo/igo/javaclient/HudInitialiser;

    .line 104
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/HudInitialiser;->register()V

    return-void
.end method
