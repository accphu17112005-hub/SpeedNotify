###### Class com.google.android.vending.licensing.StrictPolicy (com.google.android.vending.licensing.StrictPolicy)
.class public Lcom/google/android/vending/licensing/StrictPolicy;
.super Ljava/lang/Object;
.source "StrictPolicy.java"

# interfaces
.implements Lcom/google/android/vending/licensing/Policy;


# instance fields
.field private mLastResponse:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x123

    .line 38
    iput v0, p0, Lcom/google/android/vending/licensing/StrictPolicy;->mLastResponse:I

    return-void
.end method


# virtual methods
.method public allowAccess()Z
    .registers 3

    .line 60
    iget v0, p0, Lcom/google/android/vending/licensing/StrictPolicy;->mLastResponse:I

    const/16 v1, 0x100

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public processServerResponse(ILcom/google/android/vending/licensing/ResponseData;)V
    .registers 3

    .line 50
    iput p1, p0, Lcom/google/android/vending/licensing/StrictPolicy;->mLastResponse:I

    return-void
.end method
