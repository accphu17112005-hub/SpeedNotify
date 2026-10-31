###### Class com.navngo.igo.javaclient.tts.cyberon.utility.ToolKit (com.navngo.igo.javaclient.tts.cyberon.utility.ToolKit)
.class public Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;
.super Ljava/lang/Object;
.source "ToolKit.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "ToolKit"

.field private static nOSVer:I = 0x7fffffff


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNativeLibPath(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/lib"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 98
    :try_start_17
    invoke-static {}, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->getOSVer()I

    move-result v1

    const/16 v2, 0xe6

    if-lt v1, v2, :cond_38

    .line 99
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    const-string v1, "android.content.pm.ApplicationInfo"

    .line 100
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "nativeLibraryDir"

    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 102
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_37} :catch_38

    move-object v0, p0

    :catch_38
    :cond_38
    return-object v0
.end method

.method public static final getOSVer()I
    .registers 4

    const-string v0, "ToolKit"

    .line 17
    sget v1, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_a9

    .line 22
    :try_start_9
    const-class v1, Landroid/os/Build$VERSION;

    const-string v3, "SDK_INT"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v3, 0x0

    .line 23
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_16} :catch_17

    goto :goto_3d

    .line 27
    :catch_17
    :try_start_17
    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_21} :catch_22

    goto :goto_3d

    .line 29
    :catch_22
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Build.VERSION.SDK = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is not integer."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3d
    packed-switch v2, :pswitch_data_ac

    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Newer SDK version: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a9

    :pswitch_55
    const/16 v0, 0x1a4

    .line 85
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_5a
    const/16 v0, 0x19a

    .line 82
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_5f
    const/16 v0, 0x193

    .line 79
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_64
    const/16 v0, 0x190

    .line 76
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_69
    const/16 v0, 0x140

    .line 73
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_6e
    const/16 v0, 0x136

    .line 70
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_73
    const/16 v0, 0x12c

    .line 67
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_78
    const/16 v0, 0xe9

    .line 64
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_7d
    const/16 v0, 0xe6

    .line 61
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_82
    const/16 v0, 0xdc

    .line 58
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_87
    const/16 v0, 0xd2

    .line 55
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_8c
    const/16 v0, 0xc9

    .line 52
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_91
    const/16 v0, 0xc8

    .line 49
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_96
    const/16 v0, 0xa0

    .line 46
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_9b
    const/16 v0, 0x96

    .line 43
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_a0
    const/16 v0, 0x6e

    .line 40
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    goto :goto_a9

    :pswitch_a5
    const/16 v0, 0x64

    .line 37
    sput v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    .line 92
    :cond_a9
    :goto_a9
    sget v0, Lcom/navngo/igo/javaclient/tts/cyberon/utility/ToolKit;->nOSVer:I

    return v0

    :pswitch_data_ac
    .packed-switch 0x1
        :pswitch_a5
        :pswitch_a0
        :pswitch_9b
        :pswitch_96
        :pswitch_91
        :pswitch_8c
        :pswitch_87
        :pswitch_82
        :pswitch_7d
        :pswitch_78
        :pswitch_73
        :pswitch_6e
        :pswitch_69
        :pswitch_64
        :pswitch_5f
        :pswitch_5a
        :pswitch_55
    .end packed-switch
.end method

.method public static sleep(I)V
    .registers 3

    int-to-long v0, p0

    .line 112
    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_5

    goto :goto_f

    :catch_5
    move-exception p0

    .line 114
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "ToolKit"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_f
    return-void
.end method
