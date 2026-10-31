###### Class com.navngo.igo.javaclient.login.fragments.OnTextChangeListener (com.navngo.igo.javaclient.login.fragments.OnTextChangeListener)
.class public abstract Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;
.super Ljava/lang/Object;
.source "OnTextChangeListener.java"

# interfaces
.implements Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public abstract onChange(Ljava/lang/CharSequence;I)V
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 18
    invoke-virtual {p0, p1, p3}, Lcom/navngo/igo/javaclient/login/fragments/OnTextChangeListener;->onChange(Ljava/lang/CharSequence;I)V

    return-void
.end method
