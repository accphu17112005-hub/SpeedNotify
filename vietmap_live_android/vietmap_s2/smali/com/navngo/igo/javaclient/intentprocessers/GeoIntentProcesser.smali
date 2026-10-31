###### Class com.navngo.igo.javaclient.intentprocessers.GeoIntentProcesser (com.navngo.igo.javaclient.intentprocessers.GeoIntentProcesser)
.class public Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;
.super Ljava/lang/Object;
.source "GeoIntentProcesser.java"

# interfaces
.implements Lcom/navngo/igo/javaclient/intentprocessers/IIntentProcesser;


# static fields
.field private static final logname:Ljava/lang/String; = "GeoIntentProcesser"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getQueryParam(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 65
    invoke-virtual {p1}, Landroid/net/Uri;->isHierarchical()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 66
    invoke-virtual {p1, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 68
    :cond_b
    invoke-virtual {p1}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_13

    return-object v0

    :cond_13
    const-string v1, "&"

    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 73
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1c
    if-ge v3, v1, :cond_36

    aget-object v4, p1, v3

    const/4 v5, 0x2

    const-string v6, "="

    .line 74
    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 75
    aget-object v5, v4, v2

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    const/4 p1, 0x1

    .line 76
    aget-object p1, v4, p1

    return-object p1

    :cond_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    :cond_36
    return-object v0
.end method

.method private matchesGoogleMapsFilter1(Landroid/net/Uri;)Z
    .registers 4

    if-eqz p1, :cond_1c

    .line 52
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 53
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v0, "maps.google.com"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1c

    const/4 p1, 0x1

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    return p1
.end method

.method private matchesGoogleMapsFilter2(Landroid/net/Uri;)Z
    .registers 4

    if-eqz p1, :cond_2e

    .line 58
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 59
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "www.google.com"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 60
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2e

    .line 61
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    const-string v0, "/map"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2e

    const/4 p1, 0x1

    goto :goto_2f

    :cond_2e
    const/4 p1, 0x0

    :goto_2f
    return p1
.end method

.method private processGeoScheme(Landroid/net/Uri;)Z
    .registers 8

    .line 83
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "geo"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    return v1

    .line 85
    :cond_e
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x3f

    .line 86
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, 0x1

    if-ltz v3, :cond_1d

    const/4 v3, 0x1

    goto :goto_1e

    :cond_1d
    const/4 v3, 0x0

    :goto_1e
    if-eqz v3, :cond_28

    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 90
    :cond_28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Geo intent Specific part:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "GeoIntentProcesser"

    invoke-static {v3, v2}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, ","

    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 92
    array-length v2, v0

    const/4 v5, 0x2

    if-ne v2, v5, :cond_b7

    .line 93
    aget-object v2, v0, v1

    aget-object v0, v0, v4

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->createFromString(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isZero()Z

    move-result v2

    if-nez v2, :cond_64

    .line 95
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p1

    invoke-virtual {p1, v0, v4}, Lcom/navngo/igo/javaclient/address/AddressResolver;->calculateRouteToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    return v4

    :cond_64
    const-string v0, "q"

    .line 98
    invoke-direct {p0, p1, v0}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->getQueryParam(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_b7

    .line 99
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b7

    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "q=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D3(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/program/ProgramPhases;->getPhase()Lcom/navngo/program/ProgramPhases$Phase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/program/ProgramPhases$Phase;->getCode()I

    move-result v0

    sget-object v2, Lcom/navngo/program/ProgramPhases$Phase;->RUNNING:Lcom/navngo/program/ProgramPhases$Phase;

    invoke-virtual {v2}, Lcom/navngo/program/ProgramPhases$Phase;->getCode()I

    move-result v2

    if-ge v0, v2, :cond_ae

    .line 102
    invoke-static {}, Lcom/navngo/program/ProgramPhases;->getInstance()Lcom/navngo/program/ProgramPhases;

    move-result-object v0

    sget-object v2, Lcom/navngo/program/ProgramPhases$Phase;->RUNNING:Lcom/navngo/program/ProgramPhases$Phase;

    new-instance v3, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser$1;

    invoke-direct {v3, p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser$1;-><init>(Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v1, v3}, Lcom/navngo/program/ProgramPhases;->waitForPhase(Lcom/navngo/program/ProgramPhases$Phase;ZLjava/lang/Runnable;)V

    goto :goto_b6

    .line 109
    :cond_ae
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    :goto_b6
    return v4

    :cond_b7
    return v1
.end method

.method private processGoogleMapsScheme(Landroid/net/Uri;)Z
    .registers 13

    .line 119
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->matchesGoogleMapsFilter1(Landroid/net/Uri;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->matchesGoogleMapsFilter2(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_e

    return v1

    .line 120
    :cond_e
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object p1

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Geo intent GoogleMapsScheme Specific Part:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "GeoIntentProcesser"

    invoke-static {v2, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x5

    const-string v3, "\\&sll\\="

    const-string v4, "\\@"

    const-string v5, "\\&q\\="

    const-string v6, "\\&p\\="

    const-string v7, ""

    .line 122
    filled-new-array {v3, v4, v5, v6, v7}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "((\\+|\\-)?\\d+\\.\\d+),((\\+|\\-)?\\d+\\.\\d+)"

    const/4 v5, 0x0

    :goto_3a
    if-ge v5, v0, :cond_96

    .line 124
    aget-object v6, v3, v5

    .line 127
    :try_start_3e
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6
    :try_end_51
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_3e .. :try_end_51} :catch_96

    .line 130
    invoke-virtual {v6, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    .line 131
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_93

    const/4 v7, 0x1

    .line 132
    invoke-virtual {v6, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    .line 133
    invoke-virtual {v6, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 134
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Geo intent GoogleMapsHost lat,lon: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-static {v8, v6}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->createFromString(Ljava/lang/String;Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v6

    .line 136
    invoke-virtual {v6}, Lcom/navngo/igo/javaclient/androidgo/types/GCoor;->isValid()Z

    move-result v8

    if-eqz v8, :cond_93

    .line 137
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p1

    invoke-virtual {p1, v6, v7}, Lcom/navngo/igo/javaclient/address/AddressResolver;->calculateRouteToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    return v7

    :cond_93
    add-int/lit8 v5, v5, 0x1

    goto :goto_3a

    :catch_96
    :cond_96
    return v1
.end method

.method private processIntentImp(Landroid/content/Intent;)Z
    .registers 6

    .line 146
    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->matchesIntent(Landroid/content/Intent;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 147
    :cond_8
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_f

    return v1

    .line 150
    :cond_f
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->processGeoScheme(Landroid/net/Uri;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_50

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->processGoogleMapsScheme(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_1d

    goto :goto_50

    .line 153
    :cond_1d
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "path: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "GeoIntentProcesser"

    invoke-static {v3, v0}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_3a

    return v1

    .line 156
    :cond_3a
    invoke-static {p1}, Lcom/navngo/igo/javaclient/utils/GPSUtils;->parseGCoorFromString(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/types/GCoor;

    move-result-object v0

    if-eqz v0, :cond_48

    .line 158
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Lcom/navngo/igo/javaclient/address/AddressResolver;->calculateRouteToPosition(Lcom/navngo/igo/javaclient/androidgo/types/GCoor;Z)V

    goto :goto_50

    .line 160
    :cond_48
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    :cond_50
    :goto_50
    return v2
.end method


# virtual methods
.method public matchesIntent(Landroid/content/Intent;)Z
    .registers 4

    .line 47
    invoke-virtual {p1}, Landroid/content/Intent;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "geo"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->matchesGoogleMapsFilter1(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_23

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->matchesGoogleMapsFilter2(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_21

    goto :goto_23

    :cond_21
    const/4 p1, 0x0

    goto :goto_24

    :cond_23
    :goto_23
    const/4 p1, 0x1

    :goto_24
    return p1
.end method

.method public processIntent(Landroid/content/Intent;)Z
    .registers 4

    .line 166
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->processIntentImp(Landroid/content/Intent;)Z

    move-result p1

    if-nez p1, :cond_14

    const-string v0, "GeoIntentProcesser"

    const-string v1, "Geo intent cant find the coords"

    .line 168
    invoke-static {v0, v1}, Lcom/navngo/igo/javaclient/DebugLogger;->D2(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/address/AddressResolver;->showErrorMessage()V

    :cond_14
    return p1
.end method

###### Class com.navngo.igo.javaclient.intentprocessers.GeoIntentProcesser.AnonymousClass1 (com.navngo.igo.javaclient.intentprocessers.GeoIntentProcesser$1)
.class Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser$1;
.super Ljava/lang/Object;
.source "GeoIntentProcesser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;->processGeoScheme(Landroid/net/Uri;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;

.field final synthetic val$q:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;Ljava/lang/String;)V
    .registers 3

    .line 102
    iput-object p1, p0, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser$1;->this$0:Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser$1;->val$q:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 105
    invoke-static {}, Lcom/navngo/igo/javaclient/address/AddressResolver;->getResolver()Lcom/navngo/igo/javaclient/address/AddressResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/navngo/igo/javaclient/intentprocessers/GeoIntentProcesser$1;->val$q:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/navngo/igo/javaclient/address/AddressResolver;->jumpToAddressSelective(Lcom/navngo/igo/javaclient/address/StructuredAddress;Ljava/lang/String;)V

    return-void
.end method
