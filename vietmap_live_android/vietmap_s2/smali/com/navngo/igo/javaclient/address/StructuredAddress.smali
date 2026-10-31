###### Class com.navngo.igo.javaclient.address.StructuredAddress (com.navngo.igo.javaclient.address.StructuredAddress)
.class public final Lcom/navngo/igo/javaclient/address/StructuredAddress;
.super Ljava/lang/Object;
.source "StructuredAddress.java"


# instance fields
.field public final city:Ljava/lang/String;

.field public final country:Ljava/lang/String;

.field public final state:Ljava/lang/String;

.field public final street:Ljava/lang/String;

.field public final zip:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 23
    iput-object v0, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    .line 24
    iput-object v0, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    .line 25
    iput-object v0, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    if-eqz p1, :cond_8

    goto :goto_9

    :cond_8
    move-object p1, v0

    .line 31
    :goto_9
    iput-object p1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    if-eqz p2, :cond_e

    goto :goto_f

    :cond_e
    move-object p2, v0

    .line 32
    :goto_f
    iput-object p2, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    if-eqz p3, :cond_14

    goto :goto_15

    :cond_14
    move-object p3, v0

    .line 33
    :goto_15
    iput-object p3, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    if-eqz p4, :cond_1a

    goto :goto_1b

    :cond_1a
    move-object p4, v0

    .line 34
    :goto_1b
    iput-object p4, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    if-eqz p5, :cond_20

    goto :goto_21

    :cond_20
    move-object p5, v0

    .line 35
    :goto_21
    iput-object p5, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    return-void
.end method

.method private appendField(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V
    .registers 5

    .line 59
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_10

    .line 60
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_10

    const-string p2, ", "

    .line 61
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_10
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 6

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->country:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->appendField(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 47
    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->state:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->appendField(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 49
    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_24

    sget-boolean v1, Lcom/navngo/igo/javaclient/Config;->def_no_zip_if_city_available:Z

    const-string v3, "freetext_search"

    const-string v4, "no_zip_if_city_available"

    invoke-static {v3, v4, v1}, Lcom/navngo/igo/javaclient/Config;->getBool(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_29

    .line 50
    :cond_24
    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->zip:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->appendField(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 52
    :cond_29
    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->city:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->appendField(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 53
    iget-object v1, p0, Lcom/navngo/igo/javaclient/address/StructuredAddress;->street:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/navngo/igo/javaclient/address/StructuredAddress;->appendField(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
