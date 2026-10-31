###### Class com.google.android.vending.licensing.util.URIQueryDecoder (com.google.android.vending.licensing.util.URIQueryDecoder)
.class public Lcom/google/android/vending/licensing/util/URIQueryDecoder;
.super Ljava/lang/Object;
.source "URIQueryDecoder.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "URIQueryDecoder"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static DecodeQuery(Ljava/net/URI;Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 38
    new-instance v0, Ljava/util/Scanner;

    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    const-string p0, "&"

    .line 39
    invoke-virtual {v0, p0}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    .line 41
    :goto_e
    :try_start_e
    invoke-virtual {v0}, Ljava/util/Scanner;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_4a

    .line 42
    invoke-virtual {v0}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object p0

    const-string v1, "="

    .line 43
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 45
    array-length v1, p0
    :try_end_1f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_e .. :try_end_1f} :catch_43

    const-string v2, "UTF-8"

    const/4 v3, 0x1

    if-ne v1, v3, :cond_26

    const/4 v1, 0x0

    goto :goto_30

    .line 47
    :cond_26
    :try_start_26
    array-length v1, p0

    const/4 v4, 0x2

    if-ne v1, v4, :cond_3b

    .line 48
    aget-object v1, p0, v3

    invoke-static {v1, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_30
    const/4 v3, 0x0

    .line 52
    aget-object p0, p0, v3

    invoke-static {p0, v2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 53
    invoke-interface {p1, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 50
    :cond_3b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "query parameter invalid"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_43
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_26 .. :try_end_43} :catch_43

    :catch_43
    const-string p0, "URIQueryDecoder"

    const-string p1, "UTF-8 Not Recognized as a charset.  Device configuration Error."

    .line 57
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4a
    return-void
.end method
