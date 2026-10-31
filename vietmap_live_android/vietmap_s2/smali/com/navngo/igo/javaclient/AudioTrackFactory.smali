###### Class com.navngo.igo.javaclient.AudioTrackFactory (com.navngo.igo.javaclient.AudioTrackFactory)
.class public Lcom/navngo/igo/javaclient/AudioTrackFactory;
.super Ljava/lang/Object;
.source "AudioTrackFactory.java"


# static fields
.field private static final defaultName:Ljava/lang/String; = "android"

.field private static final instance:Lcom/navngo/igo/javaclient/AudioTrackFactory;

.field private static final logname:Ljava/lang/String; = "AudioTrackFactory"


# instance fields
.field private adapterMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/navngo/igo/javaclient/IAudioTrackAdapter;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 11
    new-instance v0, Lcom/navngo/igo/javaclient/AudioTrackFactory;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/AudioTrackFactory;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/AudioTrackFactory;->instance:Lcom/navngo/igo/javaclient/AudioTrackFactory;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/AudioTrackFactory;->adapterMap:Ljava/util/HashMap;

    const-string v0, "AudioTrackFactory"

    const-string v1, "AudioTrackFactory constructor started"

    .line 19
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    const-class v0, Lcom/navngo/igo/javaclient/AndroidAudioTrackAdapter;

    const-string v1, "android"

    invoke-virtual {p0, v1, v0}, Lcom/navngo/igo/javaclient/AudioTrackFactory;->register(Ljava/lang/String;Ljava/lang/Class;)V

    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/AudioTrackFactory;
    .registers 1

    .line 49
    sget-object v0, Lcom/navngo/igo/javaclient/AudioTrackFactory;->instance:Lcom/navngo/igo/javaclient/AudioTrackFactory;

    return-object v0
.end method


# virtual methods
.method public create(IIIIII)Lcom/navngo/igo/javaclient/IAudioTrackAdapter;
    .registers 20

    move-object v1, p0

    const-string v0, "sound"

    const-string v2, "audio_track_adapter"

    const-string v3, "android"

    .line 28
    invoke-static {v0, v2, v3}, Lcom/navngo/igo/javaclient/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 29
    iget-object v2, v1, Lcom/navngo/igo/javaclient/AudioTrackFactory;->adapterMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "adapterClass for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "AudioTrackFactory"

    invoke-static {v5, v4}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v2, :cond_5d

    .line 31
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5d

    .line 32
    iget-object v2, v1, Lcom/navngo/igo/javaclient/AudioTrackFactory;->adapterMap:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "adapterClass was null for"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " trying "

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5d
    const/4 v3, 0x0

    if-eqz v2, :cond_8b

    .line 38
    :try_start_60
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;

    move-object v6, v0

    move v7, p1

    move v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    move/from16 v12, p6

    .line 39
    invoke-interface/range {v6 .. v12}, Lcom/navngo/igo/javaclient/IAudioTrackAdapter;->initFromFactory(IIIIII)V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_74} :catch_76

    move-object v3, v0

    goto :goto_8b

    :catch_76
    move-exception v0

    .line 41
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception caught while creating "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_8b
    :goto_8b
    return-object v3
.end method

.method public register(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/navngo/igo/javaclient/IAudioTrackAdapter;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 24
    iget-object v0, p0, Lcom/navngo/igo/javaclient/AudioTrackFactory;->adapterMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
