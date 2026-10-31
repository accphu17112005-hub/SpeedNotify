###### Class com.navngo.igo.javaclient.functors.SettingIntentFunctors (com.navngo.igo.javaclient.functors.SettingIntentFunctors)
.class public Lcom/navngo/igo/javaclient/functors/SettingIntentFunctors;
.super Ljava/lang/Object;
.source "SettingIntentFunctors.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# static fields
.field private static final logname:Ljava/lang/String; = "SettingIntentFunctors"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getWifiApState()I
    .registers 7

    const-string v0, "Unable to get wifi accesspoint state: "

    const-string v1, "SettingIntentFunctors"

    .line 45
    :try_start_4
    sget-object v2, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 47
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "getWifiApState"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v4, 0x1

    .line 48
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v4, 0x0

    .line 49
    move-object v5, v4

    check-cast v5, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Wifi access point state is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_45
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_45} :catch_76
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_45} :catch_5e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_45} :catch_46

    return v2

    :catch_46
    move-exception v2

    .line 61
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8d

    :catch_5e
    move-exception v2

    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8d

    :catch_76
    move-exception v2

    .line 55
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    :goto_8d
    const/16 v0, 0xb

    return v0
.end method

.method public registerFunctors()V
    .registers 4

    .line 23
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.showAndroidSettings"

    const-string v2, "showAndroidSettings"

    .line 25
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.showAndroidTetherSettings"

    const-string v2, "showAndroidTetherSettings"

    .line 26
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.getWifiApState"

    const-string v2, "getWifiApState"

    .line 27
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public showAndroidSettings()V
    .registers 4

    const-string v0, "SettingIntentFunctors"

    const-string v1, "Opening settings intent"

    .line 31
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public showAndroidTetherSettings()V
    .registers 4

    const-string v0, "SettingIntentFunctors"

    const-string v1, "Opening tether settings intent"

    .line 36
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.android.settings"

    const-string v2, "com.android.settings.TetherSettings"

    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 39
    invoke-static {}, Lcom/navngo/igo/javaclient/Application;->getIgoActivity()Lcom/navngo/igo/javaclient/IgoActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/navngo/igo/javaclient/IgoActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
