###### Class com.navngo.igo.javaclient.login.api.LoginRequest (com.navngo.igo.javaclient.login.api.LoginRequest)
.class public Lcom/navngo/igo/javaclient/login/api/LoginRequest;
.super Lcom/android/volley/toolbox/JsonObjectRequest;
.source "LoginRequest.java"


# static fields
.field private static final apiKey:Ljava/lang/String; = "8zldlgom55ech8edg32fwdz7ld8di0tv"

.field private static final entry:Ljava/lang/String; = "https://api-s2.vietmap.vn"

.field private static final policy:Lcom/android/volley/DefaultRetryPolicy;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 17
    new-instance v0, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v1, 0x2710

    const/4 v2, 0x1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2, v3}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    sput-object v0, Lcom/navngo/igo/javaclient/login/api/LoginRequest;->policy:Lcom/android/volley/DefaultRetryPolicy;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/navngo/igo/javaclient/login/api/LoginResponse;Lcom/android/volley/Response$Listener;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Lcom/navngo/igo/javaclient/login/api/LoginResponse;",
            "Lcom/android/volley/Response$Listener<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://api-s2.vietmap.vn"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Lcom/navngo/igo/javaclient/login/api/LoginRequest$$ExternalSyntheticLambda0;

    invoke-direct {v7, p3}, Lcom/navngo/igo/javaclient/login/api/LoginRequest$$ExternalSyntheticLambda0;-><init>(Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V

    const/4 v3, 0x1

    move-object v2, p0

    move-object v5, p2

    move-object v6, p4

    invoke-direct/range {v2 .. v7}, Lcom/android/volley/toolbox/JsonObjectRequest;-><init>(ILjava/lang/String;Lorg/json/JSONObject;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 24
    sget-object p1, Lcom/navngo/igo/javaclient/login/api/LoginRequest;->policy:Lcom/android/volley/DefaultRetryPolicy;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    return-void
.end method

.method static synthetic lambda$new$0(Lcom/navngo/igo/javaclient/login/api/LoginResponse;Lcom/android/volley/VolleyError;)V
    .registers 2

    .line 23
    sget-object p1, Lcom/navngo/igo/javaclient/login/api/LoginError;->NO_INTERNET:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-interface {p0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V

    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "Apikey"

    const-string v2, "8zldlgom55ech8edg32fwdz7ld8di0tv"

    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

###### Class com.navngo.igo.javaclient.login.api.LoginRequest$$ExternalSyntheticLambda0 (com.navngo.igo.javaclient.login.api.LoginRequest$$ExternalSyntheticLambda0)
.class public final synthetic Lcom/navngo/igo/javaclient/login/api/LoginRequest$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# instance fields
.field public final synthetic f$0:Lcom/navngo/igo/javaclient/login/api/LoginResponse;


# direct methods
.method public synthetic constructor <init>(Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/LoginRequest$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    return-void
.end method


# virtual methods
.method public final onErrorResponse(Lcom/android/volley/VolleyError;)V
    .registers 3

    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginRequest$$ExternalSyntheticLambda0;->f$0:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-static {v0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginRequest;->lambda$new$0(Lcom/navngo/igo/javaclient/login/api/LoginResponse;Lcom/android/volley/VolleyError;)V

    return-void
.end method
