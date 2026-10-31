###### Class com.navngo.igo.javaclient.AndroidAudioTrackAdapter (com.navngo.igo.javaclient.AndroidAudioTrackAdapter)
.class Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;
.super Ljava/lang/Object;
.source "AndroidAudioTrackAdapter.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/IAudioTrackAdapter;


# static fields
.field private static final logname:Ljava/lang/String; = "AndroidAudioTrackAdapter"


# instance fields
.field protected track:Landroid/media/AudioTrack;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public flush()V
    .registers 2

    .line 53
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->flush()V

    return-void
.end method

.method public getPlayState()I
    .registers 2

    .line 63
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    return v0
.end method

.method public getState()I
    .registers 2

    .line 68
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    return v0
.end method

.method public initFromFactory(IIIIII)V
    .registers 16

    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v1, "AndroidAudioTrackAdapter"

    const/16 v2, 0x17

    if-lt v0, v2, :cond_53

    const-string p1, "Initalizing AndroidAudioTrackAdapter with builder"

    .line 19
    invoke-static {v1, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    new-instance p1, Landroid/media/AudioTrack$Builder;

    invoke-direct {p1}, Landroid/media/AudioTrack$Builder;-><init>()V

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    sget v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_usage:I

    .line 22
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    sget v1, Lcom/navngo/igo/javaclient/Config;->navigation_audio_content_type:I

    .line 23
    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Landroid/media/AudioTrack$Builder;->setAudioAttributes(Landroid/media/AudioAttributes;)Landroid/media/AudioTrack$Builder;

    move-result-object p1

    new-instance v0, Landroid/media/AudioFormat$Builder;

    invoke-direct {v0}, Landroid/media/AudioFormat$Builder;-><init>()V

    .line 26
    invoke-virtual {v0, p4}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object p4

    .line 27
    invoke-virtual {p4, p2}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    move-result-object p2

    .line 28
    invoke-virtual {p2, p3}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object p2

    .line 29
    invoke-virtual {p2}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object p2

    .line 25
    invoke-virtual {p1, p2}, Landroid/media/AudioTrack$Builder;->setAudioFormat(Landroid/media/AudioFormat;)Landroid/media/AudioTrack$Builder;

    move-result-object p1

    .line 30
    invoke-virtual {p1, p5}, Landroid/media/AudioTrack$Builder;->setBufferSizeInBytes(I)Landroid/media/AudioTrack$Builder;

    move-result-object p1

    .line 31
    invoke-virtual {p1, p6}, Landroid/media/AudioTrack$Builder;->setTransferMode(I)Landroid/media/AudioTrack$Builder;

    move-result-object p1

    .line 32
    invoke-virtual {p1}, Landroid/media/AudioTrack$Builder;->build()Landroid/media/AudioTrack;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    goto :goto_66

    :cond_53
    const-string v0, "Initalizing AndroidAudioTrackAdapter"

    .line 34
    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    new-instance v0, Landroid/media/AudioTrack;

    move-object v2, v0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v2 .. v8}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    :goto_66
    return-void
.end method

.method public play()V
    .registers 3

    .line 41
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_e

    .line 42
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    :cond_e
    return-void
.end method

.method public release()V
    .registers 2

    .line 74
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    return-void
.end method

.method public stop()V
    .registers 3

    .line 47
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_e

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    :cond_e
    return-void
.end method

.method public write([BII)I
    .registers 5

    .line 58
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/AudioTrack;->write([BII)I

    move-result p1

    return p1
.end method
