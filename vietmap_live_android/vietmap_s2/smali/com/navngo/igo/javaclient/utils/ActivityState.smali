###### Class com.navngo.igo.javaclient.utils.ActivityState (com.navngo.igo.javaclient.utils.ActivityState)
.class public final enum Lcom/navngo/igo/javaclient/utils/ActivityState;
.super Ljava/lang/Enum;
.source "ActivityState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/utils/ActivityState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/utils/ActivityState;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/utils/ActivityState;


# instance fields
.field private resumed:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 4
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ActivityState;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/utils/ActivityState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/utils/ActivityState;->INSTANCE:Lcom/navngo/igo/javaclient/utils/ActivityState;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/utils/ActivityState;

    aput-object v0, v1, v2

    .line 3
    sput-object v1, Lcom/navngo/igo/javaclient/utils/ActivityState;->$VALUES:[Lcom/navngo/igo/javaclient/utils/ActivityState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 6
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/ActivityState;->resumed:Ljava/lang/Boolean;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/utils/ActivityState;
    .registers 2

    .line 3
    const-class v0, Lcom/navngo/igo/javaclient/utils/ActivityState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/utils/ActivityState;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/utils/ActivityState;
    .registers 1

    .line 3
    sget-object v0, Lcom/navngo/igo/javaclient/utils/ActivityState;->$VALUES:[Lcom/navngo/igo/javaclient/utils/ActivityState;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/utils/ActivityState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/utils/ActivityState;

    return-object v0
.end method


# virtual methods
.method public isResumed()Ljava/lang/Boolean;
    .registers 2

    .line 13
    iget-object v0, p0, Lcom/navngo/igo/javaclient/utils/ActivityState;->resumed:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setResumed(Ljava/lang/Boolean;)V
    .registers 2

    .line 9
    iput-object p1, p0, Lcom/navngo/igo/javaclient/utils/ActivityState;->resumed:Ljava/lang/Boolean;

    return-void
.end method
