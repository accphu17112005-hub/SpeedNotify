package com.navngo.igo.javaclient;

import android.content.Intent;
import android.os.Bundle;
import android.speech.RecognitionListener;
import android.speech.SpeechRecognizer;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public class ASRRecognizer implements RecognitionListener {
    private static final int ASR_AVOID = 4;
    private static final int ASR_DELETE_ROUTE = 3;
    private static final int ASR_ERROR = 9;
    private static final int ASR_EXIT = 8;
    private static final int ASR_FIND_GAS_STATION = 1;
    private static final int ASR_FIND_PARKING = 2;
    private static final int ASR_GO_TO_MAP = 5;
    private static final int ASR_HOME = 0;
    private static final int ASR_MUTE_UNMUTE = 7;
    private static final int ASR_OVERVIEW = 6;
    private static final int VOICE_RECOGNITION_REQUEST_CODE = 1234;
    private static final String logname = "ASRRecognizer";
    protected SpeechRecognizer mRecognizer;
    private boolean mSpeechRecognitionAvailable;
    private final String asrLock = new String("ASRRecognizer.asrLock");
    private boolean mListening = false;
    private ArrayList<SimpleASRListener> mListeners = new ArrayList<>();

    public interface SimpleASRListener {
        void onBeginningOfSpeech();

        void onEndOfSpeech();

        void onReadyForSpeech();
    }

    ASRRecognizer() {
        this.mSpeechRecognitionAvailable = false;
        this.mSpeechRecognitionAvailable = Application.anApplication.getApplicationContext().getPackageManager().queryIntentActivities(new Intent("android.speech.action.RECOGNIZE_SPEECH"), 0).size() != 0;
        DebugLogger.D2(logname, "mSpeechRecognitionAvailable=" + this.mSpeechRecognitionAvailable);
        SpeechRecognizer speechRecognizerCreateSpeechRecognizer = SpeechRecognizer.createSpeechRecognizer(Application.getIgoActivity());
        this.mRecognizer = speechRecognizerCreateSpeechRecognizer;
        speechRecognizerCreateSpeechRecognizer.setRecognitionListener(this);
    }

    public boolean registerSimpleASRListener(SimpleASRListener simpleASRListener) {
        return this.mListeners.add(simpleASRListener);
    }

    public boolean unregisterSimpleASRListener(SimpleASRListener simpleASRListener) {
        return this.mListeners.remove(simpleASRListener);
    }

    @Override // android.speech.RecognitionListener
    public void onBeginningOfSpeech() {
        DebugLogger.D2(logname, "onBeginningOfSpeech()");
        Iterator<SimpleASRListener> it = this.mListeners.iterator();
        while (it.hasNext()) {
            it.next().onBeginningOfSpeech();
        }
    }

    @Override // android.speech.RecognitionListener
    public void onBufferReceived(byte[] bArr) {
        DebugLogger.D2(logname, "onBufferReceived()");
    }

    @Override // android.speech.RecognitionListener
    public void onEndOfSpeech() {
        DebugLogger.D2(logname, "onEndOfSpeech()");
        Iterator<SimpleASRListener> it = this.mListeners.iterator();
        while (it.hasNext()) {
            it.next().onEndOfSpeech();
        }
    }

    @Override // android.speech.RecognitionListener
    public void onError(int i) {
        DebugLogger.D2(logname, "onError(" + i + ")");
        this.mListening = false;
        if (i == 0) {
            this.mSpeechRecognitionAvailable = true;
        } else {
            sendMessage(9);
        }
    }

    @Override // android.speech.RecognitionListener
    public void onEvent(int i, Bundle bundle) {
        DebugLogger.D2(logname, "onEvent()");
    }

    @Override // android.speech.RecognitionListener
    public void onPartialResults(Bundle bundle) {
        DebugLogger.D2(logname, "onPartialResults()");
    }

    @Override // android.speech.RecognitionListener
    public void onReadyForSpeech(Bundle bundle) {
        DebugLogger.D2(logname, "onReadyForSpeech()");
        Iterator<SimpleASRListener> it = this.mListeners.iterator();
        while (it.hasNext()) {
            it.next().onReadyForSpeech();
        }
    }

    private boolean startsWithIgnoreCase(String str, String str2) {
        if (str == null || str2 == null) {
            return str == null && str2 == null;
        }
        if (str2.length() > str.length()) {
            return false;
        }
        return str.regionMatches(true, 0, str2, 0, str2.length());
    }

    @Override // android.speech.RecognitionListener
    public void onResults(Bundle bundle) {
        synchronized (this.asrLock) {
            this.mListening = false;
            DebugLogger.D4(logname, "entering onResults");
            ArrayList<String> stringArrayList = bundle.getStringArrayList("results_recognition");
            if (stringArrayList == null) {
                DebugLogger.D4(logname, "onResults: no results ");
                return;
            }
            Iterator<String> it = stringArrayList.iterator();
            while (it.hasNext()) {
                String lowerCase = it.next().toLowerCase(Locale.US);
                if (lowerCase.contains("home")) {
                    DebugLogger.D4(logname, "HOME command recognized");
                    sendMessage(0);
                } else if (lowerCase.contains("avoid")) {
                    DebugLogger.D4(logname, "AVOID command recognized");
                    sendMessage(4);
                } else if (lowerCase.contains("over")) {
                    DebugLogger.D4(logname, "OVERVIEW command recognized");
                    sendMessage(6);
                } else if (lowerCase.contains("mute")) {
                    DebugLogger.D4(logname, "MUTE/UNMUTE command recognized");
                    sendMessage(7);
                } else if (lowerCase.contains("exit")) {
                    DebugLogger.D4(logname, "EXIT command recognized");
                    sendMessage(8);
                } else if (lowerCase.contains("findgas")) {
                    DebugLogger.D4(logname, "GAS_STATION command recognized");
                    sendMessage(1);
                } else if (lowerCase.contains("findpark")) {
                    DebugLogger.D4(logname, "PARKING command recognized");
                    sendMessage(2);
                } else if (lowerCase.contains("delete")) {
                    DebugLogger.D4(logname, "DELETE command recognized");
                    sendMessage(3);
                } else if (lowerCase.contains("go")) {
                    DebugLogger.D4(logname, "MAP command recognized");
                    sendMessage(5);
                } else {
                    DebugLogger.D4(logname, "onResults: Unidentified sentence: '" + lowerCase + "'");
                }
            }
            this.asrLock.notify();
        }
    }

    @Override // android.speech.RecognitionListener
    public void onRmsChanged(float f) {
        DebugLogger.D2(logname, "onRmsChanged()");
    }

    private void sendMessage(int i) {
        AndroidGo androidGo = AndroidGo.getInstance();
        DebugLogger.D4(logname, "sendMessage(" + i + ")");
        androidGo.callUI("kmop_asr.sc_sendMessage", null, Integer.valueOf(i));
    }

    public void listen() {
        DebugLogger.D4(logname, "listen " + this.mListening);
        if (this.mSpeechRecognitionAvailable) {
            if (!this.mListening) {
                Application.getIgoActivity().runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.ASRRecognizer.1
                    Intent recogIntent = new Intent("android.speech.action.RECOGNIZE_SPEECH");

                    @Override // java.lang.Runnable
                    public void run() {
                        ASRRecognizer.this.mRecognizer.startListening(this.recogIntent);
                    }
                });
                this.mListening = true;
                return;
            } else {
                stopListening();
                return;
            }
        }
        DebugLogger.D4(logname, "SpeechRecognition unavailable");
        sendMessage(9);
    }

    public void stopListening() {
        if (this.mSpeechRecognitionAvailable) {
            if (this.mListening) {
                Application.getIgoActivity().runOnUiThread(new Runnable() { // from class: com.navngo.igo.javaclient.ASRRecognizer.2
                    @Override // java.lang.Runnable
                    public void run() {
                        ASRRecognizer.this.mRecognizer.stopListening();
                    }
                });
                this.mListening = false;
                return;
            }
            return;
        }
        DebugLogger.D4(logname, "SpeechRecognition unavailable");
        sendMessage(9);
    }

    public void messageProcessed(int i, int i2) {
        DebugLogger.D4(logname, "messageProcessed(" + i + "," + i2 + ")");
    }
}
