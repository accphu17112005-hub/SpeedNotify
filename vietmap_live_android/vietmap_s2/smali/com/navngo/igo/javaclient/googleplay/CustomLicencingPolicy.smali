###### Class com.navngo.igo.javaclient.googleplay.CustomLicencingPolicy (com.navngo.igo.javaclient.googleplay.CustomLicencingPolicy)
.class public Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;
.super Ljava/lang/Object;
.source "CustomLicencingPolicy.java"

# interfaces
.implements Lcom/google/android/vending/licensing/Policy;


# static fields
.field private static final DEFAULT_MAX_RETRIES:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_COUNT:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_UNTIL:Ljava/lang/String; = "0"

.field private static final DEFAULT_VALIDITY_TIMESTAMP:Ljava/lang/String; = "0"

.field private static final MILLIS_PER_MINUTE:J = 0xea60L

.field private static final PREFS_FILE:Ljava/lang/String; = "com.google.android.vending.licensing.CustomLicencingPolicy"

.field private static final PREF_LAST_RESPONSE:Ljava/lang/String; = "lastResponse"

.field private static final PREF_MAX_RETRIES:Ljava/lang/String; = "maxRetries"

.field private static final PREF_RETRY_COUNT:Ljava/lang/String; = "retryCount"

.field private static final PREF_RETRY_UNTIL:Ljava/lang/String; = "retryUntil"

.field private static final PREF_VALIDITY_TIMESTAMP:Ljava/lang/String; = "validityTimestamp"

.field private static final TAG:Ljava/lang/String; = "CustomLicencingPolicy"


# instance fields
.field private mLastResponse:I

.field private mLastResponseTime:J

.field private mMaxRetries:J

.field private mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

.field private mRetryCount:J

.field private mRetryUntil:J

.field private mValidityTimestamp:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/vending/licensing/Obfuscator;)V
    .registers 5

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 69
    iput-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponseTime:J

    const-string v0, "com.google.android.vending.licensing.CustomLicencingPolicy"

    const/4 v1, 0x0

    .line 79
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 80
    new-instance v0, Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-direct {v0, p1, p2}, Lcom/google/android/vending/licensing/PreferenceObfuscator;-><init>(Landroid/content/SharedPreferences;Lcom/google/android/vending/licensing/Obfuscator;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const/16 p1, 0x123

    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "lastResponse"

    invoke-virtual {v0, p2, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 81
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponse:I

    .line 83
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "validityTimestamp"

    const-string v0, "0"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mValidityTimestamp:J

    .line 85
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "retryUntil"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryUntil:J

    .line 86
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "maxRetries"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mMaxRetries:J

    .line 87
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "retryCount"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryCount:J

    return-void
.end method

.method private decodeExtras(Ljava/lang/String;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 266
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 268
    :try_start_5
    new-instance v1, Ljava/net/URI;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 269
    invoke-static {v1, v0}, Lcom/google/android/vending/licensing/util/URIQueryDecoder;->DecodeQuery(Ljava/net/URI;Ljava/util/Map;)V
    :try_end_1e
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_1e} :catch_1f

    goto :goto_26

    :catch_1f
    const-string p1, "CustomLicencingPolicy"

    const-string v1, "Invalid syntax error while decoding extras data from server."

    .line 271
    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_26
    return-object v0
.end method

.method private setLastResponse(I)V
    .registers 4

    .line 140
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponseTime:J

    .line 141
    iput p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponse:I

    .line 142
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "lastResponse"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setMaxRetries(Ljava/lang/String;)V
    .registers 4

    .line 222
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_18

    :catch_9
    const-string p1, "CustomLicencingPolicy"

    const-string v0, "Licence retry count (GR) missing, grace period disabled"

    .line 225
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    .line 227
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string p1, "0"

    .line 230
    :goto_18
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mMaxRetries:J

    .line 231
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "maxRetries"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setRetryCount(J)V
    .registers 4

    .line 152
    iput-wide p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryCount:J

    .line 153
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    const-string p2, "retryCount"

    invoke-virtual {v0, p2, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setRetryUntil(Ljava/lang/String;)V
    .registers 4

    .line 196
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_18

    :catch_9
    const-string p1, "CustomLicencingPolicy"

    const-string v0, "License retry timestamp (GT) missing, grace period disabled"

    .line 199
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    .line 201
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string p1, "0"

    .line 204
    :goto_18
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryUntil:J

    .line 205
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "retryUntil"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setValidityTimestamp(Ljava/lang/String;)V
    .registers 6

    .line 170
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_24

    :catch_9
    const-string p1, "CustomLicencingPolicy"

    const-string v0, "License validity timestamp (VT) missing, caching for a minute"

    .line 173
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xea60

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    .line 178
    :goto_24
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mValidityTimestamp:J

    .line 179
    iget-object v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "validityTimestamp"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public allowAccess()Z
    .registers 10

    .line 249
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 250
    iget v2, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponse:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v5, 0x100

    if-ne v2, v5, :cond_13

    .line 252
    iget-wide v5, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mValidityTimestamp:J

    cmp-long v2, v0, v5

    if-gtz v2, :cond_32

    return v3

    :cond_13
    const/16 v5, 0x123

    if-ne v2, v5, :cond_32

    .line 256
    iget-wide v5, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponseTime:J

    const-wide/32 v7, 0xea60

    add-long/2addr v5, v7

    cmp-long v2, v0, v5

    if-gez v2, :cond_32

    .line 260
    iget-wide v5, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryUntil:J

    cmp-long v2, v0, v5

    if-lez v2, :cond_31

    iget-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryCount:J

    iget-wide v5, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mMaxRetries:J

    cmp-long v2, v0, v5

    if-gtz v2, :cond_30

    goto :goto_31

    :cond_30
    const/4 v3, 0x0

    :cond_31
    :goto_31
    return v3

    :cond_32
    return v4
.end method

.method public getMaxRetries()J
    .registers 3

    .line 235
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mMaxRetries:J

    return-wide v0
.end method

.method public getRetryCount()J
    .registers 3

    .line 157
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryCount:J

    return-wide v0
.end method

.method public getRetryUntil()J
    .registers 3

    .line 209
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryUntil:J

    return-wide v0
.end method

.method public getValidityTimestamp()J
    .registers 3

    .line 183
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mValidityTimestamp:J

    return-wide v0
.end method

.method public processServerResponse(ILcom/google/android/vending/licensing/ResponseData;)V
    .registers 7

    const/16 v0, 0x123

    if-eq p1, v0, :cond_a

    const-wide/16 v0, 0x0

    .line 109
    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setRetryCount(J)V

    goto :goto_12

    .line 111
    :cond_a
    iget-wide v0, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mRetryCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-direct {p0, v0, v1}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setRetryCount(J)V

    :goto_12
    const/16 v0, 0x100

    if-ne p1, v0, :cond_40

    .line 116
    iget-object p2, p2, Lcom/google/android/vending/licensing/ResponseData;->extra:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->decodeExtras(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p2

    .line 117
    iput p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mLastResponse:I

    const-string v0, "VT"

    .line 118
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    const-string v0, "GT"

    .line 119
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setRetryUntil(Ljava/lang/String;)V

    const-string v0, "GR"

    .line 120
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setMaxRetries(Ljava/lang/String;)V

    goto :goto_4f

    :cond_40
    const/16 p2, 0x231

    if-ne p1, p2, :cond_4f

    const-string p2, "0"

    .line 123
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    .line 124
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setRetryUntil(Ljava/lang/String;)V

    .line 125
    invoke-direct {p0, p2}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setMaxRetries(Ljava/lang/String;)V

    .line 128
    :cond_4f
    :goto_4f
    invoke-direct {p0, p1}, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->setLastResponse(I)V

    .line 129
    iget-object p1, p0, Lcom/navngo/igo/javaclient/googleplay/CustomLicencingPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-virtual {p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->commit()V

    return-void
.end method
