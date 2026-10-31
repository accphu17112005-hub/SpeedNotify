###### Class com.cyberon.engine.CReaderHL (com.cyberon.engine.CReaderHL)
.class public Lcom/cyberon/engine/CReaderHL;
.super Ljava/lang/Object;
.source "CReaderHL.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;
    }
.end annotation


# static fields
.field public static final CReaderHL_STATUS_FINISH:I = 0x5016

.field public static final CReaderHL_STATUS_START:I = 0x5015

.field public static final CReaderHL_STATUS_SUBTITLE:I = 0x5018

.field public static final CReaderHL_STATUS_TIMER:I = 0x5017

.field public static final CReaderHL_STATUS_WORD:I = 0x5019

.field public static mCallback:Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native CReaderHL_AddToPlaylist(J[B)I
.end method

.method public static native CReaderHL_GetErrorMessage(I)Ljava/lang/String;
.end method

.method public static native CReaderHL_GetPitch(J)I
.end method

.method public static native CReaderHL_GetSpeed(J)I
.end method

.method public static native CReaderHL_GetVersion(J[C)I
.end method

.method public static native CReaderHL_GetVolume(J)I
.end method

.method public static native CReaderHL_Init(Ljava/lang/Object;[BILjava/lang/String;[I)J
.end method

.method public static native CReaderHL_IsPlaying(J)Z
.end method

.method public static native CReaderHL_Play(JJ)I
.end method

.method public static native CReaderHL_Release(J)I
.end method

.method public static native CReaderHL_SetPitch(JI)I
.end method

.method public static native CReaderHL_SetPlayDevice(JLjava/lang/String;)I
.end method

.method public static native CReaderHL_SetSpeed(JI)I
.end method

.method public static native CReaderHL_SetVolume(JI)I
.end method

.method public static native CReaderHL_Stop(J)I
.end method

.method public static PlayCallback(J[Ljava/lang/Object;IJ[B)I
    .registers 15

    .line 62
    sget-object v0, Lcom/cyberon/engine/CReaderHL;->mCallback:Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;

    if-eqz v0, :cond_e

    move-wide v1, p0

    move-object v3, p2

    move v4, p3

    move-wide v5, p4

    move-object v7, p6

    .line 63
    invoke-interface/range {v0 .. v7}, Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;->PlayCallbackMethod(J[Ljava/lang/Object;IJ[B)I

    move-result p0

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public static loadLibrary(Landroid/content/Context;)Z
    .registers 3

    const-string v0, "CReaderHL"

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->getNativeLibPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/libCReaderHL.so"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 27
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 29
    :try_start_1c
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 30
    invoke-static {p0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    goto :goto_29

    .line 32
    :cond_26
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_29
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_1c .. :try_end_29} :catch_2b

    :goto_29
    const/4 p0, 0x1

    return p0

    :catch_2b
    move-exception p0

    const-string v1, "Couldn\'t load CReaderHL lib"

    .line 36
    invoke-static {v0, v1, p0}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return p0
.end method

###### Class com.cyberon.engine.CReaderHL.CALLBACK_CReader_Play (com.cyberon.engine.CReaderHL$CALLBACK_CReader_Play)
.class public interface abstract Lcom/cyberon/engine/CReaderHL$CALLBACK_CReader_Play;
.super Ljava/lang/Object;
.source "CReaderHL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyberon/engine/CReaderHL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CALLBACK_CReader_Play"
.end annotation


# virtual methods
.method public abstract PlayCallbackMethod(J[Ljava/lang/Object;IJ[B)I
.end method
