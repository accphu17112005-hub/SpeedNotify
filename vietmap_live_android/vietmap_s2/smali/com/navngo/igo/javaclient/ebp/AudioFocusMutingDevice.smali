###### Class com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice (com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice)
.class public Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;
.super Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;
.source "AudioFocusMutingDevice.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/ebp/IMutingDevice;
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;
    }
.end annotation


# static fields
.field private static final logname:Ljava/lang/String; = "AudioFocusMutingDevice"


# instance fields
.field private final mAudioFocusHandler:Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;

.field private mIsForceCallModeSet:Z

.field private mIsForceSpeakerOutSet:Z

.field private mLastAudioMode:I

.field private mLastSpeakerPhoneOn:Z

.field final mScoAudioStateChangedReceiver:Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 176
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/ebp/MutingDeviceBase;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    .line 25
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    .line 103
    new-instance v0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;-><init>(Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$1;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mScoAudioStateChangedReceiver:Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;

    .line 177
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v1

    const-string v2, "audio_focus.isBluetoothA2dpOn"

    const-string v3, "isBluetoothA2dpOn"

    .line 178
    invoke-virtual {v1, v2, p0, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "audio_focus.isBluetoothScoOn"

    const-string v3, "isBluetoothScoOn"

    .line 179
    invoke-virtual {v1, v2, p0, v3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 181
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Lcom/navngo/igo/javaclient/Application;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 182
    new-instance v0, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;-><init>(Landroid/media/AudioManager$OnAudioFocusChangeListener;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mAudioFocusHandler:Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;

    return-void
.end method

.method private setForceCallMode(Z)V
    .registers 3

    .line 149
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    if-eqz p1, :cond_18

    .line 151
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    if-nez p1, :cond_28

    const/4 p1, 0x2

    .line 152
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setMode(I)V

    .line 153
    invoke-virtual {v0}, Landroid/media/AudioManager;->startBluetoothSco()V

    const/4 p1, 0x1

    .line 154
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 155
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    goto :goto_28

    .line 158
    :cond_18
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    if-eqz p1, :cond_28

    .line 159
    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    const/4 p1, 0x0

    .line 160
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 161
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setMode(I)V

    .line 162
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    :cond_28
    :goto_28
    return-void
.end method

.method private setForceSpeakerOut(Z)V
    .registers 4

    .line 130
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    if-eqz p1, :cond_21

    .line 132
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    if-nez p1, :cond_32

    .line 133
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mLastAudioMode:I

    .line 134
    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result p1

    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mLastSpeakerPhoneOn:Z

    const/4 p1, 0x1

    .line 135
    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    const/4 v1, 0x3

    .line 136
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 137
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    goto :goto_32

    .line 140
    :cond_21
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    if-eqz p1, :cond_32

    .line 141
    iget p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mLastAudioMode:I

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setMode(I)V

    .line 142
    iget-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mLastSpeakerPhoneOn:Z

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    const/4 p1, 0x0

    .line 143
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    :cond_32
    :goto_32
    return-void
.end method


# virtual methods
.method public Close()V
    .registers 1

    return-void
.end method

.method public Mute(III)V
    .registers 12

    .line 106
    sget v0, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Mute("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") audio stream "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", IsForceCallModeSet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", IsForceSpeakerOutSet: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "AudioFocusMutingDevice"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v1

    .line 110
    iget-object v3, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mAudioFocusHandler:Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;

    invoke-virtual {v3, p1, v0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->requestFocus(II)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_52

    const/4 v3, 0x1

    goto :goto_53

    :cond_52
    const/4 v3, 0x0

    .line 112
    :goto_53
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Requested focus; stream=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\', success=\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_6a

    const-string v0, "yes"

    goto :goto_6c

    :cond_6a
    const-string v0, "no"

    :goto_6c
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_a4

    .line 113
    invoke-virtual {v1}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    if-nez v0, :cond_a4

    if-eqz p2, :cond_87

    const/4 p2, 0x1

    goto :goto_88

    :cond_87
    const/4 p2, 0x0

    :goto_88
    if-eqz p3, :cond_8c

    const/4 p3, 0x1

    goto :goto_8d

    :cond_8c
    const/4 p3, 0x0

    :goto_8d
    if-eqz p2, :cond_99

    .line 117
    invoke-virtual {v1}, Landroid/media/AudioManager;->isBluetoothA2dpOn()Z

    move-result p2

    if-eqz p2, :cond_a4

    .line 118
    invoke-direct {p0, v5}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->setForceSpeakerOut(Z)V

    goto :goto_a4

    :cond_99
    if-eqz p3, :cond_a4

    .line 121
    invoke-virtual {v1}, Landroid/media/AudioManager;->isBluetoothScoAvailableOffCall()Z

    move-result p2

    if-eqz p2, :cond_a4

    .line 122
    invoke-direct {p0, v5}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->setForceCallMode(Z)V

    :cond_a4
    :goto_a4
    if-eqz v3, :cond_a7

    goto :goto_a8

    :cond_a7
    const/4 v4, 0x2

    .line 126
    :goto_a8
    invoke-virtual {p0, v4, p1}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->AudiofocusChanged(II)V

    return-void
.end method

.method public Unmute()V
    .registers 3

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unmute() streamID: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", IsForceCallModeSet: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceCallModeSet:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", IsForceSpeakerOutSet: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mIsForceSpeakerOutSet:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioFocusMutingDevice"

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 170
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->setForceCallMode(Z)V

    .line 171
    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->setForceSpeakerOut(Z)V

    .line 172
    iget-object v1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->mAudioFocusHandler:Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/ebp/AudioFocusHandler;->abandonFocus()V

    const/4 v1, 0x1

    .line 173
    invoke-virtual {p0, v1, v0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->AudiofocusChanged(II)V

    return-void
.end method

.method public isBluetoothA2dpOn()Z
    .registers 4

    .line 186
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 187
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothA2dpOn()Z

    move-result v0

    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isBluetoothA2dpOn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "AudioFocusMutingDevice"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public isBluetoothScoOn()Z
    .registers 4

    .line 193
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    .line 194
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v0

    .line 195
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isBluetoothScoOn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "AudioFocusMutingDevice"

    invoke-static {v2, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method

.method public onAudioFocusChange(I)V
    .registers 5

    const/4 v0, -0x3

    const-string v1, "AudioFocusMutingDevice"

    if-eq p1, v0, :cond_55

    const/4 v0, -0x2

    if-eq p1, v0, :cond_4f

    const/4 v0, -0x1

    if-eq p1, v0, :cond_49

    const/4 v0, 0x1

    if-eq p1, v0, :cond_43

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3d

    const/4 v0, 0x3

    if-eq p1, v0, :cond_37

    const/4 v0, 0x4

    if-eq p1, v0, :cond_31

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown audio focus notify; type=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_31
    const-string v0, "transient exclusive audio focus gained"

    .line 45
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_37
    const-string v0, "transient audio focus gained, may duck"

    .line 40
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_3d
    const-string v0, "transient audio focus gained"

    .line 36
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_43
    const-string v0, "audio focus gained"

    .line 32
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_49
    const-string v0, "audio focus loss"

    .line 49
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_4f
    const-string v0, "transient audio focus loss"

    .line 53
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5a

    :cond_55
    const-string v0, "transient audio focus loss, can duck"

    .line 57
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :goto_5a
    if-gez p1, :cond_5f

    .line 66
    invoke-virtual {p0}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;->OnAudioFocusLoss()V

    :cond_5f
    return-void
.end method

###### Class com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice.AnonymousClass1 (com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice$1)
.class synthetic Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$1;
.super Ljava/lang/Object;
.source "AudioFocusMutingDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation

###### Class com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice.ScoAudioStateChangedReceiver (com.navngo.igo.javaclient.ebp.AudioFocusMutingDevice$ScoAudioStateChangedReceiver)
.class final Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AudioFocusMutingDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ScoAudioStateChangedReceiver"
.end annotation


# instance fields
.field ScoPlaybackWaiting:Z

.field currState:I

.field prevState:I

.field final synthetic this$0:Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;


# direct methods
.method private constructor <init>(Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;)V
    .registers 2

    .line 70
    iput-object p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->this$0:Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    const/4 p1, -0x1

    .line 71
    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->prevState:I

    .line 72
    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->currState:I

    const/4 p1, 0x0

    .line 73
    iput-boolean p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->ScoPlaybackWaiting:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$1;)V
    .registers 3

    .line 70
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;-><init>(Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice;)V

    return-void
.end method


# virtual methods
.method public getState()I
    .registers 2

    .line 76
    iget v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->currState:I

    return v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 4

    .line 85
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_47

    const-string p1, "android.media.extra.SCO_AUDIO_PREVIOUS_STATE"

    const/4 v0, -0x1

    .line 86
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->prevState:I

    const-string p1, "android.media.extra.SCO_AUDIO_STATE"

    .line 87
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->currState:I

    .line 88
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Sco State Updated. Previous: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->prevState:I

    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->scoAudioStateToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " Current: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->currState:I

    invoke-virtual {p0, p2}, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->scoAudioStateToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "AudioFocusMutingDevice"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_47
    return-void
.end method

.method public resetScoplaybackWait()V
    .registers 2

    const/4 v0, 0x1

    .line 80
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/ebp/AudioFocusMutingDevice$ScoAudioStateChangedReceiver;->ScoPlaybackWaiting:Z

    return-void
.end method

.method public scoAudioStateToString(I)Ljava/lang/String;
    .registers 3

    const/4 v0, -0x1

    if-eq p1, v0, :cond_17

    if-eqz p1, :cond_14

    const/4 v0, 0x1

    if-eq p1, v0, :cond_11

    const/4 v0, 0x2

    if-eq p1, v0, :cond_e

    const-string p1, "unknown"

    return-object p1

    :cond_e
    const-string p1, "connecting"

    return-object p1

    :cond_11
    const-string p1, "connected"

    return-object p1

    :cond_14
    const-string p1, "disconnected"

    return-object p1

    :cond_17
    const-string p1, "error"

    return-object p1
.end method
