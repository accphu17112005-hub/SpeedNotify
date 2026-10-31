###### Class com.navngo.igo.javaclient.androidgo.types.CString (com.navngo.igo.javaclient.androidgo.types.CString)
.class public Lcom/navngo/igo/javaclient/androidgo/types/CString;
.super Ljava/lang/Object;
.source "CString.java"

# interfaces
.implements Ljava/lang/CharSequence;


# instance fields
.field private mStr:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 7

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "US-ASCII"

    .line 18
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    .line 21
    invoke-virtual {v1, p1}, Ljava/nio/charset/Charset;->encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    if-eqz v2, :cond_21

    .line 26
    :try_start_13
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-direct {v3, v2, v4, v1, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iput-object v3, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1f} :catch_20

    goto :goto_21

    :catch_20
    nop

    .line 31
    :cond_21
    :goto_21
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;

    if-nez v0, :cond_27

    .line 32
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;

    :cond_27
    return-void
.end method


# virtual methods
.method public charAt(I)C
    .registers 3

    .line 41
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    return p1
.end method

.method public length()I
    .registers 2

    .line 37
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .registers 4

    .line 45
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 50
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/types/CString;->mStr:Ljava/lang/String;

    return-object v0
.end method
