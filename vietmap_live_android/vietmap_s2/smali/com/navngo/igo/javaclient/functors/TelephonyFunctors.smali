###### Class com.navngo.igo.javaclient.functors.TelephonyFunctors (com.navngo.igo.javaclient.functors.TelephonyFunctors)
.class public Lcom/navngo/igo/javaclient/functors/TelephonyFunctors;
.super Ljava/lang/Object;
.source "TelephonyFunctors.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/functors/IFunctorCollection;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getGsmNetworkOperator()Ljava/lang/String;
    .registers 4

    .line 24
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_18

    .line 25
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_18

    .line 26
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_18
    const-string v0, "NOT_GSM"

    return-object v0
.end method

.method public getSimOperator()Ljava/lang/String;
    .registers 4

    .line 15
    sget-object v0, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    const-string v1, "phone"

    invoke-virtual {v0, v1}, Lcom/navngo/igo/javaclient/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_18

    .line 16
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_18

    .line 17
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_18
    const-string v0, "SIM_NA"

    return-object v0
.end method

.method public registerFunctors()V
    .registers 4

    .line 33
    invoke-static {}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->getInstance()Lcom/navngo/igo/javaclient/androidgo/AndroidGo;

    move-result-object v0

    const-string v1, "android.telephony.getSimOperator"

    const-string v2, "getSimOperator"

    .line 34
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "android.telephony.getGsmNetworkOperator"

    const-string v2, "getGsmNetworkOperator"

    .line 35
    invoke-virtual {v0, v1, p0, v2}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo;->registerFunctor(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
