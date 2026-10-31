###### Class com.navngo.igo.javaclient.androidgo.OutArgs (com.navngo.igo.javaclient.androidgo.OutArgs)
.class public Lcom/navngo/igo/javaclient/androidgo/OutArgs;
.super Ljava/lang/Object;
.source "OutArgs.java"


# instance fields
.field private mValues:[Ljava/lang/Object;


# direct methods
.method public varargs constructor <init>([Ljava/lang/Object;)V
    .registers 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;->mValues:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/Object;
    .registers 2

    .line 19
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/OutArgs;->mValues:[Ljava/lang/Object;

    return-object v0
.end method
