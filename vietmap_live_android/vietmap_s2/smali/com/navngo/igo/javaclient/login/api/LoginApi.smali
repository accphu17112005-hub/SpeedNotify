###### Class com.navngo.igo.javaclient.login.api.LoginApi (com.navngo.igo.javaclient.login.api.LoginApi)
.class public Lcom/navngo/igo/javaclient/login/api/LoginApi;
.super Ljava/lang/Object;
.source "LoginApi.java"


# static fields
.field private static instance:Lcom/navngo/igo/javaclient/login/api/LoginApi;


# instance fields
.field public final code:Lcom/navngo/igo/javaclient/login/api/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/login/api/Observable<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final counter:Lcom/navngo/igo/javaclient/login/api/Counter;

.field public final phone:Lcom/navngo/igo/javaclient/login/api/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/login/api/Observable<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final token:Lcom/navngo/igo/javaclient/login/api/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/login/api/Observable<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 5

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/navngo/igo/javaclient/login/api/Observable;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    .line 31
    new-instance v0, Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    .line 32
    new-instance v0, Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-direct {v0, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->token:Lcom/navngo/igo/javaclient/login/api/Observable;

    .line 33
    new-instance v0, Lcom/navngo/igo/javaclient/login/api/Counter;

    const/16 v1, 0x78

    const/4 v2, 0x0

    const/16 v3, 0x3e8

    invoke-direct {v0, v1, v2, v3}, Lcom/navngo/igo/javaclient/login/api/Counter;-><init>(III)V

    iput-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    return-void
.end method

.method public static getInstance()Lcom/navngo/igo/javaclient/login/api/LoginApi;
    .registers 1

    .line 25
    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->instance:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    if-nez v0, :cond_b

    new-instance v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/login/api/LoginApi;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->instance:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    .line 26
    :cond_b
    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->instance:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    return-object v0
.end method


# virtual methods
.method public registerPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
    .registers 8

    .line 38
    invoke-static {p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object p1

    .line 39
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 40
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_15
    const-string v2, "phone"

    .line 42
    iget-object v3, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "appVer"

    const-string v3, "9.35.2.281488"

    const/4 v4, 0x7

    .line 43
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "model"

    .line 44
    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "unique_id"

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "+"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "product"

    .line 46
    sget-object v2, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "brand"

    .line 47
    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "hardware"

    .line 48
    sget-object v2, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "os_ver"

    .line 49
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "fw_ver"

    .line 50
    sget-object v2, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_77
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_77} :catch_87

    .line 57
    new-instance v1, Lcom/navngo/igo/javaclient/login/api/LoginRequest;

    new-instance v2, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;

    invoke-direct {v2, p0, p2}, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;-><init>(Lcom/navngo/igo/javaclient/login/api/LoginApi;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V

    const-string v3, "/v3/user/RequestOtp"

    invoke-direct {v1, v3, v0, p2, v2}, Lcom/navngo/igo/javaclient/login/api/LoginRequest;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/navngo/igo/javaclient/login/api/LoginResponse;Lcom/android/volley/Response$Listener;)V

    .line 87
    invoke-virtual {p1, v1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    return-void

    :catch_87
    move-exception p1

    .line 52
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 53
    sget-object p1, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-interface {p2, p1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V

    return-void
.end method

.method public verifyPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
    .registers 7

    .line 93
    invoke-static {p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object p1

    .line 94
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 95
    sget-object v1, Lcom/navngo/igo/javaclient/Application;->anApplication:Lcom/navngo/igo/javaclient/Application;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/Application;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "android_id"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :try_start_15
    const-string v2, "phone"

    .line 97
    iget-object v3, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "otp"

    .line 98
    iget-object v3, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->code:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v3}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "unique_id"

    .line 99
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "+"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi;->phone:Lcom/navngo/igo/javaclient/login/api/Observable;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4c
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_4c} :catch_5c

    .line 106
    new-instance v1, Lcom/navngo/igo/javaclient/login/api/LoginRequest;

    new-instance v2, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;

    invoke-direct {v2, p0, p2}, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;-><init>(Lcom/navngo/igo/javaclient/login/api/LoginApi;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V

    const-string v3, "/v3/user/LoginByPhone"

    invoke-direct {v1, v3, v0, p2, v2}, Lcom/navngo/igo/javaclient/login/api/LoginRequest;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Lcom/navngo/igo/javaclient/login/api/LoginResponse;Lcom/android/volley/Response$Listener;)V

    .line 137
    invoke-virtual {p1, v1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    return-void

    :catch_5c
    move-exception p1

    .line 101
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    .line 102
    sget-object p1, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-interface {p2, p1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V

    return-void
.end method

###### Class com.navngo.igo.javaclient.login.api.LoginApi.AnonymousClass1 (com.navngo.igo.javaclient.login.api.LoginApi$1)
.class Lcom/navngo/igo/javaclient/login/api/LoginApi$1;
.super Ljava/lang/Object;
.source "LoginApi.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/api/LoginApi;->registerPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

.field final synthetic val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/api/LoginApi;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
    .registers 3

    .line 57
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .registers 2

    .line 57
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .registers 6

    const-string v0, "responseCode"

    :try_start_2
    const-string v1, "data"

    .line 63
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "description"

    .line 64
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 65
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "Success"

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 67
    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    iget-object v1, v1, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/login/api/Counter;->start()V

    .line 68
    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-interface {v1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onSuccess()V

    goto :goto_4c

    .line 69
    :cond_27
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-static {v1}, Lcom/navngo/igo/javaclient/login/api/LoginError;->fromTag(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/api/LoginError;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    :try_end_30
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_30} :catch_31

    goto :goto_4c

    :catch_31
    :try_start_31
    const-string v1, "error"

    .line 75
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 77
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 78
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/api/LoginError;->fromTag(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/api/LoginError;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    :try_end_44
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_44} :catch_45

    goto :goto_4c

    .line 81
    :catch_45
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$1;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-interface {p1, v0}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V

    :goto_4c
    return-void
.end method

###### Class com.navngo.igo.javaclient.login.api.LoginApi.AnonymousClass2 (com.navngo.igo.javaclient.login.api.LoginApi$2)
.class Lcom/navngo/igo/javaclient/login/api/LoginApi$2;
.super Ljava/lang/Object;
.source "LoginApi.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/navngo/igo/javaclient/login/api/LoginApi;->verifyPhoneRequest(Landroid/content/Context;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

.field final synthetic val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;


# direct methods
.method constructor <init>(Lcom/navngo/igo/javaclient/login/api/LoginApi;Lcom/navngo/igo/javaclient/login/api/LoginResponse;)V
    .registers 3

    .line 106
    iput-object p1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    iput-object p2, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .registers 2

    .line 106
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .registers 7

    const-string v0, "responseCode"

    :try_start_2
    const-string v1, "data"

    .line 112
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "description"

    .line 113
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 114
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Success"

    .line 115
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    .line 116
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/login/api/LoginApi;->counter:Lcom/navngo/igo/javaclient/login/api/Counter;

    invoke-virtual {v2}, Lcom/navngo/igo/javaclient/login/api/Counter;->stop()V

    .line 117
    iget-object v2, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->this$0:Lcom/navngo/igo/javaclient/login/api/LoginApi;

    iget-object v2, v2, Lcom/navngo/igo/javaclient/login/api/LoginApi;->token:Lcom/navngo/igo/javaclient/login/api/Observable;

    const-string v3, "token"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/navngo/igo/javaclient/login/api/Observable;->setValue(Ljava/lang/Object;)V

    .line 118
    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-interface {v1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onSuccess()V

    goto :goto_59

    .line 119
    :cond_34
    iget-object v1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-static {v3}, Lcom/navngo/igo/javaclient/login/api/LoginError;->fromTag(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/api/LoginError;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    :try_end_3d
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_3d} :catch_3e

    goto :goto_59

    :catch_3e
    :try_start_3e
    const-string v1, "error"

    .line 125
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 127
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 128
    iget-object v0, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    invoke-static {p1}, Lcom/navngo/igo/javaclient/login/api/LoginError;->fromTag(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/api/LoginError;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_3e .. :try_end_51} :catch_52

    goto :goto_59

    .line 131
    :catch_52
    iget-object p1, p0, Lcom/navngo/igo/javaclient/login/api/LoginApi$2;->val$loginResponse:Lcom/navngo/igo/javaclient/login/api/LoginResponse;

    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-interface {p1, v0}, Lcom/navngo/igo/javaclient/login/api/LoginResponse;->onError(Lcom/navngo/igo/javaclient/login/api/LoginError;)V

    :goto_59
    return-void
.end method
