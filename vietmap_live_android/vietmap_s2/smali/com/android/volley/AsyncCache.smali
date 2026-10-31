###### Class com.android.volley.AsyncCache (com.android.volley.AsyncCache)
.class public abstract Lcom/android/volley/AsyncCache;
.super Ljava/lang/Object;
.source "AsyncCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;,
        Lcom/android/volley/AsyncCache$OnGetCompleteCallback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract clear(Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
.end method

.method public abstract get(Ljava/lang/String;Lcom/android/volley/AsyncCache$OnGetCompleteCallback;)V
.end method

.method public abstract initialize(Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
.end method

.method public abstract invalidate(Ljava/lang/String;ZLcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
.end method

.method public abstract put(Ljava/lang/String;Lcom/android/volley/Cache$Entry;Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
.end method

.method public abstract remove(Ljava/lang/String;Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;)V
.end method

###### Class com.android.volley.AsyncCache.OnGetCompleteCallback (com.android.volley.AsyncCache$OnGetCompleteCallback)
.class public interface abstract Lcom/android/volley/AsyncCache$OnGetCompleteCallback;
.super Ljava/lang/Object;
.source "AsyncCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnGetCompleteCallback"
.end annotation


# virtual methods
.method public abstract onGetComplete(Lcom/android/volley/Cache$Entry;)V
.end method

###### Class com.android.volley.AsyncCache.OnWriteCompleteCallback (com.android.volley.AsyncCache$OnWriteCompleteCallback)
.class public interface abstract Lcom/android/volley/AsyncCache$OnWriteCompleteCallback;
.super Ljava/lang/Object;
.source "AsyncCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/volley/AsyncCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnWriteCompleteCallback"
.end annotation


# virtual methods
.method public abstract onWriteComplete()V
.end method
