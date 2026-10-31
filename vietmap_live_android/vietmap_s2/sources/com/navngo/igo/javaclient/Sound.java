package com.navngo.igo.javaclient;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.Build;
import com.navngo.igo.javaclient.Application;
import com.navngo.igo.javaclient.androidgo.AndroidGo;
import com.navngo.igo.javaclient.ebp.AndroidMutingDevice;
import com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice;
import com.navngo.igo.javaclient.ebp.EmptyMutingDevice;
import com.navngo.igo.javaclient.ebp.MutingDeviceBase;
import com.navngo.igo.javaclient.functors.IFunctorCollection;
import com.navngo.igo.javaclient.receiver.IReceiver;
import com.navngo.igo.javaclient.receiver.PetzaCommandReceiver;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/* JADX INFO: loaded from: /tmp/decompiler/2c83d51c71ec4ea69ef0e6ccadbd55f0/classes.dex */
public final class Sound extends BroadcastReceiver implements IReceiver, IFunctorCollection, OnActivityDestroyedListener {
    private static final int OS_MAX_VOLUME = 255;
    private static Sound instance = null;
    private static final String logname = "Sound";
    private final AudioManager mAudioManager;
    private final int mMaxVolume;
    private int mNumberOfBuffers;
    private PlayerThread mPlayerThread;
    private double mPrecVolume;
    public final int mSoundStream;
    private boolean mIgnoreVolumeChangedEvent = false;
    private IAudioTrackAdapter mTrack = null;
    private final LinkedList<Buffer> mQueuedBuffers = new LinkedList<>();
    private Buffer mCurrentBuffer = null;
    private final String mPlayerLock = new String("Sound.playerLock");
    private boolean mLogBufferPlayback = false;
    protected MutingDeviceBase mMutingDevice = null;

    private int GetAudioFormat(int i) {
        return i == 8 ? 3 : 2;
    }

    private int GetChannelConfig(int i) {
        return i == 1 ? 4 : 12;
    }

    class Buffer {
        final byte[] buf;
        final int bufferID;
        final List<Integer> controlBufferIDs = new ArrayList();

        Buffer(byte[] bArr, int i) {
            this.buf = bArr;
            this.bufferID = i;
        }
    }

    protected Sound() {
        instance = this;
        int i = Config.navigation_audio_stream;
        this.mSoundStream = i;
        AudioManager audioManager = Application.getAudioManager();
        this.mAudioManager = audioManager;
        this.mMaxVolume = audioManager.getStreamMaxVolume(i);
        this.mPrecVolume = audioManager.getStreamVolume(i);
        PlayerThread playerThread = new PlayerThread();
        this.mPlayerThread = playerThread;
        playerThread.start();
    }

    public static Sound getInstance() {
        Sound sound = instance;
        return sound != null ? sound : new Sound();
    }

    public void setMutingDevice(MutingDeviceBase mutingDeviceBase) {
        this.mMutingDevice = mutingDeviceBase;
    }

    public MutingDeviceBase getMutingDevice() {
        if (this.mMutingDevice == null) {
            int i = Config.getInt("sound", "android_muting_device", 2);
            if (i == 0) {
                DebugLogger.D3(logname, "MutingDevice: Empty");
                this.mMutingDevice = new EmptyMutingDevice();
            } else if (i == 1) {
                DebugLogger.D3(logname, "MutingDevice: Android");
                this.mMutingDevice = new AndroidMutingDevice();
            } else if (i == 2) {
                DebugLogger.D3(logname, "MutingDevice: AudioFocus");
                this.mMutingDevice = new AudioFocusMutingDevice();
            } else {
                DebugLogger.D2(logname, "MutingDevice: INVALID, falling back to Empty");
                DebugLogger.D3(logname, "MutingDevice: Empty");
                this.mMutingDevice = new EmptyMutingDevice();
            }
        }
        return this.mMutingDevice;
    }

    @Override // com.navngo.igo.javaclient.functors.IFunctorCollection
    public void registerFunctors() {
        AndroidGo androidGo = AndroidGo.getInstance();
        DebugLogger.D4(logname, "registering getVolume and setVolume");
        androidGo.registerFunctor("android.getVolume", this, "getVolume");
        androidGo.registerFunctor("android.setVolume", this, "setVolume");
        Application.anApplication.runActivityCommand(new Application.IActivityCommand() { // from class: com.navngo.igo.javaclient.Sound.1
            @Override // com.navngo.igo.javaclient.Application.IActivityCommand
            public void run(IgoActivity igoActivity) {
                igoActivity.registerOnActivityDestroyedListener(this);
            }
        });
        ServerRunner.addEngineStoppedCallback(new Runnable() { // from class: com.navngo.igo.javaclient.Sound.2
            @Override // java.lang.Runnable
            public void run() {
                Sound.this.mMutingDevice.Close();
                Sound.this.mMutingDevice = null;
            }
        });
    }

    @Override // com.navngo.igo.javaclient.OnActivityDestroyedListener
    public void onActivityDestroyed(IgoActivity igoActivity) {
        synchronized (this.mPlayerLock) {
            IAudioTrackAdapter iAudioTrackAdapter = this.mTrack;
            if (iAudioTrackAdapter != null) {
                iAudioTrackAdapter.release();
                this.mTrack = null;
            }
        }
    }

    public void init(Activity activity) {
        if (!this.mPlayerThread.isAlive()) {
            PlayerThread playerThread = new PlayerThread();
            this.mPlayerThread = playerThread;
            playerThread.start();
        }
        if (activity != null) {
            activity.setVolumeControlStream(this.mSoundStream);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void logBufferPlayback(String str) {
        if (this.mLogBufferPlayback) {
            DebugLogger.D3(logname, str);
        }
    }

    public int getMinBufferSize(int i, int i2, int i3) {
        return AudioTrack.getMinBufferSize(i, GetChannelConfig(i2), GetAudioFormat(i3));
    }

    public void start(int i, int i2, int i3, int i4, int i5, int i6) {
        if (8 != i3 && 16 != i3) {
            DebugLogger.D2(logname, "start failed: only 8 or 16 bit mode is supported");
            return;
        }
        this.mLogBufferPlayback = i6 != 0;
        int iGetChannelConfig = GetChannelConfig(i2);
        int iGetAudioFormat = GetAudioFormat(i3);
        int i7 = (i4 * i3) / 8;
        logBufferPlayback("start smpRate(" + i + ") channels(" + i2 + ") bits(" + i3 + ") bufferSizeInBytes(" + i7 + ") numberOfBuffers(" + i5 + ") MinBufferSize(" + AudioTrack.getMinBufferSize(i, iGetChannelConfig, iGetAudioFormat) + ")");
        this.mNumberOfBuffers = i5;
        this.mPlayerThread.waitPreviousPlayToFinish();
        synchronized (this.mPlayerLock) {
            IAudioTrackAdapter iAudioTrackAdapterCreate = AudioTrackFactory.getInstance().create(this.mSoundStream, i, iGetChannelConfig, iGetAudioFormat, i7, 1);
            this.mTrack = iAudioTrackAdapterCreate;
            if (iAudioTrackAdapterCreate != null) {
                DebugLogger.D4(logname, "created AudioTrack, state: " + this.mTrack.getState());
            } else {
                DebugLogger.D4(logname, "failed to create AudioTrack, track == null");
            }
        }
    }

    public void close() {
        logBufferPlayback("close");
        synchronized (this.mPlayerLock) {
            IAudioTrackAdapter iAudioTrackAdapter = this.mTrack;
            if (iAudioTrackAdapter != null) {
                iAudioTrackAdapter.release();
                this.mTrack = null;
            }
        }
    }

    public void stop() {
        logBufferPlayback(PetzaCommandReceiver.PETZA_STOP);
        synchronized (this.mPlayerLock) {
            IAudioTrackAdapter iAudioTrackAdapter = this.mTrack;
            if (iAudioTrackAdapter != null) {
                iAudioTrackAdapter.stop();
            }
        }
    }

    public int playBuffer(byte[] bArr, int i) {
        int iMax;
        synchronized (this.mPlayerLock) {
            this.mQueuedBuffers.add(new Buffer(bArr, i));
            this.mPlayerLock.notify();
            int size = this.mQueuedBuffers.size() + (this.mCurrentBuffer == null ? 0 : 1);
            logBufferPlayback("playBuffer id: " + i + ", bufferCnt: " + size);
            iMax = Math.max(0, this.mNumberOfBuffers - size);
        }
        return iMax;
    }

    public void linkControlBuffer(int i) {
        Buffer last;
        synchronized (this.mPlayerLock) {
            logBufferPlayback("linkControlBuffer id: " + i + ", queuedBuffers size: " + this.mQueuedBuffers.size());
            if (!this.mQueuedBuffers.isEmpty()) {
                last = this.mQueuedBuffers.getLast();
            } else {
                last = this.mCurrentBuffer;
                if (last == null) {
                    last = null;
                }
            }
            if (last != null) {
                last.controlBufferIDs.add(Integer.valueOf(i));
                logBufferPlayback("linkControlBuffer id (" + i + ") linked to buffer(" + last.bufferID + ")");
            }
        }
        if (last == null) {
            NNG.Sound_Finished(false, 0, 1, new int[]{i});
            logBufferPlayback("linkControlBuffer Sound_Finished(" + i + ")");
        }
    }

    public boolean canPlayBuffer() {
        boolean z;
        synchronized (this.mPlayerLock) {
            z = (this.mNumberOfBuffers - this.mQueuedBuffers.size()) - (this.mCurrentBuffer == null ? 0 : 1) > 0;
        }
        return z;
    }

    public boolean isPlaying() {
        boolean z;
        synchronized (this.mPlayerLock) {
            z = (this.mCurrentBuffer == null && this.mQueuedBuffers.isEmpty()) ? false : true;
        }
        return z;
    }

    public int getVolume() {
        int streamVolume = this.mAudioManager.getStreamVolume(this.mSoundStream);
        DebugLogger.D3(logname, String.format(null, "Volume get: %d / %d on Sound Stream: %d", Integer.valueOf(streamVolume), Integer.valueOf(this.mMaxVolume), Integer.valueOf(this.mSoundStream)));
        if (((int) Math.ceil(this.mPrecVolume)) != streamVolume) {
            this.mPrecVolume = streamVolume;
        }
        int i = this.mMaxVolume;
        if (i != 0) {
            return (int) ((this.mPrecVolume * 255.0d) / ((double) i));
        }
        return 0;
    }

    public void setVolume(int i) {
        int i2 = this.mMaxVolume;
        int i3 = (((i * i2) + 255) - 1) / 255;
        this.mPrecVolume = ((double) (i * i2)) / 255.0d;
        if (this.mAudioManager.getStreamVolume(this.mSoundStream) != i3) {
            DebugLogger.D3(logname, String.format(null, "Volume set to: %d / %d on Sound Stream: %d", Integer.valueOf(i3), Integer.valueOf(this.mMaxVolume), Integer.valueOf(this.mSoundStream)));
            this.mIgnoreVolumeChangedEvent = true;
            this.mAudioManager.setStreamVolume(this.mSoundStream, i3, 0);
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public synchronized void register() {
        if (!Config.getBool("sound", "disable_volume_changed_action", false)) {
            Application.anApplication.registerReceiver(this, new IntentFilter("android.media.VOLUME_CHANGED_ACTION"));
        }
    }

    @Override // com.navngo.igo.javaclient.receiver.IReceiver
    public synchronized void unregister() {
        if (!Config.getBool("sound", "disable_volume_changed_action", false)) {
            Application.anApplication.unregisterReceiver(this);
        }
        this.mPlayerThread.stopThread();
        instance = null;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (this.mIgnoreVolumeChangedEvent) {
            DebugLogger.D4(logname, "onReceive - IgnoreVolumeChangedEvent");
            this.mIgnoreVolumeChangedEvent = false;
            return;
        }
        int i = intent.getExtras().getInt("android.media.EXTRA_VOLUME_STREAM_TYPE", 0);
        if (i == this.mSoundStream) {
            DebugLogger.D4(logname, "android.media.VOLUME_CHANGED_ACTION received");
            int ringerMode = this.mAudioManager.getRingerMode();
            if (intent.getExtras().getInt("android.media.EXTRA_VOLUME_STREAM_VALUE", 0) > 0 && ((ringerMode == 0 || ringerMode == 1) && (Build.VERSION.SDK_INT < 23 || ((NotificationManager) context.getSystemService("notification")).isNotificationPolicyAccessGranted()))) {
                this.mAudioManager.setRingerMode(2);
            }
            NotifyIGONativeCodeOfStreamVolume();
            return;
        }
        DebugLogger.D4(logname, String.format(null, "android.media.VOLUME_CHANGED_ACTION received on other stream type: %d (igo uses: %d)", Integer.valueOf(i), Integer.valueOf(this.mSoundStream)));
    }

    public void OnResume() {
        if (Config.getBool("sound", "set_stream_volume_on_resume", true)) {
            NotifyIGONativeCodeOfStreamVolume();
        }
    }

    private void NotifyIGONativeCodeOfStreamVolume() {
        AndroidGo androidGo = AndroidGo.getInstance();
        int volume = getVolume();
        androidGo.callIgo("android.external_set_volume", null, Integer.valueOf(volume));
        androidGo.callIgo("android.external_volume_changed", null, Integer.valueOf(volume));
    }

    final class PlayerThread extends Thread {
        private boolean mDiscardAll;
        private boolean mInloop;

        PlayerThread() {
            super("Sound.PlayerThread");
            this.mDiscardAll = false;
            this.mInloop = false;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            while (!Thread.currentThread().isInterrupted()) {
                try {
                    synchronized (Sound.this.mPlayerLock) {
                        Sound sound = Sound.this;
                        sound.mCurrentBuffer = (Buffer) sound.mQueuedBuffers.poll();
                        if (Sound.this.mCurrentBuffer == null) {
                            Sound.this.mPlayerLock.wait();
                        } else {
                            synchronized (Sound.this.mPlayerLock) {
                                this.mInloop = true;
                                if (Sound.this.mCurrentBuffer != null && !this.mDiscardAll && Sound.this.mTrack != null) {
                                    playCurrentBuffer();
                                }
                            }
                            synchronized (Sound.this.mPlayerLock) {
                                if (Sound.this.mCurrentBuffer != null) {
                                    reportCurrentBufferPlayed();
                                }
                                this.mInloop = false;
                            }
                        }
                    }
                } catch (InterruptedException unused) {
                    DebugLogger.D2(Sound.logname, "PlayerThread.run InterruptedException");
                    return;
                }
            }
        }

        public void stopThread() {
            interrupt();
            synchronized (Sound.this.mPlayerLock) {
                Sound.this.mPlayerLock.notify();
                stopTrack();
                flushTrack();
                while (Sound.this.mQueuedBuffers.size() != 0) {
                    Sound sound = Sound.this;
                    sound.mCurrentBuffer = (Buffer) sound.mQueuedBuffers.poll();
                    reportCurrentBufferPlayed();
                }
            }
        }

        public void waitPreviousPlayToFinish() {
            while (true) {
                discardAllBuffer();
                Sound.this.logBufferPlayback("waitPreviousPlayToFinish");
                synchronized (Sound.this.mPlayerLock) {
                    if (!this.mInloop && Sound.this.mCurrentBuffer == null && Sound.this.mQueuedBuffers.isEmpty()) {
                        this.mDiscardAll = false;
                        return;
                    }
                }
                try {
                    Thread.sleep(100L);
                } catch (InterruptedException unused) {
                }
            }
        }

        public void discardAllBuffer() {
            synchronized (Sound.this.mPlayerLock) {
                Sound.this.logBufferPlayback("discardAllBuffer");
                stopTrack();
                this.mDiscardAll = true;
                Sound.this.mPlayerLock.notify();
            }
        }

        private void startTrack() {
            if (Sound.this.mTrack != null) {
                Sound.this.logBufferPlayback("startTrack");
                Sound.this.mTrack.play();
            }
        }

        private void flushTrack() {
            if (Sound.this.mTrack != null) {
                Sound.this.logBufferPlayback("flushTrack");
                Sound.this.mTrack.flush();
            }
        }

        private void stopTrack() {
            if (Sound.this.mTrack != null) {
                Sound.this.logBufferPlayback("stopTrack");
                Sound.this.mTrack.stop();
            }
        }

        private void playCurrentBuffer() {
            if (Sound.this.mTrack != null) {
                int length = Sound.this.mCurrentBuffer.buf.length;
                Sound.this.logBufferPlayback("playCurrentBuffer: currentBuffer ID(" + Sound.this.mCurrentBuffer.bufferID + ") length(" + length + ")");
                int i = 0;
                while (i < length) {
                    int iWrite = Sound.this.mTrack.write(Sound.this.mCurrentBuffer.buf, i, length - i);
                    Sound.this.logBufferPlayback("playCurrentBuffer: track.write(" + i + "," + length + "," + iWrite + ")");
                    if (iWrite < 0) {
                        DebugLogger.D2(Sound.logname, "playCurrentBuffer: cant write audio: " + iWrite + " pos: " + i + " end: " + length);
                        return;
                    }
                    i += iWrite;
                    startTrack();
                }
                return;
            }
            DebugLogger.D2(Sound.logname, "Cannot write audio, track is null, navigation_audio_stream is misconfigured?");
        }

        private void reportCurrentBufferPlayed() {
            int i = Sound.this.mCurrentBuffer.bufferID;
            int size = Sound.this.mCurrentBuffer.controlBufferIDs.size();
            int[] iArr = new int[size];
            Iterator<Integer> it = Sound.this.mCurrentBuffer.controlBufferIDs.iterator();
            int i2 = 0;
            while (it.hasNext()) {
                iArr[i2] = it.next().intValue();
                i2++;
            }
            Sound.this.mCurrentBuffer = null;
            Sound.this.logBufferPlayback("reportPlayingBufferPlayed (" + i + ")");
            NNG.Sound_Finished(true, i, size, iArr);
        }
    }
}
