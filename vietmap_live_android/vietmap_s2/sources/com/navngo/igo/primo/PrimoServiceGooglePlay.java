package com.navngo.igo.primo;

import android.provider.Settings;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.Encryptor;
import com.navngo.igo.javaclient.HttpLogFunctors;
import com.navngo.igo.javaclient.HudInitialiser;
import com.navngo.igo.javaclient.MainService;
import com.navngo.igo.javaclient.PapagoLocationReceiver;
import com.navngo.igo.javaclient.Sound;
import com.navngo.igo.javaclient.ValidationFunctors;
import com.navngo.igo.javaclient.VietmapAudioFocusManager;
import com.navngo.igo.javaclient.VietmapAudioTrackAdapter;
import com.navngo.igo.javaclient.browser.InAppBrowser;
import com.navngo.igo.javaclient.functors.BrowserFunctors;
import com.navngo.igo.javaclient.functors.GPSFunctors;
import com.navngo.igo.javaclient.functors.IgoEvents;
import com.navngo.igo.javaclient.functors.IntentFunctor;
import com.navngo.igo.javaclient.functors.LocaleFunctors;
import com.navngo.igo.javaclient.functors.MailSmsContacts;
import com.navngo.igo.javaclient.functors.NavfusionFunctors;
import com.navngo.igo.javaclient.functors.SettingIntentFunctors;
import com.navngo.igo.javaclient.locking.ManufacturerIDProvider;
import com.navngo.igo.javaclient.receiver.ExternalCommandReceiver;
import com.navngo.igo.javaclient.store.IgoStore;
import com.navngo.igo.javaclient.tts.cyberon.TTSCyberon;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class PrimoServiceGooglePlay extends MainService {
    private static final String logname = "PrimoServiceGooglePlay";
    private ExternalCommandReceiver mExternalCommandReceiver;
    private HudInitialiser mHudInitialiser;
    private PapagoLocationReceiver mPapagoLocationReceiver;
    private final TTSCyberon mTTSCyberon = new TTSCyberon();

    @Override // com.navngo.igo.javaclient.MainService, android.app.Service
    public void onCreate() throws Throwable {
        super.onCreate();
        String strDecrypt = Encryptor.decrypt(Application.anApplication.getSharedPreferences("PrimoServiceSharedPreferences", 0).getString("phoneNumber", Config.def_additional_assets));
        String string = Settings.Secure.getString(Application.anApplication.getContentResolver(), "android_id");
        if (string == null) {
            Application.exit(true);
        }
        if (strDecrypt == null || strDecrypt.isEmpty()) {
            return;
        }
        ManufacturerIDProvider.getInstace().setID(string + "+" + strDecrypt);
    }

    @Override // com.navngo.igo.javaclient.MainService
    public void registerInterfaces() {
        super.registerInterfaces();
        Application application = Application.anApplication;
        application.registerFunctorCollection(MailSmsContacts.INSTANCE);
        application.registerFunctorCollection(new IgoEvents());
        application.registerFunctorCollection(Application.getAntHttpUtility());
        application.registerFunctorCollection(new GPSFunctors());
        application.registerFunctorCollection(new SettingIntentFunctors());
        application.registerFunctorCollection(new IntentFunctor());
        application.registerFunctorCollection(Sound.getInstance());
        application.registerFunctorCollection(Sound.getInstance().getMutingDevice());
        application.registerFunctorCollection(new BrowserFunctors());
        application.registerFunctorCollection(InAppBrowser.getInstance());
        application.registerFunctorCollection(new NavfusionFunctors());
        application.registerFunctorCollection(new VietmapAudioFocusManager());
        application.registerFunctorCollection(new VietmapAudioTrackAdapter());
        application.registerFunctorCollection(new LocaleFunctors());
        application.registerFunctorCollection(new HttpLogFunctors());
        application.registerFunctorCollection(new ValidationFunctors());
        application.registerFunctorCollection(IgoStore.INSTANCE);
        this.mTTSCyberon.registerFunctors();
        application.registerCommonReceivers();
        PapagoLocationReceiver papagoLocationReceiver = new PapagoLocationReceiver();
        this.mPapagoLocationReceiver = papagoLocationReceiver;
        papagoLocationReceiver.register();
        ExternalCommandReceiver externalCommandReceiver = new ExternalCommandReceiver();
        this.mExternalCommandReceiver = externalCommandReceiver;
        externalCommandReceiver.register();
        HudInitialiser hudInitialiser = new HudInitialiser();
        this.mHudInitialiser = hudInitialiser;
        hudInitialiser.register();
    }

    @Override // com.navngo.igo.javaclient.MainService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        ExternalCommandReceiver externalCommandReceiver = this.mExternalCommandReceiver;
        if (externalCommandReceiver != null) {
            externalCommandReceiver.unregister();
        }
    }
}
