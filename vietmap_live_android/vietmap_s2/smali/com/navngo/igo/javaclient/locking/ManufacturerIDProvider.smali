###### Class com.navngo.igo.javaclient.locking.ManufacturerIDProvider (com.navngo.igo.javaclient.locking.ManufacturerIDProvider)
.class public Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;
.super Ljava/lang/Object;
.source "ManufacturerIDProvider.java"


# static fields
.field static mInstance:Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;


# instance fields
.field private mID:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstace()Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;
    .registers 1

    .line 11
    sget-object v0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->mInstance:Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    if-nez v0, :cond_b

    .line 12
    new-instance v0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->mInstance:Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    .line 14
    :cond_b
    sget-object v0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->mInstance:Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;

    return-object v0
.end method


# virtual methods
.method public getID()Ljava/lang/String;
    .registers 2

    .line 24
    iget-object v0, p0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->mID:Ljava/lang/String;

    return-object v0
.end method

.method public isValid()Z
    .registers 2

    .line 28
    iget-object v0, p0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->mID:Ljava/lang/String;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public setID(Ljava/lang/String;)V
    .registers 2

    .line 20
    iput-object p1, p0, Lcom/navngo/igo/javaclient/locking/ManufacturerIDProvider;->mID:Ljava/lang/String;

    return-void
.end method
