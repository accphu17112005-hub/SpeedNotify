package com.navngo.igo.javaclient.tts;

import android.content.Intent;
import android.speech.tts.TextToSpeech;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.ServerRunner;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.IgoModel;
import com.navngo.igo.javaclient.androidgo.types.CString;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
final class TTSSpeakerImpl extends TTSSpeakerAndroidGo implements TextToSpeech.OnInitListener, TextToSpeech.OnUtteranceCompletedListener {
    private static final String logname = "TTSSpeakerImpl";
    private AndroidGo mAndroidGo;
    private final String mTTSLock = new String("TTSLock");
    private TextToSpeech mTTSEngine = null;
    private EngineSpecific mSpecific = new EngineSpecific();
    private boolean mReadyToSpeak = false;
    private float mSpeechRate = 1.0f;
    private float mPitch = 1.0f;
    private Locale mLocale = null;
    private String mVoice = null;
    private HashMap<String, Locale> iGOLocale = new HashMap<>();
    private HashMap<String, String> ISO639_2_to_2T = new HashMap<>();
    private ArrayList<Integer> mCurrentRequestIds = new ArrayList<>();
    private Object mInitDoneLock = new Object();
    private volatile boolean mInitDone = false;
    private final String mCollectLanguagesLock = new String("CollectLanguagesLock");
    private HashSet<String> mSupportedLocales = new HashSet<>();

    class EngineSpecific {
        Locale currentTTSLocale = Locale.getDefault();

        String resolveTag(String str, HashMap<String, String> map) {
            return Config.def_additional_assets;
        }

        EngineSpecific() {
        }

        void InitCurrentLocale(Locale locale) {
            this.currentTTSLocale = locale;
        }

        String resolveItem(HashMap<String, String> map) {
            String str = map.get("ort");
            return str == null ? Config.def_additional_assets : str;
        }

        void setLanguageIfChangedByExternal() {
            if (TTSSpeakerImpl.this.mTTSEngine == null) {
                return;
            }
            if (this.currentTTSLocale.equals(TTSSpeakerImpl.this.mTTSEngine.getLanguage())) {
                DebugLogger.D5(TTSSpeakerImpl.logname, "setLanguageIfChangedByExternal() no need to do anything");
                return;
            }
            setLanguage(this.currentTTSLocale);
            DebugLogger.D3(TTSSpeakerImpl.logname, "setLanguageIfChangedByExternal() language set to " + this.currentTTSLocale.toString());
        }

        int setLanguage(Locale locale) {
            if (TTSSpeakerImpl.this.mTTSEngine == null) {
                return 0;
            }
            int language = TTSSpeakerImpl.this.mTTSEngine.setLanguage(locale);
            this.currentTTSLocale = TTSSpeakerImpl.this.mTTSEngine.getLanguage();
            DebugLogger.D3(TTSSpeakerImpl.logname, "setLanguage('" + locale.toString() + "') = " + String.valueOf(language));
            return language;
        }

        int stop() {
            if (TTSSpeakerImpl.this.mTTSEngine == null) {
                return 0;
            }
            return TTSSpeakerImpl.this.mTTSEngine.stop();
        }

        int speak(String str, int i, HashMap<String, String> map) {
            String str2 = "speak; text='" + str + "'";
            if (map != null) {
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    str2 = str2 + ", " + entry.getKey() + "='" + entry.getValue() + "'";
                }
            }
            DebugLogger.D5(TTSSpeakerImpl.logname, str2);
            if (TTSSpeakerImpl.this.mTTSEngine == null) {
                return 0;
            }
            return TTSSpeakerImpl.this.mTTSEngine.speak(str, i, map);
        }
    }

    class SSMLEngineSpecific extends EngineSpecific {
        String mAlphabet;

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        String resolveItem(HashMap<String, String> map) {
            String str = map.get("ph");
            String str2 = map.get("ort");
            if (str == null) {
                return str2 != null ? str2 : Config.def_additional_assets;
            }
            String strReplace = str.replace("\\", "\\\\").replace("\"", "\\\"");
            if (str2 != null) {
                return "<phoneme alphabet=\"" + this.mAlphabet + "\" ph=\"" + strReplace + "\">" + str2 + "</phoneme>";
            }
            return "<phoneme alphabet=\"" + this.mAlphabet + "\" ph=\"" + strReplace + "\"/>";
        }

        SSMLEngineSpecific(String str) {
            super();
            this.mAlphabet = str;
        }
    }

    class ParrotEngineSpecific extends EngineSpecific {
        private final String[] alphabetName;

        ParrotEngineSpecific() {
            super();
            this.alphabetName = new String[]{"x-sampa", "x-sampa", "x-NAVTEQ-sampa", "x-sampa", "x-sampa", "x-sampa", "x-sampa", "ipa"};
        }

        /* JADX WARN: Removed duplicated region for block: B:21:0x008b  */
        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct code enable 'Show inconsistent code' option in preferences
        */
        java.lang.String resolveItem(java.util.HashMap<java.lang.String, java.lang.String> r7) {
            /*
                Method dump skipped, instruction units count: 217
                To view this dump change 'Code comments level' option to 'DEBUG'
            */
            throw new UnsupportedOperationException("Method not decompiled: com.navngo.igo.javaclient.tts.TTSSpeakerImpl.ParrotEngineSpecific.resolveItem(java.util.HashMap):java.lang.String");
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        int setLanguage(Locale locale) {
            this.currentTTSLocale = locale;
            if (TTSSpeakerImpl.this.mTTSEngine == null) {
                return 0;
            }
            return (Locale.getDefault().getISO3Language().equals(locale.getISO3Language()) && Locale.getDefault().getISO3Country().equals(locale.getISO3Country())) ? 2 : -2;
        }
    }

    class IvonaEngineSpecific extends EngineSpecific {
        IvonaEngineSpecific() {
            super();
        }

        String formatOrtho(String str, String str2) {
            if (str2 == null || str2.isEmpty()) {
                return str;
            }
            return "<say-as interpret-as='" + str2 + "'>" + str + "</say-as>";
        }

        String formatOrtho(String str, String str2, String str3) {
            if (str3 == null || str3.isEmpty()) {
                return formatOrtho(str, str2);
            }
            return "<say-as interpret-as='" + str2 + "' format='" + str3 + "'>" + str + "</say-as>";
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        String resolveItem(HashMap<String, String> map) {
            Locale locale;
            String str = map.get("ph");
            String str2 = map.get("ort");
            String str3 = map.get("otype");
            if (str3 == null) {
                str3 = "address";
            }
            String str4 = map.get("lang");
            if (str4 != null) {
                locale = (Locale) TTSSpeakerImpl.this.iGOLocale.get(str4);
            } else {
                locale = this.currentTTSLocale;
            }
            if (str == null) {
                return str2 != null ? formatOrtho(str2, str3) : Config.def_additional_assets;
            }
            String strReplace = str.replace("'", "_j");
            String str5 = map.get("a");
            int i = str5 == null ? 0 : Integer.parseInt(str5, 10);
            String str6 = "x-sampa";
            if (i != 0) {
                if (i == 2) {
                    str6 = "nt-sampa-" + TTSSpeakerImpl.this.iso639_2_to_2T(locale.getISO3Language());
                } else if (i != 6) {
                    if (i != 7) {
                        DebugLogger.D3(TTSSpeakerImpl.logname, "Unsupported alphabet: " + i);
                    } else {
                        str6 = "ipa";
                    }
                }
            }
            if (str2 != null) {
                return "<phoneme alphabet=\"" + str6 + "\" ph='" + strReplace + "'>" + formatOrtho(str2, str3) + "</phoneme>";
            }
            return "<phoneme alphabet=\"" + str6 + "\" ph='" + strReplace + "'/>";
        }
    }

    class LGEEngineSpecific extends EngineSpecific {
        public static final String KEY_PARAM_AUDIO_FORMAT = "audioFormat";
        public static final String KEY_PARAM_MESSAGE_TYPE = "messageType";

        LGEEngineSpecific() {
            super();
        }

        class MessageType {
            public static final int ALERT = 1;
            public static final int GUIDANCE = 0;
            public static final int POI = 2;
            public static final int TRAFFIC = 3;

            MessageType() {
            }
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        String resolveItem(HashMap<String, String> map) {
            String str = map.get("ph");
            String str2 = map.get("ort");
            String str3 = map.get("lang");
            Locale locale = str3 != null ? (Locale) TTSSpeakerImpl.this.iGOLocale.get(str3) : null;
            if (locale == null) {
                locale = this.currentTTSLocale;
            }
            String upperCase = locale.getISO3Language().toUpperCase(Locale.US);
            if (str2 == null) {
                str2 = Config.def_additional_assets;
            }
            if (str == null) {
                return str2;
            }
            return "<phoneme alphabet=\"x-L&amp;H\" xml:lang=\"" + upperCase + "\" ph=\"" + str.replace("\\", "\\\\").replace("\"", "\\\"") + "\">" + str2 + "</phoneme>";
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        int setLanguage(Locale locale) {
            if (!Locale.getDefault().getISO3Language().equals(locale.getISO3Language()) || !Locale.getDefault().getISO3Country().equals(locale.getISO3Country())) {
                return -2;
            }
            this.currentTTSLocale = locale;
            return 2;
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        int speak(String str, int i, HashMap<String, String> map) {
            map.put(KEY_PARAM_MESSAGE_TYPE, String.valueOf(0));
            return super.speak("<speak>" + str + "</speak>", i, map);
        }
    }

    class SVoxPicoEngineSpecific extends SVoxEngineSpecific {
        SVoxPicoEngineSpecific() {
            super();
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.SSMLEngineSpecific, com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        String resolveItem(HashMap<String, String> map) {
            String str = map.get("ph");
            String str2 = map.get("ort");
            if (str == null) {
                return str2 != null ? str2 : Config.def_additional_assets;
            }
            return "<phoneme alphabet=\"" + this.mAlphabet + "\" ph=\"" + str.replace("\\", "\\\\").replace("\"", "\\\"").replace("#", Config.def_additional_assets) + "\"/>";
        }
    }

    class SVoxEngineSpecific extends SSMLEngineSpecific {
        SVoxEngineSpecific() {
            super("xsampa");
        }

        @Override // com.navngo.igo.javaclient.tts.TTSSpeakerImpl.EngineSpecific
        int stop() {
            while (!TTSSpeakerImpl.this.mCurrentRequestIds.isEmpty()) {
                int iIntValue = ((Integer) TTSSpeakerImpl.this.mCurrentRequestIds.remove(0)).intValue();
                DebugLogger.D5(TTSSpeakerImpl.logname, "Cancelling request '" + String.valueOf(iIntValue) + "'");
                TTSSpeakerImpl.this.reportCompletion(iIntValue, ServerRunner.getEngineIndex());
            }
            return super.stop();
        }
    }

    public TTSSpeakerImpl() {
        this.iGOLocale.put("ALB", new Locale("sq", "AL"));
        this.iGOLocale.put("ARA", new Locale("ar", "AE"));
        this.iGOLocale.put("AUS", new Locale("en", "AU"));
        this.iGOLocale.put("BEL", new Locale("be", "BY"));
        this.iGOLocale.put("BET", new Locale("be", "BY", "Latin"));
        this.iGOLocale.put("BOS", new Locale("bs", "BA"));
        this.iGOLocale.put("BRA", new Locale("pt", "BR"));
        this.iGOLocale.put("BUL", new Locale("bg", "BG"));
        this.iGOLocale.put("CAT", new Locale("ca", "AD"));
        this.iGOLocale.put("CHI", new Locale("zh", "CN"));
        this.iGOLocale.put("CHT", new Locale("zh", "CN"));
        this.iGOLocale.put("CRO", new Locale("hr", "HR"));
        this.iGOLocale.put("CZE", new Locale("cs", "CZ"));
        this.iGOLocale.put("DAN", new Locale("da", "DK"));
        this.iGOLocale.put("DUT", new Locale("nl", "NL"));
        this.iGOLocale.put("DUZ", new Locale("nl", "ZA"));
        this.iGOLocale.put("ENA", new Locale("en", "AU"));
        this.iGOLocale.put("ENG", new Locale("en", "GB"));
        this.iGOLocale.put("ENS", new Locale("en", "ZA"));
        this.iGOLocale.put("ENU", new Locale("en", "US"));
        this.iGOLocale.put("EST", new Locale("et", "EE"));
        this.iGOLocale.put("FIN", new Locale("fi", "FI"));
        this.iGOLocale.put("FRA", new Locale("fr", "FR"));
        this.iGOLocale.put("FRE", new Locale("fr", "FR"));
        this.iGOLocale.put("FSW", new Locale("sv", "SE"));
        this.iGOLocale.put("GER", new Locale("de", "DE"));
        this.iGOLocale.put("GLE", new Locale("ga", "IE"));
        this.iGOLocale.put("GRE", new Locale("el", "GR"));
        this.iGOLocale.put("GRL", new Locale("el", "GR", "Latin"));
        this.iGOLocale.put("HEB", new Locale("he", "IL"));
        this.iGOLocale.put("HUN", new Locale("hu", "HU"));
        this.iGOLocale.put("ICE", new Locale("is", "IS"));
        this.iGOLocale.put("IND", new Locale("hi", "IN"));
        this.iGOLocale.put("IRE", new Locale("ga", "IE"));
        this.iGOLocale.put("ITA", new Locale("it", "IT"));
        this.iGOLocale.put("JPN", new Locale("ja", "JP"));
        this.iGOLocale.put("KOR", new Locale("ko", "KR"));
        this.iGOLocale.put("LAT", new Locale("lv", "LV"));
        this.iGOLocale.put("MAL", new Locale("ms", "MY"));
        this.iGOLocale.put("MLT", new Locale("mt", "MT"));
        this.iGOLocale.put("NED", new Locale("nl", "NL"));
        this.iGOLocale.put("NOR", new Locale("no", "NO"));
        this.iGOLocale.put("POB", new Locale("pt", "BR"));
        this.iGOLocale.put("POL", new Locale("pl", "PL"));
        this.iGOLocale.put("POR", new Locale("pt", "PT"));
        this.iGOLocale.put("ROM", new Locale("ro", "RO"));
        this.iGOLocale.put("RUL", new Locale("ru", "RU", "Latin"));
        this.iGOLocale.put("RUS", new Locale("ru", "RU"));
        this.iGOLocale.put("SEN", new Locale("en", "SG"));
        this.iGOLocale.put("SER", new Locale("sr", "RS"));
        this.iGOLocale.put("SLO", new Locale("sk", "SK"));
        this.iGOLocale.put("SLV", new Locale("sl", "SI"));
        this.iGOLocale.put("SPA", new Locale("es", "ES"));
        this.iGOLocale.put("SWE", new Locale("sv", "SE"));
        this.iGOLocale.put("THA", new Locale("th", "TH"));
        this.iGOLocale.put("THE", new Locale("en", "TH"));
        this.iGOLocale.put("TUR", new Locale("tr", "TR"));
        this.iGOLocale.put("UKR", new Locale("uk", "UA"));
        this.iGOLocale.put("URL", new Locale("uk", "UA", "Latin"));
        this.ISO639_2_to_2T.put("bod", "tib");
        this.ISO639_2_to_2T.put("ces", "cze");
        this.ISO639_2_to_2T.put("cym", "wel");
        this.ISO639_2_to_2T.put("deu", "ger");
        this.ISO639_2_to_2T.put("ell", "gre");
        this.ISO639_2_to_2T.put("eus", "baq");
        this.ISO639_2_to_2T.put("fas", "per");
        this.ISO639_2_to_2T.put("fra", "fre");
        this.ISO639_2_to_2T.put("hye", "arm");
        this.ISO639_2_to_2T.put("isl", "ice");
        this.ISO639_2_to_2T.put("kat", "geo");
        this.ISO639_2_to_2T.put("mkd", "mac");
        this.ISO639_2_to_2T.put("mri", "mao");
        this.ISO639_2_to_2T.put("msa", "may");
        this.ISO639_2_to_2T.put("mya", "bur");
        this.ISO639_2_to_2T.put("nld", "dut");
        this.ISO639_2_to_2T.put("ron", "rum");
        this.ISO639_2_to_2T.put("slk", "slo");
        this.ISO639_2_to_2T.put("sqi", "alb");
        this.ISO639_2_to_2T.put("zho", "chi");
        this.mAndroidGo = AndroidGo.getInstance();
    }

    public String iso639_2_to_2T(String str) {
        if (str == null) {
            return null;
        }
        String str2 = this.ISO639_2_to_2T.get(str);
        return str2 == null ? str : str2;
    }

    public Locale parseLocale(String str) {
        String[] strArrSplit = str.split("[-_]");
        int length = strArrSplit.length;
        if (length == 0) {
            return new Locale(str);
        }
        if (length == 1) {
            return new Locale(strArrSplit[0]);
        }
        if (length == 2) {
            return new Locale(strArrSplit[0], strArrSplit[1]);
        }
        return new Locale(strArrSplit[0], strArrSplit[1], strArrSplit[2]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void reportCompletion(int i, int i2) {
        DebugLogger.D5(logname, "calling TTS_Finished: " + i);
        this.mAndroidGo.callIgo("sound.tts_ssml.sound_finished_callback", null, Integer.valueOf(i));
    }

    @Override // android.speech.tts.TextToSpeech.OnUtteranceCompletedListener
    public void onUtteranceCompleted(String str) {
        DebugLogger.D5(logname, "onUtteranceCompleted: " + str);
        int iIndexOf = str.indexOf(44);
        int i = Integer.parseInt(str.substring(0, iIndexOf));
        int i2 = Integer.parseInt(str.substring(iIndexOf + 1));
        if (this.mCurrentRequestIds.isEmpty()) {
            DebugLogger.D3(logname, "Completed utterance '" + str + "' but the request list is empty");
        } else if (this.mCurrentRequestIds.get(0).intValue() != i) {
            DebugLogger.D3(logname, "Completed utterance '" + str + "' is not at the front of the request list");
        }
        if (this.mCurrentRequestIds.remove(Integer.valueOf(i))) {
            if (i >= 0) {
                reportCompletion(i, i2);
            }
        } else {
            DebugLogger.D3(logname, "Completed utterance '" + str + "' was not found in the request list");
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public CString GetSupportedLanguages() {
        DebugLogger.D3(logname, "TTS onInit getting available locales begin");
        String str = Config.def_additional_assets;
        synchronized (this.mCollectLanguagesLock) {
            for (String str2 : this.mSupportedLocales) {
                str = str.isEmpty() ? str2 : str + "|" + str2;
            }
        }
        return new CString(str);
    }

    @Override // android.speech.tts.TextToSpeech.OnInitListener
    public void onInit(int i) {
        DebugLogger.D3(logname, "TTS onInit: " + i);
        DebugLogger.D5(logname, "Source info $HeadURL$");
        DebugLogger.D3(logname, "Source rev $Revision$");
        DebugLogger.D5(logname, "Source timestamp $Date$");
        synchronized (this.mTTSLock) {
            if (i == 0) {
                String defaultEngine = this.mTTSEngine.getDefaultEngine();
                if (defaultEngine == null) {
                    DebugLogger.D3(logname, "TTS onInit default engine is null");
                    this.mSpecific = new SSMLEngineSpecific("xsampa");
                } else {
                    DebugLogger.D3(logname, "TTS onInit engine=" + defaultEngine);
                    if (defaultEngine.startsWith("com.svox.pico")) {
                        this.mSpecific = new SVoxPicoEngineSpecific();
                    } else if (defaultEngine.startsWith("com.svox")) {
                        this.mSpecific = new SVoxEngineSpecific();
                    } else if (defaultEngine.startsWith("com.ivona.tts")) {
                        this.mSpecific = new IvonaEngineSpecific();
                    } else if (defaultEngine.equals("com.parrot.hsti.tts")) {
                        this.mSpecific = new ParrotEngineSpecific();
                    } else if (defaultEngine.equals("edu.cmu.cs.speech.tts.flite") || defaultEngine.equals("com.samsung.SMT") || defaultEngine.equals("com.google.android.tts")) {
                        this.mSpecific = new EngineSpecific();
                    } else {
                        this.mSpecific = new SSMLEngineSpecific("xsampa");
                    }
                }
                this.mSpecific.InitCurrentLocale(this.mLocale);
                Locale locale = this.mLocale;
                if (locale != null) {
                    setLanguageAndVoice(locale.toString(), this.mVoice);
                } else {
                    Locale language = this.mTTSEngine.getLanguage();
                    this.mLocale = language;
                    if (language == null) {
                        this.mLocale = Locale.getDefault();
                    }
                }
                float f = this.mSpeechRate;
                if (f != 1.0d) {
                    this.mTTSEngine.setSpeechRate(f);
                }
                float f2 = this.mPitch;
                if (f2 != 1.0d) {
                    this.mTTSEngine.setPitch(f2);
                }
                this.mTTSEngine.setOnUtteranceCompletedListener(this);
                Intent intent = new Intent();
                intent.setPackage(defaultEngine);
                intent.setAction("android.speech.tts.engine.CHECK_TTS_DATA");
                this.mReadyToSpeak = true;
                DebugLogger.D3(logname, "Supported locales start");
                new Thread(new Runnable() { // from class: com.navngo.igo.javaclient.tts.TTSSpeakerImpl.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Locale[] availableLocales = Locale.getAvailableLocales();
                        DebugLogger.D3(TTSSpeakerImpl.logname, "Supported locales: ");
                        synchronized (TTSSpeakerImpl.this.mCollectLanguagesLock) {
                            for (Locale locale2 : availableLocales) {
                                if (locale2.getVariant().isEmpty() && TTSSpeakerImpl.this.mTTSEngine.isLanguageAvailable(locale2) == 1) {
                                    String str = locale2.getISO3Language() + "-" + locale2.getISO3Country();
                                    DebugLogger.D3(TTSSpeakerImpl.logname, str);
                                    TTSSpeakerImpl.this.mSupportedLocales.add(str);
                                }
                            }
                        }
                    }
                }).start();
            } else {
                this.mReadyToSpeak = false;
            }
        }
        synchronized (this.mInitDoneLock) {
            this.mInitDone = true;
            this.mInitDoneLock.notify();
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void onActivityResult(int i, int i2, Intent intent) {
        DebugLogger.D3(logname, "onActivityResult; resultCode='" + String.valueOf(i2) + "'");
        if (i == 1250) {
            if (i2 != 1) {
                DebugLogger.D3(logname, "chkdata failed " + String.valueOf(i2) + ", but anyway, supported=");
            }
            Locale locale = this.mLocale;
            if (locale != null) {
                setLanguageAndVoice(locale.toString(), this.mVoice);
            } else {
                Locale language = this.mTTSEngine.getLanguage();
                this.mLocale = language;
                if (language == null) {
                    this.mLocale = Locale.getDefault();
                }
            }
            this.mReadyToSpeak = true;
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void create() {
        synchronized (this.mTTSLock) {
            if (this.mTTSEngine == null) {
                DebugLogger.D5(logname, "create()");
                this.mTTSEngine = new TextToSpeech(Application.anApplication.getApplicationContext(), this);
            }
        }
        if (this.mInitDone) {
            return;
        }
        DebugLogger.D5(logname, "mInitDone.wait() start");
        while (!this.mInitDone) {
            synchronized (this.mInitDoneLock) {
                try {
                    try {
                        this.mInitDoneLock.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                        return;
                    }
                } finally {
                }
            }
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public String getVariant() {
        create();
        TextToSpeech textToSpeech = this.mTTSEngine;
        return (textToSpeech == null || textToSpeech.getLanguage() == null) ? Config.def_additional_assets : this.mTTSEngine.getLanguage().getVariant();
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void destroy() {
        synchronized (this.mTTSLock) {
            DebugLogger.D5(logname, "destroy()");
            this.mReadyToSpeak = false;
            EngineSpecific engineSpecific = this.mSpecific;
            if (engineSpecific != null) {
                engineSpecific.stop();
                this.mSpecific = null;
            }
            TextToSpeech textToSpeech = this.mTTSEngine;
            if (textToSpeech != null) {
                textToSpeech.shutdown();
                this.mTTSEngine = null;
            }
        }
    }

    private String resolveTag(String str) {
        int iIndexOf;
        HashMap<String, String> map = new HashMap<>();
        int iIndexOf2 = str.indexOf(27);
        if (iIndexOf2 < 0) {
            return this.mSpecific.resolveTag(str, map);
        }
        int i = iIndexOf2 + 1;
        while (true) {
            int iIndexOf3 = str.indexOf(61, i);
            if (iIndexOf3 < 0) {
                iIndexOf = str.indexOf(27, i);
                if (iIndexOf < 0) {
                    map.put(str.substring(i), Config.def_additional_assets);
                    break;
                }
                map.put(str.substring(i, iIndexOf), Config.def_additional_assets);
                i = iIndexOf + 1;
            } else {
                int i2 = iIndexOf3 + 1;
                int iIndexOf4 = str.indexOf(27, i2);
                if (iIndexOf4 < 0) {
                    map.put(str.substring(i, iIndexOf3), str.substring(i2));
                    break;
                }
                map.put(str.substring(i, iIndexOf3), str.substring(i2, iIndexOf4));
                iIndexOf = iIndexOf4;
                i = iIndexOf + 1;
            }
        }
        String strSubstring = str.substring(0, iIndexOf2);
        if (strSubstring.equals("item")) {
            DebugLogger.D5(logname, "resolveItem; a='" + map.get("a") + "', ph='" + map.get("ph") + "', ort='" + map.get("ort") + "'");
            return this.mSpecific.resolveItem(map);
        }
        return this.mSpecific.resolveTag(strSubstring, map);
    }

    public int getVoiceVolume() {
        int iIntValue = IgoModel.ROOT_MODEL.getIntModel("sound.voice_volume").get().intValue();
        DebugLogger.D5(logname, "voiceVolume=" + String.valueOf(iIntValue));
        return iIntValue;
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void say(int i, String str) {
        String strConcat;
        DebugLogger.D5(logname, "say(" + i + "," + str.replace((char) 27, '^') + ")");
        synchronized (this.mTTSLock) {
            this.mSpecific.setLanguageIfChangedByExternal();
        }
        create();
        synchronized (this.mTTSLock) {
            if (this.mReadyToSpeak && getVoiceVolume() > 0) {
                HashMap<String, String> map = new HashMap<>();
                map.put("streamType", Config.def_additional_assets + Application.getSoundStream());
                map.put("utteranceId", i + "," + ServerRunner.getEngineIndex());
                StringBuilder sb = new StringBuilder();
                sb.append(Config.def_additional_assets);
                sb.append(((float) getVoiceVolume()) / 255.0f);
                map.put("volume", sb.toString());
                String strConcat2 = Config.def_additional_assets;
                int i2 = 0;
                while (true) {
                    int iIndexOf = str.indexOf("<\u001b", i2);
                    if (iIndexOf < 0) {
                        strConcat = strConcat2.concat(str.substring(i2));
                        break;
                    }
                    String strConcat3 = strConcat2.concat(str.substring(i2, iIndexOf));
                    int iIndexOf2 = str.indexOf("\u001b>", iIndexOf);
                    if (iIndexOf2 < 0) {
                        DebugLogger.D2(logname, "Missing end-of-item marker; '" + str + "'");
                        strConcat = strConcat3.concat(str.substring(iIndexOf));
                        break;
                    }
                    strConcat2 = strConcat3.concat(resolveTag(str.substring(iIndexOf + 2, iIndexOf2)));
                    i2 = iIndexOf2 + 2;
                }
                DebugLogger.D5(logname, "requestId: " + i + " text = " + strConcat);
                this.mCurrentRequestIds.add(Integer.valueOf(i));
                this.mSpecific.speak(strConcat, 1, map);
            } else {
                DebugLogger.D5(logname, "skipping due to muted state: " + i + " text = '" + str + "'");
                reportCompletion(i, ServerRunner.getEngineIndex());
            }
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public boolean testLanguageAndVoice(String str, String str2) {
        DebugLogger.D5(logname, "testLanguageAndVoice(" + str + "," + str2 + ")");
        try {
            synchronized (this.mTTSLock) {
                if (!this.mReadyToSpeak) {
                    DebugLogger.D2(logname, "TTS language testing not yet available; locale='" + str + "'");
                    return true;
                }
                Locale locale = parseLocale(str);
                String iSO3Language = locale.getISO3Language();
                String iSO3Country = locale.getISO3Country();
                String variant = locale.getVariant();
                int iIsLanguageAvailable = this.mTTSEngine.isLanguageAvailable(locale);
                DebugLogger.D3(logname, "testLanguage('" + iSO3Language + "', '" + iSO3Country + "', '" + variant + "') = " + String.valueOf(iIsLanguageAvailable));
                if (iIsLanguageAvailable >= 0) {
                    DebugLogger.D2(logname, "Supported TTS language; locale='" + locale.toString() + "', level='" + String.valueOf(iIsLanguageAvailable) + "'");
                    return true;
                }
                DebugLogger.D2(logname, "No TTS support for this language; locale='" + locale.toString() + "'");
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public boolean setLanguageAndVoice(String str, String str2) {
        boolean z;
        DebugLogger.D5(logname, "setLanguageAndVoice(" + str + "," + str2 + ")");
        synchronized (this.mTTSLock) {
            Locale locale = parseLocale(str);
            this.mLocale = locale;
            this.mVoice = str2;
            if (!this.mReadyToSpeak) {
                DebugLogger.D2(logname, "Deferring TTS language setting; locale='" + this.mLocale.toString() + "'");
                z = true;
            } else {
                if (this.mSpecific.setLanguage(locale) >= 0) {
                    DebugLogger.D2(logname, "Setting TTS language; locale='" + this.mLocale.toString() + "'");
                    return true;
                }
                z = false;
            }
            if (z) {
                create();
                return true;
            }
            DebugLogger.D2(logname, "No TTS support for this language; locale='" + this.mLocale.toString() + "'");
            return false;
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void setSpeed(int i) {
        DebugLogger.D5(logname, "setSpeed(" + i + ")");
        synchronized (this.mTTSLock) {
            float f = i > 0 ? i / 100.0f : 0.01f;
            if (this.mReadyToSpeak && this.mSpeechRate != f) {
                this.mTTSEngine.setSpeechRate(f);
            }
            this.mSpeechRate = f;
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void setSampleRate(int i) {
        DebugLogger.D5(logname, "setSampleRate(" + i + ")");
        synchronized (this.mTTSLock) {
            float f = i > 0 ? i / 11025.0f : 1.0f;
            if (this.mReadyToSpeak && this.mPitch != f) {
                this.mTTSEngine.setPitch(f);
            }
            this.mPitch = f;
        }
    }

    @Override // com.navngo.igo.javaclient.tts.TTSSpeaker
    public void stop() {
        synchronized (this.mTTSLock) {
            DebugLogger.D4(logname, "stop()");
            EngineSpecific engineSpecific = this.mSpecific;
            if (engineSpecific != null) {
                engineSpecific.stop();
                reportCompletion(-1, ServerRunner.getEngineIndex());
            }
        }
    }
}
