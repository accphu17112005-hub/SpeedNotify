###### Class com.navngo.igo.javaclient.androidgo.SysConfig (com.navngo.igo.javaclient.androidgo.SysConfig)
.class public Lcom/navngo/igo/javaclient/androidgo/SysConfig;
.super Ljava/lang/Object;
.source "SysConfig.java"


# static fields
.field private static final logname:Ljava/lang/String; = "SysConfig"

.field private static sSysConfig:Lcom/navngo/igo/javaclient/androidgo/SysConfig;


# instance fields
.field volatile isReady:Z


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method private constructor <init>()V
    .registers 5

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 112
    iput-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->isReady:Z

    .line 115
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v1

    sget-object v2, Lcom/navngo/program/ProgramPhases$Phase;->STARTUP:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v3, Lcom/navngo/igo/javaclient/androidgo/SysConfig$1;

    invoke-direct {v3, p0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig$1;-><init>(Lcom/navngo/igo/javaclient/androidgo/SysConfig;)V

    invoke-virtual {v1, v2, v0, v3}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    return-void
.end method

.method private checkSysconfigIsReady()V
    .registers 3

    .line 104
    monitor-enter p0

    .line 105
    :try_start_1
    iget-boolean v0, p0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->isReady:Z

    .line 106
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_f

    if-eqz v0, :cond_7

    return-void

    .line 108
    :cond_7
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "SyConfig isn\'t ready yet. Startup program phase isn\'t reached yet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_f
    move-exception v0

    .line 106
    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/androidgo/SysConfig;
    .registers 1

    .line 129
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->sSysConfig:Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    if-nez v0, :cond_b

    .line 130
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->sSysConfig:Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    .line 133
    :cond_b
    sget-object v0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->sSysConfig:Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    .line 76
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>()V

    .line 77
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 80
    :try_start_a
    invoke-virtual {v1, p3}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeSupportedObject(Ljava/lang/Object;)V

    .line 81
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->flush()V

    .line 83
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object v0

    .line 85
    iget-object v2, v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    iget v0, v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    invoke-static {p1, p2, v2, v0}, Lcom/navngo/igo/javaclient/NNG;->getFromSysConfig(Ljava/lang/String;Ljava/lang/String;[BI)[B

    move-result-object p1

    .line 86
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->close()V

    .line 88
    new-instance p2, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p2, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;-><init>(Ljava/io/InputStream;)V

    .line 89
    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readSupportedObject()Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;

    move-result-object p1

    .line 90
    invoke-virtual {p2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->close()V

    .line 91
    iget-object p1, p1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_32} :catch_33

    return-object p1

    :catch_33
    return-object p3
.end method

.method public getBool(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public getBool(Ljava/lang/String;Ljava/lang/String;Z)Z
    .registers 6

    .line 35
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->checkSysconfigIsReady()V

    .line 36
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 37
    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_16

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    return p1

    :cond_16
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    aput-object p2, v0, p1

    const-string p1, "getBool(%s, %s) return value isn\'t boolean. Returning default value"

    .line 39
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "SysConfig"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return p3
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4

    const/4 v0, 0x0

    .line 72
    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 6

    .line 62
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->checkSysconfigIsReady()V

    .line 63
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 64
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_16

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_16
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    aput-object p2, v0, p1

    const-string p1, "getInt(%s, %s) return value isn\'t int. Returning default value"

    .line 66
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "SysConfig"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return p3
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, ""

    .line 58
    invoke-virtual {p0, p1, p2, v0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 48
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->checkSysconfigIsReady()V

    .line 49
    invoke-virtual {p0, p1, p2, p3}, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->get(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 50
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_e

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_e
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 p1, 0x1

    aput-object p2, v0, p1

    const-string p1, "getString(%s, %s) return value isn\'t string. Returning default value"

    .line 52
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "SysConfig"

    invoke-static {p2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    return-object p3
.end method

###### Class com.navngo.igo.javaclient.androidgo.SysConfig.AnonymousClass1 (com.navngo.igo.javaclient.androidgo.SysConfig$1)
.class Lcom/navngo/igo/javaclient/androidgo/SysConfig$1;
.super Ljava/lang/Object;
.source "SysConfig.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/androidgo/SysConfig;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/androidgo/SysConfig;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/androidgo/SysConfig;)V
    .registers 2

    .line 115
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/SysConfig$1;->this$0:Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 118
    monitor-enter p0

    .line 119
    :try_start_1
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/SysConfig$1;->this$0:Lcom/navngo/igo/javaclient/androidgo/SysConfig;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/navngo/igo/javaclient/androidgo/SysConfig;->isReady:Z

    .line 120
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_f

    const-string v0, "SysConfig"

    const-string v1, "Startup phase reached, config can be used"

    .line 121
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_f
    move-exception v0

    .line 120
    :try_start_10
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_f

    throw v0
.end method
