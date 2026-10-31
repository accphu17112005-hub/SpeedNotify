###### Class com.navngo.igo.javaclient.Visibility (com.navngo.igo.javaclient.Visibility)
.class public final enum Lcom/navngo/igo/javaclient/Visibility;
.super Ljava/lang/Enum;
.source "Visibility.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/navngo/igo/javaclient/Visibility;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/navngo/igo/javaclient/Visibility;

.field public static final enum INSTANCE:Lcom/navngo/igo/javaclient/Visibility;

.field private static activityVisible:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 10
    new-instance v0, Lcom/navngo/igo/javaclient/Visibility;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/navngo/igo/javaclient/Visibility;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/navngo/igo/javaclient/Visibility;->INSTANCE:Lcom/navngo/igo/javaclient/Visibility;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/navngo/igo/javaclient/Visibility;

    aput-object v0, v1, v2

    .line 9
    sput-object v1, Lcom/navngo/igo/javaclient/Visibility;->$VALUES:[Lcom/navngo/igo/javaclient/Visibility;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static setVisibility(Z)V
    .registers 1

    .line 23
    sput-boolean p0, Lcom/navngo/igo/javaclient/Visibility;->activityVisible:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/navngo/igo/javaclient/Visibility;
    .registers 2

    .line 9
    const-class v0, Lcom/navngo/igo/javaclient/Visibility;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/navngo/igo/javaclient/Visibility;

    return-object p0
.end method

.method public static values()[Lcom/navngo/igo/javaclient/Visibility;
    .registers 1

    .line 9
    sget-object v0, Lcom/navngo/igo/javaclient/Visibility;->$VALUES:[Lcom/navngo/igo/javaclient/Visibility;

    invoke-virtual {v0}, [Lcom/navngo/igo/javaclient/Visibility;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/navngo/igo/javaclient/Visibility;

    return-object v0
.end method

.method public static visible()Z
    .registers 1

    .line 15
    sget-boolean v0, Lcom/navngo/igo/javaclient/Visibility;->activityVisible:Z

    return v0
.end method
