###### Class com.navngo.igo.javaclient.androidgo.IgoModel (com.navngo.igo.javaclient.androidgo.IgoModel)
.class public Lcom/navngo/igo/javaclient/androidgo/IgoModel;
.super Ljava/lang/Object;
.source "IgoModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/navngo/igo/javaclient/androidgo/IgoModel$IViewer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final ROOT_MODEL:Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "*>;"
        }
    .end annotation
.end field

.field private static final logname:Ljava/lang/String; = "IgoModel"


# instance fields
.field mModelPath:Ljava/lang/String;

.field mType:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 30
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const-string v2, ""

    invoke-direct {v0, v2, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    sput-object v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->ROOT_MODEL:Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V
    .registers 3

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mType:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    return-void
.end method

.method private unchecked_cast(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    return-object p1
.end method


# virtual methods
.method public addViewer(Lcom/navngo/igo/javaclient/androidgo/IgoModel$IViewer;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel$IViewer<",
            "TT;>;)V"
        }
    .end annotation

    return-void
.end method

.method public clearViewers()V
    .registers 1

    return-void
.end method

.method public get()Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mType:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_UNKNOWN:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_8

    return-object v2

    .line 52
    :cond_8
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    iget-object v1, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mType:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->ordinal()I

    move-result v1

    int-to-byte v1, v1

    invoke-static {p0, v0, v1}, Lcom/navngo/igo/javaclient/NNG;->queryModelValue(Lcom/navngo/igo/javaclient/androidgo/IgoModel;Ljava/lang/String;B)[B

    move-result-object v0

    const/4 v1, 0x0

    const/4 v3, 0x1

    const-string v4, "ERROR while getting value of model \'%s\'"

    if-eqz v0, :cond_4b

    .line 57
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 58
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;

    invoke-direct {v0, v5}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;-><init>(Ljava/io/InputStream;)V

    .line 62
    :try_start_25
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->readSupportedObject()Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;

    move-result-object v5

    .line 63
    iget-object v5, v5, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoObject;->value:Ljava/lang/Object;

    invoke-direct {p0, v5}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->unchecked_cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_2f} :catch_35
    .catchall {:try_start_25 .. :try_end_2f} :catchall_33

    .line 68
    :goto_2f
    :try_start_2f
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->close()V
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_32} :catch_46

    goto :goto_46

    :catchall_33
    move-exception v1

    goto :goto_47

    :catch_35
    move-exception v5

    :try_start_36
    const-string v6, "IgoModel"

    new-array v3, v3, [Ljava/lang/Object;

    .line 65
    iget-object v7, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    aput-object v7, v3, v1

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1, v5}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_45
    .catchall {:try_start_36 .. :try_end_45} :catchall_33

    goto :goto_2f

    :catch_46
    :goto_46
    return-object v2

    .line 68
    :goto_47
    :try_start_47
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoInputStream;->close()V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_4a} :catch_4a

    .line 70
    :catch_4a
    throw v1

    .line 54
    :cond_4b
    new-instance v0, Ljava/lang/RuntimeException;

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    aput-object v3, v2, v1

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBoolModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_BOOL:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getCStringModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 163
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_CSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getDateModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Lcom/navngo/igo/javaclient/androidgo/types/DateType;",
            ">;"
        }
    .end annotation

    .line 150
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DATETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getDoubleModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 146
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_DOUBLE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getGcoorModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Lcom/navngo/igo/javaclient/androidgo/types/GCoor;",
            ">;"
        }
    .end annotation

    .line 167
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_GCOOR:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getIntModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 134
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_INT:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getQwordModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 142
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_QWORD:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getStringModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 159
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_WSTRING:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public getTimeModel(Ljava/lang/String;)Lcom/navngo/igo/javaclient/androidgo/IgoModel;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "Lcom/navngo/igo/javaclient/androidgo/types/TimeType;",
            ">;"
        }
    .end annotation

    .line 154
    new-instance v0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;->TYP_TIMETYPE:Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;

    invoke-direct {v0, p1, v1}, Lcom/navngo/igo/javaclient/androidgo/IgoModel;-><init>(Ljava/lang/String;Lcom/navngo/igo/javaclient/androidgo/AndroidGo$ArgumentTypes;)V

    return-object v0
.end method

.method public removeViewer(Lcom/navngo/igo/javaclient/androidgo/IgoModel$IViewer;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel$IViewer<",
            "TT;>;)V"
        }
    .end annotation

    return-void
.end method

.method public set(Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 81
    new-instance v0, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;

    invoke-direct {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;-><init>()V

    .line 82
    new-instance v1, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;

    invoke-direct {v1, v0}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 86
    :try_start_a
    invoke-virtual {v1, p1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->writeSupportedObject(Ljava/lang/Object;)V

    .line 87
    invoke-virtual {v0}, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect;->getBuffer()Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;

    move-result-object p1

    .line 88
    iget-object v0, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    iget-object v2, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->buffer:[B

    iget p1, p1, Lcom/navngo/igo/javaclient/utils/ByteArrayOutputStreamDirect$ByteArrayRegion;->size:I

    invoke-static {p0, v0, v2, p1}, Lcom/navngo/igo/javaclient/NNG;->setModelValue(Lcom/navngo/igo/javaclient/androidgo/IgoModel;Ljava/lang/String;[BI)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_1a} :catch_20
    .catchall {:try_start_a .. :try_end_1a} :catchall_1e

    .line 94
    :goto_1a
    :try_start_1a
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1d} :catch_35

    goto :goto_35

    :catchall_1e
    move-exception p1

    goto :goto_36

    :catch_20
    move-exception p1

    :try_start_21
    const-string v0, "IgoModel"

    const-string v2, "ERROR while setting value of model \'%s\'"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    .line 90
    iget-object v5, p0, Lcom/navngo/igo/javaclient/androidgo/IgoModel;->mModelPath:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, p1}, Lcom/navngo/igo/javaclient/DebugLogger;->D1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_34
    .catchall {:try_start_21 .. :try_end_34} :catchall_1e

    goto :goto_1a

    :catch_35
    :goto_35
    return-void

    .line 94
    :goto_36
    :try_start_36
    invoke-virtual {v1}, Lcom/navngo/igo/javaclient/androidgo/AndroidGo$AndroidGoOutputStream;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_39

    .line 96
    :catch_39
    throw p1
.end method

###### Class com.navngo.igo.javaclient.androidgo.IgoModel.IViewer (com.navngo.igo.javaclient.androidgo.IgoModel$IViewer)
.class public abstract Lcom/navngo/igo/javaclient/androidgo/IgoModel$IViewer;
.super Ljava/lang/Object;
.source "IgoModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/navngo/igo/javaclient/androidgo/IgoModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "IViewer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mHandle:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final destroy()V
    .registers 1

    return-void
.end method

.method public abstract update(Lcom/navngo/igo/javaclient/androidgo/IgoModel;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/navngo/igo/javaclient/androidgo/IgoModel<",
            "TT;>;)V"
        }
    .end annotation
.end method
