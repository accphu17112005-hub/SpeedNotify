###### Class com.android.volley.ClientError (com.android.volley.ClientError)
.class public Lcom/android/volley/ClientError;
.super Lcom/android/volley/ServerError;
.source "ClientError.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Lcom/android/volley/ServerError;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/android/volley/NetworkResponse;)V
    .registers 2

    .line 28
    invoke-direct {p0, p1}, Lcom/android/volley/ServerError;-><init>(Lcom/android/volley/NetworkResponse;)V

    return-void
.end method
