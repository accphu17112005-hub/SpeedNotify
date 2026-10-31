package com.navngo.igo.javaclient.voice_recognition;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognitionListener;
import android.speech.SpeechRecognizer;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.Config;
import com.navngo.igo.javaclient.DebugLogger;
import com.navngo.igo.javaclient.IgoActivity;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.androidgo.types.CString;
import com.navngo.igo.javaclient.permission.PermissionHandler;
import com.navngo.igo.javaclient.receiver.PetzaCommandReceiver;
import java.util.ArrayList;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class GoogleVR implements RecognitionListener {
    private static final String TAG = "GoogleVR";
    AndroidGo go;
    IgoActivity igoActivity;
    int mSoundLevel;
    String packageName;
    SpeechRecognizer sr;
    ArrayList<String> mSupportedLocales = new ArrayList<>();
    Status mStatus = Status.DOWN;
    int mError = 0;
    ArrayList<Result> mResults = new ArrayList<>();
    boolean mDoDebugLogging = true;
    String mLocaleName = Config.def_additional_assets;
    String mLangModel = "web_search";
    int mMaxResults = 5;
    long mMinSpeechMillis = 1000;
    long mMinSilenceMillis = 300;
    long mMaxSilenceMillis = 500;

    enum Status {
        DOWN,
        IDLE,
        STARTED,
        MAY_SPEAK,
        SPEAKING,
        DONE_SPEAKING,
        READY
    }

    @Override // android.speech.RecognitionListener
    public void onBufferReceived(byte[] bArr) {
    }

    class VRLangReceiver extends BroadcastReceiver {
        VRLangReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            ArrayList<String> stringArrayList;
            GoogleVR.this.debugLog("GoogleVR.VRLangReceiver called");
            Bundle resultExtras = getResultExtras(true);
            GoogleVR.this.debugLog("GoogleVR.VRLangReceiver extras: " + resultExtras);
            if (resultExtras != null) {
                stringArrayList = resultExtras.getStringArrayList("android.speech.extra.SUPPORTED_LANGUAGES");
                GoogleVR.this.debugLog("GoogleVR.VRLangReceiver EXTRA_SUPPORTED_LANGUAGES: " + stringArrayList);
            } else {
                stringArrayList = null;
            }
            if (getResultCode() != -1 || stringArrayList == null) {
                DebugLogger.D2(GoogleVR.TAG, "VR Init failed");
                GoogleVR.this.go.callIgo("asr.freetext.init_done", null, false);
                return;
            }
            for (String str : stringArrayList) {
                GoogleVR.this.debugLog("Supported locale: " + str);
                GoogleVR.this.mSupportedLocales.add(str);
            }
            if (resultExtras.containsKey("android.speech.extra.LANGUAGE_PREFERENCE")) {
                GoogleVR.this.mLocaleName = resultExtras.getString("android.speech.extra.LANGUAGE_PREFERENCE");
                GoogleVR.this.debugLog("Current locale: " + GoogleVR.this.mLocaleName);
            }
            GoogleVR.this.debugLog("GoogleVR.VRLangReceiver setting idle status");
            GoogleVR.this.setStatus(Status.IDLE);
            GoogleVR.this.debugLog("GoogleVR.VRLangReceiver done");
            GoogleVR.this.go.callIgo("asr.freetext.init_done", null, true);
        }
    }

    class Result {
        float score;
        String text;

        Result(String str, float f) {
            this.text = str;
            this.score = f;
        }
    }

    public void debugLog(String str) {
        if (this.mDoDebugLogging) {
            DebugLogger.D3(TAG, str);
        }
    }

    public int getStatus() {
        return this.mStatus.ordinal();
    }

    public int getError() {
        return this.mError;
    }

    public String getLocale() {
        return this.mLocaleName;
    }

    public void setLocale(String str) {
        this.mLocaleName = str;
    }

    public int getNumSupportedLocales() {
        debugLog("getNumSupportedLocales=" + String.valueOf(this.mSupportedLocales.size()));
        return this.mSupportedLocales.size();
    }

    public CString getSupportedLocale(int i) {
        debugLog("getSupportedLocale(" + String.valueOf(i) + ")=" + this.mSupportedLocales.get(i));
        return new CString(this.mSupportedLocales.get(i));
    }

    public boolean IsLocaleSupported(String str) {
        return this.mSupportedLocales.contains(str);
    }

    public String getLangModel() {
        return this.mLangModel;
    }

    public void setLangModel(String str) {
        this.mLangModel = str;
    }

    public int getMaxResults() {
        return this.mMaxResults;
    }

    public void setMaxResults(int i) {
        this.mMaxResults = i;
    }

    public long getMinSpeechMillis() {
        return this.mMinSpeechMillis;
    }

    public void setMinSpeechMillis(long j) {
        this.mMinSpeechMillis = j;
    }

    public long getMinSilenceMillis() {
        return this.mMinSilenceMillis;
    }

    public void setMinSilenceMillis(long j) {
        this.mMinSilenceMillis = j;
    }

    public long getMaxSilenceMillis() {
        return this.mMaxSilenceMillis;
    }

    public void setMaxSilenceMillis(long j) {
        this.mMaxSilenceMillis = j;
    }

    public int getNumResults() {
        return this.mResults.size();
    }

    public String getResult(int i) {
        return this.mResults.get(i).text;
    }

    public int getScore(int i) {
        float f = this.mResults.get(i).score;
        if (f < 0.0f) {
            return 0;
        }
        return Float.valueOf(f * 100.0f).intValue();
    }

    public GoogleVR() {
        debugLog("GoogleVR.GoogleVR started");
        AndroidGo androidGo = AndroidGo.getInstance();
        this.go = androidGo;
        androidGo.registerFunctor("google_vr.getStatus", this, "getStatus");
        this.go.registerFunctor("google_vr.getError", this, "getError");
        this.go.registerFunctor("google_vr.getLocale", this, "getLocale");
        this.go.registerFunctor("google_vr.setLocale", this, "setLocale");
        this.go.registerFunctor("google_vr.getNumSupportedLocales", this, "getNumSupportedLocales");
        this.go.registerFunctor("google_vr.getSupportedLocale", this, "getSupportedLocale");
        this.go.registerFunctor("google_vr.IsLocaleSupported", this, "IsLocaleSupported");
        this.go.registerFunctor("google_vr.getLangModel", this, "getLangModel");
        this.go.registerFunctor("google_vr.setLangModel", this, "setLangModel");
        this.go.registerFunctor("google_vr.getMaxResults", this, "getMaxResults");
        this.go.registerFunctor("google_vr.setMaxResults", this, "setMaxResults");
        this.go.registerFunctor("google_vr.getMinSpeechMillis", this, "getMinSpeechMillis");
        this.go.registerFunctor("google_vr.setMinSpeechMillis", this, "setMinSpeechMillis");
        this.go.registerFunctor("google_vr.getMinSilenceMillis", this, "getMinSilenceMillis");
        this.go.registerFunctor("google_vr.setMinSilenceMillis", this, "setMinSilenceMillis");
        this.go.registerFunctor("google_vr.getMaxSilenceMillis", this, "getMaxSilenceMillis");
        this.go.registerFunctor("google_vr.setMaxSilenceMillis", this, "setMaxSilenceMillis");
        this.go.registerFunctor("google_vr.getNumResults", this, "getNumResults");
        this.go.registerFunctor("google_vr.getResult", this, "getResult");
        this.go.registerFunctor("google_vr.getScore", this, "getScore");
        this.go.registerFunctor("google_vr.init", this, "init");
        this.go.registerFunctor("google_vr.start", this, PetzaCommandReceiver.PETZA_START);
        this.go.registerFunctor("google_vr.stop", this, PetzaCommandReceiver.PETZA_STOP);
        this.go.registerFunctor("google_vr.reset", this, "reset");
        this.go.registerFunctor("google_vr.shutdown", this, "shutdown");
    }

    void setStatus(Status status) {
        if (this.mStatus != status) {
            this.mStatus = status;
        }
    }

    public void init(boolean z) {
        this.mDoDebugLogging = z;
        setupRecognizer();
    }

    private void setupRecognizer() {
        debugLog("GoogleVR.init started");
        if (this.mStatus == Status.DOWN) {
            debugLog("GoogleVR.init status = down");
            this.packageName = Application.anApplication.getPackageName();
            debugLog("GoogleVR.init package name = '" + this.packageName + "'");
            this.igoActivity = Application.getIgoActivity();
            StringBuilder sb = new StringBuilder();
            sb.append("GoogleVR.init igoActivity created: ");
            sb.append(this.igoActivity == null ? "no" : "yes");
            debugLog(sb.toString());
            this.igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.voice_recognition.GoogleVR.1
                @Override // java.lang.Runnable
                public void run() {
                    GoogleVR.this.debugLog("GoogleVR.init running on ui thread");
                    Intent intent = new Intent("android.speech.action.GET_LANGUAGE_DETAILS");
                    intent.setPackage("com.google.android.googlequicksearchbox");
                    GoogleVR.this.debugLog("GoogleVR.init intent created");
                    GoogleVR.this.igoActivity.sendOrderedBroadcast(intent, null, GoogleVR.this.new VRLangReceiver(), null, -1, null, null);
                    GoogleVR.this.debugLog("GoogleVR.init bcast sent");
                    GoogleVR googleVR = GoogleVR.this;
                    googleVR.sr = SpeechRecognizer.createSpeechRecognizer(googleVR.igoActivity);
                    GoogleVR.this.debugLog("GoogleVR.init recognizer created");
                    GoogleVR.this.sr.setRecognitionListener(GoogleVR.this);
                    GoogleVR.this.debugLog("GoogleVR.init recognizer listener set");
                }
            });
        }
        debugLog("GoogleVR.init done");
    }

    public void shutdown() {
        debugLog("GoogleVR.shutdown; status='" + String.valueOf(this.mStatus.ordinal()) + "'");
        if (this.mStatus != Status.DOWN) {
            this.igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.voice_recognition.GoogleVR.2
                @Override // java.lang.Runnable
                public void run() {
                    if (GoogleVR.this.sr != null) {
                        GoogleVR.this.sr.destroy();
                    }
                }
            });
            setStatus(Status.DOWN);
        }
    }

    /* JADX INFO: renamed from: com.navngo.igo.javaclient.voice_recognition.GoogleVR$7, reason: invalid class name */
    static /* synthetic */ class AnonymousClass7 {
        static final /* synthetic */ int[] $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status;

        static {
            int[] iArr = new int[Status.values().length];
            $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status = iArr;
            try {
                iArr[Status.DOWN.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[Status.IDLE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[Status.STARTED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[Status.MAY_SPEAK.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[Status.SPEAKING.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[Status.DONE_SPEAKING.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[Status.READY.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    public void reset() {
        debugLog("GoogleVR.reset; status='" + String.valueOf(this.mStatus.ordinal()) + "'");
        switch (AnonymousClass7.$SwitchMap$com$navngo$igo$javaclient$voice_recognition$GoogleVR$Status[this.mStatus.ordinal()]) {
            case 1:
                setupRecognizer();
                return;
            case 2:
                return;
            case 3:
            case 4:
            case 5:
            case 6:
                debugLog("Cancelling;");
                cancel();
                break;
            case 7:
                this.mResults = new ArrayList<>();
                break;
        }
        setStatus(Status.IDLE);
    }

    private void cancel() {
        this.igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.voice_recognition.GoogleVR.3
            @Override // java.lang.Runnable
            public void run() {
                if (GoogleVR.this.sr != null) {
                    GoogleVR.this.sr.cancel();
                }
                GoogleVR.this.debugLog("Cancelled;");
            }
        });
    }

    public void start() {
        debugLog("GoogleVR.start");
        PermissionHandler.get().requestPermission(this.igoActivity, "android.permission.RECORD_AUDIO", new PermissionHandler.CallbackForOne() { // from class: com.navngo.igo.javaclient.voice_recognition.GoogleVR.4
            @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForOne
            public void onPermissionGranted() {
                GoogleVR.this.debugLog("onPermissionGranted");
                GoogleVR.this.startInternal();
            }

            @Override // com.navngo.igo.javaclient.permission.PermissionHandler.CallbackForOne
            public void onPermissionDenied() {
                GoogleVR.this.debugLog("onPermissionDenied");
                GoogleVR.this.onError(9);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startInternal() {
        debugLog("GoogleVR.startInternal started");
        reset();
        debugLog("GoogleVR.startInternal #1");
        if (this.sr != null) {
            debugLog("Starting;");
            setStatus(Status.STARTED);
            this.mError = 0;
            this.igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.voice_recognition.GoogleVR.5
                @Override // java.lang.Runnable
                public void run() {
                    Intent intent = new Intent("android.speech.action.RECOGNIZE_SPEECH");
                    intent.putExtra("android.speech.extra.LANGUAGE", GoogleVR.this.mLocaleName);
                    intent.putExtra("android.speech.extra.EXTRA_ADDITIONAL_LANGUAGES", new String[0]);
                    intent.putExtra("android.speech.extra.LANGUAGE_MODEL", GoogleVR.this.mLangModel);
                    intent.putExtra("android.speech.extra.MAX_RESULTS", GoogleVR.this.mMaxResults);
                    intent.putExtra("android.speech.extra.PARTIAL_RESULTS", false);
                    intent.putExtra("android.speech.extras.SPEECH_INPUT_MINIMUM_LENGTH_MILLIS", GoogleVR.this.mMinSpeechMillis);
                    intent.putExtra("android.speech.extras.SPEECH_INPUT_POSSIBLY_COMPLETE_SILENCE_LENGTH_MILLIS", GoogleVR.this.mMinSilenceMillis);
                    intent.putExtra("android.speech.extras.SPEECH_INPUT_COMPLETE_SILENCE_LENGTH_MILLIS", GoogleVR.this.mMaxSilenceMillis);
                    intent.putExtra("calling_package", GoogleVR.this.packageName);
                    GoogleVR.this.sr.startListening(intent);
                    GoogleVR.this.debugLog("GoogleVR.started listening; status='" + String.valueOf(GoogleVR.this.mStatus.ordinal()) + "'");
                }
            });
        }
        debugLog("GoogleVR.startInternal done");
    }

    public void stop() {
        debugLog("GoogleVR.stop; status='" + String.valueOf(this.mStatus.ordinal()) + "'");
        if (this.sr != null) {
            if (this.mStatus == Status.MAY_SPEAK || this.mStatus == Status.SPEAKING) {
                debugLog("Stopping;");
                this.igoActivity.runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.voice_recognition.GoogleVR.6
                    @Override // java.lang.Runnable
                    public void run() {
                        GoogleVR.this.sr.stopListening();
                    }
                });
                setStatus(Status.DONE_SPEAKING);
            }
        }
    }

    @Override // android.speech.RecognitionListener
    public void onError(int i) {
        debugLog("GoogleVR.error; status='" + String.valueOf(this.mStatus.ordinal()) + "', error='" + String.valueOf(i) + "'");
        if (this.mStatus == Status.IDLE) {
            debugLog("Ignoring error: Status is STARTED or IDLE");
            return;
        }
        if (this.mStatus == Status.STARTED) {
            debugLog("Restart listening because it does not started yet");
            stop();
            start();
        } else {
            this.mError = i;
            this.mStatus = Status.IDLE;
            this.go.callIgo("asr.freetext.on_error", null, Integer.valueOf(this.mError));
        }
    }

    @Override // android.speech.RecognitionListener
    public void onReadyForSpeech(Bundle bundle) {
        debugLog("The endpointer is ready for the user to start speaking;");
        setStatus(Status.MAY_SPEAK);
        this.go.callIgo("asr.freetext.on_ready_for_speech", null, new Object[0]);
    }

    @Override // android.speech.RecognitionListener
    public void onBeginningOfSpeech() {
        debugLog("The user has started to speak;");
        setStatus(Status.SPEAKING);
    }

    @Override // android.speech.RecognitionListener
    public void onPartialResults(Bundle bundle) {
        DebugLogger.D2(TAG, "Unwanted onPartialResults arrived");
    }

    @Override // android.speech.RecognitionListener
    public void onEndOfSpeech() {
        debugLog("The user has stopped speaking;");
        setStatus(Status.DONE_SPEAKING);
        this.go.callIgo("asr.freetext.on_speech_ended", null, new Object[0]);
    }

    void dumpResult(String str, float f) {
        debugLog("Result; text='" + str + "', score='" + String.valueOf(f) + "'");
    }

    @Override // android.speech.RecognitionListener
    public void onResults(Bundle bundle) {
        ArrayList<String> stringArrayList = bundle.getStringArrayList("results_recognition");
        float[] floatArray = bundle.getFloatArray("confidence_scores");
        if (stringArrayList == null) {
            this.mResults = new ArrayList<>();
            debugLog("GoogleVR.results none;");
        } else if (floatArray == null) {
            debugLog("GoogleVR.results without scores;");
            this.mResults = new ArrayList<>(stringArrayList.size());
            for (String str : stringArrayList) {
                debugLog("GoogleVR.result; s='" + str + "'");
                this.mResults.add(new Result(str, -1.0f));
            }
        } else {
            debugLog("GoogleVR.results with scores;");
            this.mResults = new ArrayList<>(stringArrayList.size());
            int i = 0;
            for (String str2 : stringArrayList) {
                if (i < floatArray.length) {
                    debugLog("GoogleVR.result; s='" + str2 + "', score='" + String.valueOf(floatArray[i]) + "'");
                    this.mResults.add(new Result(str2, floatArray[i]));
                    i++;
                } else {
                    debugLog("GoogleVR.result; s='" + str2 + "'");
                    this.mResults.add(new Result(str2, -1.0f));
                }
            }
        }
        setStatus(Status.READY);
        if (this.go == null) {
            debugLog("AndroidGo is null");
            return;
        }
        debugLog("GoogleVR.result calling asr.freetext.on_begin_results");
        this.go.callIgo("asr.freetext.on_begin_results", null, new Object[0]);
        debugLog("GoogleVR.result enumerating results");
        int numResults = getNumResults();
        for (int i2 = 0; i2 < numResults; i2++) {
            debugLog("GoogleVR.result calling asr.freetext.on_add_result " + String.valueOf(i2) + "; score=" + String.valueOf(getScore(i2)) + ", result='" + getResult(i2) + "'");
            this.go.callIgo("asr.freetext.on_add_result", null, Integer.valueOf(getScore(i2)), getResult(i2));
        }
        debugLog("GoogleVR.result calling asr.freetext.on_end_results");
        this.go.callIgo("asr.freetext.on_end_results", null, new Object[0]);
    }

    @Override // android.speech.RecognitionListener
    public void onEvent(int i, Bundle bundle) {
        DebugLogger.D2(TAG, "Unwanted onEvent arrived");
    }

    @Override // android.speech.RecognitionListener
    public void onRmsChanged(float f) {
        int iMax = Math.max(0, Math.min(255, (int) (((f + 2.0f) / 12.0f) * 255.0f)));
        this.mSoundLevel = iMax;
        this.go.callIgo("asr.freetext.on_rms_changed", null, Integer.valueOf(iMax));
    }
}
