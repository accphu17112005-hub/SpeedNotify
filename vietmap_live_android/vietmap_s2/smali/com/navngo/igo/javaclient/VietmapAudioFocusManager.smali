###### Class com.navngo.igo.javaclient.VietmapAudioFocusManager (com.navngo.igo.javaclient.VietmapAudioFocusManager)
.class public Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;
.super Ljava/lang/Object;
.source "VietmapAudioFocusManager.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# instance fields
.field private final logname:Ljava/lang/String;

.field private final mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->logname:Ljava/lang/String;

    .line 12
    new-instance v0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    return-void
.end method


# virtual methods
.method public abandonAudioFocus()V
    .registers 5

    .line 41
    iget-object v0, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->logname:Ljava/lang/String;

    const-string v1, "abandoning audio focus"

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 43
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "vietmap.audio_focus_loss"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    return-void
.end method

.method synthetic lambda$new$0$com-navngo-igo-javaclient-VietmapAudioFocusManager(I)V
    .registers 5

    .line 13
    iget-object v0, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "focus changed, value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-lez p1, :cond_2a

    new-array p1, v1, [Ljava/lang/Object;

    const-string v1, "vietmap.audio_focus_gained"

    .line 16
    invoke-virtual {v0, v1, v2, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    goto :goto_31

    :cond_2a
    new-array p1, v1, [Ljava/lang/Object;

    const-string v1, "vietmap.audio_focus_loss"

    .line 19
    invoke-virtual {v0, v1, v2, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :goto_31
    return-void
.end method

.method public registerFunctors()V
    .registers 4

    .line 25
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.vietmap.requestAudioFocus"

    const-string v2, "requestAudioFocus"

    .line 26
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.vietmap.abandonAudioFocus"

    const-string v2, "abandonAudioFocus"

    .line 27
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public requestAudioFocus(I)V
    .registers 5

    .line 32
    iget-object v0, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->logname:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requesting audio focus with method: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getAudioManager()Landroid/media/AudioManager;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->mFocusChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    sget v2, Lcom/navngo/igo/javaclient/Config;->navigation_audio_stream:I

    invoke-virtual {v0, v1, v2, p1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_32

    .line 36
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "vietmap.audio_focus_gained"

    invoke-virtual {p1, v2, v0, v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->callIgo(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$IActionSucceeded;[Ljava/lang/Object;)V

    :cond_32
    return-void
.end method

###### Class com.navngo.igo.javaclient.VietmapAudioFocusManager$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.VietmapAudioFocusManager$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/VietmapAudioFocusManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;

    return-void
.end method


# virtual methods
.method public final onAudioFocusChange(I)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;

    invoke-virtual {v0, p1}, Lcom/navngo/igo/javaclient/VietmapAudioFocusManager;->lambda$new$0$com-navngo-igo-javaclient-VietmapAudioFocusManager(I)V

    return-void
.end method
