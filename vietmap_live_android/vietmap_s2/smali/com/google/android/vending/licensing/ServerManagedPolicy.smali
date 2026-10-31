###### Class com.google.android.vending.licensing.ServerManagedPolicy (com.google.android.vending.licensing.ServerManagedPolicy)
.class public Lcom/google/android/vending/licensing/ServerManagedPolicy;
.super Ljava/lang/Object;
.source "ServerManagedPolicy.java"

# interfaces
.implements Lcom/google/android/vending/licensing/Policy;


# static fields
.field private static final DEFAULT_MAX_RETRIES:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_COUNT:Ljava/lang/String; = "0"

.field private static final DEFAULT_RETRY_UNTIL:Ljava/lang/String; = "0"

.field private static final DEFAULT_VALIDITY_TIMESTAMP:Ljava/lang/String; = "0"

.field private static final MILLIS_PER_MINUTE:J = 0xea60L

.field private static final PREFS_FILE:Ljava/lang/String; = "com.google.android.vending.licensing.ServerManagedPolicy"

.field private static final PREF_LAST_RESPONSE:Ljava/lang/String; = "lastResponse"

.field private static final PREF_MAX_RETRIES:Ljava/lang/String; = "maxRetries"

.field private static final PREF_RETRY_COUNT:Ljava/lang/String; = "retryCount"

.field private static final PREF_RETRY_UNTIL:Ljava/lang/String; = "retryUntil"

.field private static final PREF_VALIDITY_TIMESTAMP:Ljava/lang/String; = "validityTimestamp"

.field private static final TAG:Ljava/lang/String; = "ServerManagedPolicy"


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

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 64
    iput-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponseTime:J

    const-string v0, "com.google.android.vending.licensing.ServerManagedPolicy"

    const/4 v1, 0x0

    .line 74
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 75
    new-instance v0, Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-direct {v0, p1, p2}, Lcom/google/android/vending/licensing/PreferenceObfuscator;-><init>(Landroid/content/SharedPreferences;Lcom/google/android/vending/licensing/Obfuscator;)V

    iput-object v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const/16 p1, 0x123

    .line 77
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "lastResponse"

    invoke-virtual {v0, p2, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponse:I

    .line 78
    iget-object p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "validityTimestamp"

    const-string v0, "0"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    .line 80
    iget-object p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "retryUntil"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    .line 81
    iget-object p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "maxRetries"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    .line 82
    iget-object p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string p2, "retryCount"

    invoke-virtual {p1, p2, v0}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

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

    .line 261
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 263
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

    .line 264
    invoke-static {v1, v0}, Lcom/google/android/vending/licensing/util/URIQueryDecoder;->DecodeQuery(Ljava/net/URI;Ljava/util/Map;)V
    :try_end_1e
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_1e} :catch_1f

    goto :goto_26

    :catch_1f
    const-string p1, "ServerManagedPolicy"

    const-string v1, "Invalid syntax error while decoding extras data from server."

    .line 266
    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_26
    return-object v0
.end method

.method private setLastResponse(I)V
    .registers 4

    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponseTime:J

    .line 136
    iput p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponse:I

    .line 137
    iget-object v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    const-string v1, "lastResponse"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setMaxRetries(Ljava/lang/String;)V
    .registers 4

    .line 217
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_18

    :catch_9
    const-string p1, "ServerManagedPolicy"

    const-string v0, "Licence retry count (GR) missing, grace period disabled"

    .line 220
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    .line 222
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string p1, "0"

    .line 225
    :goto_18
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    .line 226
    iget-object v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "maxRetries"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setRetryCount(J)V
    .registers 4

    .line 147
    iput-wide p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    .line 148
    iget-object v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    const-string p2, "retryCount"

    invoke-virtual {v0, p2, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setRetryUntil(Ljava/lang/String;)V
    .registers 4

    .line 191
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_18

    :catch_9
    const-string p1, "ServerManagedPolicy"

    const-string v0, "License retry timestamp (GT) missing, grace period disabled"

    .line 194
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    .line 196
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const-string p1, "0"

    .line 199
    :goto_18
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    .line 200
    iget-object v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "retryUntil"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setValidityTimestamp(Ljava/lang/String;)V
    .registers 6

    .line 165
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_8} :catch_9

    goto :goto_24

    :catch_9
    const-string p1, "ServerManagedPolicy"

    const-string v0, "License validity timestamp (VT) missing, caching for a minute"

    .line 168
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0xea60

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 170
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    .line 173
    :goto_24
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    .line 174
    iget-object v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    const-string v1, "validityTimestamp"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public allowAccess()Z
    .registers 10

    .line 244
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 245
    iget v2, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponse:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v5, 0x100

    if-ne v2, v5, :cond_13

    .line 247
    iget-wide v5, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    cmp-long v2, v0, v5

    if-gtz v2, :cond_32

    return v3

    :cond_13
    const/16 v5, 0x123

    if-ne v2, v5, :cond_32

    .line 251
    iget-wide v5, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponseTime:J

    const-wide/32 v7, 0xea60

    add-long/2addr v5, v7

    cmp-long v2, v0, v5

    if-gez v2, :cond_32

    .line 255
    iget-wide v5, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    cmp-long v2, v0, v5

    if-lez v2, :cond_31

    iget-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    iget-wide v5, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

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

    .line 230
    iget-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mMaxRetries:J

    return-wide v0
.end method

.method public getRetryCount()J
    .registers 3

    .line 152
    iget-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    return-wide v0
.end method

.method public getRetryUntil()J
    .registers 3

    .line 204
    iget-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryUntil:J

    return-wide v0
.end method

.method public getValidityTimestamp()J
    .registers 3

    .line 178
    iget-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mValidityTimestamp:J

    return-wide v0
.end method

.method public processServerResponse(ILcom/google/android/vending/licensing/ResponseData;)V
    .registers 7

    const/16 v0, 0x123

    if-eq p1, v0, :cond_a

    const-wide/16 v0, 0x0

    .line 104
    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setRetryCount(J)V

    goto :goto_12

    .line 106
    :cond_a
    iget-wide v0, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mRetryCount:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setRetryCount(J)V

    :goto_12
    const/16 v0, 0x100

    if-ne p1, v0, :cond_40

    .line 111
    iget-object p2, p2, Lcom/google/android/vending/licensing/ResponseData;->extra:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->decodeExtras(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p2

    .line 112
    iput p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mLastResponse:I

    const-string v0, "VT"

    .line 113
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    const-string v0, "GT"

    .line 114
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setRetryUntil(Ljava/lang/String;)V

    const-string v0, "GR"

    .line 115
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setMaxRetries(Ljava/lang/String;)V

    goto :goto_4f

    :cond_40
    const/16 p2, 0x231

    if-ne p1, p2, :cond_4f

    const-string p2, "0"

    .line 118
    invoke-direct {p0, p2}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setValidityTimestamp(Ljava/lang/String;)V

    .line 119
    invoke-direct {p0, p2}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setRetryUntil(Ljava/lang/String;)V

    .line 120
    invoke-direct {p0, p2}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setMaxRetries(Ljava/lang/String;)V

    .line 123
    :cond_4f
    :goto_4f
    invoke-direct {p0, p1}, Lcom/google/android/vending/licensing/ServerManagedPolicy;->setLastResponse(I)V

    .line 124
    iget-object p1, p0, Lcom/google/android/vending/licensing/ServerManagedPolicy;->mPreferences:Lcom/google/android/vending/licensing/PreferenceObfuscator;

    invoke-virtual {p1}, Lcom/google/android/vending/licensing/PreferenceObfuscator;->commit()V

    return-void
.end method
