###### Class com.navngo.igo.javaclient.PapagoLocationReceiver (com.navngo.igo.javaclient.PapagoLocationReceiver)
.class public final Lcom/navngo/igo/javaclient/PapagoLocationReceiver;
.super Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;
.source "PapagoLocationReceiver.java"


# instance fields
.field final logname:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 10
    invoke-direct {p0}, Lcom/navngo/igo/javaclient/receiver/DynamicIntentReceiver;-><init>()V

    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/navngo/igo/javaclient/PapagoLocationReceiver;->logname:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected action()[Ljava/lang/String;
    .registers 2

    const-string v0, "com.vietmap.S2OBU.javaclient.PAPAGO_BROADCAST_RECV"

    .line 31
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected bringMainActivityInForeground()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method protected dispatchIntent(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 9

    const-string p1, "KEY_TYPE"

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    const-string p1, "POI_NAME"

    .line 16
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    const-string p1, "LAT"

    const/4 v1, 0x0

    .line 17
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result p1

    const-string v2, "LON"

    .line 18
    invoke-virtual {p2, v2, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v1

    const-string v2, "DEV"

    .line 19
    invoke-virtual {p2, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    const-string v2, "STYLE"

    .line 20
    invoke-virtual {p2, v2, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    const-string v0, "SOURCE_APP"

    .line 21
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p2

    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    float-to-double v2, p1

    float-to-double v4, v1

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;-><init>(DD)V

    const/4 p1, 0x1

    invoke-virtual {p2, v0, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->calculateRouteToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    return-void
.end method
