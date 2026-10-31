###### Class com.navngo.igo.javaclient.login.api.LoginError (com.navngo.igo.javaclient.login.api.LoginError)
.class public final enum Lcom/navngo/igo/javaclient/login/api/LoginError;
.super Ljava/lang/Enum;
.source "LoginError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/login/api/LoginError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum ACCOUNTS_BLOCKED:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field private static final BY_TAG:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/navngo/igo/javaclient/login/api/LoginError;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum EXPIRED_OTP:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum INVALID_OTP:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum INVALID_PHONE:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum INVALID_USER:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum NEW_IGO_VERSION_AVAILABLE:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum NO_INTERNET:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum TOO_MANY_OTP_REQUESTS:Lcom/navngo/igo/javaclient/login/api/LoginError;

.field public static final enum TOO_MANY_WRONG_TRIES:Lcom/navngo/igo/javaclient/login/api/LoginError;


# instance fields
.field public final description:Ljava/lang/String;

.field public final stringRes:I

.field public final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 26

    .line 10
    new-instance v6, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v1, "INVALID_OTP"

    const/4 v2, 0x0

    const-string v3, "003"

    const-string v4, "OTP is not valid"

    const v5, 0x7f0d0073

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v6, Lcom/navngo/igo/javaclient/login/api/LoginError;->INVALID_OTP:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 11
    new-instance v0, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v8, "EXPIRED_OTP"

    const/4 v9, 0x1

    const-string v10, "004"

    const-string v11, "OTP is expired"

    const v12, 0x7f0d0072

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->EXPIRED_OTP:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 12
    new-instance v1, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v14, "TOO_MANY_OTP_REQUESTS"

    const/4 v15, 0x2

    const-string v16, "005"

    const-string v17, "You have request OTP too many times"

    const v18, 0x7f0d0076

    move-object v13, v1

    invoke-direct/range {v13 .. v18}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v1, Lcom/navngo/igo/javaclient/login/api/LoginError;->TOO_MANY_OTP_REQUESTS:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 13
    new-instance v2, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v8, "INVALID_USER"

    const/4 v9, 0x3

    const-string v10, "009"

    const-string v11, "User does not exist"

    const v12, 0x7f0d005c

    move-object v7, v2

    invoke-direct/range {v7 .. v12}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v2, Lcom/navngo/igo/javaclient/login/api/LoginError;->INVALID_USER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 14
    new-instance v3, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v14, "INVALID_PHONE"

    const/4 v15, 0x4

    const-string v16, "015"

    const-string v17, "Phone Number is not valid"

    const v18, 0x7f0d005b

    move-object v13, v3

    invoke-direct/range {v13 .. v18}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v3, Lcom/navngo/igo/javaclient/login/api/LoginError;->INVALID_PHONE:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 15
    new-instance v4, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v8, "TOO_MANY_WRONG_TRIES"

    const/4 v9, 0x5

    const-string v10, "017"

    const-string v11, "You have entered the wrong OTP too many times"

    const v12, 0x7f0d0077

    move-object v7, v4

    invoke-direct/range {v7 .. v12}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v4, Lcom/navngo/igo/javaclient/login/api/LoginError;->TOO_MANY_WRONG_TRIES:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 16
    new-instance v5, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v14, "NO_INTERNET"

    const/4 v15, 0x6

    const-string v16, "No internet or 4G"

    const-string v17, "There\u2019s no internet connection"

    const v18, 0x7f0d0066

    move-object v13, v5

    invoke-direct/range {v13 .. v18}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v5, Lcom/navngo/igo/javaclient/login/api/LoginError;->NO_INTERNET:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 17
    new-instance v13, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v8, "NEW_IGO_VERSION_AVAILABLE"

    const/4 v9, 0x7

    const-string v10, "021"

    const-string v11, "Please use the latest version."

    const v12, 0x7f0d0065

    move-object v7, v13

    invoke-direct/range {v7 .. v12}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v13, Lcom/navngo/igo/javaclient/login/api/LoginError;->NEW_IGO_VERSION_AVAILABLE:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 18
    new-instance v7, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v15, "ACCOUNTS_BLOCKED"

    const/16 v16, 0x8

    const-string v17, "022"

    const-string v18, "Your accounts has been blocked."

    const v19, 0x7f0d0065

    move-object v14, v7

    invoke-direct/range {v14 .. v19}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v7, Lcom/navngo/igo/javaclient/login/api/LoginError;->ACCOUNTS_BLOCKED:Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 19
    new-instance v8, Lcom/navngo/igo/javaclient/login/api/LoginError;

    const-string v21, "OTHER"

    const/16 v22, 0x9

    const-string v23, "Other error"

    const-string v24, "There\u2019s an error"

    const v25, 0x7f0d0067

    move-object/from16 v20, v8

    invoke-direct/range {v20 .. v25}, Lcom/navngo/igo/javaclient/login/api/LoginError;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V

    sput-object v8, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    const/16 v9, 0xa

    new-array v9, v9, [Lcom/navngo/igo/javaclient/login/api/LoginError;

    const/4 v10, 0x0

    aput-object v6, v9, v10

    const/4 v6, 0x1

    aput-object v0, v9, v6

    const/4 v0, 0x2

    aput-object v1, v9, v0

    const/4 v0, 0x3

    aput-object v2, v9, v0

    const/4 v0, 0x4

    aput-object v3, v9, v0

    const/4 v0, 0x5

    aput-object v4, v9, v0

    const/4 v0, 0x6

    aput-object v5, v9, v0

    const/4 v0, 0x7

    aput-object v13, v9, v0

    const/16 v0, 0x8

    aput-object v7, v9, v0

    const/16 v0, 0x9

    aput-object v8, v9, v0

    .line 8
    sput-object v9, Lcom/navngo/igo/javaclient/login/api/LoginError;->$VALUES:[Lcom/navngo/igo/javaclient/login/api/LoginError;

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->BY_TAG:Ljava/util/Map;

    .line 24
    invoke-static {}, Lcom/navngo/igo/javaclient/login/api/LoginError;->values()[Lcom/navngo/igo/javaclient/login/api/LoginError;

    move-result-object v0

    array-length v1, v0

    :goto_e9
    if-ge v10, v1, :cond_f7

    aget-object v2, v0, v10

    sget-object v3, Lcom/navngo/igo/javaclient/login/api/LoginError;->BY_TAG:Ljava/util/Map;

    iget-object v4, v2, Lcom/navngo/igo/javaclient/login/api/LoginError;->tag:Ljava/lang/String;

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v10, v10, 0x1

    goto :goto_e9

    :cond_f7
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 31
    iput-object p3, p0, Lcom/navngo/igo/javaclient/login/api/LoginError;->tag:Ljava/lang/String;

    .line 32
    iput-object p4, p0, Lcom/navngo/igo/javaclient/login/api/LoginError;->description:Ljava/lang/String;

    .line 33
    iput p5, p0, Lcom/navngo/igo/javaclient/login/api/LoginError;->stringRes:I

    return-void
.end method

.method public static fromTag(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/api/LoginError;
    .registers 3

    .line 37
    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->BY_TAG:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/login/api/LoginError;

    return-object p0

    .line 38
    :cond_f
    sget-object p0, Lcom/navngo/igo/javaclient/login/api/LoginError;->OTHER:Lcom/navngo/igo/javaclient/login/api/LoginError;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/login/api/LoginError;
    .registers 2

    .line 8
    const-class v0, Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/login/api/LoginError;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/login/api/LoginError;
    .registers 1

    .line 8
    sget-object v0, Lcom/navngo/igo/javaclient/login/api/LoginError;->$VALUES:[Lcom/navngo/igo/javaclient/login/api/LoginError;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/login/api/LoginError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/login/api/LoginError;

    return-object v0
.end method
