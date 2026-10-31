###### Class com.navngo.igo.javaclient.VietmapAudioTrackAdapter (com.navngo.igo.javaclient.VietmapAudioTrackAdapter)
.class public Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;
.super Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;
.source "VietmapAudioTrackAdapter.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# static fields
.field private static final logname:Ljava/lang/String; = "VietmapAudioTrackAdapter"

.field private static mStreamType:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic flush()V
    .registers 1

    .line 11
    invoke-super {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->flush()V

    return-void
.end method

.method public bridge synthetic getPlayState()I
    .registers 2

    .line 11
    invoke-super {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->getPlayState()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getState()I
    .registers 2

    .line 11
    invoke-super {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->getState()I

    move-result v0

    return v0
.end method

.method public initFromFactory(IIIIII)V
    .registers 15

    const-string p1, "VietmapAudioTrackAdapter"

    const-string v0, "Initalizing VietmapAudioTrackAdapter"

    .line 28
    invoke-static {p1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    new-instance p1, Landroid/media/AudioTrack;

    sget v2, Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;->mStreamType:I

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v1 .. v7}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;->track:Landroid/media/AudioTrack;

    return-void
.end method

.method public bridge synthetic play()V
    .registers 1

    .line 11
    invoke-super {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->play()V

    return-void
.end method

.method public registerFunctors()V
    .registers 4

    .line 17
    invoke-static {}, Lcom/navngo/igo/javaclient/AudioTrackFactory;->getInstance()Lcom/navngo/igo/javaclient/AudioTrackFactory;

    move-result-object v0

    const-class v1, Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;

    const-string v2, "vietmap"

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/AudioTrackFactory;->register(Ljava/lang/String;Ljava/lang/Class;)V

    .line 18
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.vietmap.streamTypeChanged"

    const-string v2, "streamTypeChanged"

    .line 19
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic release()V
    .registers 1

    .line 11
    invoke-super {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->release()V

    return-void
.end method

.method public bridge synthetic stop()V
    .registers 1

    .line 11
    invoke-super {p0}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->stop()V

    return-void
.end method

.method public streamTypeChanged(I)V
    .registers 2

    .line 23
    sput p1, Lcom/navngo/igo/javaclient/VietmapAudioTrackAdapter;->mStreamType:I

    return-void
.end method

.method public bridge synthetic write([BII)I
    .registers 4

    .line 11
    invoke-super {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;->write([BII)I

    move-result p1

    return p1
.end method
